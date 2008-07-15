unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ToolWin, ComCtrls, StdCtrls, VirtualTrees, ImgList, inifiles,
  uDBBase, uDBHamsterNews, uDBHamsterMails, uDBMbox, RxRichEd, uMPArticle,
  uSearchBase, uDBNewsNNTP, uDBHamsterOLE, TeeProcs, TeEngine, Chart, Buttons,
  Series, ExtDlgs, kProgress, uStatisticsBase, uStatisticsMessPer, uStatisticsHeader,
  AppEvnts, StdActns, ActnList, uConfiguration, uDBMailsPOP3,
  HH, HH_FUNCS;

type
  TfrmMainGoldFindWindow = class(TForm)
    MainMenu: TMainMenu;
    mnuTopFile: TMenuItem;
    mnuExit: TMenuItem;
    N1: TMenuItem;
    mnuTopConfig: TMenuItem;
    mnuMainConfig: TMenuItem;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    pGroupTree: TPanel;
    pnlCombo: TPanel;
    cbRootElements: TComboBox;
    mnuSearch: TMenuItem;
    vstGroupTree: TVirtualStringTree;
    GroupTreeImages: TImageList;
    spGroupTree: TSplitter;
    mnuTopHelp: TMenuItem;
    ImgListMenu: TImageList;
    mnuHelpAbout: TMenuItem;
    mnuHelpContent: TMenuItem;
    mnuAddHamDB: TMenuItem;
    mnuAddDBHamster: TMenuItem;
    OpenDialog: TOpenDialog;
    mnuCfgBuildTree: TMenuItem;
    mnuMBX: TMenuItem;
    mnuAddNNTP: TMenuItem;
    FolderIC: TImageList;
    MainFrm: TImageList;
    tbTreeView: TToolButton;
    pcState: TPageControl;
    tsArticles: TTabSheet;
    tsStatistics: TTabSheet;
    p1: TPanel;
    spViewers: TSplitter;
    pArtView: TPanel;
    pOneOverview: TPanel;
    lFrom: TLabel;
    lFromContent: TLabel;
    lNewsgroups: TLabel;
    lNewsgroupsContent: TLabel;
    lSubject: TLabel;
    lSubjectContent: TLabel;
    lDate: TLabel;
    lDateContent: TLabel;
    rxreMessage: TRxRichEdit;
    tcArtView: TTabControl;
    pOptions: TPanel;
    mnuChartin3D: TMenuItem;
    tbChart3D: TToolButton;
    popupChart: TPopupMenu;
    popChartExport: TMenuItem;
    popChartDrawasbars: TMenuItem;
    popChartDrawaslines: TMenuItem;
    popChartExportasBitmap: TMenuItem;
    popChartWMFtoclipboard: TMenuItem;
    N2: TMenuItem;
    SavePictureDialog: TSavePictureDialog;
    popChartEMFtoclipboard: TMenuItem;
    popChartDrawasarea: TMenuItem;
    N3: TMenuItem;
    popChartDrawall: TMenuItem;
    popChartDrawashorizbars: TMenuItem;
    popChartDrawaspie: TMenuItem;
    progress: tProgressForm;
    mnuHamsterOLE: TMenuItem;
    popChartChartin3D: TMenuItem;
    popChartInownWindow: TMenuItem;
    p4: TPanel;
    lStatFrom: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    lStatTo: TLabel;
    edLastDays: TEdit;
    tlDays: TLabel;
    p5: TPanel;
    p6: TPanel;
    cbStatiList: TComboBox;
    chkRank: TCheckBox;
    edParam: TEdit;
    lParam: TLabel;
    btnMake: TBitBtn;
    lStati: TLabel;
    ActionList: TActionList;
    actEditCopy: TEditCopy;
    actEditSelectAll: TEditSelectAll;
    mnuEdit: TMenuItem;
    SelectAll1: TMenuItem;
    Copy1: TMenuItem;
    btnLastDays: TButton;
    shRed: TShape;
    shRight: TShape;
    vstArticlesView: TVirtualStringTree;
    lSrc: TLabel;
    pcResult: TPageControl;
    tsText: TTabSheet;
    mmResult: TMemo;
    tsGraphic: TTabSheet;
    Chart: TChart;
    serieDemo: TFastLineSeries;
    POP31: TMenuItem;
    procedure mnuExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbRootElementsClick(Sender: TObject);
    procedure mnuHelpAboutClick(Sender: TObject);
    procedure mnuAddDBHamsterClick(Sender: TObject);
    procedure mnuSearchClick(Sender: TObject);
    procedure mnuCfgBuildTreeClick(Sender: TObject);
    procedure tcArtViewChange(Sender: TObject);
    procedure mnuAddMBXClick(Sender: TObject);
    procedure vstGroupTreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure vstArticlesViewGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vstArticlesViewHeaderClick(Sender: TVTHeader;
      Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure vstArticlesViewCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure vstGroupTreePaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure vstGroupTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure mnuAddNNTPClick(Sender: TObject);
    procedure cbStatiListChange(Sender: TObject);
    procedure btnMakeClick(Sender: TObject);
    procedure pcResultChange(Sender: TObject);
    procedure vstArticlesViewInitChildren(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var ChildCount: Cardinal);
    procedure vstArticlesViewExpanded(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure mnuChartin3DClick(Sender: TObject);
    procedure popChartExportToFileClick(Sender: TObject);
    procedure popChartExportasBitmapClick(Sender: TObject);
    procedure popChartWMFtoclipboardClick(Sender: TObject);
    procedure popChartDrawAsClick(Sender: TObject);
    procedure popChartEMFtoclipboardClick(Sender: TObject);
    procedure popChartDrawallClick(Sender: TObject);
    procedure mnuAddHamsterOLEClick(Sender: TObject);
    procedure vstGroupTreeDblClick(Sender: TObject);
    procedure popChartInownWindowClick(Sender: TObject);
    procedure edLastDaysChange(Sender: TObject);
    procedure edLastDaysKeyPress(Sender: TObject; var Key: Char);
    procedure vstArticlesViewFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure vstGroupTreeKeyPress(Sender: TObject; var Key: Char);
    procedure actEditSelectAllExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure btnLastDaysClick(Sender: TObject);
    procedure cbRootElementsKeyPress(Sender: TObject; var Key: Char);
    procedure vstArticlesViewKeyPress(Sender: TObject; var Key: Char);
    procedure rxreMessageKeyPress(Sender: TObject; var Key: Char);
    procedure mnuMainConfigClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuHelpContentClick(Sender: TObject);
    procedure dtpChange(Sender: TObject);
    procedure POP31Click(Sender: TObject);
    procedure vstArticlesViewDblClick(Sender: TObject);
  private
    fChartResult : tChartResult;
    fShowPart: Integer;

    procedure SetShowPart(const Value: Integer);
    procedure ShowArticleList(TreeView: Boolean);
    function GetTreeView: Boolean;
    procedure SetTreeView(const Value: Boolean);
    procedure DrawChartResult(Data : tChartResult);
    procedure progressStatisticStep(data : tProgressData; out cancel : Boolean);
    procedure progressStatisticFindStep(count : integer);
    procedure progressArticleStep(grpName : String; min,max,actual : Integer; out cancel : Boolean);
    procedure emptyArticleList;
    function getSelectedGroupList(rekursiv, needNotExpanded: boolean): tGroupList;
    procedure InitStatisticList(Selected : String);
    procedure ReReadConfig;

  private
    UsePaths:      tList;
    LastSearchList:tSearchList;
    ShowArticle:   tMPArticle;
    ShowArtList:   tStringList;

    procedure InitPathTree;
    property ShowPart          : Integer read fShowPart         write SetShowPart;
    property Treeview          : Boolean read GetTreeView       write SetTreeView;

    procedure MessageViewClear;
    procedure RXREShowMessage(SearchList : tSearchList; rxreMessage : tRXRichEdit; const Msg : string; WithHeader : Boolean);
  end;

var
  frmMainGoldFindWindow: TfrmMainGoldFindWindow;
  mHHelp: THookHelpSystem;

implementation

{$R *.DFM}

uses filectrl, uTools, uAbout, uoTools, uFrmSearch, uSearchTrivial,
     uEncoding, uCharsets, uFrmStatistic, uStatistiken, cPCRE, {uPerlRe,}
     uDockForm, uFrmConfig;

const
  CRLF = #13#10;


procedure TfrmMainGoldFindWindow.emptyArticleList();
var i : Integer;
begin
  for i := ShowArtList.count-1 downto 0 do
    dispose(pOverview(ShowArtList.Objects[i]));
  vstArticlesView.Clear;
  ShowArtList.Clear;
  MessageViewClear;
  ShowArticleList(false);
end;

function TfrmMainGoldFindWindow.getSelectedGroupList(rekursiv, needNotExpanded : boolean) : tGroupList;
  procedure doRekursiv(node : PVirtualNode; res : tList);
  var act : PVirtualNode;
  begin
    //vsExpanded, vsHidden, vsSelected, vsHasChildren
    if not needNotExpanded or not (vsExpanded in node^.States) then begin
      act := node^.FirstChild;
      while act<>nil do begin
        if not (vsSelected in act^.States) then begin
          res.Add(act);
          doRekursiv(act, res);
        end;
        act := act^.NextSibling;
      end;
    end;
  end;


var
  i, cnt : Integer;
  Data   : pTreeData;
  na     : tNodeArray;
  list   : tList;
begin
  list := tList.create;
  na := vstGroupTree.GetSortedSelection(true);
  try
    for i := 0 to length(na)-1 do begin
      list.Add(na[i]);
      doRekursiv(na[i], list);
    end;

    SetLength(Result, list.Count);
    cnt := 0;
    for i := 0 to list.count-1 do begin
      Data := vstGroupTree.GetNodeData(PVirtualnode(list[i]));
      if not (Data^.DB=nil) and not (Data^.Path^='') then begin
        Result[cnt].Path := Data^.Path;
        Result[cnt].Name := Data^.Caption;
        Result[cnt].DB   := Data^.DB;
        inc(cnt);
      end
    end;
    SetLength(Result, cnt)
  finally
    SetLength(na, 0);
    list.Free;
  end;
end;


procedure TfrmMainGoldFindWindow.mnuExitClick(Sender: TObject);
begin
  Close
end;

procedure AddBP(var tsl : tStringList; Path : String; DBs : tDBTypes);
var
  temBPDataBases: PDBTypes;
begin
//  Path := IncludeTrailingBackslash(Path);
  if tsl.IndexOf(Path)<0 then begin
    new(temBPDataBases);
    temBPDataBases^ := DBs;
    tsl.addobject(Path, TObject(temBPDataBases));
  end else begin
    temBPDataBases := PDBTypes(tsl.Objects[tsl.IndexOf(Path)]);
    temBPDataBases^ := temBPDataBases^ + DBs;
  end;
end;

procedure tfrmMainGoldFindWindow.InitStatisticList(Selected : String);
    procedure AddInList( StatClass : tStatisticBaseClass);
    begin
      with StatClass.Create(nil, nil) do try
        cbStatiList.items.AddObject(GetShowOptions.Caption, TObject(StatClass));
      finally free end;
      //Selektiertes selektieren
      if (StatClass.ClassNameIs(Selected)) then begin
        cbStatiList.ItemIndex := cbStatiList.Items.count-1
      end
    end;
begin
  AddInList(tStatMesPerMonth);       //'Messages per month'
  AddInList(tStatMesPerWeekDay);     //'Messages per day'
  AddInList(tStatMesPerDay);         //'Messages per weekday'
  AddInList(tStatMesPerHour);        //'Messages per hour'
  AddInList(tStatNone);              //'-'
  AddInList(tStatHeaderFrom);        //'Header: From'
  AddInList(tStatHeaderFromName);    //'Header: From (grouped, name)'
  AddInList(tStatHeaderFromDomain);  //'Header: From (grouped, domain)'
  AddInList(tStatNone);              //'-'
  AddInList(tStatHeaderSubject);     //'Header: Subject (Re:/was: skipped)'
  AddInList(tStatNone);              //'-'
  AddInList(tStatHeaderMessageID);   //'Message-ID (grouped)'
  AddInList(tStatNone);              //'-'
  AddInList(tStatHeaderXNewsreader); //'Header: Newsreader'
  AddInList(tStatHeaderXNewsreaderMsg); //'Header: Newsreader (grouped, per msg.)'
  AddInList(tStatHeaderXNewsreaderUsr); //'Header: Newsreader (grouped, per user)'
  AddInList(tStatNone);              //'-'
  AddInList(tStatHeaderOther);       //'Header: (others)'
  AddInList(tStatHeaderRegExp);      //'Header: (regex)'
  AddInList(tStatNone);              //'-'
  AddInList(tStatPathRelay);         //'Path: Relayers (Top 100)'
  AddInList(tStatPathMyFeeds);       //'Path: My Feeds'
  AddInList(tStatPathFeedsOf);       //'Path: Feeds of ...'
  AddInList(tStatNone);              //'-'
  AddInList(tStatDauJones);          //'Fun: DAU Jones ;-)'
  AddInList(tStatDauJonesName);      //'Fun: DAU Jones ;-) (grouped, name)'
end;

procedure TfrmMainGoldFindWindow.ReReadConfig();
begin
  //Empty all
  MessageViewClear;
  EmptyArticleList;

  //Schriften fuer GroupTree und ArticleList setzen
  vstGroupTree.Font.Assign(Conf.fGroupTreeFont);
  vstArticlesView.Font.Assign(Conf.fArticleListFont);

  InitPathTree;
end;

procedure TfrmMainGoldFindWindow.FormCreate(Sender: TObject);
begin
  mHHelp := THookHelpSystem.Create(AppPath, '', htHHAPI);
  Conf.LoadFromFile(iniFilename);

  //Fensterhoehe + State laden
  If Not Conf.LoadWindowState( Self, 'Main', iniFilename ) then begin
    Left := (Screen.Width - Width) div 2;
    Top := (Screen.Height - Height) div 2;
  end;

  //Breite von grouptree und article-list setzen
  if (Conf.fGroupTreeWidth<>-1) then
    pGroupTree.Width := Conf.fGroupTreeWidth;

  if (Conf.fArticleListHeight<>-1) then
    pArtView.height := Conf.fArticleListHeight;

  //Was wird angezeigt?
  pcState.ActivePageIndex := Conf.fShowArtStati;

  //Statistiken in die Auswahl (geordnet) hinzufuegen
  //Und laut Config vorselektieren
  InitStatisticList(Conf.fLastStatistic);

  //Datumspanel initialisieren
  dtpFrom.DateTime := now-30; //dtpFrom.MaxDate := now;
  dtpTo.DateTime   := now;    //dtpTo.MaxDate   := now;
  edLastDays.Text  := IntToStr(Trunc(dtpTo.DateTime) - Trunc(dtpFrom.DateTime));

  //Datasizes setzen
  vstGroupTree.NodeDataSize := SizeOf(tTreeData);
  vstArticlesView.NodeDataSize := SizeOf(pPointer);

  //Initialisierungen der internen Variablen
  UsePaths      := tList.Create;
  ShowArticle   := tMPArticle.create;
  ShowArtList   := tStringList.Create;
  ShowArtList.Sorted := true;

  //Nach der konfigurierten Spalte sortieren
  vstArticlesView.Header.SortColumn    := Integer(Conf.fSort);
  vstArticlesView.Header.SortDirection := TSortDirection(Conf.fSortDir);

  //3d-View laut Config setzen...
  mnuChartIn3D.Checked := Conf.fChartIn3d;
  chart.View3D := Conf.fChartIn3d;

  //Initialisierung der Suche aus der Konfiguration
  SetLength(LastSearchList.SBList, 0);
  with LastSearchList do begin
    BeginDate       := now-30;
    EndDate         := now;
    ToSearch        := Conf.fLastSearchOptions;
    CompletePattern := Conf.fLastPattern
  end;

  //Starten/Aktualisieren der Views.
  MessageViewClear;
  ReReadConfig(); //InitPathTree and so on

  //Beim setzen wird bisserl was gemacht
  TreeView := Conf.fTreeView;

  //Um die Dinger, die von der selektierten Statistik abhaengen zu aktualiseren
  chkRank.checked := Conf.fLastRanking;
  edParam.text    := Conf.fLastParamStr;
  cbStatiList.OnChange(nil);
end;


procedure TfrmMainGoldFindWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  HH.HtmlHelp(0, nil, HH_CLOSE_ALL, 0);
end;

procedure TfrmMainGoldFindWindow.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  //Speichern der Anzeigeeinstellungen
  Conf.fShowArtStati := pcState.ActivePageIndex;

  //TODO: Reset ArticleMaximized
  if (pGroupTree.width = 0) then pGroupTree.width := 1;
  if (pArtView.height = 0) then pArtView.height := 1;
  Conf.fGroupTreeWidth := pGroupTree.width;
  Conf.fArticleListHeight := pArtView.height;
  Conf.SaveWindowState(Self, 'Main', iniFilename);
  Conf.SaveToFile(iniFilename);

  //Freigeben der Ressourcen
  emptyArticleList;
  ShowArtList.free;
  ShowArticle.free;

  for i := 0 to UsePaths.count-1 do
    Dispose(UsePaths[i]);
  UsePaths.free;
  
  mHHelp.Free;
  HHCloseAll;     //Close help before shutdown or big trouble
end;

procedure TfrmMainGoldFindWindow.MessageViewClear;
begin
  lNewsgroupsContent.Caption := '';
  lSubjectContent.Caption    := '';
  lFromContent.Caption       := '';
  lDateContent.Caption       := '';

  lNewsGroups.Left        := lFromContent.left + lFromContent.Width + 15;
  lNewsGroupsContent.Left := lNewsgroups.left + lNewsgroups.Width + 2;
  lDate.Left              := lSubjectContent.left + lSubjectContent.Width + 15;
  lDateContent.Left       := lDate.Left + lDate.Width + 2;

  rxreMessage.clear;
  rxreMessage.lines.clear;
end;

//Richedit-Prozeduren
type
  tAttr = record
    FColor : tColor;
    BColor : tColor;
    Hide   : Boolean;
    Link   : Boolean;
    Font : record
      name  : string;
      style : tFontStyles;
      size  : Integer;
      Charset : tFontCharset;
      UnderlineType : tUnderLineType;
    end;
  end;


procedure TfrmMainGoldFindWindow.RXREShowMessage(SearchList : tSearchList; rxreMessage : tRXRichEdit; const Msg : string; WithHeader : Boolean);
//Parse Message into Richedit

var Sig : Boolean;
    Header : Boolean;

  function move(var Text : String; start,finish : integer):String;
  begin
    Result := copy(Text,start,finish);
    Text   := copy(Text,finish+1,length(Text));
  end;

  procedure AddText(rxre : tRXRichEdit; var pos : Integer; Attr : tAttr; const s : string);
  var
    sl : Integer;
    ss : Integer;
  begin
    with rxre do begin
      sl := SelLength;
      ss := SelStart;
      SelLength := 0;
      SelStart  := Pos;
      with SelAttributes do begin
        Charset              := Attr.Font.Charset;
        BackColor            := Attr.BColor;
        Color                := Attr.FColor;
        Hidden               := Attr.Hide;
        Name                 := Attr.Font.Name;
        Size                 := Attr.Font.Size;
        Style                := Attr.Font.Style;
//        Height               := Attr.Height;
        UnderlineType        := Attr.Font.UnderlineType;
        Link                 := Attr.Link;
      end;
      SelText   := s;

      pos := pos + length(s);
      SelStart  := ss;
      SelLength := sl
   end;
  end;

  procedure ParseFKU( s : string; var RE : trxRichEdit; Attr : tAttr; var posi : integer);
  var
    s2, zus : string;
    i : integer;
    temColor : tColor;
  begin
    zus := '';
    Attr.Font.Style := [];
    Attr.Link := false;
    temColor := Attr.FColor;
    if (pos('*',s)=0) and (pos('/',s)=0) and (pos('\',s)=0)
                      and (pos('-',s)=0) and (pos('_',s)=0)
                      and (pos('<',s)=0) and (pos('&',s)=0) then begin
                        AddText(re, posi, Attr, s);
    end else begin

      if copy(s,length(s)-1,2)=CRLF then
        s := copy(s,1,length(s)-2) + ' '
      else
        s := s + ' ';
      i := Pos(' ', s);
      while (i>0) and not sig do begin
        if not (i=1) then begin
          s2 := move(s,1,i);
          s2 := copy(s2,1,length(s2)-1);
        end else begin
          s2 := '';
          s := copy(s,2,length(s));
        end;

        while (length(s2)>0) and (s2[length(s2)] in ['!', '.', '?', '1', 'ß', ',', ';', ':']) do begin
          zus := s2[length(s2)] + zus;
          system.delete(s2,length(s2),1);
        end;

        if length(s)>0 then
          zus := zus + ' ';
        if (length(s2)>3) then begin
          if (s2[1]='*') and (s2[length(s2)]='*') and (aphBold in Conf.fHighlighting) then
            Attr.Font.Style := [fsBold];
          if (s2[1]='/') and (s2[length(s2)]='/') and (aphItalic in Conf.fHighlighting) then
            Attr.Font.Style := [fsItalic];
          if (s2[1]='\') and (s2[length(s2)]='\') and (aphItalic in Conf.fHighlighting) then
            Attr.Font.Style := [fsItalic];
          if (s2[1]='_') and (s2[length(s2)]='_') and (aphUnderline in Conf.fHighlighting) then
            Attr.Font.Style := [fsUnderline];
          if (s2[1]='-') and (s2[length(s2)]='-') and (aphStrike in Conf.fHighlighting) then
            Attr.Font.Style := [fsStrikeOut];
          if (s2[1]='<') and (s2[length(s2)]='>') and (aphLink in Conf.fHighlighting) then begin
            Attr.FColor := clBlue; //Purple
            Attr.Link := true;
          end;
          if (s2[1]='&') and (s2[length(s2)]=';') and (aphHTML in Conf.fHighlighting) then
            Attr.FColor := clPurple;
        end;

        AddText(re,posi,Attr,s2);
        Attr.Font.Style := [];
        Attr.FColor := temColor;
        Attr.Link := false;
        AddText(re,posi,Attr,zus);
        zus := '';

        i := Pos(' ', s);
      end;
      AddText(re,posi,Attr,s+#13#10);
    end;
  end;

var
  Art, Art2 : string;
  s2 : string;
  CTE: String; //Content_Transfer_Encoding
  CT: String; //Content_Type
  //CP: Integer;
  Charset: string;

  i,i2, lin : integer;
  sr   : toSearchResult;
  posi : integer;
  Attr : tAttr;
  SelPos : TPoint;

begin
  Header := WithHeader;
  rxreMessage.WordAttributes.BackColor := clWindow;
  rxreMessage.AutoURLDetect := (aphLink in Conf.fHighlighting);

  with rxreMessage.DefAttributes do begin
    Name  := Conf.fArticlePreFont.Name;// 'Courier New'; //Opt.Visual.ResultFont.Name;
    Size  := Conf.fArticlePreFont.Size;// 10 //Opt.Visual.ResultFont.Size;
    Style := Conf.fArticlePreFont.Style;//[];//Opt.Visual.ResultFont.Style;
  end;

  with rxreMessage.SelAttributes do begin
    Attr.Font.Charset       := Charset;
    Attr.BColor             := BackColor;
    Attr.FColor             := Color;
    Attr.Hide               := Hidden;
    Attr.Font.Name          := Name;
    Attr.Font.Size          := Size;
    Attr.Font.Style         := Style;
//        Height               := Attr.Height;
    Attr.Font.UnderlineType := UnderlineType;
    Attr.Link               := Link;
  end;

  posi := 0;
  SetLength(sr,0);
  Sig := false;
//  Header := true; //opt.Visual.ShowHeader; //Header vorhanden um sie anzuzeigen?

  CTE := Uppercase(ShowArticle.HeaderWOCRLF['Content-Transfer-Encoding:']);
  if not Header Then begin //Decodierung der Postings
    if pos('QUOTED-PRINTABLE', CTE) >0 then
        Art := DecodeQP(Msg[1], length(Msg))
    else if pos('BASE64', CTE) >0 then
        Art := DecodeB64(Msg[1], length(Msg))
    else //8Bit, 7Bit or not known
        Art := Msg;
  end else
    Art := Msg;

  //Fuer Gelbmarkierung
  Art2 := Art;

  CT  := Uppercase(ShowArticle.HeaderWOCRLF['Content-Type:']);
  //Content-Type: text/plain; charset="HZ-GB-2312"
  CharSet := copy(CT, pos('CHARSET=', CT)+8, length(CT));
  if copy(CharSet,1,1)='"' then begin
    system.delete(CharSet,1,1);
    Charset := copy(CharSet, 1, pos('"', CharSet)-1);
  end;
  {if not Header then begin
    if CharSet<>'' then begin
      CP := GetCharsetCodePage(Charset);
      if (CP = -1) then
        CP := CP_ACP
    end else
      CP := CP_ACP;
    Art := CodePageToUnicode(Art, CP)
  end;}

  while copy(Art,length(Art)-1,2)=CRLF do
    System.Delete(Art,length(Art)-1,2);

  if length(Art)>MAX_SHOW_LENGTH then
    Art := copy(Art,1,MAX_SHOW_LENGTH);

  rxreMessage.Lines.BeginUpdate;
  try
    while pos(CRLF, Art)<>0 do begin
      if Header then
        if pos(CRLF, Art)=1 then begin
          Header := false;
          if pos('QUOTED-PRINTABLE', CTE) >0 then
            Art := DecodeQP(Art[1], length(Art))
          else if pos('BASE64', CTE) >0 then
            Art := DecodeB64(Art[1], length(Art))
          else //8Bit, 7Bit or not known
            Art := Msg;

          {if CharSet<>'' then begin
            CP := GetCharsetCodePage(Charset);
            if (CP = -1) then
              CP := CP_ACP
          end else
            CP := CP_ACP;
          Art := CodePageToUnicode(Art, CP)}
        end;

      s2 := copy(Art,1,pos(CRLF,Art)+1);
      Art := copy(Art,pos(CRLF,Art)+2,length(Art));

      if not Header then begin
        if (length(s2)=5) and (pos('-- '+CRLF,s2)=1) and (pos(CRLF+'-- '+CRLF,Art)=0) then
          Sig := true;
        if (length(s2)=4) and (pos('--'+CRLF,s2)=1) and (pos(CRLF+'--'+CRLF,Art)=0) then
          Sig := True;

        if Sig and (aphSignature in Conf.fHighlighting) then
          Attr.FColor := clGreen
        else if (length(s2)>0) and (s2[1] in ['>', '|', ':'])
             and (aphQuote in Conf.fHighlighting) then
          Attr.FColor := clBlue
        else
          Attr.FColor := clBlack;

        ParseFKU(s2, rxreMessage, Attr, posi);

      end else begin //Header
        if (pos(' ', s2)=1) or (pos(#9,  s2)=1) then
          Attr.FColor := clgray
        else if (pos(':', s2)<>0) and (aphHeaderName in Conf.fHighlighting) then begin
          Attr.FColor := clRed;
          AddText( rxreMessage, posi, Attr, move(s2,1,pos(':',s2)));
          Attr.FColor := clBlack;
        end else
          Attr.FColor := clBlack;
        AddText( rxreMessage, posi, Attr, s2);
      end;
    end;

    if Art<>CRLF then begin
      s2 := Art;
      if Sig and (aphSignature in Conf.fHighlighting) then
        Attr.FColor := clGreen
      else if Header then begin
        if (pos(':', s2)<>0) and (aphHeaderName in Conf.fHighlighting) then begin
          Attr.FColor := clRed;
          AddText( rxreMessage, posi, Attr, move(s2,1,pos(':',s2)));
          Attr.FColor := clBlack;
        end else if (length(s2)>0) and (s2[1] in [#32, #9]) then
          Attr.FColor := clgray
      end else if (length(s2)>0) and (s2[1] in ['>', '|', ':']) and (aphQuote in Conf.fHighlighting) then
        Attr.FColor := clBlue
      else
        Attr.FColor := clBlack;
      ParseFKU(s2,rxreMessage, Attr, posi);
    end;

    rxreMessage.SelLength := 0;
  finally
    rxreMessage.Lines.EndUpdate
  end;

  try
    rxreMessage.Lines.BeginUpdate;
    try
      SelPos.x := rxreMessage.SelStart;
      SelPos.y := rxreMessage.SelLength + SelPos.x;
      for i2 := 0 to length(SearchList.SBList)-1 do begin
        if not (SearchList.SBList[i2].SB=nil) then begin
          with SearchList.SBList[i2].SB.create(SearchList.BeginDate, SearchList.EndDate, SearchList.ToSearch) do try
            //sr := FindPosInArt(StringReplace(rxreMessage.Lines.GetText, #13#10, #13, [rfReplaceAll]), WithHeader, SearchList.SBList[i2].Patter);
            //sr := FindPosInArt(rxreMessage.Lines.GetText, WithHeader, SearchList.SBList[i2].Patter);
            sr := FindPosInArt(Art2, WithHeader, SearchList.SBList[i2].Patter);
            for i := 0 to length(sr)-1 do begin
              lin := rxreMessage.LineFromChar(sr[i].BeginPos);
              if Header then lin := lin - 2; //BAD quick fix... Body is empty
              rxreMessage.SetSelection(sr[i].BeginPos - lin, sr[i].EndPos - lin, false);
              rxreMessage.WordAttributes.BackColor := clYellow;
  //          rxreMessage.SelLength := rxreMessage.WordAttributes
            end;
          finally
            free;
          end;
        end;
      end;

      rxreMessage.SetSelection(SelPos.x, SelPos.y, false);
    finally
      rxreMessage.Lines.EndUpdate
    end;
  except
     on E:Exception do begin
        MessageDlg( 'Regex-error:' + #13#10 + E.Message, mtError, [mbOK], 0);
        exit
     end;
  end;
end;


//Virtual Get* - Functions
procedure TfrmMainGoldFindWindow.ShowArticleList( TreeView : Boolean);
var REGEX : tPCRE;
    function GetRootArtNum(ArtNum : Integer; var References : String; var TSL : tStringList) : Integer;
          function GetLastMID(var Ref : String) : String;
          begin //Splitted von Ref die letzte (nicht erste!) MID und gibt sie zurueck
            Result := '';
            //if REGEX.MatchS( Ref ) then //Result := RE_Extract( Ref, '<\S+@\S+>$', PCRE_CASELESS );
            //  Result := REGEX.SubExp[0].Text;
            if REGEX.Exec( PChar(Ref), 0 ) then
              Result := REGEX.MatchString[0];
            Ref := copy(Ref, 1, length(Ref)-length(Result)-1)
          end;
    begin
      Result := -1;
      while (((Result=-1) or (Result=ArtNum)) and (References<>'')) do
        Result := TSL.IndexOf(GetLastMID(References));

      if Result = ArtNum then
        Result := -1;
    end;

var
  temData : pPointer;
  temNode : pVirtualNode;

  i, RootCount    : Integer;
  progrHide : Boolean;
  over : POverview;

begin
  vstArticlesView.Clear;

  progrHide := progress.Shown;
  progress.Min := 0;
  progress.Max := ShowArtList.count;
  if (not progrHide) then progress.ShowModal('Order Articles');
  REGEX := tPCRE.Create(true, PCRE_CASELESS);
  try
    //REGEX.Options := PCRE_CASELESS;
    REGEX.Compile('<\S+@\S+>$');

    if not TreeView then begin
      vstArticlesView.RootNodeCount := ShowArtList.count;
      temNode := vstArticlesView.GetFirst;
      for i := 0 to ShowArtList.count-1 do begin
        if (i mod 10) = 0 then progress.Progress('', i+1);
        temData  := vstArticlesView.GetNodeData(temNode);
        temData^ := POverview(ShowArtList.objects[i]);
        temNode  := vstArticlesView.GetNext(temNode);
      end;

    end else begin //List-->Tree
    //-----------------------------------------------

      //Build Tree
      RootCount := 0;
      for i := 0 to ShowArtList.Count-1 do begin
        if (i mod 10) = 0 then progress.Progress('Get threads', i+1);
        over := POverView(ShowArtList.Objects[i]);
        if over^.Root=-2 then begin
          over^.Root := GetRootArtNum(i, over^.References, ShowArtList);
          if over^.Root=-1 then begin
            inc(RootCount);
            over^.rootHasChild := false;
          end else
            POverView(ShowArtList.Objects[over^.Root])^.rootHasChild := true
        end
      end;

      //Show Tree into VirtualTree
      vstArticlesView.RootNodeCount := RootCount;
      temNode := vstArticlesView.GetFirst;
      for i := 0 to ShowArtList.count-1 do begin
        if (i mod 10) = 0 then progress.Progress('Show thread ('+IntToStr(i+1)+'):', i+1);
        over := POverView(ShowArtList.Objects[i]);
        if over^.Root = -1 then begin
          temData  := vstArticlesView.GetNodeData(temNode);
          temData^ := over;

          //Hat dieser Root auch Kinder?
          vstArticlesView.HasChildren[temNode] := over^.rootHasChild; //false;
          temNode  := vstArticlesView.GetNextSibling(temNode);
        end;
      end
    end;
  finally
    REGEX.free;
    if (not progrHide) then progress.Hide();
  end;

  //Sicherheitshalber aktualisieren
  vstArticlesView.repaint()
end;


procedure TfrmMainGoldFindWindow.vstGroupTreeDblClick(Sender: TObject);
  function oCompare( D1: pTreeData; D2 : tTreeData) : Boolean;
  begin
    Result := //((D1^.Path^    = D2.Path^) AND
              ((D1^.Caption = D2.Caption)
          AND (D1^.ImgIdx  = D2.ImgIdx)
          AND (D1^.Count   = D2.Count)
          AND (D1^.DB      = D2.DB));
  end;

var
  Node: PVirtualNode;
  Data: pTreeData;
  Cancel : Boolean;
begin
  //Beim Doppelklick den fokussierten oeffnen
  Node := vstGroupTree.FocusedNode;

  //Articlelist leeren.
  emptyArticleList;

  //Nichts fokussiert
  if (Node = nil) then exit;

  //Daten auslesen, Ansichten leeren
  Data := vstGroupTree.GetNodeData(Node);

  //Nichts verwertbares fokussiert
  if Data^.DB = nil then exit;

  //Nun, endlich, Articles fuellen (und damit Liste laden)
  progress.ShowModal('Loading article list...');
  try
    if Data^.Path^<>'' then
      with Data^.DB.Create do try
        Open(Data^.Path^);
        Data^.Count := Count;
        Cancel := not GetAllOverList(Data^.Path, ShowArtList, progressArticleStep);
        if (Cancel) then ; //Do nothing!
        Close;
        ShowArticleList(TreeView);
        vstArticlesView.Sort(nil, Integer(Conf.fSort), TSortDirection(Conf.fSortDir), true);
      finally
        Free
      end;
  finally
    progress.Hide
  end;
  //Focus weitergeben
  if (pcState.ActivePageIndex=0) then vstArticlesView.SetFocus;
  if (pcState.ActivePageIndex=1) then dtpFrom.SetFocus;
end;

procedure TfrmMainGoldFindWindow.vstGroupTreeKeyPress(Sender: TObject;
  var Key: Char);
var Node : PVirtualNode;
begin
  if (key = #13) then begin
    node := vstGroupTree.FocusedNode;
    if (node<>nil) then begin
      vstGroupTree.OnDblClick(Sender);
    end;

    //Focus weitergeben
    if (pcState.ActivePageIndex=0) then vstArticlesView.SetFocus;
    if (pcState.ActivePageIndex=1) then dtpFrom.SetFocus;
  end;
  if (key=#27) then cbRootElements.setFocus;
end;

procedure TfrmMainGoldFindWindow.cbRootElementsClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: pTreeData;
begin
  Node := vstGroupTree.GetFirst;
  if node=nil then exit;
  Data := vstGroupTree.GetNodeData(Node);
  while not ((Node=nil) or (Data^.Caption=cbRootElements.Text)) do begin
    Node := vstGroupTree.GetNextSibling(Node);
    Data := vstGroupTree.GetNodeData(Node);
  end;
  if Node<>nil then begin
    vstGroupTree.FullCollapse;
    vstGroupTree.ClearSelection;
    vstGroupTree.Selected[Node] := true;
    vstGroupTree.FullExpand(node);
    vstGroupTree.ScrollIntoView(Node, true);
  end;
  if (sender<>nil) then vstGroupTree.SetFocus;
end;

procedure TfrmMainGoldFindWindow.cbRootElementsKeyPress(Sender: TObject;
  var Key: Char);
var
  Node: PVirtualNode;
  Data: pTreeData;
begin
  if (key <> #13) then exit;
  Node := vstGroupTree.GetFirst;
  if node=nil then exit;
  Data := vstGroupTree.GetNodeData(Node);
  while not ((Node=nil) or (Data^.Caption=cbRootElements.Text)) do begin
    Node := vstGroupTree.GetNextSibling(Node);
    Data := vstGroupTree.GetNodeData(Node);
  end;
  if Node<>nil then begin
    vstGroupTree.FullCollapse;
    vstGroupTree.ClearSelection;
    vstGroupTree.Selected[Node] := true;
    vstGroupTree.FullExpand(node);
    vstGroupTree.ScrollIntoView(Node, true);
  end;
  vstGroupTree.SetFocus;
end;

procedure TfrmMainGoldFindWindow.mnuHelpAboutClick(Sender: TObject);
begin
  with tfrmAbout.create(frmMainGoldFindWindow) do try
    ShowModal
  finally free end
end;

procedure TfrmMainGoldFindWindow.InitPathTree;

    function AddGrpNode(res: tVirtualStringTree; RootNode: PVirtualNode;
               vCaption : String; vPath : PString; vImgIdx, vCount : Integer;
               vDB : tDBBaseClass) : PVirtualNode;
    var
      temData: pTreeData;
      temNode: PVirtualNode;
    begin
      temNode := res.AddChild(RootNode);
      temData  := res.GetNodeData(temNode);
      with temData^ do begin
        Caption := vCaption;
        Path    := vPath;
        imgidx  := vImgIdx;
        Count   := vCount;
        DB      := vDB
      end;
      Result := temNode;
    end;

var
  i : integer;
  BaseNode: PVirtualNode;
  HamsterIni : tIniFile;
  BasePath : String;
  temPath : PString;
  s : string;
  ds : tGFDataSource;

begin
  Progress.ShowModal('Loading DB-Informations...');
  try
    Progress.Min := 0;
    Progress.Max := length(Conf.fDataSources);

    vstGroupTree.clear;
    cbRootElements.clear;
    for i := 0 to UsePaths.count-1 do
      Dispose(UsePaths[i]);
    UsePaths.clear;

    for i := 0 to length(Conf.fDataSources)-1 do begin
      ds := Conf.fDataSources[i];

      if not progress.Progress(ds.Caption,i+1) then
        break; //Wegen Cancel

      //Hamster
      if (HamsterNews  in ds.types) or
         (HamsterMails in ds.types) then

        if FileExists(ds.BasePath) then begin
          HamsterIni := tIniFile.Create(ds.BasePath);
          try
            s := HamsterIni.ReadString('Directories', 'Main', '');
            if s>'' then
              BasePath := MakeAbsolutPath(s, ExtractFilePath(ds.BasePath)) + 'Hamster.ini'
            else
              BasePath := ds.BasePath;
          finally
            HamsterIni.free;
          end;
          if not FileExists(BasePath) then
            break;    //Falscher Eintrag? --> Abbrechen

          HamsterIni := tIniFile.Create(BasePath);
          try
            new(temPath);
            temPath^ := BasePath;
            UsePaths.Add(TemPath);
            BasePath := ExtractFilePath(BasePath);
            BaseNode := AddGrpNode(vstGroupTree, nil,
                        ds.Caption, temPath, 40 ,-1, nil);
            cbRootElements.items.add(ds.Caption);

            //Hamster-Newsgroups einlesen
            if (HamsterNews  in ds.types) then
              try
                if FileExists(BasePath + 'groups.hst') then
                  with tDBGroup.create do try
                    ReadFolderList(vstGroupTree,
                                   AddGrpNode(vstGroupTree, BaseNode,
                                        'NewsGroups', temPath, 6 ,-1, nil),
                                   MakeAbsolutPath(HamsterIni.ReadString('Directories', 'groups', BasePath + 'groups\'), BasePath)
                                   + ';' + BasePath,
                                   UsePaths);
                  finally
                    free
                  end;
              except end;

            //Hamster-Mailboxen einlesen
            if (HamsterMails  in ds.types) then
              try
                if FileExists(BasePath + 'accounts.!!!') then
                  with tDBMails.create do try
                    ReadFolderList(vstGroupTree,
                                   AddGrpNode(vstGroupTree, BaseNode,
                                        'Mails', temPath, 38 ,-1, nil),
                                   MakeAbsolutPath(HamsterIni.ReadString('Directories', 'Mails', BasePath+'Mails\') ,BasePath)
                                   +';'+BasePath,
                                   UsePaths);
                  finally
                    free
                  end;
              except end;

          finally
            HamsterIni.free
          end
        end;

      //MBox-Format
      if UnixMBX in ds.types then
//        if DirectoryExists(ds.BasePath) then
        try
          with tDBMbx.create do try
            ReadFolderList(vstGroupTree, nil, ds.BasePath, UsePaths);
            cbRootElements.items.add(ds.BasePath);
          finally
            free
          end;
        except end;

      //NNTP
      if NNTP in ds.types then
        try
          with tDBNNTP.create do try
            new(temPath);
            temPath^ := ds.BasePath;
            ReadFolderList(vstGroupTree,
                           AddGrpNode(vstGroupTree, nil,
                                     ds.BasePath, temPath, 4 ,-1, nil),
                           ds.BasePath, UsePaths);

            cbRootElements.items.add(ds.BasePath);
          finally
            free
          end;
        except end;

      //POP3
      if POP3 in ds.types then
        try
          with tDBPOP3.create do try
            new(temPath);
            temPath^ := ds.BasePath;
            ReadFolderList(vstGroupTree,
                           AddGrpNode(vstGroupTree, nil,
                                     ds.BasePath, temPath, 4 ,-1, nil),
                           ds.BasePath, UsePaths);

            cbRootElements.items.add(ds.BasePath);
          finally
            free
          end;
        except end;

      //Hamster-OLE
      if HamsterOLE in ds.types then
        try
          with tDBHamsterOLE.create do try
            new(temPath);
            temPath^ := ds.BasePath;
            ReadFolderList(vstGroupTree,
                           AddGrpNode(vstGroupTree, nil,
                                     ds.BasePath, temPath, 4 ,-1, nil),
                           ds.BasePath, UsePaths);

            cbRootElements.items.add(ds.BasePath);
          finally
            free
          end;
        except end;

    end
  finally
    Progress.Hide
  end;
  cbRootElements.ItemIndex := 0;
  cbRootElements.OnClick(nil)
end;

procedure TfrmMainGoldFindWindow.mnuAddDBHamsterClick(Sender: TObject);
begin
  if opendialog.execute then begin
    Conf.AddDataSource(opendialog.filename, opendialog.filename, [HamsterMails, HamsterNews]);
    InitPathTree
  end;
end;

procedure TfrmMainGoldFindWindow.mnuAddMBXClick(Sender: TObject);
begin
  if opendialog.execute then begin
    Conf.AddDataSource(opendialog.filename, opendialog.filename, [UnixMBX]);
    InitPathTree
  end;
end;

procedure TfrmMainGoldFindWindow.mnuAddHamsterOLEClick(Sender: TObject);
var s : String;
begin
  s := InputBox('Neue Hamster OLE DB', 'Bitte geben sie den OLE-Namen an:', 'Hamster.App');
  if (s<>'') then begin
    Conf.AddDataSource(s, s, [HamsterOLE]);
    InitPathTree
  end
end;

procedure TfrmMainGoldFindWindow.mnuAddNNTPClick(Sender: TObject);
var s : string;
begin
  s := Inputbox('Temporary inputbox', 'NNTP-Entry:', 'user>>pass@host:port');
  if (s = '') or (s = 'user>>pass@host:port') then exit;
  Conf.AddDataSource(s, s, [NNTP]);
  InitPathTree
end;

procedure TfrmMainGoldFindWindow.POP31Click(Sender: TObject);
var s : string;
begin
  s := Inputbox('Temporary inputbox', 'POP3-Entry:', 'user2>>pass2|user>>pass@host:port');
  if (s = '') or (s = 'user2>>pass2|user>>pass@host:port') then exit;
  Conf.AddDataSource(s, s, [POP3]);
  InitPathTree
end;



procedure TfrmMainGoldFindWindow.mnuSearchClick(Sender: TObject);
var
  groups : tGroupList;

  db : tDBBase;
  Ok : Boolean;
  i, gnr: Integer;
  tempList1, tempList2, tempList : toArtList;
  Verkn : tVerknuepfung;
  V_I1, V_I2 : Integer;
  Found : Boolean;
  Cancel : Boolean;
  sum : Integer;
begin
  if vstGroupTree.GetFirstSelected = nil then exit;

  with TfrmSearch.create(frmMainGoldFindWindow) do try
    Ok := GetPattern(LastSearchList);
    //In der Config speichern...
    Conf.fLastPattern       := LastSearchList.CompletePattern;
    Conf.fLastSearchOptions := LastSearchList.ToSearch
  finally free end;

  if ok then begin
    emptyArticleList;
    sum := 0;
    groups := getSelectedGroupList(true, false);

    progress.ShowModal('The selected groups will be searched');
    try
      for gnr := 0 to length(groups)-1 do begin
        DB := groups[gnr].DB.Create;
        try
          db.open(groups[gnr].Path^);
          SetLength(tempList1, 0);

          for Verkn := hOR to hNOT do begin
            for i := 0 to length(LastSearchList.SBList)-1 do begin
              if (not (LastSearchList.SBList[i].SB=nil))
                 and (LastSearchList.SBList[i].How = Verkn)
              then begin
                  try
                    SetLength(tempList2, 0);
                    with LastSearchList.SBList[i].SB.Create(
                            LastSearchList.BeginDate, LastSearchList.EndDate,
                            LastSearchList.ToSearch)
                    do try
                      tempList2 := find(db, db.min, db.max, LastSearchList.SBList[i].Patter);
                    finally free end;
                  except
                     on E:Exception do begin
                        MessageDlg( 'Regex-error:' + #13#10 + E.Message, mtError, [mbOK], 0);
                     end;
                  end;

                case Verkn of
                  hOR:  begin //tempList1 OR  tempList2
                          SetLength(tempList, 0);
                          tempList := tempList1;
                          for V_I1 := 0 to length(tempList2)-1 do begin
                            V_I2 := 0; found := false;
                            while (V_I2<length(tempList1)) and not found do begin
                              found := (tempList2[V_I1] = tempList1[V_I2]);
                              Inc(V_I2);
                            end;
                            if not found then begin
                              Setlength(tempList, length(tempList)+1);
                              tempList[length(tempList)-1] := tempList2[V_I1];
                            end;
                          end;
                          SetLength(tempList1, 0);
                          tempList1 := tempList;
                          StatusBar.SimpleText := 'Possibly found: ' + IntToStr(sum+length(tempList1));
                        end;
                  hAND: begin //tempList1 AND tempList2
                          SetLength(tempList, 0);
                          for V_I1 := 0 to length(tempList2)-1 do begin
                            V_I2 := 0; found := false;
                            while (V_I2<length(tempList1)) and not found do begin
                              found := (tempList2[V_I1] = tempList1[V_I2]);
                              Inc(V_I2);
                            end;
                            if found then begin
                              Setlength(tempList, length(tempList)+1);
                              tempList[length(tempList)-1] := tempList2[V_I1];
                            end;
                          end;
                          SetLength(tempList1, 0);
                          tempList1 := tempList;
                          StatusBar.SimpleText := 'Possibly found: ' + IntToStr(sum+length(tempList1));
                        end;
                  hNOT: begin //tempList1 NOT tempList2
                          SetLength(tempList, 0);
                          for V_I1 := 0 to length(tempList1)-1 do begin
                            V_I2 := 0; found := false;
                            while (V_I2<length(tempList2)) and not found do begin
                              found := (tempList1[V_I1] = tempList2[V_I2]);
                              Inc(V_I2);
                            end;
                            if not found then begin
                              Setlength(tempList, length(tempList)+1);
                              tempList[length(tempList)-1] := tempList1[V_I1];
                            end;
                          end;
                          SetLength(tempList1, 0);
                          tempList1 := tempList;
                          StatusBar.SimpleText := 'Possibly found: ' + IntToStr(sum+length(tempList1));
                        end;
                end;
              end;
            end;
          end;

          sum := sum + length(tempList1);
          StatusBar.SimpleText := 'Found: ' + IntToStr(sum);
          Cancel := not db.GetOverList(tempList1, groups[gnr].Path, ShowArtList, progressArticleStep);
          if (Cancel) then ; //break; //TODO: Clear ShowArticles and Objects! clear lists!
          ShowArticleList(false);
          //db.GetOverList(tempList1, Data^.Path, ShowArtList, nil);
          db.close;
        finally
          db.free
        end;
      end;
      StatusBar.SimpleText := 'Found: ' + IntToStr(sum);
      ShowArticleList(TreeView);
    finally
      progress.hide
    end
  end;
  SetLength(groups, 0);
end;

procedure TfrmMainGoldFindWindow.mnuCfgBuildTreeClick(Sender: TObject);
begin
  TreeView := not TreeView;
end;

procedure TfrmMainGoldFindWindow.tcArtViewChange(Sender: TObject);
var s : string;
begin
  s := String(tcArtView.Tabs[tcArtView.TabIndex]);
  if pos(':',s)<=1 then exit;
  ShowPart := StrToInt(copy(s,1,pos(':',s)-1));
end;

procedure TfrmMainGoldFindWindow.SetShowPart(const Value: Integer);
begin
  //-1: RAW
  // 0: Body
  // 1: Header
  // 2..n+1: MIME 1 ... MIME n
  fShowPart := Value;
  MessageViewClear;
  with ShowArticle do begin
    lDateContent.Caption    := Header['Date:'];
    lFromContent.Caption    := Header['From:'];
    lSubjectContent.Caption := Header['Subject:'];

    if Header['Newsgroups:']<>'' then begin
      lNewsgroups.Caption := 'Newsgroups:'; //Name of label is historical
      lNewsgroupsContent.Caption := Header['Newsgroups:']
    end else begin
      lNewsgroups.Caption := 'To:'; //Name of label is historical
      lNewsgroupsContent.Caption := Header['To:'];
    end;

    lNewsGroups.Left        := lFromContent.left + lFromContent.Width + 15;
    lNewsGroupsContent.Left := lNewsgroups.left + lNewsgroups.Width + 2;
    lDate.Left              := lSubjectContent.left + lSubjectContent.Width + 15;
    lDateContent.Left       := lDate.Left + lDate.Width + 2;
  end;

  case Value of
    -1:  rxreShowMessage(LastSearchList, rxreMessage, ShowArticle.Text, false);
    0:   rxreShowMessage(LastSearchList, rxreMessage, ShowArticle.FullHeader, true);
    1:   rxreShowMessage(LastSearchList, rxreMessage, ShowArticle.FullBody, false);
  else
    rxreShowMessage(LastSearchList, rxreMessage, ShowArticle.GetPartText(Value-1), false)
  end;
  if Value=0 then tcArtView.TabIndex := 2
  else if Value=1 then tcArtView.TabIndex := 1
  else if Value=-1 then tcArtView.TabIndex := 0
  else tcArtView.TabIndex := Value+1;
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewInitChildren(
  Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal);
VAR
  i, ChCount, RootNum : Integer;
  temNode : PVirtualNode;
  over : POverView;
begin
  ChCount := 0;
  RootNum := ShowArtList.IndexOf(POverview(sender.GetNodeData(Node)^)^.MID);
  for i := 0 to ShowArtList.Count-1 do begin
    over := POverView(ShowArtList.Objects[i]);
    if over^.Root = RootNum then begin
      temNode := sender.AddChild(Node, over);
      sender.HasChildren[temNode] := over^.rootHasChild;
      inc(ChCount)
    end
  end;
  ChildCount := ChCount
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewExpanded(
  Sender: TBaseVirtualTree; Node: PVirtualNode);
var temNode : PVirtualNode;
begin
  temNode := Node.FirstChild;
  while temNode<>nil do begin
    if sender.HasChildren[temNode] then
      sender.Expanded[temNode] := true;
    temNode := temNode.NextSibling
  end
end;

procedure TfrmMainGoldFindWindow.vstGroupTreeGetImageIndex(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var Data: pTreeData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data^.ImgIdx
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewGetText(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: WideString);
var Data: pPointer;
    s: string;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  if Assigned(Data^) then
    case Column of
      0: CellText := Data^^.Subject;
      1: case Conf.fShowFrom of
           frAll:      CellText := Data^^.From;
           frAddress:  CellText := FilterEMailOfFrom(Data^^.From);
           frName:     CellText := FilterNameOfFrom(Data^^.From);
         end;
      2: begin
           DateTimeToString(s, Conf.fDateFormat, Data^^.Date);
           CellText := s;
         end;
      3: CellText := IntToStr(Data^^.Size);
    end;
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewHeaderClick(
  Sender: TVTHeader; Column: TColumnIndex; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //Switch
  Conf.fSortDir := tArticleListSortDir(1-Integer(Conf.fSortDir));
  Conf.fSort := tArticleListSort(Column);
  Sender.SortColumn := Column;
  Sender.SortDirection := TSortDirection(Conf.fSortDir);
  //Resort
  vstArticlesView.Sort(nil, Column, TSortDirection(Conf.fSortDir));
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewCompareNodes(
  Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);

  function CompareInt(a, b: Integer): Integer;
  begin
    if a > b then
      Result := 1
    else if a < b then
      Result := -1
    else
      Result := 0;
  end;

  function CompareInt64(a, b: Int64): Integer;
  begin
    if a > b then
      Result := 1
    else if a < b then
      Result := -1
    else
      Result := 0;
  end;

var
  Data1, Data2 : pPointer;
  s1, s2 : string;
begin
  Result := -1;
  Data1 := Sender.GetNodeData(Node1); Data2 := Sender.GetNodeData(Node2);
  case Column of
      0: Result := AnsiCompareText(Data1^.Subject, Data2^.Subject);

      1: case Conf.fShowFrom of
           frAll:      Result := AnsiCompareText(Data1^^.From, Data2^^.From);
           frAddress:  Result := AnsiCompareText(FilterEMailOfFrom(Data1^.From),
                                       FilterEMailOfFrom(Data2^.From));         
           frName:     Result := AnsiCompareText(FilterNameOfFrom(Data1^.From),
                                       FilterNameOfFrom(Data2^.From));
         end;
      2: begin
           DateTimeToString(s1, 'yyyymmddhhnnss', Data1^.Date);
           DateTimeToString(s2, 'yyyymmddhhnnss', Data2^.Date);
           Result := CompareInt64(StrToInt64(s1), StrToInt64(s2));
         end;
      3: Result := CompareInt(Data1^.Size, Data2^.Size);
  end;
end;

procedure TfrmMainGoldFindWindow.vstGroupTreePaintText(
  Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var Data: pTreeData;
begin
  Data := Sender.GetNodeData(Node);
  if Data^.Count > 0 then begin
    if TextType = ttNormal then begin
      with TargetCanvas.Font do
        Style := Style + [fsBold]
    end else
      with TargetCanvas.Font do begin
        Color := clBlue;
        Style := Style - [fsBold]
      end
  end else with TargetCanvas.Font do
    Style := Style - [fsBold];
end;

procedure TfrmMainGoldFindWindow.vstGroupTreeGetText(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: WideString);
var Data: pTreeData;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    case TextType of
      ttNormal: CellText := Data^.Caption;
      ttStatic: if (Data^.Count>0) then
                     CellText := '(' + IntToStr(Data^.Count) + ')'
                else CellText := '';
    end
end;

function TfrmMainGoldFindWindow.GetTreeView: Boolean;
begin
  Result := Conf.fTreeView;
end;

procedure TfrmMainGoldFindWindow.SetTreeView(const Value: Boolean);
begin
  Conf.fTreeView := Value;
  tbTreeView.Down := Value;
  mnuCfgBuildTree.Checked := Value;
  ShowArticleList(Value);
end;

procedure TfrmMainGoldFindWindow.cbStatiListChange(Sender: TObject);
var
  temStatShow : tStatShow;
  stati : tStatisticBaseClass;
begin
  if cbStatiList.ItemIndex<0 then exit;
  stati := tStatisticBaseClass(cbStatiList.items.Objects[cbStatiList.itemIndex]);
  with stati.create(nil, nil) do try
    temStatShow := GetShowOptions
  finally free end;

  with temStatShow do begin
    if (ssoHasGraph in Options) then begin
      //pcResult.activePage := tsText;
      //pcResult.Enabled := true;
    end else begin
      pcResult.activePage := tsText;
      pcResult.OnChange(nil);
      //pcResult.Enabled := false;
    end;
    btnMake.Enabled   := not (ssoDisable in Options);
    chkRank.Enabled   := ssoRanking in Options;
    dtpFrom.Enabled   := ssoBDate in Options;
    lStatFrom.Enabled := ssoBDate in Options;
    dtpTo.Enabled     := ssoEDate in Options;
    lStatTo.Enabled   := ssoEDate in Options;
    edLastDays.Enabled:= (ssoBDate in Options) and (ssoEDate in Options);
    tlDays.Enabled    := (ssoBDate in Options) and (ssoEDate in Options);
    lParam.Enabled    := ssoEdParam in Options;
    edParam.Enabled   := ssoEdParam in Options;
    edParam.Text      := DefParam;

    lParam.Caption    := 'Param: ' + ParamCapt;
  end;
end;

procedure TfrmMainGoldFindWindow.DrawChartResult(Data : tChartResult);
VAR
   TempSerie : TChartSeries;
   i, j : integer;
   //allAdd : integer;
begin
   //Befreien wir uns mal von alten Charts
   for i:=chart.SeriesList.Count-1 downto 1 do
     chart.SeriesList[i].free;

   //Globale Sachen fuer den chart
   with chart do begin
     title.Text.clear;
     title.text.Add(Data.name);
     BottomAxis.Inverted := false;
     BottomAxis.Title.Caption := Data.xAxis;
     LeftAxis.Title.Caption := Data.yAxis;
   end;

   //Serien hinzufuegen
   //if (Length(Data.results)>1) allAdd := 1 else allAdd := 0;
   for i := 0 to Length(Data.results)-1 do begin
     if (i = 0) and (Length(Data.results)>1) and not popChartDrawall.checked then continue;
      if (popChartDrawasbars.Checked) then
         tempserie := tBarSeries.create(nil)
      else if (popChartDrawaslines.Checked) then
         tempserie := tLineSeries.create(nil)
      else if (popChartDrawasarea.Checked) then
         tempserie := TAreaSeries.create(nil)
      else if (popChartDrawashorizbars.checked) then
         tempserie := THorizBarSeries.create(nil)
      else if (popChartDrawaspie.checked) then
         tempserie := TPieSeries.create(nil)
      else
         tempserie := tLineSeries.create(nil);

      with tempserie do begin
        Assign( chart.SeriesList[0]);
        Clear;
        tempserie.Title := Data.results[i].groupname;
        ShowInLegend    := true;
        SeriesColor     := sColors[i mod Length(sColors)];
        for j := 0 to length(Data.results[i].values)-2 do
          tempserie.Add(Data.results[i].values[j], Data.valueNames[j]);
        //Bad dates nur wenn existent
        j := length(Data.results[i].values)-1;
        if (Data.results[i].values[j]>0) then
          tempserie.Add(Data.results[i].values[j], Data.valueNames[j]);
      end;
      chart.addseries(TempSerie);
   end;
end;

procedure TfrmMainGoldFindWindow.progressStatisticStep(data : tProgressData; out cancel : Boolean);
begin
  cancel := false;
  //Testweise mal so...
  statusbar.SimpleText := 'Found: ' + IntToStr(data.FindCount);

  //Grp* nur jeden 20. Schritt aktualisieren. Der allererste gehoert dazu!
  if (data.GrpCount mod 20 = 1) then begin
    //Progressbar mit Infos fuellen
    progress.Min := 0;
    progress.Max := data.GrpMax;
    cancel := not progress.Progress(data.grpName + ' (' + IntToStr(data.GrpMax) + ')', data.GrpCount);
  end
end;

procedure TfrmMainGoldFindWindow.progressStatisticFindStep(count: integer);
begin
  //TODO Kann ich noch nicht rausschmeissen, leider.
  statusbar.SimpleText := 'Found: ' + IntToStr(count);
end;

procedure TfrmMainGoldFindWindow.progressArticleStep(grpName: String; min,
    max, actual: Integer; out cancel : Boolean);
begin
  cancel := false;
  if (actual mod 20 = 1) then begin
    progress.Min := min;
    progress.Max := max;
    cancel := not progress.Progress(grpName, actual)
  end
end;

procedure TfrmMainGoldFindWindow.btnMakeClick(Sender: TObject);

    procedure CopyChartResult(crFrom : tChartResult; var crTo : tChartResult);
    var i : integer;
    begin
      crTo := crFrom;
      crTo.valueNames := Copy(crFrom.valueNames, 0, length(crFrom.valueNames));
      crTo.results := Copy(crFrom.results, 0, length(crFrom.results));
      for i := 0 to length(crTo.results)-1 do
        crTo.results[i].values := Copy(crFrom.results[i].values, 0, length(crFrom.results[i].values));
    end;
var
  temStatOptions : tStatOptions;
  temGroups      : tGroupList;

  stati : tStatisticBaseClass;
begin
  SetLength(temGroups, 0);
  if cbStatiList.ItemIndex<0 then begin
    dialogs.MessageDlg('Please select a statistic...', mtError, [mbOK], -1);
    exit;
  end;

  if dtpFrom.DateTime > dtpTo.DateTime then begin
    dialogs.MessageDlg('Dates: "from" after "to"...', mtError, [mbOK], -1);
    exit;
  end;

  btnMake.Enabled  := false;
//  btnExit.Enabled  := false;
  pOptions.Enabled := false;
  try
    Application.ProcessMessages;
    with temStatOptions do begin
      Ranking   := chkRank.checked;
      BeginDate := dtpFrom.DateTime;
      EndDate   := dtpTo.DateTime;
      Param     := edParam.text;
    end;

    //Create Group-List:
    temGroups := getSelectedGroupList(true, false);

    if length(temGroups)>0 then begin
      stati := tStatisticBaseClass(cbStatiList.items.Objects[cbStatiList.itemIndex]);
      progress.ShowModal('Statistic: ' + cbStatiList.items[cbStatiList.itemIndex]);
      try
        with stati.create(progressStatisticStep, progressStatisticFindStep) do try
          SetOptions(temStatOptions);
          MakeStatistic(temGroups);
          mmResult.Text := GetResultAsText;
          CopyChartResult(GetResultAsChart, fChartResult);
          DrawChartResult(fChartResult);
        finally
          free;
          statusbar.simpleText := ''
        end
      finally progress.hide end
    end else begin
      mmResult.Text := '';
    end;
    SetLength(temGroups, 0);
  finally
    btnMake.Enabled  := true;
    pOptions.Enabled := True
  end;
end;

procedure TfrmMainGoldFindWindow.pcResultChange(Sender: TObject);
begin
  case pcResult.ActivePageIndex of
    0: begin
         chart.visible    := false;
         mmResult.visible := true;
       end;
    1: begin
         chart.visible    := true;
         mmResult.visible := false;
       end;
  end;
end;

procedure TfrmMainGoldFindWindow.mnuChartin3DClick(Sender: TObject);
begin
  Conf.fChartIn3d           := not conf.fChartIn3d;
  mnuChartIn3D.Checked      := Conf.fChartIn3d;
  chart.View3D              := Conf.fChartIn3d;
  tbChart3D.Down            := Conf.fChartIn3d;
  popChartChartin3D.Checked := Conf.fChartIn3d
end;

procedure TfrmMainGoldFindWindow.popChartExportToFileClick(Sender: TObject);
var s : string;
begin
  SavePictureDialog.FilterIndex := Conf.fChartPicExt;
  if SavePictureDialog.Execute then begin
    Conf.fChartPicExt := SavePictureDialog.FilterIndex;
    s := SavePictureDialog.FileName;
    case SavePictureDialog.FilterIndex of
    1: begin
      if not (lowercase(ExtractFileExt(s))='.bmp') then
        s := s + '.bmp';
      Chart.SaveToBitmapFile(s);
      Conf.fChartPicExt := 1
      end;
    2: begin
      if not (lowercase(ExtractFileExt(s))='.emf') then
        s := s + '.emf';
      Chart.SaveToMetafileEnh(s);
      Conf.fChartPicExt := 2
      end;
    3: begin
      if not (lowercase(ExtractFileExt(s))='.wmf') then
        s := s + '.wmf';
      Chart.SaveToMetafile(s);
      Conf.fChartPicExt := 3
      end;
    end;
  end;
end;

procedure TfrmMainGoldFindWindow.popChartExportasBitmapClick(Sender: TObject);
begin
  Chart.CopyToClipboardBitmap
end;

procedure TfrmMainGoldFindWindow.popChartWMFtoclipboardClick(Sender: TObject);
begin
  Chart.CopyToClipboardMetafile(false)
end;

procedure TfrmMainGoldFindWindow.popChartEMFtoclipboardClick(Sender: TObject);
begin
  Chart.CopyToClipboardMetafile(true)
end;

procedure TfrmMainGoldFindWindow.popChartDrawAsClick(Sender: TObject);
begin
  (Sender as TMenuItem).checked := true;
  DrawChartResult(fChartResult)
end;

procedure TfrmMainGoldFindWindow.popChartDrawallClick(Sender: TObject);
begin
  (Sender as TMenuItem).checked := not (Sender as TMenuItem).checked;
  DrawChartResult(fChartResult)
end;

procedure TfrmMainGoldFindWindow.popChartInownWindowClick(Sender: TObject);
var tr : TRect;
begin
  if (not popChartInownWindow.checked) then begin
    popChartInownWindow.checked := true;
    tr.Left := Screen.DesktopLeft;
    tr.Bottom := Screen.DesktopHeight;
    tr.Right := Screen.DesktopWidth;
    tr.Top := 0;
    // Use our own docksite class, which in our case disables the 'close' button
    // And also the resizeability
    Chart.FloatingDockSiteClass := TDockForm;
    Chart.ManualFloat(tr);

  end else begin
    popChartInownWindow.checked := false;
    Chart.FloatingDockSiteClass := nil;
    //Chart.ManualDock(pChart);
    Chart.ManualDock(tsGraphic);
    Chart.Align := alClient;
  end;
end;


//Nur Zahlen zulassen
procedure TfrmMainGoldFindWindow.edLastDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then exit; //Return
  if (Key = #8) then  exit; //Backslash
  if (Key < #48) then Key := #0;
  if (Key > #58) then Key := #0;
end;


procedure TfrmMainGoldFindWindow.edLastDaysChange(Sender: TObject);
var days : Integer;
    base : tDateTime;
const maxDays : Integer = 40000;
begin
  //Auslesen der Tage
  if (edLastDays.text = '') then
    days := 0
  else
    days := StrToIntDef(edLastDays.text, 0);

  //Abschneiden, sonst gibt es eine Exception
  if days>maxDays then begin
    edLastDays.Text := IntToStr(maxDays);
    days := maxDays;
  end;

  //Datum richtig setzen
  base := dtpTo.DateTime; //now
  if (base>now) then base := now;
  dtpFrom.DateTime := base-days; //dtpFrom.MaxDate := base;
  dtpTo.DateTime   := base;      //dtpTo.MaxDate   := base;
end;

procedure TfrmMainGoldFindWindow.dtpChange(Sender: TObject);
begin
  if (dtpFrom.DateTime<dtpTo.DateTime) then
    edLastDays.text := IntToStr(Round(dtpTo.DateTime-dtpFrom.DateTime))
end;

procedure TfrmMainGoldFindWindow.vstArticlesViewFocusChanged(
  Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
var
  Data: pPointer;
  s : string;
  i : integer;
begin
  MessageViewClear;
  for i := tcArtView.Tabs.Count-1 downto 3 do
    tcArtView.Tabs.Delete(i);

  if node = nil then begin
    exit;  //Nichts fokussiert (eigentlich nicht moeglich)
  end;

  Data := vstArticlesView.GetNodeData(Node);
  if (Data^^.DB=nil) or (Data^^.Path^ = '') then exit;

  with Data^^.DB.Create do try
    Open(Data^^.Path^);
     GetArticle(Data^^.ArtNum, s, i);
     ShowArticle.SetText(s);
     for i := 1 to ShowArticle.GetPartsCount do
       tcArtView.tabs.Add(IntToStr(i+1) + ': ' + ShowArticle.GetPartTyp(i));
     tcArtView.Repaint();
     ShowPart := 1; //Shows the article itself (Body)
    Close
  finally
    free
  end;
end;

procedure TfrmMainGoldFindWindow.actEditSelectAllExecute(Sender: TObject);
begin
  if mmResult.Focused then
    mmResult.SelectAll
  else if rxreMessage.Focused then
    rxreMessage.SelectAll
  else if vstGroupTree.Focused then
    vstGroupTree.SelectAll(true)
  else if vstArticlesView.Focused then
    rxreMessage.SelectAll
end;

procedure TfrmMainGoldFindWindow.actEditCopyExecute(Sender: TObject);
begin
  if mmResult.Focused then
    mmResult.CopyToClipboard
  else if rxreMessage.Focused then
    rxreMessage.CopyToClipboard
  else if vstGroupTree.Focused then //macht nicht sooo viel Sinn...
    vstGroupTree.CopyToClipBoard
  else if vstArticlesView.Focused then
    rxreMessage.CopyToClipboard
end;

procedure TfrmMainGoldFindWindow.btnLastDaysClick(Sender: TObject);
begin
  dtpTo.DateTime := now;
  dtpFrom.DateTime := now - StrToIntDef(edLastDays.Text, 0)
end;


procedure TfrmMainGoldFindWindow.vstArticlesViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key=#13) then rxreMessage.SetFocus;
  if (key=#27) then vstArticlesView.setFocus;
end;

procedure TfrmMainGoldFindWindow.rxreMessageKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key=#27) then vstArticlesView.setFocus;
end;

procedure TfrmMainGoldFindWindow.mnuMainConfigClick(Sender: TObject);
begin
  if (showConfigurationModal(self, Conf)) then begin
    ReReadConfig();
    self.Repaint;
  end;
end;

procedure TfrmMainGoldFindWindow.mnuHelpContentClick(Sender: TObject);
begin
  HtmlHelp(GetDesktopWindow, 'GoldFind3.chm', HH_DISPLAY_TOPIC, 0);
end;


procedure TfrmMainGoldFindWindow.vstArticlesViewDblClick(Sender: TObject);
begin
  vstArticlesView.Expanded[vstArticlesView.FocusedNode] := true
end;

end.
