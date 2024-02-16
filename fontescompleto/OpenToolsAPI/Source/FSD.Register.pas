unit FSD.Register;

interface

uses
  ToolsAPI,
  System.SysUtils,
  FSD.BasicMenu.Wizard,
  FSD.MainMenu.Wizard,
  FSD.NewProject.Wizard,
  FSD.Modelo.Forms,
  FSD.HistoryProjects.Notifier,
  FSD.HistoryProjects.Forms,
  FSD.HistoryProjects.ContextMenu,
  FSD.HistoryProjects.Binding,
  FSD.Splash;

procedure Register;

implementation

procedure Register;
begin
  AddSplash;
  RegisterBasicMenuWizard;
  RegisterMainMenuWizard;
  RegisterNewProjectWizard;
  RegisterModeloDockForm;
  RegisterHistoryProjectsNotifier;
  RegisterHistoryProjectsContextMenu;
  RegisterHistoryProjectBinding;
end;

end.
