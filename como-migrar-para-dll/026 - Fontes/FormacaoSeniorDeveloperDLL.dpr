library FormacaoSeniorDeveloperDLL;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{$R *.dres}

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.DockForm.Sample in 'DockForm\FSD.DockForm.Sample.pas' {FSDDockFormSample},
  FSD.HelloWorld.Wizard in 'HelloWorld\FSD.HelloWorld.Wizard.pas',
  FSD.HistoryProjects.Binding in 'HistoryProjects\FSD.HistoryProjects.Binding.pas',
  FSD.HistoryProjects.ContextMenu in 'HistoryProjects\FSD.HistoryProjects.ContextMenu.pas',
  FSD.HistoryProjects.Forms in 'HistoryProjects\FSD.HistoryProjects.Forms.pas' {FSDHistoryProjectsForms},
  FSD.HistoryProjects.Notifier in 'HistoryProjects\FSD.HistoryProjects.Notifier.pas',
  FSD.MainMenu.Wizard in 'MainMenu\FSD.MainMenu.Wizard.pas',
  FSD.NewProject.Creator in 'NewProject\FSD.NewProject.Creator.pas',
  FSD.NewProject.NewFormCadastro.Creator in 'NewProject\FSD.NewProject.NewFormCadastro.Creator.pas',
  FSD.NewProject.NewFormCadastro.SourceFile in 'NewProject\FSD.NewProject.NewFormCadastro.SourceFile.pas',
  FSD.NewProject.NewFormMain.Creator in 'NewProject\FSD.NewProject.NewFormMain.Creator.pas',
  FSD.NewProject.NewFormMain.SourceFile in 'NewProject\FSD.NewProject.NewFormMain.SourceFile.pas',
  FSD.NewProject.NewUnit.Component.ConnectionFiredac in 'NewProject\FSD.NewProject.NewUnit.Component.ConnectionFiredac.pas',
  FSD.NewProject.NewUnit.Component.ConnectionInterfaces in 'NewProject\FSD.NewProject.NewUnit.Component.ConnectionInterfaces.pas',
  FSD.NewProject.NewUnit.ComponentFactory in 'NewProject\FSD.NewProject.NewUnit.ComponentFactory.pas',
  FSD.NewProject.NewUnit.ComponentInterfaces in 'NewProject\FSD.NewProject.NewUnit.ComponentInterfaces.pas',
  FSD.NewProject.NewUnit.Controller in 'NewProject\FSD.NewProject.NewUnit.Controller.pas',
  FSD.NewProject.NewUnit.DAOBase in 'NewProject\FSD.NewProject.NewUnit.DAOBase.pas',
  FSD.NewProject.NewUnit.DAOFactory in 'NewProject\FSD.NewProject.NewUnit.DAOFactory.pas',
  FSD.NewProject.NewUnit.DAOInterfaces in 'NewProject\FSD.NewProject.NewUnit.DAOInterfaces.pas',
  FSD.NewProject.NewUnit.Model in 'NewProject\FSD.NewProject.NewUnit.Model.pas',
  FSD.NewProject.NewUnit.ModelInterfaces in 'NewProject\FSD.NewProject.NewUnit.ModelInterfaces.pas',
  FSD.NewProject.NewUnit.Behaviors in 'NewProject\FSD.NewProject.NewUnit.Behaviors.pas',
  FSD.NewProject.Forms in 'NewProject\FSD.NewProject.Forms.pas' {FSDNewProjectForms},
  FSD.NewProject.SourceFile in 'NewProject\FSD.NewProject.SourceFile.pas',
  FSD.NewProject.Wizard in 'NewProject\FSD.NewProject.Wizard.pas',
  FSD.NewUnit.ToolsAPI.Creator in 'NewUnit\FSD.NewUnit.ToolsAPI.Creator.pas',
  FSD.Splash in 'Splash\FSD.Splash.pas',
  FSD.Register in 'FSD.Register.pas';

exports
  RegisterDLL name WizardEntryPoint;

{$R *.res}

begin
end.
