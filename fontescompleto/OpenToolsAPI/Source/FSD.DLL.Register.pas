unit FSD.DLL.Register;

interface

uses
  ToolsAPI,
  deskutil,
  System.SysUtils,
  FSD.BasicMenu.Wizard,
  FSD.MainMenu.Wizard,
  FSD.NewProject.Wizard,
  FSD.Modelo.Forms,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Forms,
  FSD.HistoryProjects.ContextMenu,
  FSD.HistoryProjects.Binding;

function RegisterDLL(
  BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc;
  var Terminate: TWizardTerminateProc
): Boolean; stdcall;

implementation

function RegisterDLL(
  BorlandIDEServices: IBorlandIDEServices;
  RegisterProc: TWizardRegisterProc;
  var Terminate: TWizardTerminateProc
): Boolean; stdcall;
begin
  result := True;
  RegisterBasicMenuWizard;
  RegisterMainMenuWizard;
  RegisterNewProjectWizard;
  RegisterModeloDockForm;
  RegisterHistoryProjectsNotifier;
  RegisterHistoryProjectsContextMenu;
  RegisterHistoryProjectBinding;
end;

end.
