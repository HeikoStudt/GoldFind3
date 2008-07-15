unit uFrmSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, uDBBase, uSearchBase, ExtCtrls;

type

  TfrmSearch = class(TForm)
    p1: TPanel;
    btnBeginSearch: TBitBtn;
    btnCancel: TBitBtn;
    gbOpts: TGroupBox;
    chkCase: TCheckBox;
    chkHeader: TCheckBox;
    chkBody: TCheckBox;
    gbTime: TGroupBox;
    dtpTo: TDateTimePicker;
    lTo: TLabel;
    lFrom: TLabel;
    dtpFrom: TDateTimePicker;
    btnLastDays: TButton;
    edLastDays: TEdit;
    tlDays: TLabel;
    p2: TPanel;
    lSearch: TLabel;
    edPattern: TEdit;
    chkUseDates: TCheckBox;
    procedure edLastDaysChange(Sender: TObject);
    procedure edLastDaysKeyPress(Sender: TObject; var Key: Char);
    procedure btnLastDaysClick(Sender: TObject);
    procedure dtpChange(Sender: TObject);
    procedure chkUseDatesClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function GetPattern(VAR SearchList : tSearchList): Boolean;
  end;

implementation

{$R *.DFM}

uses uSearchTrivial, uSearchRegexp;

{ TfrmSearch }

function TfrmSearch.GetPattern(VAR SearchList : tSearchList): Boolean;
var  s, p, wo : String;
     j, t : Integer;
     h : tVerknuepfung;
     cEnd: Char;
     re: Boolean;
begin
  with SearchList do begin
    dtpFrom.DateTime    := BeginDate;
    dtpTo.DateTime      := EndDate;
    edLastDays.text     := IntToStr(Trunc(EndDate)-Trunc(BeginDate));

    chkHeader.checked   := soHeader        in ToSearch;
    chkBody.checked     := soBody          in ToSearch;
    chkCase.checked     := soCaseSensitive in toSearch;
    chkUseDates.checked := soUseDate in toSearch;
    edPattern.Text      := CompletePattern;
  end;
  chkUseDates.OnClick(nil);

  if ShowModal = mrOK then begin
    Result := true;
    with SearchList do begin
      BeginDate := dtpFrom.DateTime;
      EndDate   := dtpTo.DateTime;

      ToSearch  := [];
      if chkHeader.checked then   ToSearch := ToSearch + [soHeader];
      if chkBody.checked then     ToSearch := ToSearch + [soBody];
      if chkCase.checked then     ToSearch := ToSearch + [soCaseSensitive];
      if chkUseDates.checked then ToSearch := ToSearch + [soUseDate];
      CompletePattern := edPattern.Text;

      {Parse the Pattern}
      SetLength(SBList, 0);
      s := Trim(edPattern.Text);

      while (s<>'') and (Length(SBList)<32) do begin //Todo: Max (32)
        h := hOR;
        if copy(s,1,1)='+' then begin
           h:=hAND;
           System.Delete(s,1,1);
        end else begin
           if copy(s,1,1)='-' then begin
              h:=hNOT;
              System.Delete(s,1,1);
           end;
        end;

        wo := '';
        if copy(s,1,1)='@' then begin
           j := Pos(':',s);
           if j>0 then begin
              wo := copy(s,2,j-1);
              s  := copy(s,j+1,255);
              {ggf. Header-Suche einschalten}
              //ToDo: Am einfachen ToSearch
              ToSearch := ToSearch + [soHeader];
//              if not(chkHeader.Checked) then chkHeader.Checked:=True;
           end;
        end;

        cEnd := #32;
        re   := False;
        if copy(s,1,1)='"' then begin cEnd:='"'; System.Delete(s,1,1); end;
        if copy(s,1,1)='{' then begin cEnd:='}'; System.Delete(s,1,1); re:=True; end;

        //Pattern rausextrahieren
        t := 1;
        while (t<=length(s)) and (s[t]<>cEnd) do
           inc(t);
        p := System.Copy(s, 1, t-1);
        if (t<=length(s)) then inc(t);
        System.Delete( s, 1, t-1 );

        //MessageDlg('at="'+wo+'" find="'+p+'" mode='+IntToStr(Integer(h)), mtInformation, [mbOK], -1);

        if p<>'' then begin
           SetLength(SBList, length(SBList)+1);
           if Wo>'' then
                SBList[length(SBList)-1].Patter := '@' + Wo + p
           else SBList[length(SBList)-1].Patter := p;

           if re then
                SBList[length(SBList)-1].SB := tRegexpSearch
           else SBList[length(SBList)-1].SB := tTrivialSearch;

           SBList[length(SBList)-1].How := h;
        end;
        //Leerzeichen loeschen
        s := Trim(s);
      end;
    end;
  end else
    Result := false;
end;

procedure TfrmSearch.edLastDaysChange(Sender: TObject);
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

procedure TfrmSearch.edLastDaysKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then exit; //Return
  if (Key = #8) then  exit; //Backslash
  if (Key < #48) then Key := #0;
  if (Key > #58) then Key := #0;
end;

procedure TfrmSearch.btnLastDaysClick(Sender: TObject);
begin
  dtpTo.DateTime := now;
  dtpFrom.DateTime := now - StrToIntDef(edLastDays.Text, 0)
end;

procedure TfrmSearch.dtpChange(Sender: TObject);
begin
  if (dtpFrom.DateTime<dtpTo.DateTime) then
    edLastDays.text := IntToStr(Round(dtpTo.DateTime-dtpFrom.DateTime))
end;

procedure TfrmSearch.chkUseDatesClick(Sender: TObject);
begin
  dtpFrom.Enabled    := chkUseDates.checked;
  dtpTo.Enabled      := chkUseDates.checked;
  edLastDays.Enabled := chkUseDates.checked;
end;

end.
