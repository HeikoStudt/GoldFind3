program GoldFind;

uses
  Forms,
  uMain in 'uMain.pas' {frmMainGoldFindWindow},
  uDBHamsterNews in 'uDBHamsterNews.pas',
  uTools in 'lib\uTools.pas',
  uAbout in 'uAbout.pas' {frmAbout},
  uDBBase in 'uDBBase.pas',
  uDBHamsterMails in 'uDBHamsterMails.pas',
  uSearchTrivial in 'uSearchTrivial.pas',
  uoTools in 'uoTools.pas',
  uFrmSearch in 'uFrmSearch.pas' {frmSearch},
  uSearchRegexp in 'uSearchRegexp.pas',
  uStatisticsBase in 'uStatisticsBase.pas',
  uDBMbox in 'uDBMbox.pas',
  uFrmStatistic in 'uFrmStatistic.pas' {frmStatistic},
  uSearchBase in 'uSearchBase.pas',
  uStatistiken in 'uStatistiken.pas',
  uDBNewsNNTP in 'uDBNewsNNTP.pas',
  uMPArticle in 'uMPArticle.pas',
  uDBHamsterOle in 'uDBHamsterOle.pas',
  uStatisticsMessPer in 'uStatisticsMessPer.pas',
  uStatisticsHeader in 'uStatisticsHeader.pas',
  uDockForm in 'uDockForm.pas',
  uConfiguration in 'uConfiguration.pas',
  uFrmConfig in 'uFrmConfig.pas' {frmConfig},
  hh in 'lib\delphikit\hh.pas',
  hh_funcs in 'lib\delphikit\hh_funcs.pas',
  uDBMailsPOP3 in 'uDBMailsPOP3.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'GoldFind 3';
  Application.CreateForm(TfrmMainGoldFindWindow, frmMainGoldFindWindow);
  Application.CreateForm(TfrmStatistic, frmStatistic);
  Application.Run;
end.
