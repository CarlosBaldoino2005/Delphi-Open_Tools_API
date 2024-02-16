unit FSD.Register;

interface

uses
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Binding;

procedure Register;

implementation

procedure Register;
begin
  RegisterHelloWorldWizard;
  RegisterMenuWizard;
  RegisterHistoryNotifier;
  RegisterKeyBindingHistory;
end;

end.

