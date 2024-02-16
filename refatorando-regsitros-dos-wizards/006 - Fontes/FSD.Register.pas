unit FSD.Register;

interface

uses
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard;

procedure Register;

implementation

procedure Register;
begin
  RegisterHelloWorldWizard;
  RegisterMenuWizard;
end;

end.

