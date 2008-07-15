unit uStatistiken;

interface

uses uStatisticsBase, cStats, cArticle, uDateTime, uDBBase;

type

  //Path - Statistics
  tStatPathFeedsOf = class (tStatisticBase)
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatPathRelay = class (tStatisticBase)
  private
    procedure GetPathList(const allHdr: String; var tsa, tsg: tStatList);
    protected
      function OneText(tit : String; TS : tStatList;
               findAll, findBAD : Integer) : String;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatPathMyFeeds = class (tStatisticBase)
    private
      procedure GetPathList(const allHdr: String; const FeedMax : Integer;
          var Feed: array of String; out HdrLast: String);
      function OneText(tit : String; TS : tStatList;
               findAll, findBAD : Integer) : String;
    public
      function GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;


  ///DAU Jones ;-)
  tStatDAUJonesBase = class (tStatisticBase)
    protected
      function DauJones( Article: tArticle; AddEach: Boolean;
                         GrpTS, SumTS: TStatList ): Integer;
      procedure MakeDAUStatistic(Groups: tGroupList; GroupByName : Boolean);
  end;

  tStatDAUJones = class (tStatDAUJonesBase)
    public
      function  GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;

  tStatDAUJonesName = class (tStatDAUJonesBase)
    public
      function  GetShowOptions : tStatShow; override;
      procedure MakeStatistic( Groups : tGroupList); override;
  end;


implementation

uses sysutils, uTools, uoTools, cArts, uEncoding;

{ tStatDAUJones }

function tStatDAUJonesBase.DauJones( Article: tArticle; AddEach: Boolean;
                                 GrpTS, SumTS: TStatList ): Integer;
var  Art  : TArt;
     s, h    : String;
     i, j, k, n : Integer;
     qc   : Char;
     fr : tFrom;

     procedure DauAdd( Pts: Integer; Why: String );
     begin
          Result := Result + Pts;
          if AddEach then begin
             GrpTS.Add( Why, Pts, 2 );
             SumTS.Add( Why, Pts, 2 );
          end;
     end;

begin
  Result := 0;
  fr := tFrom.Create;
  try
     s := LowerCase( Article.Header['From:'] );

     i := Pos( '@', s );
     if (i<=1) or (i=length(s)) then begin
        DauAdd(50,'invalid From:');
     end else begin
        h := copy( s, i+1, 255 );
        if Pos('.',h)=0 then DauAdd(50,'invalid From:');
     end;

     for n:=1 to 2 do begin
        if Pos('@dev.nul',s)>0 then DauAdd(25,'From:-fake assumed');
        if Pos('xxx'     ,s)>0 then DauAdd(25,'From:-fake assumed');

        i := Pos('this',s);
        if i>0 then begin
           j:=Pos('remove',s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('erase' ,s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('del'   ,s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('cut'   ,s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
        end;

        i := Pos('spam',s);
        if i>0 then begin
           j:=Pos('no'  ,s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('stop',s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('dont',s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
           j:=Pos('anti',s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
        end;

        i := Pos('sig',s);
        if i>0 then begin
           j:=Pos('see',s); if (j>0) and (j<i) then DauAdd(25,'From:-fake assumed');
        end;

        s := ROT13(s);
     end;

     s := LowerCase( Article.Header['From:'] );
     n := 1;
     repeat
           i := Pos(' ',s);
           j := Pos('_',s);
           if i=0 then i:=j;
           if (i>0) and (j>0) and (j<i) then i:=j;
           if i>0 then begin inc(n); System.Delete(s,1,i); end;
     until i=0;
     if n<3 then DauAdd(10,'no name in From: assumed');

     fr.Whole := Article.Header['From:'];
     s := LowerCase( fr.EMailAdress );
     fr.Whole := Article.Header['Reply-To:'];
     h := LowerCase( fr.EMailAdress );
     if h<>'' then begin
        if s=h then DauAdd(1,'Reply-To: = From:');
        i := Pos('@',h);
        if (i=0) then DauAdd(25,'invalid Reply-To:');
        if (i=1) or (i=length(h)) then begin i:=0; DauAdd(25,'invalid Reply-To:'); end;
        if (i=2) and (h[1]='<')   then begin i:=0; DauAdd(25,'invalid Reply-To:'); end;
        if i>0 then begin
           h := copy(h,i+1,255);
           if Pos('.',h)=0 then DauAdd(25,'invalid Reply-To:');
        end;
     end;

     s := Article.Header['Message-ID:'];
     i := Pos('@',s);
     if i=0 then DauAdd(5,'invalid M-ID:')
     else begin
        if Pos('.',s)=0 then DauAdd(5,'invalid M-ID: assumed');
     end;

     s := Article.Header['Newsgroups:'];
     n := 0;
     repeat
        i:=Pos(',',s);
        if i>0 then begin inc(n); System.Delete(s,1,i); end;
     until i=0;

     s := Article.Header['Followup-To:'];
     if s<>'' then begin
        if Pos(',',s)=0 then n:=0 else inc(n);
     end;
     if n>0 then DauAdd( n*10, 'crosspost w/o FollowUp-To' );

     Art := TArt.Create;
     try
       Art.Text := Article.Text;

       for i:=0 to Art.Count-1 do begin
          s := Lowercase(Trim(Art[i]));
          if copy(s,1,13)='content-type:' then begin
             if Pos('html',s)>0 then DauAdd(50,'html');
             if Pos('vcard',s)>0 then DauAdd(25,'vcard');
             if Pos('application/octet-stream',s)>0 then begin
                h := LowerCase( Article.Header['Newsgroups:'] );
                if Pos('bina',h)+Pos('datei',h)=0 then DauAdd(50,'binary in non-b.-group assumed');
             end;
          end;
       end;

       n := 0;
       for i:=0 to Art.Count-1 do begin
          s := Art[i];
          if s='' then break;
          for k:=1 to length(s) do begin
             if Ord(s[k])>=$80 then begin inc(n); break; end;
          end;
          if n>0 then begin DauAdd(5,'uncoded 8bit-chars in header'); break; end;
       end;

       Art.SkipBoundary;
       Art.SkipHeader;
       qc := Art.GetQuoteChar;

       if Art.Count>10 then begin
          n := 0;
          for i:=0 to Art.Count-1 do begin
             s := Art[i];
             if (s='-- ') or (s='--=20') or (s='-- =') then break;
             s := Trim(s);
             if (s<>'') and (s<>qc) then begin
                if s[1]=qc then inc(n) else dec(n);
             end;
          end;
          if n>=10 then DauAdd( n ,'quote-ratio');

          n := 0;
          for i:=0 to Art.Count-1 do begin
             s := Art[i];
             if (s='-- ') or (s='--=20') or (s='-- =') then break;
             if Pos('-----== Posted via D',s)=1 then break; // Deja News
             s := Trim(s);
             if (s<>'') and (s<>qc) then begin
                if copy(s,1,1)=qc then
                   inc(n)
                else begin
                   if n>9 then DauAdd( n ,'mega-quote');
                   n := 0;
                end;
             end;
          end;
          if n>9 then DauAdd( n*2 ,'trailing mega-quote');
       end;

       k := -1;
       for i:=0 to Art.Count-1 do begin
          s := Art[i];
          if (s='-- ') or (s='--=20') or (s='-- =') then begin
             n := (Art.Count-1) - i;
             if n>4 then begin
                if Art[Art.Count-1]='' then dec(n);
                if n>4 then DauAdd(n,'.sig > 4 lines');
             end;
             k := i;
             break;
          end;
       end;
       if k<0 then begin
          j := Art.Count - 1;
          while (j>0) and (Trim(Art[j])='') do dec(j);
          dec(j,2);
          k := -1;
          for i:=0 to j do begin
             s := Art[i];
             if (copy(s,1,2)='--') and (copy(s,1,5)<>'-----') and (length(s)<10) then begin
                if s<>'-->' then k:=i;
             end;
          end;
          if k>0 then begin
             DauAdd(1,'pseudo-.sig assumed "'+Art[k]+'"');
             n := (Art.Count-1) - k;
             if n>4 then begin
                if Art[Art.Count-1]='' then dec(n);
                if n>4 then DauAdd(n,'pseudo-.sig > 4 lines assumed');
             end;
          end;
       end;
       n := 0;
       j := Art.Count-1;
       while (j>=0) and (Art[j]='') do begin inc(n); dec(j); end;
       if n>1 then DauAdd(n-1,'trailing empty-lines');
     finally
       Art.Free;
     end;

     if Result<0 then Result:=0; // no bonus-points

     if AddEach then begin
        GrpTS.Add( '(probe count)', Result, 0 );
        SumTS.Add( '(probe count)', Result, 0 );
        if Result<=0 then begin
           GrpTS.Add( '"DAU Jones ;-)" tested and approved!', 0, 1 );
           SumTS.Add( '"DAU Jones ;-)" tested and approved!', 0, 1 );
        end else begin
           GrpTS.Add( '"DAU Jones ;-)" failed!', Result, 1 );
           SumTS.Add( '"DAU Jones ;-)" failed!', Result, 1 );
        end;
     end;
  finally
    fr.free;
  end;
end;

procedure tStatDAUJonesBase.MakeDAUStatistic(Groups: tGroupList; GroupByName : Boolean);
const DAUHeader = 'DAU Jones ;-) ';
   procedure Report( const Title: String;
                     const TS: TStatList );
   var  s: String;
        i, summsg, sumdau, d, l: Integer;
        TH: TStatInfo;
   begin
     if fStatOptions.Param<>'' then fStatOptions.Ranking := False; // nur bei Ranking
     if fStatOptions.Ranking then TS.SortBy_Group_WCRatioDesc
                             else TS.SortBy_GroupDesc_Weight;

     fResultAsText := fResultAsText + Title + CRLF;

     s := 'Pos.' + #9 + 'DAUs';
     s := s      + #9 + 'Msgs';
     s := s      + #9 + 'Ratio';
     if fStatOptions.Param='' then s := s + #9 + 'Who'
                              else s := s + #9 + 'Why';

     fResultAsText := fResultAsText + s + CRLF;

     if fStatOptions.Param='' then begin
        for i:=0 to TS.Count-1 do begin
           TH := TS.Infos[i];
           if TH.Weight>0 then begin
              s := inttostr(i+1) + #9 + IntToStr(TH.Weight);
              s := s + #9 + IntToStr(TH.Counter);
              s := s + #9 + FloatToStrF( 1.0*TH.Weight/TH.Counter, ffFixed, 7, 2 );
              s := s + #9 + TS.Keys[i];
              fResultAsText := fResultAsText + s + CRLF;
           end;
        end;
     end else begin
        summsg := 1;
        sumdau := 1;
        d := -1;
        l := 0;
        for i:=0 to TS.Count-1 do begin
           TH := TS.Infos[i];
           if TH.Group<>d then begin
              d := TH.Group;
              l := 0;
              fResultAsText := fResultAsText + CRLF;
           end;
           inc( l );
           if TH.Group=0 then begin
              summsg := TH.Counter;
              sumdau := TH.Weight;
              s := inttostr(TH.Group)+'.'+inttostr(l) + #9 + IntToStr(TH.Weight);
              s := s + #9 + IntToStr(TH.Counter);
              s := s + #9 + FloatToStrF( 1.0*TH.Weight/TH.Counter, ffFixed, 7, 2 );
           end else begin
              if TH.Group=1 then begin
                 s := inttostr(TH.Group)+'.'+inttostr(l) + #9 + IntToStr(TH.Weight);
                 s := s + #9 + IntToStr(TH.Counter);
                 s := s + #9 + FloatToStrF( 100.0*TH.Counter/summsg, ffFixed, 7, 2 )+'%';
              end else begin
                 s := inttostr(TH.Group)+'.'+inttostr(l) + #9 + IntToStr(TH.Weight);
                 s := s + #9; // + IntToStr(TH.Anz);
                 s := s + #9 + FloatToStrF( 100.0*TH.Weight/sumdau, ffFixed, 7, 2 )+'%';
              end;
           end;
           s := s + #9 + TS.Keys[i];
           fResultAsText := fResultAsText + s + CRLF;
        end;
     end;

     fResultAsText := fResultAsText + CRLF;
   end;

var
     GrpCnt, DJ: Integer;
     gnr,anr: LongInt;
     Hdr : String;
     GrpTS, SumTS: TStatList;
     Art : tArticle;
     s : string;
     i : integer;
     fr : tFrom;
     cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;
  ClearFindCount;

  Art := tArticle.Create;
  fr := tFrom.Create;
  try
     fResultAsText := '';
     if fStatOptions.Param='' then fResultAsText := fResultAsText +
                          DAUHeader + '(Ranking)' + CRLF
                    else fResultAsText := fResultAsText +
                          DAUHeader + 'for "'+fStatOptions.Param+'"' + CRLF;
     fResultAsText := fResultAsText + '(based on msgs with bodies '+StatDayBaseText+', i.e. not killfiled yet ...)' + CRLF
                      + CRLF;


     SumTS := TStatList.Create;
     GrpTS := TStatList.Create;
     GrpCnt := 0;
     for gnr := 0 to length(Groups)-1 do begin
       with Groups[gnr].DB.Create do try
         GrpTS.Clear;
         Open(Groups[gnr].Path^);
         ClearGrpCount(Groups[gnr].name, Count);
         for anr:=Min to Max do begin
          cancel := incGrpCount;
          if cancel then break;
          GetArticle(anr, s, i);
          art.text := s;
          if DayOK( art.GetGMTDateDT ) then begin
            IncFindCount;
            if fStatOptions.Param='' then begin
               Hdr := Art.Header['From:'];
               //hdr := DecodeHeaderValue(Hdr[1], length(hdr));

               if GroupByName then begin
                 //Hdr := FilterNameOfFrom(Hdr);
                 fr.Whole := Hdr;
                 Hdr := fr.Name;
                 if (Hdr = '') then Hdr := fr.EMailAdress;
               end;
               DJ := DauJones( Art, False, nil, nil );
               GrpTS.Add( Hdr, DJ, 0 );
               SumTS.Add( Hdr, DJ, 0 );
            end else begin
               Hdr := LowerCase( Art.Header['From:'] );
               //Hdr := DecodeHeaderValue(Hdr[1], length(Hdr));
               if GroupByName then begin
                 //Hdr := FilterNameOfFrom(Hdr);
                 fr.Whole := Hdr;
                 Hdr := fr.Name;
                 if (Hdr = '') then Hdr := fr.EMailAdress;
               end;
               if (fStatOptions.Param='@') or (Pos(LowerCase(fStatOptions.Param),Hdr)>0) then begin
                  DauJones( Art, True, GrpTS, SumTS );
               end;
            end;
          end;
         end;

         Close;

         Report( Groups[gnr].Name, GrpTS );
         inc( GrpCnt );
       finally
         free
       end;
       if cancel then begin
         fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF;
         break;
       end;
       fResultAsText := fResultAsText + GetGruppenTrenner();
     end;

     if GrpCnt > 1 then Report( 'All selected groups', SumTS );

     GrpTS.Free;
     SumTS.Free;
  finally
    Fr.Free;
    Art.Free;
  end;
end;

{Normal}
function tStatDAUJones.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoRanking, ssoBDate, ssoEDate, ssoEdParam];
    Caption   := 'DAU Jones ;-)';
    ParamCapt := 'From:-part (@ for all posters; leave empty for ranking)';
    DefParam  := '';
  end
end;

procedure tStatDAUJones.MakeStatistic(Groups: tGroupList);
begin
  MakeDAUStatistic(Groups, false)
end;

{Name}
function tStatDAUJonesName.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoRanking, ssoBDate, ssoEDate, ssoEdParam];
    Caption   := 'DAU Jones ;-) (grouped, name)';
    ParamCapt := 'From:-part (@ for all posters; leave empty for ranking)';
    DefParam  := '';
  end
end;

procedure tStatDAUJonesName.MakeStatistic(Groups: tGroupList);
begin
  MakeDAUStatistic(Groups, True)
end;



{ tStatPathFeedsOf }

function tStatPathFeedsOf.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoEdParam];
    Caption   := 'Path: Feeds of ...';
    ParamCapt := 'Newsserver';
    DefParam  := ''
//    DefParam  := AgtIni.ReadString('Temp','FeedsOfSrv','');
  end
end;

procedure tStatPathFeedsOf.MakeStatistic(Groups: tGroupList);
var
     i,k,findSum    : Integer;
     gnr,anr,l: LongInt;
     s    : String;
     TH  : TStatInfo;
     TS  : TStatList;
     Path, PredSrv, SuccSrv : String;
     OldGroup : Integer;
     AllFeeds : Boolean;
     Newsserver : String;
     Art        : tArticle;
     cancel     : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;
  ClearFindCount;
  FindSum := 0;

  NewsServer := fStatOptions.Param;
  if NewsServer='' then begin
     AllFeeds := True;
  end else begin
     AllFeeds := False;
//     AgtIni.WriteString( 'Temp', 'FeedsOfSrv', NewsServer );
  end;

  fResultAsText := 'Feeds of: ' + Newsserver + CRLF
                 + '(based on msgs with bodies '+StatDayBaseText+')' + CRLF
                 + CRLF
                 + 'Pos.'+#9+'Count'+#9+'Weight'+#9+'Feed' + CRLF
                 + CRLF;

  Art := tArticle.Create;
  TS := TStatList.Create;
  try
    for gnr := 0 to length(Groups)-1 do begin
      with Groups[gnr].DB.Create do try
        Open(Groups[gnr].Path^);
        clearGrpCount(Groups[gnr].name, Count);
        for anr:=Min to Max do begin
          cancel := incGrpCount;
          if cancel then break;
          GetArticle(anr, s, i);
          art.text := s;

          if DayOK( art.GetGMTDateDT ) then begin
            Path := Art.Header[ 'Path:' ];

            if AllFeeds then begin
               incFindCount;
               inc(FindSum);

               PredSrv := '';
               i := Pos('!',Path);
               if i>0 then begin PredSrv:=copy(Path,1,i-1); System.Delete(Path,1,i); end;
               while Path<>'' do begin
                  i := Pos('!',Path);
                  if i=0 then begin
                     SuccSrv := Path;
                     Path := '';
                  end else begin
                     SuccSrv := copy(Path,1,i-1);
                     System.Delete(Path,1,i);
                  end;
                  if SuccSrv<>'not-for-mail' then TS.Add( PredSrv + ' <- ' + SuccSrv, 1, 9 );
                  PredSrv := SuccSrv;
               end;
            end else begin
               i := Pos( '!' + NewsServer + '!', Path );
               if i>0 then begin
                  incFindCount;
                  inc(FindSum);

                  PredSrv := '';
                  k := i - 1;
                  while (k>0) and (Path[k]<>'!') do begin
                     PredSrv := Path[k] + PredSrv;
                     dec(k);
                  end;
                  if PredSrv='' then PredSrv:='.';

                  SuccSrv := '';
                  k := i + length(NewsServer) + 2;
                  while (k<=length(Path)) and (Path[k]<>'!') do begin
                     SuccSrv := SuccSrv + Path[k];
                     inc(k);
                  end;
                  if SuccSrv='not-for-mail' then SuccSrv:='';
                  if SuccSrv='' then SuccSrv:='.';

                  TS.Add( NewsServer + ' <- ' + SuccSrv, 1, 1 );
                  TS.Add( NewsServer + ' -> ' + PredSrv, 1, 2 );
               end;
            end;
          end;
        end;
        Close;
      finally
        free
      end;
      if cancel then begin
         fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF;
         break;
       end;
      fResultAsText := fResultAsText + GetGruppenTrenner();
    end;

    {Sortieren}
    TS.SortBy_GroupDesc_Counter;

    {"Bericht" erstellen}
    fResultAsText := fResultAsText
        + #9 + IntToStr(FindSum)
        + #9 + ValToPercent(FindSum, FindSum)+'%'
        + #9 + '(probe count)'
        + CRLF;

    OldGroup := -1;
    l := 0;
    for i:=0 to TS.Count-1 do begin
       TH := TS.Infos[i];

       if TH.Group<>OldGroup then begin
          fResultAsText := fResultAsText + CRLF;
          if TH.Group=1 then fResultAsText := fResultAsText +  '[IN]' + CRLF;
          if TH.Group=2 then fResultAsText := fResultAsText + '[OUT]' + CRLF;
          OldGroup := TH.Group;
          l := 0;
       end;

       inc(l);
       fResultAsText := fResultAsText
           + IntToStr(l)
           + #9 + IntToStr(TH.Counter)
           + #9 + ValToPercent(TH.Counter, FindSum)+'%'
           + #9 + TS.Keys[i]
           + CRLF;
    end;

  finally
    TS.Free;
    Art.Free
  end;
end;

{ tStatPathMyFeeds }

procedure tStatPathMyFeeds.GetPathList(const allHdr: String;
  const FeedMax: Integer; var Feed: array of String; out HdrLast: String);
var
  i : Integer;
  HdrFirst : Boolean;
  Hdr : String;
  feedLfd : Integer;
begin
  HdrLast := '';
  for i := 0 to FeedMax-1 do Feed[i] := '';

  Hdr := '';
  HdrFirst := true;
  feedLfd := 0;
  //Alle Zeichen durchgehen
  for i := 1 to length(allHdr) do begin

    //Ende eines Teiles
    if allHdr[i] in [#13, #0, '!'] then begin
      if Hdr='' then Hdr:='(no value)';
      if (Hdr<>'not-for-mail') then begin
        if not HdrFirst then begin
          if FeedLfd<FeedMax then begin
            Feed[FeedLfd] := Hdr;
            inc(FeedLfd);
          end; //Kein Break!
          HdrLast := Hdr;
        end;
        HdrFirst := False;
      end;
      Hdr := '';

    end else begin //Not in [#13, #0, '!']
      //if length(Hdr)<255 then //WOZU?!
        Hdr := Hdr + allHdr[i];
    end;

    //Am Ende der Zeile beenden
    if allHdr[i] in [#13, #0] then break; //Urks
  end;
end;

function tStatPathMyFeeds.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate, ssoEdParam];
    Caption   := 'Path: My Feeds';
    ParamCapt := 'Max. Relayers (1-10)';
    DefParam  := '1'
  end
end;

procedure tStatPathMyFeeds.MakeStatistic(Groups: tGroupList);
var
     i    : Integer;
     gnr,anr: LongInt;
     s    : String;
     TSG  : TStatList;
     TSA  : TStatList;
     HdrLast  : String;
     allHdr   : String;
     Feed    : array of String;
     FeedMax : LongInt;
     Art : tArticle;
     FindAll, FindGrp, findBAD : Integer;
     DTA : tDateTime;
     cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;
  clearFindCount;
  FindAll := 0;
  findBAD := 0;

  if fStatOptions.Param='' then exit;
  FeedMax := StrToIntDef(fStatOptions.Param, 0);
  if FeedMax<1 then FeedMax:=1;
  //if FeedMax>10 then FeedMax:=10;
  SetLength(Feed, FeedMax);

  fResultAsText := 'Path-statistics: My Feeds (<= '+IntToStr(FeedMax)+' relayer)' + CRLF
                 + '(based on msgs with bodies '+StatDayBaseText+')' + CRLF
                 + CRLF
                 + 'Pos.'+#9+'Count'+#9+'Weight'+#9+'Relayer' + CRLF
                 + CRLF;
  fResultAsText := fResultAsText + 'IMPORTANT: Perhaps buggy (new implemented)!' + CRLF;

  Art := tArticle.Create;
  TSG := TStatList.Create;
  TSA := TStatList.Create;
  try
    for gnr := 0 to length(Groups)-1 do begin
      FindGrp := 0;
      with Groups[gnr].DB.Create do try
        Open(Groups[gnr].Path^);
        clearGrpCount(Groups[gnr].name, Count);
        for anr:=Min to Max do begin
          cancel := incGrpCount;
          if cancel then break;
          GetArticle(anr, s, i);
          art.text := s;

          DTA := art.GetGMTDateDT;
          if DayOK( DTA ) then begin

            allHdr := Art.Header['Path:'] + #0;
            if (allHdr<>'') then begin
              incFindCount;
              inc(FindGrp);
              inc(FindAll);
              if (DTA = oldDefault) then inc(findBAD);

              GetPathList(allHdr, FeedMax, Feed, HdrLast);

              //Letzter Path ueberall loeschen
              for i:=0 to FeedMax-1 do begin
                if Feed[i]=HdrLast then Feed[i]:='';
              end;

              //Wenn der Feed nicht leer ist als Path hinzufuegen
              if Feed[0]<>'' then begin
                s := Feed[0];
                for i:=1 to FeedMax-1 do begin
                  if Feed[i]='' then Feed[i]:='.';
                  s := s+'!'+Feed[i];
                end;
                TSG.Add( s );
                TSA.Add( s );
              end;
            end;
          end;
        end;
        Close;
      finally free end;

      if cancel then begin
         fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF;
         break;
      end;

      fResultAsText := fResultAsText
          + OneText(Groups[gnr].Name, TSG, findGrp, findBAD) + CRLF
          + GetGruppenTrenner();
    end;


    if (not cancel) and (length(Groups)>1) then begin
      fResultAsText := fResultAsText
          + OneText('All selected groups', TSA, findAll, findBAD);
    end
  finally
    TSG.Free;
    TSA.Free;
    Art.Free
  end;
  SetLength(Feed, 0);
end;

function tStatPathMyFeeds.OneText(tit : String; TS : tStatList;
         findAll, findBAD : Integer) : String;
var
  i, l : integer;
  TH   : TStatInfo;
begin
  //Sortieren nach Anzahl
  TS.SortBy_Counter;

  Result := '';
  l := 0;
  for i:=0 to TS.Count-1 do begin
    TH := TS.Infos[i];
    if TH.Counter>0 then begin
      inc(l);
      if l<=100 then begin
        Result := Result
           + IntToStr(l)
           + #9 + IntToStr(TH.Counter)
           + #9 + ValToPercent(TH.Counter, FindAll)+'%'
           + #9 + TS.Keys[i]
           + CRLF;
      end;
    end;
  end;

  Result := Result
     + CRLF
     + #9 + IntToStr(findBAD)
     + #9 + ValToPercent(findBAD,FindAll)+'%'
     + #9 + '(BAD dates)'
     + CRLF
     + #9 + IntToStr(FindAll)
     + #9 + ValToPercent(FindAll,FindAll)+'%'
     + #9 + '(probe count)'
     + CRLF
     + CRLF;
end;


{ tStatPathRelay }

function tStatPathRelay.GetShowOptions: tStatShow;
begin
  with Result do begin
    Options   := [ssoBDate, ssoEDate];
    Caption   := 'Path: Relayers (Top 100)';
    ParamCapt := '';
    DefParam  := ''
  end
end;

(*procedure tStatPathRelay.MakeStatistic(Groups: tGroupList);
var
     i    : Integer;
     gnr,anr,l: LongInt;
     s    : String;
     Hdr : String;
     TH  : TStatInfo;
     TS  : TStatList;
     HdrPtr : PChar;
     HdrC   : Char;
     HdrFirst : Boolean;
     HdrLast  : String;
     Art : tArticle;
begin
  if length(Groups)=0 then exit;
  clearFindCount;

  fResultAsText := 'Path-statistics: Relayers (Top 100)' + CRLF
                 + '(based on msgs with bodies within last 14 days)' + CRLF
                 + CRLF
                 + 'Pos.'+#9+'Count'+#9+'Weight'+#9+'Relayer' + CRLF
                 + CRLF;
  fResultAsText := fResultAsText + 'IMPORTANT: Not implemented yet!' + CRLF;
//  Application.ProcessMessages;

  Art := tArticle.Create;
  TS := TStatList.Create;
  try
    for gnr := 0 to length(Groups)-1 do begin
      with Groups[gnr].DB.Create do try
        Open(Groups[gnr].Path);

        for anr:=Min to Max do begin
{              inc( Form1.BalkenCount );
              if (Form1.BalkenCount mod 25)=0 then begin
                 Form1.FindStatus(TG,anr);
                 Form1.BalkenG.Progress := Form1.BalkenCount;
              end;
}
          GetArticle(anr, s, i);
          art.text := s;

          if DayOK( art.GetGMTDateDT ) then begin
(*
                 ArtTextSize := AgtArtTextLen(HArt);
                 ArtText     := AgtArtTextPtr(HArt);

                 HdrPtr := AgtArtHeaderStartPtr( HArt, 'Path:' );
                 if HdrPtr<>nil then begin
                    inc(Form1.FindCount);
                    Hdr := '';
                    HdrFirst := True;

                    repeat
                       HdrC := HdrPtr^;
                       HdrPtr := (HdrPtr+1);

                       if (HdrC<>#13) and (HdrC<>#0) and (HdrC<>'!') then begin

                          if length(Hdr)<255 then Hdr := Hdr + HdrC;

                       end else begin

                          if Hdr='' then Hdr:='(no value)';
                          if Hdr<>'not-for-mail' then begin
                             if not HdrFirst then begin
                                TS.Add( Hdr );
                                HdrLast := Hdr;
                             end;
                             HdrFirst := False;
                          end;
                          Hdr := '';

                       end;
                    until (HdrC=#13) or (HdrC=#0);

                    TS.Add( HdrLast, -1 );

                 end; {if HdrPtr<>nil ...}
              end;
           end;

           CloseMyArt;
           Application.ProcessMessages;
        end;

        Application.ProcessMessages;
     end;

     {Sortieren nach Anzahl}
     TS.SortBy_Weight;

     {"Bericht" erstellen}
     l := 0;
     for i:=0 to TS.Count-1 do begin
        inc( l );
        if l<=100 then begin
           TH := TS.Infos[i];
           if TH.Weight>1 then begin
              s := IntToStr(l) + #9 + IntToStr(TH.Weight);
              s := s + #9 + ValToPercent(TH.Weight,Form1.FindCount)+'%';
              s := s + #9 + TS.Keys[i];
              Form1.rtfStat.Lines.Add( s );
           end;
        end;
     end;

     Form1.rtfStat.Lines.Add( '' );

     s := #9 + IntToStr(Form1.FindCount);
     s := s + #9 + ValToPercent(Form1.FindCount,Form1.FindCount)+'%';
     s := s + #9 + '(probe count)';
     Form1.rtfStat.Lines.Add( s );
     Form1.rtfStat.Lines.Add( '' );
     Application.ProcessMessages;
*
          end;
        end;
        Close
      finally free end;
      fResultAsText := fResultAsText + GruppenTrenner;
    end;
  finally
    TS.Free;
    Art.Free
  end;
end;
*)


procedure tStatPathRelay.GetPathList(const allHdr: String; var tsa, tsg : tStatList);
var
  i : Integer;
  HdrFirst : Boolean;
  Hdr, HdrLast : String;
begin
  HdrLast := '';

  Hdr := '';
  HdrFirst := true;
  //Alle Zeichen durchgehen
  for i := 1 to length(allHdr) do begin

    //Ende eines Teiles
    if allHdr[i] in [#13, #0, '!'] then begin
      if Hdr='' then Hdr:='(no value)';
      if (Hdr<>'not-for-mail') then begin
        if not HdrFirst then begin
          tsg.Add( Hdr );
          tsa.Add( Hdr );
          HdrLast := Hdr;
        end;
        HdrFirst := False;
      end;
      Hdr := '';

    end else begin //Not in [#13, #0, '!']
      //if length(Hdr)<255 then //WOZU?!
        Hdr := Hdr + allHdr[i];
    end;

    //Am Ende der Zeile beenden
    if allHdr[i] in [#13, #0] then break; //Urks
  end;

  tsa.Add(HdrLast, -1);
  tsg.Add(HdrLast, -1);
end;

procedure tStatPathRelay.MakeStatistic(Groups: tGroupList);
var
     i    : Integer;
     gnr,anr: LongInt;
     s    : String;
     TSG  : TStatList;
     TSA  : TStatList;
     allHdr   : String;
     Art : tArticle;
     FindAll, FindGrp, findBAD : Integer;
     DTA : tDateTime;
     cancel : Boolean;
begin
  cancel := false;
  if length(Groups)=0 then exit;
  clearFindCount;
  FindAll := 0;
  findBAD := 0;

  fResultAsText := 'Path-statistics: Relayers (Top 100)' + CRLF
                 + '(based on msgs with bodies '+StatDayBaseText+')' + CRLF
                 + CRLF
                 + 'Pos.'+#9+'Count'+#9+'Weight'+#9+'Relayer' + CRLF
                 + CRLF;
  fResultAsText := fResultAsText + 'IMPORTANT: Perhaps buggy (new implemented)!' + CRLF;

  Art := tArticle.Create;
  TSG := TStatList.Create;
  TSA := TStatList.Create;
  try
    for gnr := 0 to length(Groups)-1 do begin
      FindGrp := 0;
      with Groups[gnr].DB.Create do try
        Open(Groups[gnr].Path^);
        clearGrpCount(Groups[gnr].name, Count);
        for anr:=Min to Max do begin
          cancel := incGrpCount;
          if cancel then break;
          GetArticle(anr, s, i);
          art.text := s;

          DTA := art.GetGMTDateDT;
          if DayOK( DTA ) then begin

            allHdr := Art.Header['Path:'] + #0;
            if (allHdr<>'') then begin
              incFindCount;
              inc(FindGrp);
              inc(FindAll);
              if (DTA = oldDefault) then inc(findBAD);

              GetPathList(allHdr, TSA, TSG);
            end;
          end;
        end;
        Close;
      finally free end;
      if cancel then begin
         fResultAsText := fResultAsText + CRLF + 'Cancelled...'+CRLF;
         break;
      end;
      fResultAsText := fResultAsText
          + OneText(Groups[gnr].Name, TSG, findGrp, findBAD) + CRLF
          + GetGruppenTrenner();
    end;


    if (not cancel) and (length(Groups)>1) then begin
      fResultAsText := fResultAsText
          + OneText('All selected groups', TSA, findAll, findBAD);
    end
  finally
    TSG.Free;
    TSA.Free;
    Art.Free
  end;
end;

function tStatPathRelay.OneText(tit: String; TS: tStatList; findAll,
  findBAD: Integer): String;
var
  i, l : Integer;
  TH   : TStatInfo;
begin
  //Sortieren nach Weight
  TS.SortBy_Weight;

  //Bericht" erstellen
  Result := '';
  l := 0;
  for i:=0 to TS.Count-1 do begin
    inc(l);
    if l<=100 then begin
      TH := TS.Infos[i];
      if TH.Weight>1 then begin
        Result := Result
           + IntToStr(l)
           + #9 + IntToStr(TH.Weight)
           + #9 + ValToPercent(TH.Weight, FindAll)+'%'
           + #9 + TS.Keys[i]
           + CRLF;
      end;
    end;
  end;

  Result := Result
     + CRLF
     + #9 + IntToStr(findBAD)
     + #9 + ValToPercent(findBAD,FindAll)+'%'
     + #9 + '(BAD dates)'
     + CRLF
     + #9 + IntToStr(FindAll)
     + #9 + ValToPercent(FindAll,FindAll)+'%'
     + #9 + '(probe count)'
     + CRLF
     + CRLF;
end;



end.

