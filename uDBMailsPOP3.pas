unit uDBMailsPOP3;

interface

uses VirtualTrees, PSock, uDBBase, Classes;

//"Groups" are the account-name, you can set
//more than one account per POP3-Server
//user>>pass|user>>pass@host:port

type
  tDBPOP3 = class(tDBBase) //Group I/O
    private
      Con : tPowerSock;
      fAccount : String;
      fCount : Integer;
      function WriteReadLn(s : string) : string;
    procedure ReadList(tsl: tStrings);
    protected
      function getGroupName: String; override;
    public
      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); override;

      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); override;

      function Count : longint; override;
      function Max   : longint; override;
      function Min   : longint; override;

      function Open(Path : String): boolean; override;
      procedure Close; override;
  end;

implementation

{ tDBPOP3 }

uses SysUtils, uDateTime, uCharSets;

function tDBPOP3.WriteReadLn(s: string): string;
begin
  Con.WriteLn(s);
  Result := Con.ReadLn;
end;

procedure tDBPOP3.ReadList(tsl : tStrings);
var
  s : string;
begin
  s := Con.ReadLn;
  Delete(s, length(s)-1, 2);
  while (s<>'.') do begin
    if (copy(s,1,1)='.') then Delete(s,1,1);
    tsl.add(s);
    s := Con.ReadLn;
    Delete(s, length(s)-1, 2);
  end;
end;

function tDBPOP3.Open(Path: String): boolean;
var
  s : string;
  fUser, fPass  : string;
  fHost : string;
  fPort : Integer;
  tsl : tStringList;
begin
  if not fCreated then begin
    fCreated := true;
    Con := tPowerSock.Create(nil);
  end;

  Result := false;
  fPath := Path;

  fHost := '';
  fPort := 110;

  fUser := '';
  fPass := '';

  fAccount := '';

  //user>>pass@host:port
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

  fAccount := fUser;

  //host:port
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
    if not (copy(s,1,1)='+') then exit;

    s := WriteReadLn('USER ' + fUser);
    if (copy(s,1,1)='+') then s := WriteReadLn('PASS ' + fPass);
    if (copy(s,1,1)<>'+') then exit; //Fehler!

    s := WriteReadLn('UIDL');
    if (copy(s,1,1)='+') then begin
      tsl := tStringList.create;
      try
        ReadList(tsl);
        fCount := tsl.count
      finally
        tsl.free
      end;
    end else
      exit;

    Result := true;
  finally
    if not Result and con.Connected then
      con.disconnect;
  end;
end;

function tDBPOP3.getGroupName: String;
begin
  Result := fAccount
end;

procedure tDBPOP3.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings: tList);
var
    EntryNode: PVirtualNode;
    temData: pTreeData;
    vCount : Integer;
    po, i : Integer;
    tsl : tStringList;
begin
  //user>>pass|user>>pass@host:port
  //Groups: Every user has one group
  //Connect each account internally (new objects?) to get min/max/count
  tsl := tStringList.create;
  try
    //Extrahieren der User/Pass-Teile
    po := pos('|', BasePath);
    while (po>0) do begin
      tsl.add(copy(BasePath, 1, po-1));
      BasePath := copy(BasePath, po+1, length(BasePath));
      po := pos('|', BasePath);
    end;
    //Letzter User/Pass
    po := pos('@', BasePath);
    if (po=0) then exit; //Kein host/port?
    tsl.add(copy(BasePath, 1, po-1));
    BasePath := copy(BasePath, po+1, length(BasePath));

    //In TSL stehen 'user>>pass' und in BasePath steht 'host:port'
    for i := 0 to tsl.count-1 do begin
      EntryNode := res.AddChild(RootNode);
      temData  := res.GetNodeData(EntryNode);
      with temData^ do begin
        new(Path);
        PathStrings.Add(Path);
        Path^ := tsl[i] + '@' + BasePath;

        with tDBPOP3.create do try
          Open(Path^);
          vCount := Count;
          Close();
        finally free end;

        imgidx  := 38;
        DB      := tDBPOP3;
        Caption := copy(tsl[i], 1, pos('>>',tsl[i])-1);
        Count   := vCount;
        //if (Count>-1) then Count := Count + 1;
      end;
    end;

  finally
    tsl.free
  end;
end;

procedure tDBPOP3.GetArticle(ArtNum: integer; var ResArt: String;
  var ResSize: Integer);
var s : string;
  tsl : tStringList;
begin
  ResArt := '';
  ResSize := -1;
  if not fCreated or not con.connected then exit;

  tsl := tStringList.create;
  try
    s := WriteReadLn('RETR ' + IntToStr(ArtNum));
    if not (copy(s,1,1)='+') then exit;
    ReadList(tsl);
    ResArt := tsl.Text;
    ResSize := length(ResArt);
  finally
    tsl.free
  end
end;

function tDBPOP3.Count: longint;
begin
  Result := fCount
end;

function tDBPOP3.Max: longint;
begin
  Result := fCount
end;

function tDBPOP3.Min: longint;
begin
  Result := 1
end;

procedure tDBPOP3.Close;
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
