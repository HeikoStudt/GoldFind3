unit uDBHamsterOle;

interface

uses VirtualTrees, uDBBase, Classes, ActiveX, ComObj {,OleAuto},
     Forms;

type
  tDBHamsterOle = class(tDBBase)
    private
      ham       : OLEVariant;
      fGroup    : String;
      fGroupIdx : Integer;
    protected
      function getGroupName: String; override;
    public
      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); override;

      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); override;
      function GetOverList(const ArtList: toArtList; vPath: PString; var Res: tStringList; progr : tProgressXOver) : Boolean; override;
      function GetAllOverList(vPath: PString; var Res: tStringList; progr: tProgressXOver) : Boolean; override;

      function Count : longint; override;
      function Max   : longint; override;
      function Min   : longint; override;

      function Open(Path : String): boolean; override;
      procedure Close; override;
  end;

implementation

{ tDBNNTP }

uses SysUtils;

function tDBHamsterOle.Open(Path: String): boolean;
var vPath, s1, s2 : String;
begin
  Result := false;
  if pos('<<', Path)>0 then begin
    fGroup := trim(copy(Path, pos('<<', Path)+2, length(Path)));
    vPath := copy(Path, 1, pos('<<', Path)-1);
  end else begin
    fGroup := '';
    vPath := Path;
  end;

  CoInitialize( nil ); //???
  // create 'Hamster.App'-object
  try
    ham := CreateOleObject( vPath ); //'Hamster.App'
    if (fGroup <> '') then begin
      fGroupIdx := ham.NewsGrpOpen(fGroup)
    end;
    Result := true;
  except
     on E:Exception do begin
        s1 := 'ERROR: ' + E.Message;
        s2 := 'Object "'+vPath+'" could not be created!';
        Application.MessageBox(
            PChar(s1),
            PChar(s2),
            1 );
        exit;
     end;
  end;
end;

function tDBHamsterOle.getGroupName: String;
begin
  Result := fGroup;
end;

procedure tDBHamsterOle.ReadFolderList(res: tVirtualStringTree;
  RootNode: PVirtualNode; BasePath: String; PathStrings: tList);
var
  max, idx, i : Integer;
  name : String;
  EntryNode: PVirtualNode;
  temData: pTreeData;

begin
  if open(BasePath) then try
     max := ham.NewsGrpCount;
     for idx := 0 to max-1 do begin
       name := ham.NewsGrpName(idx);
       EntryNode := res.AddChild(RootNode);
       temData  := res.GetNodeData(EntryNode);
       with temData^ do begin
         imgidx  := 31; //2: Pull or not
         DB      := tDBHamsterOle;
         Caption := name;

         new(Path);
         PathStrings.Add(Path);
         Path^   := BasePath + '<<' + Caption;
         i := ham.NewsGrpOpen(name);
         Count   := ham.NewsArtCount(i);
         ham.NewsGrpClose(i);
       end;
     end;
  finally close end
end;

function tDBHamsterOle.GetAllOverList(vPath: PString;
  var Res: tStringList; progr : tProgressXOver) : Boolean;
var j, i, mi, ma: Integer;
    temTreeData: POverview;
    line: string;
    OverRes: TStrings;
    linesList : TStrings;
    cancel : Boolean;
begin
  OverRes := TStringList.Create;
  lineslist := TStringList.create;
  try
    Res.Sorted := true;

    {
    s := WriteReadLn('XOVER '+IntToStr(Min)+'-'+IntToStr(Max));
    if Copy(s, 1, 1) <> '2' then begin
      Result := inherited GetOverList(ArtList, vPath, Res);
      Exit;
    end;
    }

    mi := Min;
    ma := Max;
    i := mi;
    while (i<ma) do begin
      linesList.Text := ham.NewsGrpXOver(fGroupIdx, i, i+99);
      //Progressbar
      if (Assigned(progr)) then
        progr(fGroup, mi, ma, i, cancel);
      if cancel then break;

      j := 0;
      repeat
        line := linesList[j];
        ComputeXOverLine(line, OverRes);
        //Progressbar
        if (Assigned(progr)) then
          progr(fGroup, Min, Max, StrToIntDef(OverRes[0], -1), cancel);
        if cancel then break;

        temTreeData := ComputeOverOfXOver(OverRes, vPath, tDBBaseClass(self.ClassType));
        Res.AddObject(temTreeData^.Mid, TObject(temTreeData));

        inc(j);
      until (j>=linesList.count);

      //Nachgeschoben
      if (cancel) then break;

      i := i + 100;
    end;

  finally
    linesList.free;
    OverRes.Free;
  end;
  Result := not Cancel
end;

function tDBHamsterOle.GetOverList(const ArtList: toArtList; vPath: PString;
  var Res: tStringList; progr : tProgressXOver) : Boolean;
var i : Integer;
    temTreeData: POverview;
    line: string;
    OverRes: TStrings;
    linesList : TStrings;
    cancel : Boolean;
begin
  OverRes := TStringList.Create;
  lineslist := TStringList.create;
  try
    Res.Sorted := true;

    {
    s := WriteReadLn('XOVER '+IntToStr(Min)+'-'+IntToStr(Max));
    if Copy(s, 1, 1) <> '2' then begin
      Result := inherited GetOverList(ArtList, vPath, Res);
      Exit;
    end;
    }

    for i := 0 to length(ArtList)-1 do begin
      line := ham.NewsArtXOver(fGroupIdx, ArtList[i]);
      //Progressbar
      if (Assigned(progr)) then
        progr(fGroup, 0, length(ArtList), i, cancel);
      if cancel then break;

      ComputeXOverLine(line, OverRes);
      temTreeData := ComputeOverOfXOver(OverRes, vPath, tDBBaseClass(self.ClassType));
      Res.AddObject(temTreeData^.Mid, TObject(temTreeData));
    end;

  finally
    linesList.free;
    OverRes.Free;
  end;
  Result := not Cancel;
end;

procedure tDBHamsterOle.GetArticle(ArtNum: integer; var ResArt: String;
  var ResSize: Integer);
begin
  ResArt := '';
  ResSize := -1;
  //if (not Assigned(ham)) then exit;

  ResArt := ham.NewsArtText(fGroupIdx, ArtNum);
  ResSize := length(ResArt);
end;

function tDBHamsterOle.Count: longint;
begin
  Result := ham.NewsArtCount(fGroupIdx)
end;

function tDBHamsterOle.Max: longint;
begin
  Result := ham.NewsArtNoMax(fGroupIdx)
end;

function tDBHamsterOle.Min: longint;
begin
  Result := ham.NewsArtNoMin(fGroupIdx)
end;

procedure tDBHamsterOle.Close;
begin
  if (fGroup<>'') then ham.NewsGrpClose(fGroupIdx);
  fGroup := '';
  // release 'Hamster.App'-object
  if (VarIsEmpty(ham)) then begin
    ham := Unassigned;
    CoUninitialize;
  end
end;

end.
