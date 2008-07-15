unit uDBBase;

interface

uses VirtualTrees, windows, cArticle, classes;

type
  toArtList = array of integer; //ArtNums
  pString = ^String;
  tDBBaseClass = class of tDBBase;

  tGroup = record
     Path : PString;
     DB   : tDBBaseClass;
     Name : String;
  end;
  tGroupList = array of tGroup;

  pPointer = ^pOverview;
  pOverview = ^tOverview; //Hier wird der Overview gespeichert
  tOverview = packed record
    ArtNum     : Integer;
    From,
    Subject    : WideString;
    MID,
    References : String;       //Zum Threaden; In-Reply-To wird einfach angehangen...
    Root       : Integer;      //Zum Threaden: Welches Element der Liste ist die Wurzel?
    rootHasChild : Boolean;    //Zum Threaden
    Date       : tDateTime;
    Size       : Integer;
    Path       : PString;
    DB         : tDBBaseClass;
  end;

  //Im group-tree wird ein Datasource gespeichert.
  PTreeData = ^TTreeData; //this is a node example
  TTreeData = packed record
    Path   : PString;
    Caption: String;
    ImgIdx : Integer;
    Count  : Integer;
    DB     : tDBBaseClass;
  end;

  //TODO: Remembering von Gruppen
  tGFRememberedDataSource = record
      fDB   : tDBBaseClass; //Database-Class (name)
      fPath : String;       //BasePath
      fCapt : String;       //ID der RDS
  end;


  tProgressXOver = procedure (grpName : String; min, max, actual : Integer; out cancel : Boolean)  of Object;

  tDBBase = class
    protected
      fPath : String;
      fCreated : Boolean;

      function getGroupName() : String; virtual;
    public
      //Should be implemented
      function  Count : longint; virtual;

      //*MUST* be implemented in child-class
      //(Exspecially "ReadFolderlist" is problematic to program)
      procedure GetArticle (ArtNum : integer; var ResArt : String; var ResSize : Integer); virtual; abstract;
      //May be implemented
      procedure GetHeader (ArtNum : integer; var ResHdr : String; var ArtSize : Integer); virtual;

      function  Max   : longint; virtual; abstract;
      function  Min   : longint; virtual; abstract;

      procedure ReadFolderList(res : tVirtualStringTree;
                               RootNode : PVirtualNode; BasePath : String;
                               PathStrings : tList); virtual; abstract;

      //If possible override it with a faster routine
      function GetAllOverList(vPath : PString; var Res : tStringList; progr : tProgressXOver) : Boolean; virtual;
      function GetOverList(const ArtList : toArtList; vPath : PString; var Res : tStringList; progr : tProgressXOver) : Boolean; virtual;

      //If you need Open override it, but use inherited!
      function Open(Path : String): boolean; virtual;
      //if you don't need close you only need to have an empty Method.
      procedure Close; virtual; abstract;

      //WARNING: a overwritten CREATE will NEVER be called!
      //But destroy is called.
      Constructor Create;
      Destructor Destroy; override;
  end;


//Static
function ComputeOverOfXOver(const XOver : tStrings; vPath : PString;
    dbc : tDBBaseClass) : pOverview;
procedure ComputeXOVerLine(line : String; var OverRes : tStrings);


implementation

{ tDBBase }

uses SysUtils, uDateTime, uCharSets, cPCRE;

destructor tDBBase.Destroy;
begin
  Close;
  inherited;
end;

function tDBBase.Open(Path: String): boolean;
begin
  fPath := Path;
  Result := true;
end;

function  tDBBase.Count : longint;
begin
  Result := Max - Min
end;

procedure tDBBase.GetHeader(ArtNum: integer; var ResHdr: String; var ArtSize : Integer);
var tmp : Integer;
begin
  GetArticle(ArtNum, ResHdr, ArtSize);
  tmp := pos(#13#10#13#10, ResHdr);
  if (tmp>0) then SetLength(ResHdr, tmp)
end;

function tDBBase.GetOverList(const ArtList: toArtList; vPath: PString;
  var Res: tStringList; progr : tProgressXOver) : Boolean;
var i, Num, ma : integer;
    temTreeData : pOverview;
    Article : tArticle;
    fSize   : Integer;
    s       : string;
    cancel  : Boolean;
    dbclass : tDBBaseClass;
begin
    dbclass := tDBBaseClass(self.ClassType);
    Article := tArticle.create;
    try
      Res.Sorted := true;

      //Create list of articles
      ma := length(ArtList)-1;
      for i := 0 to length(ArtList)-1 do begin
        //Progressbar
        if (Assigned(progr)) then
          progr(getGroupName, 0, ma, i, cancel);
        if cancel then break;

        Num := ArtList[i];
        GetHeader(Num, s, fSize);
        Article.Text := s; //Dauert zu lang

        if Article.HeaderCount>0 then begin
          new(temTreeData);

          with temTreeData^ do begin
            //Save Headers (Overview)
            ArtNum     := Num;
            Size       := fSize;
            Mid        := Article.Header['Message-ID:'];
            if ((Mid='') or (Res.IndexOf(Mid)>=0)) then begin
              Mid := IntToStr(Num) + '::' + Article.Header['Newsgroups'] + '@GoldFind.noMID.invalid';
            end;
            References := Article.Header['References:']
                        + Article.Header['In-Reply-To:'];
                                  //References + In-Reply-To  um den Tree zu finden.
                                  //In-Reply-To wird so als erstes ausgewertet!
            Root       := -2;     //Nicht initialisiert
            Date       := Article.GetGMTDateDT;
            Path       := vPath;
            DB         := dbclass;

            //Decode Headers
            From    := HeaderToUnicode(Article.Header['From:']);
            Subject := HeaderToUnicode(Article.Header['Subject:']);
          end;
          //In Liste einfügen
          Res.addobject(temTreeData^.Mid, TObject(temTreeData))
        end
      end
   finally
     Article.free
   end;
   Result := not cancel;
end;


constructor tDBBase.Create;
begin
  inherited;
  fCreated := false;
end;

function tDBBase.GetAllOverList(vPath: PString; var Res: tStringList;
  progr: tProgressXOver) : boolean;
var
  i, mi, ma : Integer;
  tmp : toArtList;
begin
  mi := Min;
  ma := Max;
  SetLength(tmp, ma-mi+1);
  for i := mi to ma do
    tmp[i-mi] := i;
  Result := GetOverList(tmp, vPath, Res, progr);
  SetLength(tmp, 0);
end;

function tDBBase.getGroupName: String;
begin
  Result := fPath;
end;

{ Static }

procedure ComputeXOVerLine(line : String; var OverRes : tStrings);
var p : integer;
begin
  OverRes.Clear;
  repeat
    p := Pos(#9, line);
    if p > 0 then begin
      OverRes.Add(Copy(line, 1, p-1));
      Delete(line, 1, p);
    end;
  until p = 0;
  OverRes.Add(line);

  while OverRes.Count < 7 do OverRes.Add('');
end;

function ComputeOverOfXOver(const XOver : tStrings; vPath : PString;
    dbc : tDBBaseClass) : pOverview;
begin
  New(Result);
  with Result^ do begin
    ArtNum := StrToInt(XOver[0]);
    Size := StrToInt(XOver[6]);
    Mid := XOver[4];
    References := XOver[5];
    Root       := -2;     //Uninitialisiert
    Date := RfcDateTimeToDateTimeGMT(XOver[3]);
    Path := vPath;
    DB := dbc;

    From := HeaderToUnicode(XOver[2]);
    Subject := HeaderToUnicode(XOver[1]);
  end;
end;

end.
