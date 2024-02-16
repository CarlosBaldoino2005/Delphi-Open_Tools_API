unit FSD.Register;

interface

uses
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Binding,
  FSD.HistoryProjects.ContextMenu,
  FSD.NewProject.Wizard,
  FSD.DockForm.Sample,
  FSD.Splash;

procedure Register;

implementation

procedure Register;
begin
  AddSplash;
  RegisterHelloWorldWizard;
  RegisterMenuWizard;
  RegisterHistoryNotifier;
  RegisterKeyBindingHistory;
  RegisterContextMenuHistoryProjects;
  RegisterRepositoryWizard;
  RegisterDockFormSample;
end;

end.

