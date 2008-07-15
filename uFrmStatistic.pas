unit uFrmStatistic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, ComCtrls, ExtCtrls, StdCtrls,
  uStatisticsBase, uStatisticsMessPer, uStatisticsHeader;

type
  TfrmStatistic = class(TForm)
    pnlButtons: TPanel;
    p2: TPanel;
    Splitter1: TSplitter;
    pcResult: TPageControl;
    tsText: TTabSheet;
    tsGrafik: TTabSheet;
    Chart1: TChart;
    mmResult: TMemo;
    btnExit: TButton;
    btnMake: TButton;
    p1: TPanel;
    lbStatisticlist: TListBox;
    pOptions: TPanel;
    lFrom: TLabel;
    lTo: TLabel;
    lParam: TLabel;
    chkRank: TCheckBox;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    edParam: TEdit;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbStatisticlistClick(Sender: TObject);
    procedure btnMakeClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmStatistic: TfrmStatistic;

implementation

uses uMain, VirtualTrees, uDBBase, uDBHamsterMails, uDBHamsterNews, uDBMbox, uStatistiken;

{$R *.DFM}

procedure TfrmStatistic.btnExitClick(Sender: TObject);
begin
  Close
end;

procedure TfrmStatistic.FormCreate(Sender: TObject);
    procedure AddInList( StatClass : tStatisticBaseClass);
    begin
      with StatClass.Create(nil, nil) do try
        lbStatisticList.items.AddObject(GetShowOptions.Caption, TObject(StatClass));
      finally free end
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

  dtpFrom.DateTime := now-30; dtpFrom.MaxDate := now;
  dtpTo.DateTime   := now; dtpTo.MaxDate := now;

  lParam.caption := 'Param: ';
end;

procedure TfrmStatistic.lbStatisticlistClick(Sender: TObject);
var
  temStatShow : tStatShow;
  stati : tStatisticBaseClass;
begin
  if lbStatisticList.ItemIndex<0 then exit;
  stati := tStatisticBaseClass(lbStatisticList.items.Objects[lbStatisticList.itemIndex]);
  with stati.create(nil, nil) do try
    temStatShow := GetShowOptions
  finally free end;
  
  with temStatShow do begin
    chkRank.visible := ssoRanking in Options;
    dtpFrom.visible := ssoBDate in Options;
    lFrom.visible   := ssoBDate in Options;
    dtpTo.visible   := ssoEDate in Options;
    lTo.visible     := ssoEDate in Options;
    lParam.visible  := ssoEdParam in Options;
    edParam.visible := ssoEdParam in Options;
    edParam.Text    := DefParam;

    lParam.Caption  := 'Param: ' + ParamCapt;
  end;
end;

procedure TfrmStatistic.btnMakeClick(Sender: TObject);
var
  temStatOptions : tStatOptions;
  temGroups      : tGroupList;

  stati : tStatisticBaseClass;

  Data: pTreeData;
  Node: PVirtualNode;
  i : integeR;
begin
  SetLength(temGroups, 0);
  if lbStatisticList.ItemIndex<0 then exit;

  btnMake.Enabled  := false;
  btnExit.Enabled  := false;
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
    i := 0;
    Node := frmMainGoldFindWindow.vstGroupTree.GetFirstSelected;
    while (Node<>nil) do begin
      inc(i);
      SetLength(temGroups, i);
      Data := frmMainGoldFindWindow.vstGroupTree.GetNodeData(Node);

      temGroups[i-1].Path := Data^.Path;
      temGroups[i-1].Name := Data^.Caption;
      temGroups[i-1].DB   := Data^.DB;

      Node := frmMainGoldFindWindow.vstGroupTree.GetNextSelected(Node);
    end;
    SetLength(temGroups, i);

    stati := tStatisticBaseClass(lbStatisticList.items.Objects[lbStatisticList.itemIndex]);
    //TODO: Wenn ich das Form einbaue: Progress
    with stati.create(nil, nil) do try
      SetOptions(temStatOptions);
      MakeStatistic(temGroups);
      mmResult.Text := GetResultAsText;
    finally free end
  finally
    btnMake.Enabled  := true;
    btnExit.Enabled  := true;
    pOptions.Enabled := True
  end;
end;

end.
