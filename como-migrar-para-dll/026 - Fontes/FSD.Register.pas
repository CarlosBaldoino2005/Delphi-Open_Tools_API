unit FSD.Register;

interface

uses
  ToolsAPI,
  FSD.MainMenu.Wizard,
  FSD.HelloWorld.Wizard,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Binding,
  FSD.HistoryProjects.ContextMenu,
  FSD.NewProject.Wizard,
  FSD.DockForm.Sample,
  FSD.Splash;

procedure Register;

function RegisterDLL(
  BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc;
  var Terminate: TWizardTerminateProc
): Boolean; stdcall;

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

function RegisterDLL(
  BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc;
  var Terminate: TWizardTerminateProc
): Boolean; stdcall;
begin
  result := True;
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

