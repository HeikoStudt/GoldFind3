unit uDBHamsterNews;

interface

uses VirtualTrees, cIndexRC, uTools, cArticle, uDBBase, Classes;

type
  tDBGroup = class(tDBBase) //Group I/O
    private
      IndexFile: TIndexedRecords;
      FSdat: TFileStreamEx;
      fPos: Integer;
      function ReadArticle(ArtNo: Integer; var MaxSize: Integer): String;
      function ReadHeader(ArtNum: integer; var ArtSize: Integer): String;
    public
      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); override;

      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); override;
      procedure GetHeader (ArtNum : integer; var ResHdr : String; var ArtSize : Integer); override;

      function Count : longint; override;
      function Max   : longint; override;
      function Min   : longint; override;

      function Open(Path : String): boolean; override;
      procedure Close; override;
  end;

implementation

uses sysutils, filectrl;

type
  PIndexRec = ^TIndexRec;
  TIndexRec = record
     DatKey : LongInt;
     DatPos : LongInt
  end;

const
  FileUsage = fmShareDenyNone or fmOpenRead;
  DATMASK_SIZE     = $00FFFFFF;
  DATMASK_RESERVED = $7F000000;
  DATMASK_DELETED  = LongInt($80000000);


{ tGroup }
function tDBGroup.Open(Path : String) : boolean;
begin
   inherited Open(Path);
   //Result := false;
   fPos := -1;
   if not fCreated then begin
     //Create
     FSDat := nil;
     fCreated := true
   end;

   //Open
   try
     FSdat := TFileStreamEx.Create( Path + 'data.dat', FileUsage );
   except
      on E:EFOpenError do begin
//         Log( LOGID_DEBUG, FFileBase + EXT_DAT + ': ' + E.Message );
         FSdat := nil;
         raise
      end;
      on E:Exception do begin
//         Log( LOGID_DEBUG, FFileBase + EXT_DAT + ': ' + E.Message );
        raise
      end
   end;

   IndexFile := TIndexedRecords.Create( Path + 'data.idx',
                                        sizeof(TIndexRec) );

   IndexFile.LoadFromFile;

   if (IndexFile.Count=0) and (FSdat.Size>0) then
     raise Exception.Create('IndexFile damaged?');
   Result   := true
end;

{function tDBGroup.ReadSize( Key: LongInt ): Integer; //Hamster 23.170
var siz: LongInt;
begin
     try
        Result := 0;

        if key<0 then exit;

        FSdat.Seek( GetDatPos(key), soFromBeginning );
        FSdat.Read( siz, sizeof(siz) );
        Result := siz and DATMASK_SIZE;
     except
        on E:Exception do begin
//           Log( LOGID_ERROR, 'cArtFile.ReadSize: ' + E.Message );
           raise;
        end;
     end;
end;
}

function tDBGroup.ReadHeader(ArtNum: integer; var ArtSize: Integer): String;
var
  MaxLength : Integer;
  posi      : Integer;
begin
  MaxLength := 3072;
  Result := ReadArticle(ArtNum-1, MaxLength);
  posi := pos(#13#10#13#10, Result);
  if (posi<=0) then begin
    MaxLength := 0;
    Result := ReadArticle(ArtNum-1, MaxLength);
    posi := pos(#13#10#13#10, Result)
  end;
  if (posi>0) then SetLength(Result, posi);
  ArtSize := MaxLength;
end;

function tDBGroup.ReadArticle( ArtNo: Integer; var MaxSize: Integer ): String; //Hamster  23.170
var  dpos: LongWord;
     siz: LongInt;
begin
     try
        Result := '';
        if ArtNo<0 then exit;

        dpos := PIndexRec( IndexFile.RecPtr(ArtNo) )^.DatPos;
//        if dpos<0 then exit;

        FSdat.Seek( dpos, soFromBeginning );
        FSdat.Read( siz, sizeof(siz) );
        siz := siz and DATMASK_SIZE;
        if (siz>MaxSize) and (MaxSize>0) then
          siz := MaxSize;
        MaxSize := siz;

        if siz<=0 then exit;
        SetLength ( Result, siz );
        FSdat.Read( Result[1], siz )
     except
        on E:Exception do begin
//           Log( LOGID_ERROR, 'cArtFile.ReadArticle: ' + E.Message );
           Result := '';
           raise
        end
     end
end;

procedure tDBGroup.Close;
begin
   if fCreated then begin
     if Assigned( IndexFile ) then
        FreeAndNil(IndexFile);
     if FSdat<>nil then begin
        FSdat.Free;
        FSdat := nil
     end
   end;
   fCreated := false
end;

procedure tDBGroup.GetHeader(ArtNum: integer; var ResHdr: String; var ArtSize : Integer);
begin
  if (ArtNum <= Max) and (ArtNum >= Min) then begin
    ResHdr := ReadHeader(ArtNum-1, ArtSize)
  end else
    ResHdr := ''
end;

procedure tDBGroup.GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer);
begin
  ResSize := 0;
  if (ArtNum <= Max) and (ArtNum >= Min) then begin
    ResArt := ReadArticle(ArtNum-1, ResSize)
  end else
    ResArt := ''
end;

function tDBGroup.Count: longint;
begin
  if Assigned(IndexFile) then Result := IndexFile.Count
                         else Result := 0
end;

function tDBGroup.Max: longint;
begin
  Result := Count
end;

function tDBGroup.Min: longint;
begin
  Result := 0
end;

procedure tDBGroup.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings : tList);
var
  f : Textfile;
  s : string;
  EntryNode: PVirtualNode;
  temData: pTreeData;
  OldBasePath : String;
begin
  OldBasePath := copy(BasePath,pos(';',BasePath)+1,length(BasePath));
  BasePath    := copy(BasePath,1, pos(';',BasePath)-1);
  if not DirectoryExists(BasePath) then
    exit;

  AssignFile(f, OldBasePath + 'groups.hst');
  reset(f);
  while not eof(f) do begin  //Alle Gruppen einlesen
    readln(f,s);
    if FileExists(BasePath + s + '\data.dat') then begin
      EntryNode := res.AddChild(RootNode);
      temData  := res.GetNodeData(EntryNode);
      with temData^ do begin
        new(Path);
        PathStrings.Add(Path);

        Caption := s;
        Path^   := BasePath + s + '\';
        imgidx  := 31; //2: Pull or not
//        typ     := HamsterNews;
        DB      := tDBGroup;
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
  end;
  CloseFile(f);
end;


{
function tDBGroup.ReadHeader(ArtNum: integer): String;
var
  MaxLength : Integer;
begin
  with fCurrentArticle do begin
    MaxLength := 3072;

    Text := ReadArticle(ArtNum-1, MaxLength);
    if FullBody = '' then begin
      MaxLength := 0;
      Text := ReadArticle(ArtNum-1, MaxLength)
    end;
    Result := FullHeader
  end;
  fCurrentOnlyHeader := true
end;
}

end.
