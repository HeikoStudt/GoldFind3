unit uStatisticsHeader;

interface

uses uStatisticsBase, uDBBase;

type
  tStatHeaderBase = class (tStatisticBase)
  private
    function getNewsReader(Hdr: String): String;
    protected
      procedure MakeHeaderStat(Groups: tGroupList; HeaderName : String);
    public
  end;

  tStatHeaderFrom = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderFromName = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderFromDomain = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderSubject = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderMessageID = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderXNewsreader = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderXNewsreaderMsg = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderXNewsreaderUsr = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderOther = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatHeaderRegExp = class (tStatHeaderBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;


implementation

uses cArticle, cStats, Classes, Sysutils, {uPerlRe,} cPCRE, uEncoding, cArts, uTools,
     Dialogs;

{ tStatHeaderBase }

function tStatHeaderBase.getNewsReader(Hdr : String) : String;
var
  Cmp : String; //Warum wird das nicht ueberall verwendet?!
begin
  //Added 2004 by Miroslav Sabljic (<mirsablj@inet.hr>)
  //Resorted + added by HSR
  Cmp := LowerCase( Hdr );
  if Pos('Forte Free Agent',Hdr)>0 then Hdr:='Forte Free Agent';
  if Pos('Forte Agent',Hdr)>0 then Hdr:='Forte Agent';
  if (Pos('Microsoft Outlook Express',Hdr)>0) or (Pos('Outlook-Express-Macintosh',Hdr)>0) then Hdr:='Outlook Express' else
  if Pos('Microsoft Outlook',Hdr)>0 then Hdr:='Microsoft Outlook';
  if Pos('Microsoft Internet News',Hdr)>0 then Hdr:='Microsoft Internet News';
  if Pos('Microsoft Windows Mail',Hdr)>0 then Hdr:='Microsoft Windows Mail';
  if Pos('MacSOUP',Hdr)>0 then Hdr:='MacSOUP';
  if Pos('News Xpress',Hdr)>0 then Hdr:='News Xpress';
  if Pos('CrossPoint',Hdr)>0 then Hdr:='CrossPoint';
  if Pos('PMINews',Hdr)>0 then Hdr:='PMINews';
  if Pos('Virtual Access',Hdr)>0 then Hdr:='Virtual Access';
  if Pos('ZQWKPro',Hdr)>0 then Hdr:='ZQWKPro';
  if Pos('ProNews',Hdr)>0 then Hdr:='ProNews';
  if Pos('AOL Offline Reader',Hdr)>0 then Hdr:='AOL Offline Reader';
  if Pos('ASH Emailer',Hdr)>0 then Hdr:='ASH Emailer';
  if Pos('VSoup',Hdr)>0 then Hdr:='VSoup';
  if Pos('News Rover',Hdr)>0 then Hdr:='News Rover';
  if Pos('Lotus Notes',Hdr)>0 then Hdr:='Lotus Notes';
  if Pos('turnpike',Cmp)>0 then Hdr:='Turnpike';
  if Pos('kexpress',Cmp)>0 then Hdr:='kexpress';
  if Pos('mynews',Cmp)>0 then Hdr:='MyNews';
  if Pos('MT-NewsWatcher',Hdr)>0 then Hdr:='MT-NewsWatcher';
  if Pos('40tude_Dialog',Hdr)>0 then Hdr:='40tude Dialog';
  if Pos('Noworyta',Hdr)>0 then Hdr:='Noworyta';
  if Pos('Sylpheed-Claws',Hdr)>0 then Hdr:='Sylpheed-Claws' else
  if Pos('Sylpheed',Hdr)>0 then Hdr:='Sylpheed';
  if Pos('xnews',Cmp)>0 then Hdr:='Xnews';
  if Pos('KNode',Hdr)>0 then Hdr:='KNode';
  if Pos('ameol',Cmp)>0 then Hdr:='Ameol';
  if Pos('Gravity',Hdr)>0 then Hdr:='Gravity';
  if Pos('GoldED',Hdr)>0 then Hdr:='GoldED';
  if Pos('MicroDot',Hdr)>0 then Hdr:='MicroDot';
  if Pos('EmTec',Hdr)>0 then Hdr:='EmTec';
  if Pos('knews',Hdr)>0 then Hdr:='knews';
  if Pos('XanaNews',Hdr)>0 then Hdr:='XanaNews';
  if Pos('Unison',Hdr)>0 then Hdr:='Unison';
  if Pos('Mutt',Hdr)>0 then Hdr:='Mutt';
  if Pos('MesNews',Hdr)>0 then Hdr:='MesNews';
  if Pos('CowlipsNews',Hdr)>0 then Hdr:='CowlipsNews';
  if Pos('NewsMan',Hdr)>0 then Hdr:='NewsMan';
  if Pos('NewsFleX',Hdr)>0 then Hdr:='NewsFleX';
  if Pos('NewzCrawler',Hdr)>0 then Hdr:='NewzCrawler';
  if Pos('Becky',Hdr)>0 then Hdr:='Becky!';
  if Pos('Entourage',Hdr)>0 then Hdr:='Entourage';
  if Pos('Halime',Hdr)>0 then Hdr:='Halime';
  if Pos('Hogwasher',Hdr)>0 then Hdr:='Hogwasher';
  if Pos('MaxNews',Hdr)>0 then Hdr:='MaxNews';
  if Pos('NewsCarrier',Hdr)>0 then Hdr:='NewsCarrier';
  if Pos('Thoth',Hdr)>0 then Hdr:='Thoth';
  if Pos('OSXnews',Hdr)>0 then Hdr:='"OSXnews';
  if Pos('IBM Newsreader',Hdr)>0 then Hdr:='IBM Newsreader';
  if Pos('SNews',Hdr)>0 then Hdr:='SNews';
  if Pos('NewsCoaster',Hdr)>0 then Hdr:='NewsCoaster';
  if Pos('WinVN',Hdr)>0 then Hdr:='WinVN';
  if Pos('SeaMonkey',Hdr)>0 then
    Hdr:='Mozilla SeaMonkey'
  else if Pos('Thunderbird',Hdr)>0 then
    Hdr:='Mozilla Thunderbird'
  else begin
    if (Pos('Mozilla/',Hdr)>0) and not ((Pos('Thunderbird',Hdr)>0) or (Pos('Netscape',Hdr)>0)) then Hdr:='Mozilla';
    if ((Pos('Mozilla ',Hdr)>0) and not (Pos('Thunderbird',Hdr)>0)) or (Pos('Netscape',Hdr)>0) then Hdr:='Netscape';
  end;
  if Pos('Opera',Hdr)>0 then Hdr:='Opera/M2';

  if Pos('slrn',Hdr)>0 then Hdr:='slrn';
  if Pos('trn',Hdr)>0 then Hdr:='trn';
  if Pos('xrn',Hdr)>0 then Hdr:='xrn';
  if Pos('krn',Cmp)>0 then Hdr:='"krn';
  if Pos('OUI ',Hdr)>0 then Hdr:='OUI';
  if (Pos('TIN ',Hdr)>0) or (Pos('tin/',Hdr)>0) then Hdr:='TIN';
  if Pos('Gnus',Hdr)>0 then Hdr:='Gnus';
  if Pos('THOR',Hdr)>0 then Hdr:='THOR';
  if Pos('Pan',Hdr)>0 then Hdr:='Pan';
  if Pos('G2',Hdr)>0 then Hdr:='G2';
  if (Pos('NN ',Hdr)>0) or (Pos('nn/',Hdr)>0) then Hdr:='NN';
  if Pos('XP ',Hdr)>0 then Hdr:='CrossPoint';

  Result := Hdr
end;

procedure tStatHeaderBase.MakeHeaderStat(Groups: tGroupList;
  HeaderName: String);

var REGEX : tPCRE;

     function GetRegExMatch(ArtText : String): String;
     var  Art   : TStringList;
          Lin, e: Integer;
          h     : String;
     begin
          Result := '';
          Art := TStringList.Create;
          Art.Text := String( ArtText );
          for lin:=0 to Art.Count-1 do begin
             if Art[lin]='' then break; // end-of-headers
             h := Art[lin];
             h := DecodeHeadervalue( h[1], length(h) );
             {if regex.MatchS( DecodeHeadervalue( h[1], length(h) ) ) then begin
                if regex.SubExpCount<=1 then begin
                   Result := Art[lin];
                end else begin
                   for e:=1 to regex.SubExpCount do begin
                      Result := Result
                          + copy( Art[lin], regex.SubExp[e].StartP, regex.SubExp[e].Len );
                   end;
                end;
                break;
             end;}
             if regex.Exec( PChar(h), 0 ) then begin
                if regex.MatchCount<=1 then begin
                   Result := Art[lin];
                end else begin
                   for e:=1 to regex.MatchCount do begin
                      Result := Result + regex.MatchString[e];
//                        + copy( h, regex.GetMatchOffset(e), regex.GetMatchLength(e) );
                   end;
                end;
                break;
             end;
          end;
          Art.Free;
     end;

var
   i,maxCnt  : Integer;
   Art       : tArticle;
   gnr,anr,l,gsum : LongInt;
   s,tit     : String;
   Hdr       : String;
   TH        : TStatInfo;
   GrpTS, SumTS: TStatList;
   GrpUsers, SumUsers: TStringList;
   HdrNam    : String;
   Special   : Byte;
   IsRegex   : Boolean;
   cancel : Boolean;

begin
  cancel := false;
  if length(Groups)=0 then exit;
  if HeaderName='' then exit;
  ClearFindCount;

  Special := 0;
  IsRegex := False;
  REGEX := tPCRE.create(true, PCRE_CASELESS);
  try
   if copy(HeaderName,1,1)='{' then begin
     try
        s := HeaderName;
        System.Delete( s, 1, 1 );
        if copy(s,length(s),1)='}' then s:=copy(s,1,length(s)-1);
        REGEX.Compile(PChar(s));
        //regex.CompileRO( s, PCRE_CASELESS );
        IsRegex := True;
     except
        on E:Exception do begin
           MessageDlg( 'Regex-error:' + #13#10 + E.Message, mtError, [mbOK], 0);
           exit;
        end;
     end;
   end else begin
     if copy(HeaderName,length(HeaderName),1)<>':' then HeaderName:=HeaderName+':';

     if HeaderName[1] in ['1'..'6'] then begin {[Gruppierte] X-Newsreader}
        Special := strtoint(HeaderName[1]);
        HeaderName := copy(HeaderName,2,255);
     end;
   end;
   HdrNam := HeaderName;

   case Special of
       1: tit := 'Header-statistics for: '+ HdrNam + ', X-Mailer:, User-Agent:';
       2: tit := 'Header-statistics for: Newsreader (grouped, per msg.)';
       3: tit := 'Header-statistics for: '+ HdrNam + ' (grouped by domain)';
       4: tit := 'Header-statistics for: '+ HdrNam + ' (grouped by name)';
       5: tit := 'Header-statistics for: '+ HdrNam + ' (Re:/was: skipped)';
       6: tit := 'Header-statistics for: Newsreader (grouped, per user)';
     else tit := 'Header-statistics for: '+ HdrNam;
   end;

   fResultAsText := tit + CRLF
                  + '(based on msgs with bodies '+StatDayBaseText+')' + CRLF
                  + CRLF;

   GrpTS := TStatList.Create;
   SumTS := TStatList.Create;

   GrpUsers := TStringList.Create;
   GrpUsers.Sorted := True;
   SumUsers := TStringList.Create;
   SumUsers.Sorted := True;
   Art := tArticle.Create;
   try
    for gnr := 0 to length(Groups)-1 do begin
      with Groups[gnr].DB.Create do try
        GrpTS.Clear;
        GrpUsers.Clear;
        Open(Groups[gnr].Path^);
        clearGrpCount(Groups[gnr].name, Count);
        for anr:=Min to Max do begin
          cancel := incGrpCount;
          if cancel then break;

          GetArticle(anr,s,i);
          Art.text := s;
          if DayOK( Art.GetGMTDateDT ) then begin
            IncFindCount;
            if IsRegex then begin
              Hdr := GetRegExMatch(s);
            end else begin
              Hdr := Art.Header[ HdrNam ];
            end;
            if (Hdr='') and (Special in [1,2,6]) then Hdr:=Art.Header['X-Mailer:'];
            if (Hdr='') and (Special in [1,2,6]) then Hdr:=Art.Header['User-Agent:'];
            if Hdr='' then Hdr:='(not set)';

            case Special of
              2: Hdr := getNewsReader(Hdr);
              3: Hdr := StatDomainOf( FilterMailAdr( Hdr ) );
              4: Hdr := FilterNameOfFrom( Hdr );
              5: Hdr := FilterSubject( Hdr );
              6: Hdr := getNewsReader(Hdr);
            end;

            if Special=6 then begin
               //Grouped by from
               s := FilterNameOfFrom( Art.Header[ 'From:' ] );
               if GrpUsers.IndexOf(s)<0 then begin
                  GrpUsers.Add( s );
                  GrpTS.Add( Hdr );
               end;
               if SumUsers.IndexOf(s)<0 then begin
                  SumUsers.Add( s );
                  SumTS.Add( Hdr );
               end;
            end else begin
               GrpTS.Add( Hdr );
               SumTS.Add( Hdr );
            end;
          end;
        end;
        Close;
      finally free end;
      if cancel then begin
         fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF;
         break;
      end;

      //Sortieren
      GrpTS.SortBy_Counter;

      //Bericht fuer eine Gruppe
      fResultAsText := fResultAsText + Groups[gnr].Name + CRLF;
      gsum := GrpTS.CounterSum;
      if gsum>0 then begin
        fResultAsText := fResultAsText
           + #9 + IntToStr(gsum)
           + #9 + ValToPercent(gsum,gsum)+'%'
           + #9 + '(probe count)'
           + CRLF;
        l := 0;
        for i:=0 to GrpTS.Count-1 do begin
          TH := GrpTS.Infos[i];
          if (TH.Counter>1) or IsRegex then begin
            fResultAsText := fResultAsText
                + #9 + IntToStr(TH.Counter)
                + #9 + ValToPercent(TH.Counter,gsum)+'%'
                + #9 + GrpTS.Keys[i]
                + CRLF;
          end else //"Sonstiges"
             l := l + TH.Counter;
        end;
        if l>0 then begin
          fResultAsText := fResultAsText
              + #9 + IntToStr(l)
              + #9 + ValToPercent(l,gsum)+'%'
              + #9 + '(others)'
              + CRLF;
        end;
      end;
      fResultAsText := fResultAsText + GetGruppenTrenner();
    end;


    if (not cancel) and (length(groups) > 1) then begin
      //Sortieren
      SumTS.SortBy_Counter;

      //Bericht fuer alle Gruppen erzeugen
      fResultAsText := fResultAsText + 'All selected groups' + CRLF;
      gsum := SumTS.CounterSum;
      if (gsum>0) then begin
        fResultAsText := fResultAsText
            + #9 + IntToStr(gsum)
            + #9 + ValToPercent(gsum,gsum)+'%'
            + #9 + '(probe count)'
            + CRLF;
        l := 0;
        for i:=0 to SumTS.Count-1 do begin
          TH := SumTS.Infos[i];
          if (TH.Counter>1) or IsRegex then begin
            fResultAsText := fResultAsText
                + #9 + IntToStr(TH.Counter)
                + #9 + ValToPercent(TH.Counter,gsum)+'%'
                + #9 + SumTS.Keys[i]
                + CRLF;
          end else begin
            l := l + TH.Counter;
          end;
        end;
        if l>0 then begin
          fResultAsText := fResultAsText
              + #9 + IntToStr(l)
              + #9 + ValToPercent(l,gsum)+'%'
              + #9 + '(others)'
              + CRLF;
        end;
      end;
      fResultAsText := fResultAsText + CRLF;
    end;

    //Chart adden...
    if (not cancel) and (SumTS.Count>0) then begin
      if (SumTS.Count<20) then
        maxCnt := SumTS.Count
      else
        maxCnt := 20; //TODO: Configurable!

      initializeChart(maxCnt, 1); //Etwas gehackt ;-)
      if (length(groups)>1) then begin
        fResultAsChart.name := tit + #13;
        fResultAsChart.results[0].groupname := Groups[0].Name;
      end else begin
        fResultAsChart.name := tit + #13 + '[for all selected groups]';
        fResultAsChart.results[0].groupname := 'ALL';
      end;
      if (special = 2) or (special = 6) then
        fResultAsChart.xAxis := 'Newsreader' + #13 + '(based on msgs with bodies '+StatDayBaseText+')'
      else
        fResultAsChart.xAxis := HdrNam + #13 + '(based on msgs with bodies '+StatDayBaseText+')';

      //Sortieren
      SumTS.SortBy_Counter;

      //gsum := SumTS.CounterSum;
      for i := 0 to maxCnt-1 do begin
        fResultAsChart.valueNames[i]        := SumTS.Keys[i];
        fResultAsChart.results[0].values[i] := SumTS.Infos[i].Counter;
      end;
    end

   finally
    Art.Free;
    GrpTS.Free;
    SumTS.Free;
    GrpUsers.Free;
    SumUsers.Free;
   end;
  finally
    REGEX.free
  end
end;



{ tStatHeaderFrom }

function tStatHeaderFrom.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: From';
    ParamCapt := '';
    DefParam  := '';
  end
end;

procedure tStatHeaderFrom.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, 'From:');
end;

{ tStatHeaderFromName }

function tStatHeaderFromName.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: From (grouped, name)';
    ParamCapt := '';
    DefParam  := '';
  end
end;

procedure tStatHeaderFromName.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '4From:');
end;

{ tStatHeaderFromDomain }

function tStatHeaderFromDomain.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: From (grouped, domain)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatHeaderFromDomain.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '3From:')
end;

{ tStatHeaderSubject }

function tStatHeaderSubject.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: Subject (Re:/was: skipped)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatHeaderSubject.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '5Subject:')
end;

{ tStatHeaderMessageID }

function tStatHeaderMessageID.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Message-ID (grouped)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatHeaderMessageID.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '3Message-ID:')
end;

{ tStatHeaderXNewsreader }

function tStatHeaderXNewsreader.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: Newsreader';
    ParamCapt := '';
    DefParam  := ''
  end

end;

procedure tStatHeaderXNewsreader.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '1X-Newsreader:')
end;

{ tStatHeaderXNewsreaderMsg }

function tStatHeaderXNewsreaderMsg.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: Newsreader (grouped, per msg.)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatHeaderXNewsreaderMsg.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '2X-Newsreader:')
end;

{ tStatHeaderXNewsreaderUsr }

function tStatHeaderXNewsreaderUsr.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoHasGraph];
    Caption   := 'Header: Newsreader (grouped, per user)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

procedure tStatHeaderXNewsreaderUsr.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '6X-Newsreader:')
end;

{ tStatHeaderOther }

function tStatHeaderOther.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoEdParam, ssoHasGraph];
    Caption   := 'Header: (others)';
    ParamCapt := 'Header-field';
    DefParam  := ''
  end
end;

procedure tStatHeaderOther.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, '{' + fStatOptions.Param + '}')
end;

{ tStatHeaderRegExp }

function tStatHeaderRegExp.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoEdParam, ssoHasGraph];
    Caption   := 'Header: (regex)';
    ParamCapt := 'Regular expression (PCRE-style)';
    DefParam  := ''
  end
end;

procedure tStatHeaderRegExp.MakeStatistic(Groups: tGroupList);
begin
  MakeHeaderStat(Groups, fStatOptions.Param )
end;


end.
