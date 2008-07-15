unit uStatisticsMessPer;

interface

uses uStatisticsBase, uDateTime, uDBBase;

type
  tStatMesPerBase = class (tStatisticBase)
  private
    procedure progressOneXOver(grpName: String; min, max, actual: Integer;
              out cancel : Boolean);
    protected
      procedure GetAllDateTime(Group : tGroup; out res : tDateTimeArr; out cancel : Boolean);
    public
  end;

  tStatMesPerMonth = class (tStatMesPerBase)
    protected
      function oneSumText(tit : String;
                          beginMonth, beginYear, endYear : Integer;
                          arr : Array of Integer) : String; virtual;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatMesPerMonthOld = class (tStatMesPerMonth)
    protected
      function oneSumText(tit : String;
                          beginMonth, beginYear, endYear : Integer;
                          arr : Array of Integer) : String; override;
    public
      function GetShowOptions : tStatShow; override;
  end;

  tStatMesPerWeekDay = class (tStatMesPerBase)
    private
      function oneSumText(tit : String; arr : Array of Integer) : String;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatMesPerDay = class (tStatMesPerBase)
    private
      function oneSumText(tit : String; beginDate : tDateTime;
                      arr : Array of Integer) : String;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatMesPerHour = class (tStatMesPerBase)
    private
      function oneSumText(tit : String; findCnt : Integer;
                      arr : Array of Integer) : String;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;


implementation

uses SysUtils, Classes, uoTools;


{ tStatMesPerWeekDay }

function tStatMesPerWeekDay.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Messages per weekday';
    ParamCapt := '';
    DefParam  := '';
  end
end;

function tStatMesPerWeekDay.oneSumText(tit : String; arr : Array of Integer) : String;
begin
  Result := tit + CRLF
      + 'Monday:    ' + IntToStr(arr[0]) + CRLF
      + 'Tuesday:   ' + IntToStr(arr[1]) + CRLF
      + 'Wednesday: ' + IntToStr(arr[2]) + CRLF
      + 'Thursday:  ' + IntToStr(arr[3]) + CRLF
      + 'Friday:    ' + IntToStr(arr[4]) + CRLF
      + 'Saturday:  ' + IntToStr(arr[5]) + CRLF
      + 'Sunday:    ' + IntToStr(arr[6]) + CRLF;
  if (arr[7]>0) then
    Result := Result + 'BAD-Date:  ' + IntToStr(arr[7]) + CRLF;
end;

procedure tStatMesPerWeekDay.MakeStatistic(Groups: tGroupList);
var
  i, dow  : integer;
  gnr : LongInt;
  GrpCount, SumCount: Array of LongInt;
  grpChartAdd : Integer;
  dtarr : tDateTimeArr;
  cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;

  fResultAsText := 'Statistics: Messages per Weekday ('
                 + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')' + CRLF
                 + CRLF;

  with (fResultAsChart) do begin
    //8 Spalten, Anzahl Gruppen
    initializeChart(8, length(Groups));

    //Statistikname
    name := 'Messages per Weekday ('
          + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')';
    xAxis := 'Weekday';
    yAxis := 'Messages';

    //Spaltennamen
    valueNames[0] := 'Mon';//'Monday';
    valueNames[1] := 'Tue';//'Tuesday';
    valueNames[2] := 'Wed';//'Wednesday';
    valueNames[3] := 'Thu';//'Thursday';
    valueNames[4] := 'Fri';//'Friday';
    valueNames[5] := 'Sat';//'Saturday';
    valueNames[6] := 'Sun';//'Sunday';
    valueNames[7] := 'BAD';//'Bad-Date';
  end;
  if length(Groups)=1 then grpChartAdd := 0 else grpChartAdd := 1;

  clearFindCount;

  SetLength(GrpCount, 8);
  SetLength(SumCount, 8);
  for i:=0 to 7 do SumCount[i] := 0;
  for gnr := 0 to length(Groups)-1 do begin
    for i:=0 to 7 do GrpCount[i] := 0;
    GetAllDateTime(Groups[gnr], dtarr, cancel);
    if cancel then break;
    for i := 0 to Length(dtarr)-1 do begin
      if (dtarr[i] = oldDefault) then
        dow := 7
      else //SUN, MON, TUE, WED, THU, FRI, SAT
        dow := (6+DayOfWeek(dtarr[i])) mod 7;

      incFindCount;
      inc(GrpCount[dow]);
      inc(SumCount[dow]);
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText(Groups[gnr].Name, GrpCount);

    //Dem Chart hinzufuegen
    with fResultAsChart.results[gnr+grpChartAdd] do begin
      groupname := Groups[gnr].Name;
      for i := 0 to 7 do values[i] := GrpCount[i];
    end;

    fResultAsText := fResultAsText + GetGruppenTrenner();
  end;

  if cancel then begin
     fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF
  end;

  //Bei mehr als einer Gruppe: Summe auch ausgeben
  if (not cancel) and (length(Groups) > 1) then begin
    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText('All selected groups', SumCount);

    //Dem Chart hinzufuegen
    with fResultAsChart.results[0] do begin
      groupname := 'All';
      for i := 0 to 7 do values[i] := SumCount[i];
    end;
  end;

  SetLength(GrpCount, 0);
  SetLength(SumCount, 0);
end;

{ tStatMesPerMonth }

function tStatMesPerMonth.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Messages per month';
    ParamCapt := '';
    DefParam  := '';
  end
end;


//New style (table) Months
function tStatMesPerMonth.oneSumText(tit : String; beginMonth, beginYear, endYear : Integer;
                      arr : Array of Integer) : String;
var year, month, i, cntMonths : Integer;
begin
  cntMonths := length(arr)-1;

  //Header and begin of first line
  Result := '*** ' + tit + ' ***' + CRLF
      + '      Jan   Feb   Mar   Apr   May   Jun   Jul   Aug   Sep   Oct   Nov   Dec ' + CRLF
      + StrCenter(IntToStr(beginYear),4);
  for i := 1 to beginMonth-1 do Result := Result + '      ';

  //Rest months
  year  := beginYear;
  month := beginMonth-1;
  for i := 0 to cntMonths-1 do begin
    Result := Result + ' ' + StrCenter(IntToStr(arr[i]), 5);
    inc(month);

    //At the end CRLF and perhaps year
    if (month mod 12) = 0 then begin
      Result := Result + CRLF;
      inc(year);
      if (endYear >= year) then Result := Result + IntToStr(year);
    end;
  end;
  if (month mod 12) <> 0 then Result := Result + CRLF;
  if (arr[cntMonths]>0) then
    Result := Result + 'Bad Dates: ' + IntToStr(arr[cntMonths]) + CRLF;
end;


procedure tStatMesPerMonth.MakeStatistic(Groups: tGroupList);
var
  i, ind  : integer;
  gnr : LongInt;
  GrpCount, SumCount: Array of Integer;
  grpChartAdd : Integer;
  dtarr : tDateTimeArr;
  beginYear, beginMonth, beginDay,
  endYear, endMonth, endDay,
  year, month, day : Word;
  cntMonths : Integer;
  cancel : Boolean;

begin
  cancel := false;
  if length(Groups)=0 then exit;

  fResultAsText := 'Statistics: Messages per Month ('
                 + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')' + CRLF
                 + CRLF;

  //Get number of months
  DecodeDate(fStatOptions.BeginDate, beginYear, beginMonth, beginDay);
  DecodeDate(fStatOptions.EndDate, endYear, endMonth, endDay);
  if (beginYear=endYear) then
    cntMonths := endMonth - beginMonth
  else
    cntMonths := endMonth + 12-beginMonth + (endYear-beginYear-1)*12;

  with (fResultAsChart) do begin
    //8 Spalten, Anzahl Gruppen
    initializeChart(cntMonths+2, length(Groups));

    //Statistikname
    name := 'Messages per Month ('
          + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')';
    xAxis := ' '; //'Month';
    yAxis := 'Messages';

    for i := 0 to cntMonths do begin
      valueNames[i] := '';
      case (((beginMonth-1)+i) mod 12) of
        0:  valueNames[i] := valueNames[i] + 'January';
        1:  valueNames[i] := valueNames[i] + 'February';
        2:  valueNames[i] := valueNames[i] + 'March';
        3:  valueNames[i] := valueNames[i] + 'April';
        4:  valueNames[i] := valueNames[i] + 'May';
        5:  valueNames[i] := valueNames[i] + 'June';
        6:  valueNames[i] := valueNames[i] + 'Jule';
        7:  valueNames[i] := valueNames[i] + 'August';
        8:  valueNames[i] := valueNames[i] + 'September';
        9:  valueNames[i] := valueNames[i] + 'October';
        10: valueNames[i] := valueNames[i] + 'November';
        11: valueNames[i] := valueNames[i] + 'December';
      end;
      valueNames[i] := valueNames[i] + #13
                     + IntToStr(beginYear + (((beginMonth-1)+i) div 12));
    end;
    valueNames[cntMonths+1] := 'Bad Date';
  end;
  if length(Groups)=1 then grpChartAdd := 0 else grpChartAdd := 1;

  clearFindCount;

  SetLength(GrpCount, cntMonths+2);
  SetLength(SumCount, cntMonths+2);
  for i:=0 to cntMonths+1 do SumCount[i] := 0;
  for gnr := 0 to length(Groups)-1 do begin
    for i:=0 to cntMonths+1 do GrpCount[i] := 0;
    GetAllDateTime(Groups[gnr], dtarr, cancel);
    if cancel then break;
    for i := 0 to Length(dtarr)-1 do begin
      if (dtarr[i] = oldDefault) then
        ind := cntMonths+1
      else begin
        DecodeDate(dtarr[i], year, month, day);
        ind := ((year-beginYear)*12) + (month-beginMonth);
      end;

      incFindCount;
      inc(GrpCount[ind]);
      inc(SumCount[ind]);
    end;

    //Dem Chart hinzufuegen
    with fResultAsChart.results[gnr+grpChartAdd] do begin
      groupname := Groups[gnr].Name;
      for i := 0 to cntMonths+1 do values[i] := GrpCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText(Groups[gnr].Name,
                     beginMonth, beginYear, endYear, grpCount)
        + GetGruppenTrenner()
  end;

  if cancel then begin
    fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF
  end;

  //Bei mehr als einer Gruppe: Summe auch ausgeben
  if (not cancel) and (length(Groups) > 1) then begin
    //Dem Chart hinzufuegen
    with fResultAsChart.results[0] do begin
      groupname := 'All';
      for i := 0 to cntMonths+1 do values[i] := SumCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText('All selected groups',
                     beginMonth, beginYear, endYear, sumCount)
  end;

  SetLength(GrpCount, 0);
  SetLength(SumCount, 0);
end;

{ tStatMesPerMonthOld }

function tStatMesPerMonthOld.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Messages per month (old)';
    ParamCapt := '';
    DefParam  := '';
  end
end;

//Old-Style Text
function tStatMesPerMonthOld.oneSumText(tit : String;
                    beginMonth, beginYear, endYear : Integer;
                    arr : Array of Integer) : String;
var year, month, i, cntMonths : Integer;
begin
  cntMonths := length(arr)-1;

  //Header and begin of first line
  Result := tit + CRLF;

  //Rest months
  year  := beginYear;
  month := beginMonth;
  for i := 0 to cntMonths-1 do begin

    if (month<10) then
      Result := Result
         + StrLeft(StrRight(IntToStr(year), 4) + '.0' + IntToStr(month), 9)
         + StrCenter(IntToStr(arr[i]), 5)
         + CRLF
    else
      Result := Result
         + StrLeft(StrRight(IntToStr(year), 4) + '.' + IntToStr(month), 9)
         + StrCenter(IntToStr(arr[i]), 5)
         + CRLF;

    inc(month);
    //At the end CRLF
    if (month mod 13) = 0 then begin
      inc(year);
      month := 1;
    end;
  end;
  if (arr[cntMonths]>0) then
    Result := Result + 'Bad Dates: ' + IntToStr(arr[cntMonths+1]) + CRLF;
end;


{ tStatMesPerDay }

function tStatMesPerDay.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Messages per day';
    ParamCapt := '';
    DefParam  := '';
  end
end;

function tStatMesPerDay.oneSumText(tit : String; beginDate : tDateTime;
                      arr : Array of Integer) : String;
  var //year, month, tmpMonth, day : Word;
      weekday, i, cntDays : Integer;
  begin
    Result := tit + CRLF;
    cntDays := length(arr)-1;
    weekday := DayOfWeek(beginDate);
    //DecodeDate(beginDate, year, tmpMonth, day); //Fuer den 1. Monat
    for i := 0 to cntDays-1 do begin
      if (weekday mod 7) = 0 then Result := Result + '  ';

      Result := Result + ' ' + IntToStr(arr[i]);
      inc(weekday);

      //Optimierung: Tage nur ab 27 durch DecodeDay laufen lassen
      {if (day<27) then
        inc(day)
      else begin
        DecodeDate(beginDate+i, year, month, day);
        if (month <> tmpMonth) then begin
          Result   := Result + CRLF + CRLF;
          tmpMonth := month;
        end;
      end;}
    end;
    if (arr[cntDays]>0) then
      Result := Result + CRLF
          + ' Bad dates: ' + IntToStr(arr[cntDays]);
  end;

procedure tStatMesPerDay.MakeStatistic(Groups: tGroupList);
var
  i, ind  : integer;
  gnr : LongInt;
  GrpCount, SumCount: Array of Integer;
  grpChartAdd : Integer;
  dtarr : tDateTimeArr;
  beginDay : Word;
  cntDays : Integer;
  year, month, day : Word;
  cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;

  fResultAsText := 'Statistics: Messages per Day ('
                 + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')' + CRLF
                 + CRLF;

  //CountDays: DateTime is days . time
  beginDay := trunc(fStatOptions.BeginDate);
  cntDays := trunc(fStatOptions.EndDate) - beginDay;
  with (fResultAsChart) do begin
    //cntDays+1 Spalten, Anzahl Gruppen
    initializeChart(cntDays+2, length(Groups));

    //Statistikname
    name := 'Messages per Day ('
          + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')';
    xAxis := 'Day';
    yAxis := 'Messages';

    //Namen sind hier einfach
    for i := 0 to cntDays do begin
      DecodeDate(fStatOptions.BeginDate + i, year, month, day);
      //valueNames[i] := IntToStr(i);
      valueNames[i] := IntToStr(day);
    end;
    valueNames[cntDays+1] := 'Bad Date';
  end;
  if length(Groups)=1 then grpChartAdd := 0 else grpChartAdd := 1;

  clearFindCount;

  SetLength(GrpCount, cntDays+2);
  SetLength(SumCount, cntDays+2);
  for i:=0 to cntDays+1 do SumCount[i] := 0;
  for gnr := 0 to length(Groups)-1 do begin
    for i:=0 to cntDays+1 do GrpCount[i] := 0;
    GetAllDateTime(Groups[gnr], dtarr, cancel);
    if cancel then break;
    for i := 0 to Length(dtarr)-1 do begin
      if (dtarr[i] = oldDefault) then
        ind := cntDays+1
      else
        ind := trunc(dtArr[i]) - beginDay;

      incFindCount;
      inc(GrpCount[ind]);
      inc(SumCount[ind]);
    end;

    //Dem Chart hinzufuegen
    with fResultAsChart.results[gnr+grpChartAdd] do begin
      groupname := Groups[gnr].Name;
      for i := 0 to cntDays+1 do values[i] := GrpCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText(Groups[gnr].Name, fStatOptions.beginDate, grpCount)
        + GetGruppenTrenner()
  end;

  if cancel then begin
    fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF
  end;

  //Bei mehr als einer Gruppe: Summe auch ausgeben
  if (not cancel) and (length(Groups) > 1) then begin
    //Dem Chart hinzufuegen
    with fResultAsChart.results[0] do begin
      groupname := 'All';
      for i := 0 to cntDays+1 do values[i] := SumCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText('All selected groups', fStatOptions.beginDate, sumCount)
  end;

  SetLength(GrpCount, 0);
  SetLength(SumCount, 0);
end;

{ tStatMesPerHour }

function tStatMesPerHour.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Messages per hour';
    ParamCapt := '';
    DefParam  := '';
  end
end;

function tStatMesPerHour.oneSumText(tit : String; findCnt : Integer;
                      arr : Array of Integer) : String;

    function formatLine(i : Integer; f : double; text : String) : String;
    begin
      Result := StrLeft(StrCenter(IntToStr(i), 7), 9)
              + StrLeft(Format('%3.2f%', [f]), 9)
              + text + CRLF;
    end;

var i : integer;
    f, sumF : double;
begin
  Result := tit + CRLF + CRLF
      + 'Msgs     %        Interval' + CRLF;
  sumF := 0;
  for i := 0 to 25 do begin
    if (i<10) then begin
      f := (arr[i] * 100) / findCnt;
      sumF := sumF + f;
      Result := Result + formatLine(arr[i], f,
           '0' + IntToStr(i) + ':00 - 0' + IntToStr(i) + ':59')
    end else if (i<24) then begin
      f := (arr[i] * 100) / findCnt;
      sumF := sumF + f;
      Result := Result + formatLine(arr[i], f,
           '' + IntToStr(i) + ':00 - ' + IntToStr(i) + ':59')
    end else if (i=24) then begin
      if (arr[i]>0) then begin
        f := (arr[i] * 100) / findCnt;
        sumF := sumF + f;
        Result := Result + formatLine(arr[i], f, 'Bad dates')
      end
    end else
      Result := Result + CRLF + formatLine(findCnt, sumF, '(probe count)')
  end;
end;

procedure tStatMesPerHour.MakeStatistic(Groups: tGroupList);
var
  i, ind, findGrp, findAll : integer;
  gnr : LongInt;
  GrpCount, SumCount: Array of Integer;
  grpChartAdd : Integer;
  dtarr : tDateTimeArr;
  Hour, mm, ss, ms: Word;
  cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;

  fResultAsText := 'Statistics: Messages per Hour ('
                 + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')' + CRLF
                 + CRLF;

  with (fResultAsChart) do begin
    //cntDays+1 Spalten, Anzahl Gruppen
    initializeChart(25, length(Groups));

    //Statistikname
    name := 'Messages per Hour ('
          + DateToStr(fStatOptions.BeginDate)+' - '+DateToStr(fStatOptions.EndDate)+')';
    xAxis := 'Time';
    yAxis := 'Messages';

    //Namen sind hier ziemlich schwer. Erst einfach mal keinen ;-)
    for i := 0 to 23 do
      valueNames[i] := '';
    valueNames[24] := 'Bad Date';
  end;
  if length(Groups)=1 then grpChartAdd := 0 else grpChartAdd := 1;

  clearFindCount;
  FindAll := 0;

  SetLength(GrpCount, 25);
  SetLength(SumCount, 25);
  for i:=0 to 24 do SumCount[i] := 0;
  for gnr := 0 to length(Groups)-1 do begin
    findGrp := 0;
    for i:=0 to 24 do GrpCount[i] := 0;
    GetAllDateTime(Groups[gnr], dtarr, cancel);
    if cancel then break;
    for i := 0 to Length(dtarr)-1 do begin
      if (dtarr[i] = oldDefault) then
        ind := 24
      else begin
        DecodeTime( dtarr[i], Hour, mm, ss, ms );
        ind := hour;
      end;

      incFindCount;
      inc(findGrp);
      inc(findAll);
      inc(GrpCount[ind]);
      inc(SumCount[ind]);
    end;

    //Dem Chart hinzufuegen
    with fResultAsChart.results[gnr+grpChartAdd] do begin
      groupname := Groups[gnr].Name;
      for i := 0 to 24 do values[i] := GrpCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText(Groups[gnr].Name, findGrp, grpCount)
        + GetGruppenTrenner()
  end;

  if cancel then begin
    fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF
  end;

  //Bei mehr als einer Gruppe: Summe auch ausgeben
  if (not cancel) and (length(Groups) > 1) then begin
    //Dem Chart hinzufuegen
    with fResultAsChart.results[0] do begin
      groupname := 'All';
      for i := 0 to 24 do values[i] := SumCount[i];
    end;

    //Dem Text hinzufuegen
    fResultAsText := fResultAsText
        + OneSumText('All selected groups', findAll, sumCount)
  end;

  SetLength(GrpCount, 0);
  SetLength(SumCount, 0);
end;

{ tStatMesPerBase }

procedure tStatMesperBase.progressOneXOver(grpName : String;
          min, max, actual : Integer; out cancel : Boolean);
begin
  Cancel := IncGrpCount;
end;

procedure tStatMesPerBase.GetAllDateTime(group: tGroup;
  out res: tDateTimeArr; out cancel: Boolean);
var anr : Integer;
    resnr : Integer;
    ADT : tDateTime;
    tsl : tStringList;
begin
  tsl := tStringList.create;
  try
    //Gruppe oeffnen
    with group.DB.Create do try
      Open(group.Path^);

      //Result maximal initialisieren
      SetLength(res, Count+1);
      resnr := 0;

      ClearGrpCount(group.name, Count);
      cancel :=  not GetAllOverList(nil, tsl, progressOneXOver);
      if cancel then exit;
      ClearGrpCount(group.name, Count);

      //procedure GetAllOverList(vPath : PString; var Result : tStringList; progr : tProgressXOver); virtual;
      for anr := 0 to tsl.Count-1 do begin
        cancel := IncGrpCount; //Hier kann man nicht canceln
        ADT := POverview(tsl.Objects[anr])^.Date;
        if DayOK( ADT ) then begin
          res[resnr] := ADT;
          resnr := resnr + 1;
        end;

        Dispose(POverview(tsl.Objects[anr]));
      end;

      //Truncen auf wieviel wir wirklich gebraucht haben
      SetLength(res, resnr);

      Close;

    finally free end;

  finally
    tsl.free
  end;
end;

end.
