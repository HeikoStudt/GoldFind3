unit uDBNewsNNTP;

interface

uses VirtualTrees, PSock, uDBBase, Classes;

type
  tDBNNTP = class(tDBBase) //Group I/O
    private
      Con : tPowerSock;
      fGroupRes : String;
      fGroup : String;
      function WriteReadLn(s : string) : string;
    protected
      function getGroupName: String; override;
    public
      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); override;

      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); override;
      function GetOverList(const ArtList: toArtList; vPath: PString; var Res: tStringList; progr : tProgressXOver) : Boolean; override;
      function GetAllOverList(vPath: PString; var Res: tStringList; progr : tProgressXOver) : Boolean; override;

      function Count : longint; override;
      function Max   : longint; override;
      function Min   : longint; override;

      function Open(Path : String): boolean; override;
      procedure Close; override;
  end;

implementation

{ tDBNNTP }

uses SysUtils, uDateTime, uCharSets;

function tDBNNTP.WriteReadLn(s: string): string;
begin
  Con.WriteLn(s);
  Result := Con.ReadLn;
end;

function tDBNNTP.Open(Path: String): boolean;
var
  s : string;
  fUser, fPass  : string;
  fHost : string;
  fPort : Integer;

begin
  if not fCreated then begin
    fCreated := true;
    Con := tPowerSock.Create(nil);
  end;

  Result := false;
  fPath := Path;

  fHost := '';
  fPort := 119;

  fUser := '';
  fPass := '';

  fGroup := '';
  fGroupRes := '';

  if pos('@', Path)>0 then begin
    s := copy(Path, 1, pos('@', Path)-1);
    Path := copy(Path, pos('@', Path)+1, length(Path));
    if pos('>>', s)>0 then begin
      fUser := copy(s, 1, pos('>>', s)-1);
      fPass := copy(s, pos('>>', s)+2, length(s));
    end else begin
      fUser := s;
    end;
  end;

  if pos('<<', Path)>0 then begin
    fGroup := trim(copy(Path, pos('<<', Path)+2, length(Path)));
    Path := copy(Path, 1, pos('<<', Path)-1);
  end;

  if pos(':', Path)=0 then begin
    if Path='' then exit;
    fHost := Path;
  end else begin
    s := copy(Path, pos(':',Path)+1, length(Path));
    if s <> '' then
      fPort := StrToInt(s);
    fHost := copy(Path,1, pos(':', Path)-1);
  end;

  try
    con.Host := fHost;
    con.Port := fPort;
    try
      con.connect; if not con.connected then exit;
    except exit end;

    s := con.readln;
    if not (copy(s,1,1)='2') then exit;

    if fUser <> '' then begin
      s := WriteReadLn('AUTHINFO USER ' + fUser);
      if (copy(s,1,1)='3') then begin
        s := WriteReadLn('AUTHINFO PASS ' + fPass);
        if (copy(s,1,1)='5') then exit;
      end;
      if not (copy(s,1,1)='2') then exit;
    end;

    if fGroup <> '' then begin
      s := WriteReadLn('GROUP ' + fGroup);
      if not (copy(s,1,1)='2') then exit;
      fGroupRes := trim(copy(s, 4, length(s)));
    end;

    Result := true;
  finally
    if not Result and con.Connected then
      con.disconnect;
  end;
end;

function tDBNNTP.getGroupName: String;
begin
  Result := fGroup;
end;

procedure tDBNNTP.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings: tList);
var s : string;
    EntryNode: PVirtualNode;
    temData: pTreeData;
    vMax, vMin : Integer;
begin
  if copy(BasePath,length(BasePath),1)='\' then BasePath := copy(BasePath,1,length(BasePath)-1);
  if open(BasePath) then try
     if not (copy(WriteReadLn('LIST'), 1, 1)='2') then exit;

     repeat
       s := con.ReadLn;
       if (s='.'+CRLF) then break;
       if pos('.', s)=1 then system.delete(s, 1, 1);

       EntryNode := res.AddChild(RootNode);
       temData  := res.GetNodeData(EntryNode);
       with temData^ do begin
        imgidx  := 31; //2: Pull or not
        DB      := tDBNNTP;

        new(Path);
        PathStrings.Add(Path);

        vMax := -1; vMin := 0;

        if pos(' ', s)>0 then
          Caption := trim(copy(s, 1, pos(' ', s)))
        else
          Caption := s;

        Path^   := BasePath + '<<' + Caption;

        s := trim(copy(s, pos(' ', s), length(s)));
        if pos(' ', s)>1 then
          vMax := StrToInt(copy(s, 1, pos(' ', s)-1));

        s := trim(copy(s, pos(' ', s), length(s)));
        if pos(' ', s)>1 then
          vMin := StrToInt(copy(s, 1, pos(' ', s)-1));

        Count   := vMax-vMin;
        if (Count>-1) then
          Count := Count + 1;
      end;
     until false; //not (con.DataAvailable);
  finally
    close;
  end;
end;

//Ich gehe davon aus, dass die ArtList und XOver nach ArtNum sortiert sind.
//Ausserdem lese ich alles aus (langsam bei wenigen Artikeln in ArtList,
//schnell bei vielen).
function tDBNNTP.GetOverList(const ArtList: toArtList; vPath: PString;
  var Res: tStringList; progr : tProgressXOver) : Boolean;
var
    temTreeData: POverview;
    line, s: string;
    OverRes: TStrings;
    actual : Integer;
    posi   : Integer;
    cancel : Boolean;
begin
  Result := true;
  posi := 0;
  OverRes := TStringList.Create;
  try
    Res.Sorted := true;

    s := WriteReadLn('XOVER '+IntToStr(Min)+'-'+IntToStr(Max));
    if Copy(s, 1, 1) <> '2' then begin
      Result := inherited GetOverList(ArtList, vPath, Res, progr);
      Exit;
    end;

    repeat
      line := con.ReadLn;
      if line = '.' + CRLF then Break;
      if Copy(line, 1, 1) = '.' then Delete(line, 1, 1);

      ComputeXOverLine(line, OverRes);
      actual := StrToIntDef(OverRes[0], -1);
      //Progressbar
      if (Assigned(progr)) then
        progr(fGroup, Min, Max, actual, cancel);
      //Cancel: Rest laden...
      if cancel then begin
        Result := false;
        progr('Canceling', Min, Max, Max, cancel);
        while (True) do begin
          line := con.ReadLn;
          if line = '.' + CRLF then exit;
        end
      end;

      //Auf naechstliegenden ArtList gehen
      while ((posi<length(ArtList)) and (actual>ArtList[posi])) do inc(posi);
      //Ups, wir haben schon alles
      if (posi>=length(ArtList)) then break;
      //Wir haben eine neue gefunden
      if (actual=ArtList[posi]) then begin
        temTreeData := ComputeOverOfXOver(OverRes, vPath, tDBBaseClass(self.ClassType));
        Res.AddObject(temTreeData^.Mid, TObject(temTreeData));
      end;
    until False;
  finally
    OverRes.Free;
  end
end;

function tDBNNTP.GetAllOverList(vPath: PString; var Res: tStringList;
  progr: tProgressXOver) : Boolean;
var
    temTreeData: POverview;
    line, s: string;
    OverRes: TStrings;
    cancel : Boolean;
begin
  Result := true;
  OverRes := TStringList.Create;
  try
    Res.Sorted := true;

    s := WriteReadLn('XOVER '+IntToStr(Min)+'-'+IntToStr(Max));
    if Copy(s, 1, 1) <> '2' then begin
      Result := inherited GetAllOverList(vPath, Res, progr);
      Exit;
    end;

    repeat
      line := con.ReadLn;
      if line = '.' + CRLF then Break;
      if Copy(line, 1, 1) = '.' then Delete(line, 1, 1);

      ComputeXOverLine(line, OverRes);
      //Progressbar
      if (Assigned(progr)) then
        progr(fGroup, Min, Max, StrToIntDef(OverRes[0], -1), Cancel);
      //Cancel: Rest laden...
      if cancel then begin
        progr('Canceling', Min, Max, Max, cancel);
        Result := false;
        while (True) do begin
          line := con.ReadLn;
          if line = '.' + CRLF then exit;
        end
      end;

      temTreeData := ComputeOverOfXOver(OverRes, vPath, tDBBaseClass(self.ClassType));
      Res.AddObject(temTreeData^.Mid, TObject(temTreeData));
    until False;
  finally
    OverRes.Free;
  end
end;

procedure tDBNNTP.GetArticle(ArtNum: integer; var ResArt: String;
  var ResSize: Integer);
var s : string;
begin
  ResArt := '';
  ResSize := -1;
  if not fCreated or not con.connected then exit;

  s := WriteReadLn('ARTICLE ' + IntToStr(ArtNum));
  if not (copy(s,1,1)='2') then exit; //Hopefully nothing else...
  s := '';
  repeat
    s := con.ReadLn;
    if (s='.'+CRLF) then break;
    if pos('.', s)=1 then system.Delete(s,1,1);
    ResArt := ResArt + s;
  until false; //not (con.DataAvailable);
  ResSize := length(ResArt);
end;

function tDBNNTP.Count: longint;
var s : string;
begin
  Result := 0;
  if fGroupRes<>'' then begin
    s := trim(copy(fGroupRes, 1, pos(' ', fGroupRes)));
    if s<>'' then
    Result := StrToInt(s);
  end;
end;

function tDBNNTP.Max: longint;
var s : string;
begin
  Result := -1;
  if fGroupRes<>'' then begin
    s := trim(copy(fGroupRes, pos(' ', fGroupRes), length(fGroupRes)));
    s := trim(copy(s, pos(' ', s), length(s)));
    s := trim(copy(s, 1, pos(' ', s)));
    if s<>'' then
    Result := StrToInt(s);
  end;
end;

function tDBNNTP.Min: longint;
var s : string;
begin
  Result := 0;
  if fGroupRes<>'' then begin
    s := trim(copy(fGroupRes, pos(' ', fGroupRes), length(fGroupRes)));
    s := trim(copy(s, 1, pos(' ', s)));
    if s<>'' then
    Result := StrToInt(s);
  end;
end;

procedure tDBNNTP.Close;
begin
  try
    if not fCreated then exit;
    if con.connected then begin
      con.writeln('QUIT');
      con.ReadLn //Keine "Connection Lost"s
    end;
    con.Disconnect;
  finally
    if fCreated then begin
      fCreated := false;
      con.free;
    end;
  end;
end;

end.
