unit uDockForm;

interface

uses Forms, classes;

//http://majority.110mb.com/various.htm
//Damit kein Close-Button existiert bei dem gefloateten Chart.
type
  TDockForm = class(TCustomDockForm)
    private
      fIsResized : Integer; //2 times to be resized
    public
      constructor Create(AOwner: TComponent); override;
      procedure   DoClose(var Action: TCloseAction); override;
      function    CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
  end;


implementation

constructor TDockForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderIcons := []; // This disables the 'close' button
  fIsResized := 0
end;

function TDockForm.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := fIsResized <> 2;
  if (Result) then inc(fIsResized)
end;

procedure TDockForm.DoClose(var Action: TCloseAction);
begin
  Action := caNone;
end;

end.
