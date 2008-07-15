unit uStatisticsBase;

interface

uses uDBBase, Classes, Sysutils, Graphics;

var sColors : array of tColor;

type
  //tDBList = array of tDBBaseClass;

  tStatOptions = record
                   Ranking : Boolean;
                   BeginDate,
                   EndDate : tDateTime;
                   Param   : String;
                 end;
  tStatShow = record
                Options : set of (ssoDisable, ssoRanking, ssoBDate, ssoEDate,
                                  ssoEdParam, ssoHasGraph);
                Caption : String;
                ParamCapt : String;
                DefParam : String;
              end;

  tChartOneResult = record
      groupname : String; //Or ALL for all
      values    : Array of Integer;
  end;
  tChartResult = record
      name    : String;               //Name of whole statistic
      xAxis   : String;
      yAxis   : String;
      valueNames : Array of String;   //Names of columns (same length as values)
      results : Array of tChartOneResult; //Same Length as groupnames
  end;

  tProgressData = record
    FindCount : Integer;
    GrpCount  : Integer;
    GrpMax    : Integer;
    GrpName   : String;
  end;
  tProgressStep = procedure (data : tProgressData; out cancel : Boolean) of Object;
  tFindProgressStep = procedure (cnt : Integer) of Object;


  tStatisticBaseClass = class of tStatisticBase;
  tStatisticBase = class //Base Statistic (Base-Class)
    private //Fuer den GUI-Ruecksprung
      progress : tProgressData;
      fEventProgress : tProgressStep;
      fEventFindProgress : tFindProgressStep;
    protected //Fuer den GUI-Ruecksprung
      procedure clearFindCount();
      procedure incFindCount();
      procedure clearGrpCount(name : String; max : Integer);
      function incGrpCount() : Boolean;

    protected
      fStatOptions : tStatOptions;
      fResultAsText : String;
      fResultAsChart : tChartResult;

      function DayOK( DateTime: tDateTime ): Boolean;
      function StatDayBaseText: String;
      procedure initializeChart(valueCount : Integer; GroupCount : Integer);
    public
      function  GetShowOptions : tStatShow; virtual; abstract;
      procedure SetOptions( Options : tStatOptions); virtual;
      procedure MakeStatistic( Groups : tGroupList); virtual; abstract;

      function GetResultAsText  : String; virtual;
      function GetResultAsChart : tChartResult; virtual;

      Constructor Create(EventProgress : tProgressStep; EventFindProgress : tFindProgressStep);
      Destructor  Destroy; override;
    end;

    
    tStatNONE = class (tStatisticBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
    end;


Const CRLF = #13#10;
function GetGruppenTrenner() : string;
const OldDefault = 29221.0; // =EncodeDate(1980,1,1)
                            //See RfcDateTimeToDateTimeGMT


implementation

uses uConfiguration;

function GetGruppenTrenner() : string;
begin
  case (Conf.fGroupParter) of
    gpNone:  Result := CRLF + CRLF;
    gpBoth:  Result := CRLF + '_________-_________-_________-_________-_________-_________-_________-' + CRLF;
    gpSingle:Result := CRLF + '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' + CRLF;
  end;
end;

{ tStatisticBase }

constructor tStatisticBase.Create(EventProgress : tProgressStep; EventFindProgress : tFindProgressStep);
begin
  inherited Create;
  fEventProgress := EventProgress;
  fEventFindProgress := EventFindProgress;
  fResultAsText := '';
  initializeChart(0, 0);

  with fStatOptions do begin
    Param     := '';
    Ranking   := false;
    BeginDate := now;
    EndDate   := now
  end;
end;

destructor tStatisticBase.Destroy;
begin
  initializeChart(0, 0);
  inherited;
end;

function tStatisticBase.GetResultAsChart: tChartResult;
begin
  Result := fResultAsChart
end;

function tStatisticBase.GetResultAsText: String;
begin
  Result := fResultAsText
end;

procedure tStatisticBase.SetOptions(Options: tStatOptions);
begin
  fStatOptions := Options
end;

function tStatisticBase.DayOK( DateTime: tDateTime ): Boolean;
var Days: LongInt;
begin
  Days := Trunc(DateTime);
  Result := ((Trunc(fStatOptions.BeginDate)<=Days)
        and (Trunc(fStatOptions.EndDate)>=Days))
        or (DateTime = OldDefault)
end;

function tStatisticBase.StatDayBaseText: String;
begin
  Result := 'between ' + DateToStr(fStatOptions.BeginDate) + ' and ' + DateToStr(fStatOptions.EndDate)
end;


procedure tStatisticBase.initializeChart(valueCount, GroupCount: Integer);
var i : Integer;
begin
  with (fResultAsChart) do begin
    //Freigabe von Speicher
    for i := Length(results)-1 downto 0 do
      setlength(results[i].values, 0);

    //Anzahl an Spaltenueberschriften
    setlength(valueNames, valueCount);

    //Anzahl Charts (Mit oder ohne "all groups")
    if GroupCount=1 then
      setlength(results, 1)
    else
      setlength(results, GroupCount + 1);

    //Values der Charts
    for i := 0 to Length(results)-1 do
      setlength(results[i].values, valueCount);
  end
end;


//Ausgelagerte FindCount fuer spaetere GUI
procedure tStatisticBase.clearFindCount;
begin
  progress.FindCount := 0;
end;

procedure tStatisticBase.incFindCount;
//var tmp : Boolean;
begin
  inc(progress.FindCount);
  if (Assigned(fEventFindProgress)) then begin
    fEventFindProgress(progress.FindCount);
  end;
  //Wegen dem Cancel-Button ist das nicht so toll:
  //TODO Ueberlegen... 
  //if (Assigned(fEventProgress)) then
  //  fEventProgress(progress, tmp);
end;

procedure tStatisticBase.clearGrpCount(name : String; max: Integer);
begin
  progress.GrpMax := max;
  progress.GrpCount := 0;
  progress.GrpName := name;
end;

function tStatisticBase.incGrpCount : Boolean;
begin
  Result := false;
  inc(progress.GrpCount);
  if (Assigned(fEventProgress)) then
    fEventProgress(progress, Result)
end;

{ tStatNONE }

function tStatNONE.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoDisable];
    Caption   := '------------';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatNONE.MakeStatistic(Groups: tGroupList);
begin
  fResultAsText := '';
end;


procedure setSColors(arr : Array of tColor);
var i : Integer;
begin
  SetLength(sColors, length(arr));
  for i := 0 to length(arr)-1 do
    sColors[i] := arr[i];
end;


initialization
  SetSColors([clMaroon, clGreen, clNavy, clPurple, clTeal, clSilver,
              clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clLtGray,
              clDkGray, clOlive, clGray]);
end.
