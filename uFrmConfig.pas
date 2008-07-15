unit uFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uConfiguration,
  ComCtrls, VirtualTrees, Buttons, StdCtrls, ExtCtrls;

type
  trTabSheet = record
    ts      : tTabsheet;
    caption : string;
    dataSrc : tGFDataSource;
  end;
  PrTabSheet = ^trTabSheet;


  TfrmConfig = class(TForm)
    vstOptionList: TVirtualStringTree;
    pgConfigs: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel3: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnNewServer: TButton;
    btnRemove: TButton;
    rgShowFrom: TRadioGroup;
    gbViewDateFormat: TGroupBox;
    edViewDateFormat: TEdit;
    gbFontGrp: TGroupBox;
    stFontGrpName: TStaticText;
    stFontGrpSize: TStaticText;
    btnFontGrpChange: TButton;
    gbFontOver: TGroupBox;
    stFontOverName: TStaticText;
    stFontOverSize: TStaticText;
    btnFontOverChg: TButton;
    gbFonArt: TGroupBox;
    stFontArtName: TStaticText;
    stFontArtSize: TStaticText;
    btnFontArtChg: TButton;
    gbSrvName: TGroupBox;
    edSrvName: TEdit;
    rgSrvType: TRadioGroup;
    gbSrvBasepath: TGroupBox;
    edSrvBP: TEdit;
    btnSrvSelect: TButton;
    tsText: TTabSheet;
    memText: TMemo;
    FontDialog: TFontDialog;
    stViewDFBeispiel: TStaticText;
    btnHelp: TBitBtn;
    tsHelpText: TTabSheet;
    memHelpText: TMemo;
    tsHighlighter: TTabSheet;
    gbHighlighter: TGroupBox;
    cbStrike: TCheckBox;
    cbItalic: TCheckBox;
    cbBold: TCheckBox;
    cbUnderline: TCheckBox;
    cbQuote: TCheckBox;
    cbLink: TCheckBox;
    cbSignature: TCheckBox;
    cbHeaderName: TCheckBox;
    cbHTML: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure vstOptionListGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure pgConfigsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ts2Show(Sender: TObject);
    procedure ts1Show(Sender: TObject);
    procedure vstOptionListFocusChanging(Sender: TBaseVirtualTree; OldNode,
      NewNode: PVirtualNode; OldColumn, NewColumn: TColumnIndex;
      var Allowed: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure tsTextShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure vstOptionListFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure btnFontGrpChangeClick(Sender: TObject);
    procedure btnFontOverChgClick(Sender: TObject);
    procedure btnFontArtChgClick(Sender: TObject);
    procedure edViewDateFormatChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure tsHighlighterShow(Sender: TObject);
    procedure tsHelpTextShow(Sender: TObject);
    procedure btnNewServerClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure vstOptionListCollapsing(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var Allowed: Boolean);
    procedure btnSrvSelectClick(Sender: TObject);
  private
    ProgramMade : Boolean;
    removing    : Boolean;
    dbsParent   : pVirtualNode;
    fGrpFont    : tFont;
    fOverFont   : tFont;
    fArtFont    : tFont;
    procedure ChangedGrpFont;
    procedure ChangedOverFont;
    procedure ChangedArtFont;
    procedure setActivePage(newActive : TTabSheet);
    function addChild(root: pVirtualNode; vTs: tTabsheet;
      cap: String): pVirtualNode;
    function DataBaseOK( act : prTabsheet ): Boolean;
    function ViewOK(): Boolean;
    function ActivePageChangeOK : Boolean;
  end;

//var
//  frmConfig: TfrmConfig;

  function showConfigurationModal(owner : TComponent; config : tConfiguration): Boolean;

implementation


{$R *.DFM}

function showConfigurationModal(owner : TComponent; config : tConfiguration): Boolean;
var
  node : pVirtualNode;
  i : Integer;
  Data : prTabsheet;
  hl : tArticlePreviewHighl;
begin
  with tfrmConfig.Create(owner) do try
    //Datenbanken einlesen
    dbsParent := addChild(nil, nil, 'Databases');
    for i := 0 to length(config.fDatasources)-1 do begin
      data := vstOptionList.GetNodeData(
              addChild(dbsParent, ts1, config.fDatasources[i].caption));
      data.dataSrc := config.fDataSources[i];
    end;

    //View-Optionen Einlesen
    addChild(nil, ts2, 'View');
    rgShowFrom.itemIndex  := Integer(config.fShowFrom);
    edViewDateFormat.text := config.fDateFormat;
    fGrpFont.assign(config.fGroupTreeFont);    ChangedGrpFont;
    fOverFont.assign(config.fArticleListFont); ChangedOverFont;
    fArtFont.assign(config.fArticlePreFont);   ChangedArtFont;

    //Highlighter einlesen
    addChild(nil, tsHighlighter, 'Highlighter');
    cbStrike.checked := aphStrike         in config.fHighlighting;
    cbItalic.checked := aphItalic         in config.fHighlighting;
    cbBold.checked := aphBold             in config.fHighlighting;
    cbUnderline.checked := aphUnderline   in config.fHighlighting;
    cbQuote.checked := aphQuote           in config.fHighlighting;
    cbLink.checked := aphLink             in config.fHighlighting;
    cbSignature.checked := aphSignature   in config.fHighlighting;
    cbHeaderName.checked := aphHeaderName in config.fHighlighting;
    cbHTML.checked := aphHTML             in config.fHighlighting;

    //HelpText einbinden
    addChild(nil, tsHelpText, 'Help');

    //Focus ist der Elternteil der Datenbanken
    vstOptionList.FocusedNode := dbsParent;

    //Show form
    Result := (showModal() = mrOK);
    if not Result then exit;
    vstOptionList.FocusedNode := nil;

    //Save data
    //TODO THIS is the LAST thing to do besides the help!
    //Should work: Save Datasources
    SetLength(config.fDataSources, 0);
    node := dbsParent.FirstChild;
    while (node <> nil) do begin
      data := vstOptionList.GetNodeData(node);
      if (data^.caption<>'') then begin //Wegen 'NEW'
        SetLength(config.fDataSources, length(config.fDataSources)+1);
        config.fDataSources[length(config.fDataSources)-1] := data^.dataSrc;
      end;
      node := node.NextSibling
    end;
    
    config.fShowFrom   := tShowFrom(rgShowFrom.itemIndex);
    config.fDateFormat := edViewDateFormat.text;
    config.fGroupTreeFont.Assign(fGrpFont);
    config.fArticleListFont.Assign(fOverFont);
    config.fArticlePreFont.Assign(fArtFont);

    //Save Highlighter
    hl := [];
    if (cbStrike.checked) then      hl := hl + [aphStrike];
    if (cbBold.checked) then        hl := hl + [aphBold];
    if (cbUnderline.checked) then   hl := hl + [aphUnderline];
    if (cbQuote.checked) then       hl := hl + [aphQuote];
    if (cbLink.checked) then        hl := hl + [aphLink];
    if (cbSignature.checked) then   hl := hl + [aphSignature];
    if (cbHeaderName.checked) then  hl := hl + [aphHeaderName];
    if (cbHTML.checked) then        hl := hl + [aphHTML];
    config.fHighlighting := hl;

  finally free end
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  vstOptionList.NodeDataSize := sizeof(trTabsheet);
  programMade := false;
  removing    := false;
  fGrpFont    := tFont.create;
  fOverFont   := tFont.create;
  fArtFont    := tFont.create;
  self.ModalResult := mrOK
end;

procedure TfrmConfig.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := ActivePageChangeOK()
end;

procedure TfrmConfig.FormDestroy(Sender: TObject);
begin
  fGrpFont.free;
  fOverFont.free;
  fArtFont.free
end;

function TfrmConfig.addChild(root : pVirtualNode; vTs : tTabsheet; cap : String) : pVirtualNode;
var Data : prTabsheet;
begin
  result := vstOptionList.AddChild(root);
  data := vstOptionList.GetNodeData(result);
  data^.ts := vTs;
  data^.caption := cap;
end;

procedure TfrmConfig.vstOptionListGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var Data: prTabsheet;
begin
  Data := Sender.GetNodeData(Node);
  CellText := Data^.caption
end;

procedure TfrmConfig.tsTextShow(Sender: TObject);
begin
  btnNewServer.Visible := true;
  btnRemove.Visible    := false
end;

procedure TfrmConfig.ts1Show(Sender: TObject);
begin
  btnNewServer.Visible := true;
  btnRemove.Visible    := true
end;

procedure TfrmConfig.ts2Show(Sender: TObject);
begin
  btnNewServer.Visible := false;
  btnRemove.Visible    := false
end;

procedure TfrmConfig.tsHighlighterShow(Sender: TObject);
begin
  btnNewServer.Visible := false;
  btnRemove.Visible    := false
end;

procedure TfrmConfig.tsHelpTextShow(Sender: TObject);
begin
  btnNewServer.Visible := false;
  btnRemove.Visible    := false
end;

procedure TfrmConfig.pgConfigsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := programMade;
end;

procedure TfrmConfig.setActivePage(newActive: TTabSheet);
begin
  programMade := true;
  pgConfigs.ActivePage := newActive;
  programMade := false;
end;

function TfrmConfig.ActivePageChangeOK: Boolean;
var
  node : PVirtualNode;
  data : PrTabSheet;
begin
  node := vstOptionList.FocusedNode;
  data := vstOptionList.GetNodeData(node);
  Result := true;
  if ((pgConfigs.ActivePage=ts1) and not DataBaseOK(data)) then
    Result := self.ModalResult=mrCancel;
  if ((pgConfigs.ActivePage=ts2) and not ViewOK()) then
    Result := self.ModalResult=mrCancel;
end;

function TfrmConfig.ViewOK: Boolean;
begin
  //Result := false;
  Result := true
end;

function TfrmConfig.DataBaseOK( act : prTabsheet ) : Boolean;
var node : PVirtualNode;
    data : prTabsheet;
begin
  Result := false;

  //Kein Namen?
  if (edSrvName.text='') then begin
    MessageDlg('DB name cannot be empty!', mtError, [mbOK], -1);
    exit;
  end;

  //Namen doppelt?
  node := dbsParent.FirstChild;
  while (node <> nil) do begin
    data := vstOptionList.GetNodeData(node);
    if ((data <> nil) and (data<>act)) then begin
      if (data^.dataSrc.caption = edSrvName.text) then begin
        MessageDlg('DB-Name is doubled.', mtError, [mbOK], -1);
        exit;
      end;
    end;
    node := node.NextSibling;
  end;

  //Kein Basepath?
  if (edSrvBP.text='') then begin
    MessageDlg('DB basepath cannot be empty!', mtError, [mbOK], -1);
    exit;
  end;

  //Welche Datenbank? Basepath OK?
  case (rgSrvType.ItemIndex) of
   -1: begin
         MessageDlg('Please select an DBType or remove.', mtError, [mbOK], -1);
         exit;
       end;
    0: if not FileExists(edSrvBP.text) //Mit Ausnahme eigenes Verzeichnis
          and (edSrvBP.text<>(AppPath + 'Hamster.ini')) then
       begin
         MessageDlg('Basepath: Hamster.ini can not be found', mtError, [mbOK], -1);
         exit;
       end;
    1: ; //NNTP: Cannot proove
    2: if not FileExists(edSrvBP.text) then begin
         MessageDlg('Basepath: MBox-File can not be found', mtError, [mbOK], -1);
         exit;
       end;
    3: ; //OLE: Cannot proove
    4: ; //POP3: Cannot proove
  else //Nothing
  end;

  Result := true
end;

procedure TfrmConfig.vstOptionListFocusChanging(Sender: TBaseVirtualTree;
  OldNode, NewNode: PVirtualNode; OldColumn, NewColumn: TColumnIndex;
  var Allowed: Boolean);
var Data : prTabsheet;
begin
  if removing then exit;

  //Not unused
  if (OldNode=NewNode) then exit;

  //Speichere DB, nicht besonders schoen aber funktionell
  if (OldNode <> nil) then begin
    if (OldNode=dbsParent.FirstChild) then exit; //Do not save
    Allowed := ActivePageChangeOK();
    if (not Allowed) then exit;

    //Save
    data := vstOptionList.GetNodeData(OldNode);
    if (data^.ts=ts1) then begin
      data^.caption         := edSrvName.text;
      data^.dataSrc.caption := edSrvName.text;
      case (rgSrvType.ItemIndex) of
        0: data^.dataSrc.types := [HamsterNews, HamsterMails];
        1: data^.dataSrc.types := [NNTP];
        2: data^.dataSrc.types := [UnixMBX];
        3: data^.dataSrc.types := [HamsterOLE];
        4: data^.dataSrc.types := [POP3];
      else data^.dataSrc.types := [];
      end;
      data^.dataSrc.BasePath := edSrvBP.text;
    end
  end;
end;

procedure TfrmConfig.vstOptionListFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
var
  data : PrTabSheet;
  dbType : tDBTypes;
begin
  //Empty or nothing selected
  if (node = nil) then begin
    setActivePage(tsText);
    exit;
  end;

  //Show TextSheet on DBS-Main
  data := vstOptionList.GetNodeData(node);
  if (data^.ts=nil) then begin
    setActivePage(tsText);
    exit;
  end;

  //Read in Database
  if (data^.ts=ts1) then begin
    edSrvName.text := data^.dataSrc.caption;
    dbType := data^.dataSrc.types;
    if ( [HamsterNews, HamsterMails] * dbType <> []) then
      rgSrvType.ItemIndex := 0
    else if ( [NNTP] * dbType <> []) then
      rgSrvType.ItemIndex := 1
    else if ( [UnixMBX] * dbType <> []) then
      rgSrvType.ItemIndex := 2
    else if ( [HamsterOLE] * dbType <> []) then
      rgSrvType.ItemIndex := 3
    else if ( [POP3] * dbType <> []) then
      rgSrvType.ItemIndex := 4
    else
      rgSrvType.ItemIndex := -1;
  end;
  edSrvBP.text := data^.dataSrc.BasePath;
  //Show Page
  data := vstOptionList.GetNodeData(node);
  if Assigned(data^.ts) then setActivePage(data^.ts);
end;


procedure TfrmConfig.btnRemoveClick(Sender: TObject);
var
  foc, newFoc : pVirtualNode;
  data : PrTabSheet;
begin
  if pgConfigs.ActivePage <> ts1 then exit;

  foc := vstOptionList.FocusedNode;
  if foc = nil then begin
    MessageDlg('No DB selected!?', mtInformation, [mbOK], -1);
    exit;
  end;

  data := vstOptionList.GetNodeData(foc);
  if (data=nil) then exit;
  if (data^.ts<>ts1) then exit;

  if (foc=dbsParent.FirstChild) then begin
    MessageDlg('This DB cannot be deleted or changed.',
               mtInformation, [mbOK], -1);
    exit;
  end;

  //Loescht einfach den (alten) focussierten
  removing := true;
  newFoc := foc.PrevSibling;
  if (newFoc=nil) then newFoc := foc.NextSibling;
  vstOptionList.FocusedNode := newFoc;
  vstOptionList.SetFocus;
  removing := false;

  //And now: DELETE
  vstOptionList.DeleteNode(foc);
end;

procedure TfrmConfig.ChangedGrpFont;
begin
  stFontGrpName.caption := fGrpFont.Name;
  stFontGrpSize.caption := IntToStr(fGrpFont.size);
end;

procedure TfrmConfig.ChangedOverFont;
begin
  stFontOverName.caption := fOverFont.Name;
  stFontOverSize.caption := IntToStr(fOverFont.size);
end;

procedure TfrmConfig.ChangedArtFont;
begin
  stFontArtName.caption := fArtFont.Name;
  stFontArtSize.caption := IntToStr(fArtFont.size);
end;

procedure TfrmConfig.btnFontGrpChangeClick(Sender: TObject);
begin
  fontdialog.Font.Assign(fGrpFont);
  if fontdialog.Execute then begin
    fGrpFont.assign(fontdialog.Font);
    ChangedGrpFont;
  end
end;

procedure TfrmConfig.btnFontOverChgClick(Sender: TObject);
begin
  fontdialog.Font.Assign(fOverFont);
  if fontdialog.Execute then begin
    fOverFont.assign(fontdialog.Font);
    ChangedOverFont;
  end
end;

procedure TfrmConfig.btnFontArtChgClick(Sender: TObject);
begin
  fontdialog.Font.Assign(fArtFont);
  if fontdialog.Execute then begin
    fArtFont.assign(fontdialog.Font);
    ChangedArtFont;
  end
end;

procedure TfrmConfig.edViewDateFormatChange(Sender: TObject);
var s : string;
begin
  DateTimeToString(s, edViewDateFormat.text, now);
  stViewDFBeispiel.caption := s
end;

procedure TfrmConfig.btnNewServerClick(Sender: TObject);
var
  node : pVirtualNode;
  data : PrTabSheet;
begin
  if (not activePageChangeOK()) then exit;

  node := vstOptionList.AddChild(dbsParent, nil);
  data := vstOptionList.GetNodeData(node);
  data^.dataSrc.caption := '';
  data^.caption := '';
  data^.ts := ts1;
  vstOptionList.FocusedNode := node;
  vstOptionList.SetFocus();
end;

procedure TfrmConfig.vstOptionListCollapsing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var Allowed: Boolean);
begin
  Allowed := false
end;

procedure TfrmConfig.btnSrvSelectClick(Sender: TObject);
begin
  if opendialog.execute then begin
    edSrvBP.text := opendialog.filename
  end
end;

procedure TfrmConfig.btnHelpClick(Sender: TObject);
begin
  //TODO: Show help
  //pgConfigs.ActivePage := tsHelpText
end;


end.
