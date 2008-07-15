unit uDBHamsterMails;

interface

uses kProgress, VirtualTrees, uDBBase, FileCtrl, sysutils, inifiles, Classes;

type
  tDBMails = class(tDBBase) //Mails I/O
    private
      CurrentArtNum: Integer;
      CurrentSR: TSearchRec;
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
  end;

implementation

uses cArticle;

{ tMails }

procedure tDBMails.GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer);
const FileUsage = fmShareDenyNone or fmOpenRead;
var
  i: Integer;
  OK: Boolean;
  fs : tFileStream;
begin
  ResArt := '';
  if ArtNum<=0 then exit;
  if fPath='' then exit;

  i := CurrentArtNum;
  if CurrentArtNum <= 0 then begin            //First Init?
    FindFirst(fPath + '*.msg', faAnyFile, CurrentSR);
    if (CurrentSR.Attr and faDirectory) <> faDirectory then
      i := 1
    else
      i := 0
  end else if CurrentArtNum>ArtNum then begin //Need Re-Init?
    FindClose(CurrentSR);
    FindFirst(fPath + '*.msg', faAnyFile, CurrentSR);
    if (CurrentSR.Attr and faDirectory) <> faDirectory then
      i := 1
    else
      i := 0
  end;

  Ok := true;
  while (ArtNum>i) do
    if FindNext(CurrentSR)<>0 then begin
      Ok := false;
      break;
    end else if (CurrentSR.Attr and faDirectory) <> faDirectory then
      inc(i);

  if not ok then begin //Zu große ArtNum z.B.
    FindClose(CurrentSR);
    CurrentArtNum := 0;
    exit;
  end;

  CurrentArtNum := i;

  if (CurrentSR.Name<>'') and FileExists(fPath+CurrentSR.Name) then begin
    fs := tFileStream.Create(fPath+CurrentSR.Name, FileUsage);
    try
      fs.Seek(0,soFromBeginning);
      setLength(ResArt,fs.size);
      fs.Read(ResArt[1],fs.size);
      ResSize := fs.size
    finally
      fs.free;
    end;
  end;
end;

procedure tDBMails.Close;
begin
  if fCreated then begin
    if CurrentArtNum <= 0 then
      FindClose(CurrentSR);
    CurrentArtNum := 0
  end;
  fCreated := false
end;

function tDBMails.Count: longint;
var
  sr: TSearchRec;
  i: Integer;
begin
  FindFirst(fPath + '*.msg', faAnyFile, sr);
  i := 0;

  if sr.Name<>'' then
    repeat
      if (sr.Attr and faDirectory) <> faDirectory then
        inc(i);
    until FindNext(sr)<>0;

  FindClose(sr);
  Result := i;
end;

function tDBMails.Max: longint;
begin
  Result := Count
end;

function tDBMails.Min: longint;
begin
  Result := 1
end;

function tDBMails.Open(Path: String): boolean;
begin
  inherited Open(Path);
  if not fCreated then begin //Create
    CurrentArtNum := 0;
    fCreated := true
  end;

  //Open
  Result := DirectoryExists(Path);
end;

procedure tDBMails.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings : tList);
var
  ActIni : tIniFile;
  GrpIni : tIniFile;
  i, i2 : integer;
  GrpName : String;
  GrpNode: PVirtualNode;
  EntryNode: PVirtualNode;
  temData: pTreeData;
  OldBasePath : String;
begin
  OldBasePath := copy(BasePath,pos(';',BasePath)+1,length(BasePath));
  BasePath    := copy(BasePath,1, pos(';',BasePath)-1);

  ActIni := tIniFile.Create(OldBasePath + 'Accounts.!!!');
  try
    if FileExists(OldBasePath + 'groups.!!!') then begin
      GrpIni := tIniFile.Create(OldBasePath + 'Groups.!!!');
      try
        for i := 1 to GrpIni.ReadInteger('COMMON', 'GroupMax', 0) do begin
          GrpName := GrpIni.ReadString( '0', IntToStr(i), '');
          if GrpName <> '' then begin
            GrpNode := res.AddChild(RootNode);
            temData := res.GetNodeData(GrpNode);
            new(temData^.Path);
            PathStrings.Add(temData^.Path);
            with temData^ do begin
              Caption   := GrpName;
              Path^     := '';
              ImgIdx    := 31;
//              typ       := Base;
              DB        := nil;
              Count     := -1
            end;
            GrpName := Uppercase(GrpName);
            for i2 := 0 to ActIni.ReadInteger('Common', 'UserIDMax', 0) do
              if ActIni.SectionExists(IntToStr(i2)) then
                if ((Uppercase(ActIni.ReadString(IntToStr(i2), 'Group', '')) = GrpName)
                  OR ((Uppercase(ActIni.ReadString(IntToStr(i2), 'Group', '')) = '')
                    AND (GrpName='ADMIN')))
                AND (ActIni.ReadInteger(IntToStr(i2), 'MailBox', 0)<>0)
                then begin
                  EntryNode := res.AddChild(GrpNode);
                  temData := res.GetNodeData(EntryNode);
                  new(temData^.Path);
                  PathStrings.Add(temData^.Path);
                  with temData^ do begin
                    Caption   := ActIni.ReadString(IntToStr(i2), 'Username', '');
                    Path^     := BasePath + Caption + '\';
                    ImgIdx    := 12;
//                    Typ       := HamsterMails;
                    DB        := tDBMails;
                    if path^<>'' then begin
                      open(path^);
                      Count   := self.count;
                      close
                    end else
                      Count := -1
                  end;
                end;
          end;
        end;
      finally
        GrpIni.free;
      end;
    end else begin
      for i2 := 0 to ActIni.ReadInteger('Common', 'UserIDMax',0) do
        if ActIni.SectionExists(IntToStr(i2)) then
          if (ActIni.ReadInteger(IntToStr(i2),'MailBox',0)<>0) then begin
            EntryNode := res.AddChild(RootNode);
            temData := res.GetNodeData(EntryNode);
            with temData^ do begin
              new(Path);
              PathStrings.Add(Path);

              Caption   := ActIni.ReadString(IntToStr(i2), 'Username', '');
              Path^     := BasePath + Caption + '\';
              ImgIdx    := 12;
//              Typ       := HamsterMails;
              DB := tDBMails;
              try
                if Path^ <> '' then begin
                  open(path^);
                  Count     := self.count;
                  close
                end else
                  Count     := -1
              except end;
            end
          end
    end
  finally
    ActIni.free
  end;
end;



(*
unit BMSearch;


{ -------------------------------------------------------------------
   Boyer-Moore string searching.

   This is one of the fastest string search algorithms.
   See a description in:

     R. Boyer and S. Moore.
     A fast string searching algorithm.
     Communications of the ACM 20, 1977, Pags 762-772
------------------------------------------------------------------- }


interface

type
{$ifdef WINDOWS}
   size_t = Word;
{$else}
   size_t = LongInt;
{$endif}

type
   TTranslationTable = array[char] of char;  { translation table }

   TSearchBM = class(TObject)
   private
      FTranslate  : TTranslationTable;     { translation table }
      FJumpTable  : array[char] of Byte;   { Jumping table }
      FShift_1    : integer;
      FPattern    : pchar;
      FPatternLen : size_t;

   public
      procedure Prepare( Pattern: pchar; PatternLen: size_t; IgnoreCase: Boolean );
      procedure PrepareStr( const Pattern: string; IgnoreCase: Boolean );

      function  Search( Text: pchar; TextLen: size_t ): pchar;
      function  Pos( const S: string ): integer;
   end;




implementation


uses  SysUtils;



{ -------------------------------------------------------------------
   Ignore Case Table Translation
------------------------------------------------------------------- }

procedure CreateTranslationTable( var T: TTranslationTable; IgnoreCase: Boolean );
var
   c: char;
begin
   for c := #0 to #255 do
       T[c] := c;

   if not IgnoreCase then
      exit;

   for c := 'a' to 'z' do
      T[c] := UpCase(c);

   { Mapping all acented characters to their uppercase equivalent }

   T['Á'] := 'A';
   T['À'] := 'A';
   T['Ä'] := 'A';
   T['Â'] := 'A';

   T['á'] := 'A';
   T['à'] := 'A';
   T['ä'] := 'A';
   T['â'] := 'A';

   T['É'] := 'E';
   T['È'] := 'E';
   T['Ë'] := 'E';
   T['Ê'] := 'E';

   T['é'] := 'E';
   T['è'] := 'E';
   T['ë'] := 'E';
   T['ê'] := 'E';

   T['Í'] := 'I';
   T['Ì'] := 'I';
   T['Ï'] := 'I';
   T['Î'] := 'I';

   T['í'] := 'I';
   T['ì'] := 'I';
   T['ï'] := 'I';
   T['î'] := 'I';

   T['Ó'] := 'O';
   T['Ò'] := 'O';
   T['Ö'] := 'O';
   T['Ô'] := 'O';

   T['ó'] := 'O';
   T['ò'] := 'O';
   T['ö'] := 'O';
   T['ô'] := 'O';

   T['Ú'] := 'U';
   T['Ù'] := 'U';
   T['Ü'] := 'U';
   T['Û'] := 'U';

   T['ú'] := 'U';
   T['ù'] := 'U';
   T['ü'] := 'U';
   T['û'] := 'U';

   T['ñ'] := 'Ñ';
end;



{ -------------------------------------------------------------------
   Preparation of the jumping table
------------------------------------------------------------------- }

procedure TSearchBM.Prepare( Pattern: pchar; PatternLen: size_t;
                             IgnoreCase: Boolean );
var
   i: integer;
   c, lastc: char;
begin
   FPattern := Pattern;
   FPatternLen := PatternLen;

   if FPatternLen < 1 then
      FPatternLen := strlen(FPattern);

   { This algorythm is based in a character set of 256 }

   if FPatternLen > 256 then
      exit;


   { 1. Preparing translating table }

   CreateTranslationTable( FTranslate, IgnoreCase);


   { 2. Preparing jumping table }

   for c := #0 to #255 do
      FJumpTable[c] := FPatternLen;

   for i := FPatternLen - 1 downto 0 do begin
      c := FTranslate[FPattern[i]];
      if FJumpTable[c] >= FPatternLen - 1 then
         FJumpTable[c] := FPatternLen - 1 - i;
   end;

   FShift_1 := FPatternLen - 1;
   lastc := FTranslate[Pattern[FPatternLen - 1]];

   for i := FPatternLen - 2 downto 0 do
      if FTranslate[FPattern[i]] = lastc  then begin
         FShift_1 := FPatternLen - 1 - i;
         break;
      end;

   if FShift_1 = 0 then
      FShift_1 := 1;
end;


procedure TSearchBM.PrepareStr( const Pattern: string; IgnoreCase: Boolean );
var
   str: pchar;
begin
   if Pattern <> '' then begin
{$ifdef Windows}
      str := @Pattern[1];
{$else}
      str := pchar(Pattern);
{$endif}

      Prepare( str, Length(Pattern), IgnoreCase);
   end;
end;



{ Searching Last char & scanning right to left }

function TSearchBM.Search( Text: pchar; TextLen: size_t ): pchar;
var
   shift, m1, j: integer;
   jumps: size_t;
begin
   result := nil;
   if FPatternLen > 256 then
      exit;

   if TextLen < 1 then
      TextLen := strlen(Text);


   m1 := FPatternLen - 1;
   shift := 0;
   jumps := 0;

   { Searching the last character }

   while jumps <= TextLen do begin
      Inc( Text, shift);
      shift := FJumpTable[FTranslate[Text^]];
      while shift <> 0 do begin
          Inc( jumps, shift);
          if jumps > TextLen then
             exit;

          Inc( Text, shift);
          shift := FJumpTable[FTranslate[Text^]];
      end;

      { Compare right to left FPatternLen - 1 characters }

      if jumps >= m1 then begin
         j := 0;
         while FTranslate[FPattern[m1 - j]] = FTranslate[(Text - j)^] do begin
            Inc(j);
            if j = FPatternLen then begin
               result := Text - m1;
               exit;
            end;
         end;
      end;

      shift := FShift_1;
      Inc( jumps, shift);
   end;
end;


function TSearchBM.Pos( const S: string ): integer;
var
   str, p: pchar;
begin
   result := 0;
   if S <> '' then begin
{$ifdef Windows}
      str := @S[1];
{$else}
      str := pchar(S);
{$endif}

      p := Search( str, Length(S));
      if p <> nil then
         result := 1 + p - str;
   end;
end;

end.


*)

end.

