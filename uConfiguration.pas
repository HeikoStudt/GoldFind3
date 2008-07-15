unit uConfiguration;

interface

uses uSearchBase, graphics, forms;

type
  tArticleListSort = (alsSubject, alsFrom, alsDate, alsSize);
  tArticleListSortDir = (alsdAsc, alsdDesc);
  tArticlePreviewHighlOne = (aphStrike, aphItalic, aphBold, aphUnderline, aphQuote, aphLink, aphSignature, aphHeaderName, aphHTML);
  tArticlePreviewHighl = set of tArticlePreviewHighlOne;

  tShowFrom = (frAll, frName, frAddress);
  tDBTyp = (HamsterNews, HamsterMails, HamsterOLE, UnixMBX, NNTP, POP3);

  PDBTypes = ^tDBTypes;
  tDBTypes = set of tDBTyp;

  tGroupParter = (gpNone, gpBoth, gpSingle);

type
  tGFDataSource = record
    caption  : String;
    BasePath : String;
    types    : tDBTypes;
  end;
  tGFDataSources = array of tGFDataSource;

  //Nicht wirklich schoen, aber effektiv
  tConfiguration = class
  public
    //Datasources
    fDataSources : tGFDataSources;

    //Main
    fTreeView   : Boolean; //Auto
    fChartIn3d  : Boolean; //Auto

    fShowFrom   : tShowFrom;
    fDateFormat : String;
    fChartPicExt: Integer; //Auto    //Welcher Filterindex fuer Export
    fShowArtStati:Integer; //Auto

    //GroupTree
    fGroupTreeFont  : tFont;
    fGroupTreeWidth : Integer;       //Auto //Breite von GroupTree

    //ArticleList
    fSort      : tArticleListSort;   //Auto
    fSortDir   : tArticleListSortDir;//Auto
    fArticleListFont : tFont;
    fArticleListHeight : Integer;    //Auto //Hoehe der Artikel-Liste

    //ArticlePreview
    fHighlighting : tArticlePreviewHighl;
    fArticlePreFont : tFont;

    //Search
    fLastPattern       : String;         //Auto
    fLastSearchOptions : tSearchOptions; //Auto

    //Statistics
    fLastStatistic : String;  //Auto
    fLastParamStr  : String;  //Auto
    fLastRanking   : Boolean; //Auto

    fGroupParter : tGroupParter;

    Function LoadWindowState( TheForm: TForm; Section: String; filename : String ): Boolean;
    procedure SaveWindowState( TheForm: TForm; Section: String; filename : String );

    procedure LoadFromFile(filename : String);
    procedure SaveToFile(filename : String);
  public //Wegen uMain.pas und co
    procedure AddDataSource(cap, bp : String; typ : tDBTypes);

    constructor create;
    destructor destroy; override;
  end;

const
  MAX_SHOW_LENGTH = 16636;

var
  Conf : tConfiguration;
  AppPath : String;
  iniFileName : String;

implementation

uses inifiles, uStatisticsMessPer, Sysutils, dialogs, Classes;

type
  tExtInifile = class(tInifile)
  public
    procedure IRead(const Section, Ident: String; var Default: string); overload;
    procedure IRead(const Section, Ident: String; var Default: Integer); overload;
    //procedure IRead(const Section, Ident: String; var Default: DWord); overload;
    procedure IRead(const Section, Ident: String; var Default: Boolean); overload;
    procedure IRead(const Section, Ident: String; var Default: tArticlePreviewHighl); overload;
    procedure IRead(const Section, Ident: String; var Default: tSearchOptions); overload;
    procedure IRead(const Section, Ident: String; var Default: tDBTypes); overload;
    procedure IRead(const Section, Ident: String; var Default: tFontStyles); overload;
    procedure IWrite(const Section, Ident: String; const Value: string); overload;
    procedure IWrite(const Section, Ident: String; const Value: Integer); overload;
    procedure IWrite(const Section, Ident: String; const Value: Boolean); overload;
    procedure IWrite(const Section, Ident: String; const Value: tArticlePreviewHighl); overload;
    procedure IWrite(const Section, Ident: String; const Value: tSearchOptions); overload;
    procedure IWrite(const Section, Ident: String; const Value: tDBTypes); overload;
    procedure IWrite(const Section, Ident: String; const Value: tFontStyles); overload;
    procedure ReadFont(const Section, Ident: string; var InOut : tFont);
    procedure WriteFont(const Section, Ident: string; const Value : tFont);
  end;


{ tConfiguration }

//Should not be overriden, called by create!
procedure tConfiguration.AddDataSource(cap, bp: String; typ: tDBTypes);
var i : integer;
begin
  if ((bp = '') or (typ=[])) then exit;
  //Ueberpruefen ob schon drin.
  for i := 0 to length(fDataSources)-1 do begin
    if (fDataSources[i].BasePath = bp) then begin
      fDataSources[i].types := fDataSources[i].types + typ;
      //MessageDlg('Double Sources: ' + fDataSources[i].Caption + ' and ' + cap, mtError, [mbOK], -1);
      exit;
    end;
  end;

  //Hinzufuegen
  SetLength(fDataSources, length(fDataSources)+1);
  with fDataSources[length(fDataSources)-1] do begin
    Caption  := cap;
    BasePath := bp;
    types    := types + typ
  end
end;

//Default values
constructor tConfiguration.create;
begin
  inherited;
  //Datasources
  SetLength(fDataSources, 0);

  //Eigenen Pfad als Default, der ist immer dabei!
  //ARGL! Bad for config dialog
  AddDataSource('HamsterHere', AppPath + 'Hamster.ini', [HamsterNews,HamsterMails]);

  //Main
  fTreeView     := true;
  fChartIn3d    := false;
  fShowFrom     := frName;
  fDateFormat   := 'dd.mm.yyyy';
  fChartPicExt  := 1;
  fShowArtStati := 0;

  //GroupTree
  fGroupTreeWidth    := -1; //Do nothing
  fGroupTreeFont := tFont.Create;
  with fGroupTreeFont do begin
    Name  := 'Lucida Sans Unicode';
    Size  := 10;
    Style := [];
  end;

  //ArticleList
  fSort         := alsDate;
  fSortDir      := alsdDesc;
  fArticleListHeight := -1; //Do nothing
  fArticleListFont := tFont.Create;
  with fArticleListFont do begin
    Name  := 'Lucida Sans Unicode';
    Size  := 10;
    Style := [];
  end;

  //ArticlePreview
  fHighlighting := [aphStrike, aphItalic, aphBold, aphUnderline, aphQuote, aphLink, aphSignature, aphHeaderName, aphHTML];
  fArticlePreFont := tFont.Create;
  with fArticlePreFont do begin
    Name  := 'Courier New';
    Size  := 10;
    Style := [];
  end;

  //Search
  fLastPattern  := '';
  fLastSearchOptions := [soHeader, soBody];

  //Statistics
  fLastStatistic := tStatMesPerMonth.ClassName;
  fLastParamStr  := '';
  fLastRanking   := false;

  fGroupParter := gpBoth;
end;

//Auch wenn unnoetig, Speicher aufraeumen
destructor tConfiguration.destroy;
begin
  SetLength(fDataSources, 0);
  fArticlePreFont.free;
  inherited;
end;

procedure tConfiguration.LoadFromFile(filename: String);
var
  i : Integer;
  ini : tExtIniFile;
  tsl : tStringList;
  types : tDBTypes;
begin
  if (not FileExists(filename)) then exit;
  ini := tExtIniFile.create(filename);
  tsl := tStringList.create;
  try
    //Main
    ini.IRead('Main', 'TreeView',    fTreeView);
    ini.IRead('Main', 'ChartIn3d',   fChartIn3d);
    fShowFrom := tShowFrom(
        ini.ReadInteger('Main', 'ShowFrom', Integer(fShowFrom)));
    ini.IRead('Main', 'DateFormat',  fDateFormat);
    ini.IRead('Main', 'ChartSaveExt',fChartPicExt);
    ini.IRead('Main', 'ShowArticlesOrStati',fShowArtStati);

    //GroupTree
    ini.IRead('GroupTree', 'GroupTreeWidth', fGroupTreeWidth);
    ini.ReadFont('GroupTree', 'GroupTreeFont', fGroupTreeFont);

    //ArticleList
    fSort    := tArticleListSort(
        ini.ReadInteger('ArticleList', 'SortWith', Integer(fSort)));
    fSortdir := tArticleListSortDir(
        ini.ReadInteger('ArticleList', 'SortDir', Integer(fSortDir)));
    ini.IRead('ArticleList', 'ArticleListHeight', fArticleListHeight);
    ini.ReadFont('ArticleList', 'ArticleListFont', fArticleListFont);

    //ArticlePreview
    ini.IRead('ArticlePreview', 'Highlight', fHighlighting);
    ini.ReadFont('ArticlePreview', 'Font', fArticlePreFont);

    //Search
    ini.IRead('Search', 'LastPattern', fLastPattern);
    ini.IRead('Search', 'LastSearchOptions', fLastSearchOptions);

    //Statistics
    ini.IRead('Statistics', 'LastStatistic', fLastStatistic);
    ini.IRead('Statistics', 'LastParamStr',  fLastParamStr);
    ini.IRead('Statistics', 'LastRanking',   fLastRanking);

    fGroupParter := tGroupParter(
        ini.ReadInteger('Statistics', 'GroupParter', Integer(fGroupParter)));


    //Die Datensourcen einlesen
    ini.ReadSections(tsl);
    for i := 0 to tsl.count-1 do begin
      if (pos('DB_', uppercase(tsl[i]))=1) then begin
        types := [];
        ini.IRead(tsl[i], 'types', types);
        if (types=[]) then continue;
        AddDataSource(
            copy(tsl[i], 4, length(tsl[i])-3), //Caption
            ini.ReadString(tsl[i], 'BasePath', ''), //BasePath
            types);
      end
    end;
  finally ini.free; tsl.free end
end;

procedure tConfiguration.SaveToFile(filename: String);
var
  i : Integer;
  ini : tExtIniFile;
  tsl : tStringList;
  secName : String;
begin
  //Kann ich in die Datei schreiben?
  i := FileOpen(filename, fmOpenReadWrite);
  if (i=-1) then begin
    MessageDlg('Could not save configuration.', mtWarning, [mbOK], -1);
    exit;
  end else begin
    FileClose(i);
  end;

  ini := tExtIniFile.create(filename);
  tsl := tStringList.create;
  try
    //Main
    ini.IWrite('Main', 'TreeView',    fTreeView);
    ini.IWrite('Main', 'ChartIn3d',   fChartIn3d);
    ini.IWrite('Main', 'ShowFrom',    Integer(fShowFrom));
    ini.IWrite('Main', 'DateFormat',  fDateFormat);
    ini.IWrite('Main', 'ChartSaveExt',fChartPicExt);
    ini.IWrite('Main', 'ShowArticlesOrStati',fShowArtStati);

    //GroupTree
    ini.IWrite('GroupTree', 'GroupTreeWidth', fGroupTreeWidth);
    ini.WriteFont('GroupTreeList', 'GroupTreeFont', fGroupTreeFont);

    //ArticleList
    ini.IWrite('ArticleList', 'SortWith', Integer(fSort));
    ini.IWrite('ArticleList', 'SortDir', Integer(fSortDir));
    ini.IWrite('ArticleList', 'ArticleListHeight', fArticleListHeight);
    ini.WriteFont('ArticleList', 'ArticleListFont', fArticleListFont);

    //ArticlePreview
    ini.IWrite('ArticlePreview', 'Highlight', fHighlighting);
    ini.WriteFont('ArticlePreview', 'Font', fArticlePreFont);

    //Search
    ini.IWrite('Search', 'LastPattern', fLastPattern);
    ini.IWrite('Search', 'LastSearchOptions', fLastSearchOptions);

    //Statistics
    ini.IWrite('Statistics', 'LastStatistic', fLastStatistic);
    ini.IWrite('Statistics', 'LastParamStr',  fLastParamStr);
    ini.IWrite('Statistics', 'LastRanking',   fLastRanking);

    ini.IWrite('Statistics', 'GroupParter',   Integer(fGroupParter));

    //Alte Datasources loeschen
    ini.ReadSections(tsl);
    for i := 0 to tsl.count-1 do begin
      if (pos('DB_', uppercase(tsl[i]))=1) then begin
        ini.EraseSection(tsl[i]);
      end;
    end;

    //Die neuen Datensourcen rausschreiben
    //Aber NICHT den ersten, meinen eigenen Pfad!
    for i := 1 to length(fDataSources)-1 do begin
      with (fDataSources[i]) do begin
        secName := 'DB_' + Caption;
        ini.IWrite(secName, 'BasePath', BasePath);
        ini.IWrite(secName, 'types', Types);
      end;
    end;
  finally ini.free; tsl.free end
end;

procedure tConfiguration.SaveWindowState(TheForm: TForm; Section: String; filename : String);
var
  ini : tExtIniFile;
begin
  ini := tExtIniFile.create(filename);
  try
    try
      case TheForm.WindowState of
        wsNormal   : ini.WriteInteger( Section, 'State', 0 );
        wsMinimized: ini.WriteInteger( Section, 'State', 1 );
        wsMaximized: ini.WriteInteger( Section, 'State', 2 );
      end;
      if TheForm.WindowState=wsNormal then begin
        ini.WriteInteger( Section, 'Left',   TheForm.Left );
        ini.WriteInteger( Section, 'Top',    TheForm.Top );
        ini.WriteInteger( Section, 'Width',  TheForm.Width );
        ini.WriteInteger( Section, 'Height', TheForm.Height );
      end;
    except
{ //Kann man ignorieren
     Log(LOGID_WARN, 'Warning.WindowState.save',
        'Window-State of %s could not be saved in Hamster.ini', TheForm.Name)
}
    end
  finally ini.free end
end;

function tConfiguration.LoadWindowState(TheForm: TForm;
  Section: String; filename : String): Boolean;
var  i: Integer;
ini : tExtIniFile;
begin
  Result := true;
  ini := tExtIniFile.create(filename);
  try
    i := ini.ReadInteger( Section, 'Left',  -1 );
    if i<>-1 then TheForm.Left   := i else Result := false;
    i := ini.ReadInteger( Section, 'Top',    -1 );
    if i<>-1 then TheForm.Top    := i else Result := false;
    i := ini.ReadInteger( Section, 'Width',  -1 );
    if i>0 then TheForm.Width  := i else Result := false;
    i := ini.ReadInteger( Section, 'Height', -1 );
    if i>0 then TheForm.Height := i else Result := false;

    Case ini.ReadInteger( Section, 'State', -1 ) of
       1: TheForm.WindowState:=wsMinimized;
       2: TheForm.WindowState:=wsMaximized;
       else TheForm.WindowState:=wsNormal;
    end;
  finally ini.free end
end;


{ tExtInifile }

procedure tExtInifile.IRead(const Section, Ident: String;
  var Default: Boolean);
begin
  Default := ReadBool(Section, Ident, Default)
end;
procedure tExtInifile.IRead(const Section, Ident: String;
  var Default: Integer);
begin
  Default := ReadInteger(Section, Ident, Default)
end;
{procedure tExtInifile.IRead(const Section, Ident: String; var Default: DWord);
begin
  Default := ReadInteger(Section, Ident, Default)
end;}
procedure tExtInifile.IRead(const Section, Ident: String;
  var Default: string);
begin
  Default := ReadString(Section, Ident, Default)
end;

procedure tExtInifile.IRead(const Section, Ident: String;
  var Default: tArticlePreviewHighl);
var
  read : Integer;
  i : tArticlePreviewHighlOne;
begin
  read := -1;
  IRead(section, ident, read);
  if read <= -1 then exit; //Default bleibt gleich
  Default := [];
  i := Low(i);
  while (read>0) and (i<=High(i)) do begin
    if (read mod 2) = 1 then Default := Default + [i];
    i := Succ(i);
    read := read div 2
  end
end;

procedure tExtInifile.IRead(const Section, Ident: String; var Default: tDBTypes);
var
  read : Integer;
  i : tDBTyp;
begin
  read := -1;
  IRead(section, ident, read);
  if read <= -1 then exit; //Default bleibt gleich
  Default := [];
  i := Low(i);
  while (read>0) and (i<=High(i)) do begin
    if (read mod 2) = 1 then Default := Default + [i];
    i := Succ(i);
    read := read div 2
  end
end;

procedure tExtInifile.IRead(const Section, Ident: String;
  var Default: tSearchOptions);
var
  read : Integer;
  i : tSearchOption;
begin
  read := -1;
  IRead(section, ident, read);
  if read <= -1 then exit; //Default bleibt gleich
  Default := [];
  i := Low(i);
  while (read>0) and (i<=High(i)) do begin
    if (read mod 2) = 1 then Default := Default + [i];
    i := Succ(i);
    read := read div 2
  end
end;

procedure tExtInifile.IRead(const Section, Ident: String; var Default: tFontStyles);
var
  read : Integer;
  i : tFontStyle;
begin
  read := -1;
  IRead(section, ident, read);
  if read <= -1 then exit; //Default bleibt gleich
  Default := [];
  i := Low(i);
  while (read>0) and (i<=High(i)) do begin
    if (read mod 2) = 1 then Default := Default + [i];
    i := Succ(i);
    read := read div 2
  end
end;

procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: Boolean);
begin
  WriteBool(Section, Ident, Value)
end;
procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: Integer);
begin
  WriteInteger(Section, Ident, Value)
end;
procedure tExtInifile.IWrite(const Section, Ident, Value: string);
begin
  WriteString(Section, Ident, Value)
end;

procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: tArticlePreviewHighl);
var
  tmp   : tArticlePreviewHighlOne;
  i, tw : Integer;
begin
  tw  := 0;
  tmp := Low(tmp);
  i   := 1;
  while (tmp<=High(tmp)) do begin
    if (tmp in Value) then tw := tw + i;
    i := i * 2;
    tmp := succ(tmp);
  end;
  WriteInteger(Section, Ident, tw);
end;

procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: tSearchOptions);
var
  tmp   : tSearchOption;
  i, tw : Integer;
begin
  tw  := 0;
  tmp := Low(tmp);
  i   := 1;
  while (tmp<=High(tmp)) do begin
    if (tmp in Value) then tw := tw + i;
    i := i * 2;
    tmp := succ(tmp);
  end;
  WriteInteger(Section, Ident, tw);
end;

procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: tDBTypes);
var
  tmp   : tDBTyp;
  i, tw : Integer;
begin
  tw  := 0;
  tmp := Low(tmp);
  i   := 1;
  while (tmp<=High(tmp)) do begin
    if (tmp in Value) then tw := tw + i;
    i := i * 2;
    tmp := succ(tmp);
  end;
  WriteInteger(Section, Ident, tw);
end;

procedure tExtInifile.IWrite(const Section, Ident: String;
  const Value: tFontStyles);
var
  tmp   : tFontStyle;
  i, tw : Integer;
begin
  tw  := 0;
  tmp := Low(tmp);
  i   := 1;
  while (tmp<=High(tmp)) do begin
    if (tmp in Value) then tw := tw + i;
    i := i * 2;
    tmp := succ(tmp);
  end;
  WriteInteger(Section, Ident, tw);
end;

procedure tExtInifile.ReadFont(const Section, Ident: string;
  var InOut: tFont);
var tfs : tFontStyles;
begin
  with InOut do begin
    Name  := ReadString(Section, Ident+'Name', Name);
    Size  := ReadInteger(Section, Ident+'Size', Size);
    tfs := Style;
    IRead(Section, Ident+'Styles', tfs);
    Style := tfs
  end;
end;

procedure tExtInifile.WriteFont(const Section, Ident: string;
  const Value: tFont);
begin
  WriteString(Section, Ident+'Name', Value.Name);
  WriteInteger(Section, Ident+'Size', Value.Size);
  IWrite(Section, Ident+'Styles', Value.Style);
end;


initialization
  AppPath := IncludeTrailingBackSlash(ExtractFilePath(Application.ExeName));
  iniFileName := AppPath+'GoldFind.ini';
  //NICHT in GoldFind.dpr...
  Conf := tConfiguration.create;
finalization
  Conf.free;

end.
