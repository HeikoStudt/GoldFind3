unit uDBMbox;

interface

uses kProgress, VirtualTrees, uDBBase, FileCtrl, sysutils, inifiles, Classes, uTools;

type
  PInt = ^Integer;
  tDBMbx = class(tDBBase) //Mails I/O
    private
      OffSetList : tList;
      DatFile: TFileStream;
    public
      function Count : longint; override;
      function Max   : longint; override;
      function Min   : longint; override;

      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); override;
      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); override;

      function Open(Path : String): boolean; override;
      procedure Close; override;
      Destructor Destroy; override;
  end;

implementation

uses Windows;

const FileUsage = fmShareDenyNone or fmOpenRead;

{ tDBMbx }

procedure tDBMBx.GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer);
begin
  try
    DatFile.Position := pInt(OffSetList[ArtNum-1])^;
    if OffSetList.count > ArtNum then
//      ResSize := pInt(OffSetlist[ArtNum])^-pInt(OffSetList[ArtNum-1])^-1
      ResSize := pInt(OffSetlist[ArtNum])^-DatFile.Position-1
    else
      ResSize := DatFile.Size - DatFile.Position;
    SetLength(ResArt, ResSize);
    DatFile.Read(ResArt[1], ResSize);
//    ResArt := copy(ResArt, pos(#13#10, ResArt)+2, length(ResArt));
    ResArt := AdjustLineBreaks(ResArt);
    Delete(ResArt, 1, pos(#13#10, ResArt)+1);
    ResSize := Length(ResArt);
  except end;
end;

procedure tDBMbx.Close;
var i : integer;
begin
   if fCreated then begin
     for i := OffSetList.count-1 downto 0 do
       Dispose(PInt(OffSetList[i]));
     OffSetList.Clear;

     if DatFile<>nil then begin
        DatFile.Free;
        DatFile := nil
     end
   end;
   fCreated := false
end;

function tDBMbx.Count: longint;
begin
  Result := OffSetList.count
end;

destructor tDBMbx.Destroy;
begin
  inherited;
  if OffSetList<>nil then
    OffSetList.free; //Have to be later because of parent Destroy uses Close
end;

function tDBMbx.Max: longint;
begin
  Result := Count
end;

function tDBMbx.Min: longint;
begin
  Result := 1;
end;

function tDBMbx.Open(Path: String): boolean;
var temp : pInt;
    s: string;
    s2: string;
    temI : Integer;
    OldI : Integer;
begin
   Path := copy(Path,1,length(Path)-1);   //Strip '\' at the end
   inherited Open(Path);
   if not fCreated then begin
     //Create
     DatFile := nil;
     OffSetList := tList.Create;
     fCreated := true
   end;

   //Open
   try
      DatFile := TFileStreamEx.Create( fPath, FileUsage );
   except
      on E:EFOpenError do begin
         DatFile := nil;
         raise;
      end;
      on E:Exception do begin
        raise;
      end
   end;

   //Create Offset-List
//   s2 := #13#10;
   s2 := #13;
   DatFile.Position := 0;
   OldI := 0;
   while DatFile.Position<DatFile.Size do begin
     SetLength(s, 1024);
     //DatFile.Read(s[1], 1024);
     SetLength(s, DatFile.Read(s[1], Length(s)));

     s2 := s2 + Uppercase(s);
//     s := Uppercase(s);
//     s2 := s2 + s;

     temI := pos('FROM ', s2);
//     temI := pos(#13#10+'FROM ', s2);
     while temI>0 do begin
       if (temI=1) or (s2[temI-1] in [#13, #10]) then begin
         new(temp);
         temp^ := OldI + temI;
         OffSetList.Add(temp);
       end;
       OldI := OldI + temI + 4;
       s2 := copy(s2, temI + 5, length(s2));
//       temI := pos(#13#10+'FROM ', s2);
       temI := pos('FROM ', s2);
     end;
     if Length(s2) > 5 then begin
       Inc(OldI, Length(s2) - 5);
       Delete(s2, 1, Length(s2) - 5);
     end;
   end;
   new(temp);
   temp^ := DatFile.Size;
   OffSetList.Add(temp);
   s2 := '';

   Result   := true
end;

procedure tDBMbx.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings: tList);
var
  EntryNode: PVirtualNode;
  temData: pTreeData;
begin
{  if not DirectoryExists(BasePath) then
    exit;}
  EntryNode := res.AddChild(RootNode);
  temData  := res.GetNodeData(EntryNode);
  with temData^ do begin
    new(Path);
    PathStrings.Add(Path);

    Caption := 'MBox';
    Path^   := BasePath;
    imgidx  := 12; //2: Pull or not
//    typ     := UnixMbx;
    DB      := tDBMBx;
    try
      if Path^<>'' then begin
        open(Path^);
        Count := self.count;
        close;
      end else
        Count := -1
    except end;
  end;
end;

end.
