unit FSD.Register;

interface

uses
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Binding,
  FSD.HistoryProjects.ContextMenu,
  FSD.NewProject.Wizard,
  FSD.DockForm.Sample;

procedure Register;

implementation

procedure Register;
begin
  RegisterHelloWorldWizard;
  RegisterMenuWizard;
  RegisterHistoryNotifier;
  RegisterKeyBindingHistory;
  RegisterContextMenuHistoryProjects;
  RegisterRepositoryWizard;
  RegisterDockFormSample;
end;

end.

