unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmAbout = class(TForm)
    btnOK: TBitBtn;
    imgAbout: TImage;
    lCopyright: TLabel;
    mLicense: TMemo;
    lGF: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses uTools;

{$R *.DFM}

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  frmAbout.Caption := 'About...';
  lGF.Caption := 'GoldFind 3 (' + GetMyBuildInfo() + ')'
end;

end.
