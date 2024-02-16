unit FSD.NewProject.Wizard;

interface

uses
  Vcl.Dialogs,
  ToolsAPI,
  System.SysUtils,
  Winapi.Windows,
  FSD.NewProject.Creator,
  FSD.NewProject.Forms;

type TFSDNewProjectRepository = class(TNotifierObject, IOTAWizard,
                                                       IOTAProjectWizard,
                                                       IOTARepositoryWizard)
  protected
    FPath: string;
    FProjectName: string;
    FNamespace: string;

    // IOTAWizard
    function GetIDString : string;
    function GetName     : string;
    function GetState    : TWizardState;
    procedure Execute;

    // IOTARepositoryWizard
    function GetAuthor  : string;
    function GetComment : string;
    function GetPage    : string;
    function GetGlyph   : Cardinal;

    function IsVisible(Project: IOTAProject): Boolean;

  public
    class function New: IOTAWizard;

end;

procedure RegisterNewProjectWizard;

implementation

procedure RegisterNewProjectWizard;
begin
  RegisterPackageWizard(TFSDNewProjectRepository.New);
end;

{ TFSDNewProjectRepository }

procedure TFSDNewProjectRepository.Execute;
var
  project: IOTAProjectCreator;
  module: IOTAModule;
begin
  with TFSDNewProjectForms.Create(nil) do
  try
    ShowModal;
    if ModalResult = 1 then
    begin
      FProjectName := ProjectName;
      FPath        := Path;
      FNamespace   := Namespace;

      project := TFSDNewProjectCreator.New(FProjectName, FNamespace, FPath);
      module := (BorlandIDEServices as IOTAModuleServices).CreateModule(project);

      module.FileName := Path + ProjectName + '.dproj';
      module.Save(False, True);
      module.Refresh(True);
    end;
  finally
    Free;
  end;
end;

function TFSDNewProjectRepository.GetAuthor: string;
begin
  result := 'Gabriel Baltazar';
end;

function TFSDNewProjectRepository.GetComment: string;
begin
  result := 'Criar novo projeto VCL com estrutura MVC e Conex�o SQLite';
end;

function TFSDNewProjectRepository.GetGlyph: Cardinal;
begin
  result := LoadIcon(HInstance, 'delphi_ico');
end;

function TFSDNewProjectRepository.GetIDString: string;
begin
  result := Self.ClassName;
end;

function TFSDNewProjectRepository.GetName: string;
begin
  result := 'Novo Projeto';
end;

function TFSDNewProjectRepository.GetPage: string;
begin
  result := 'Forma��o Senior Developer';
end;

function TFSDNewProjectRepository.GetState: TWizardState;
begin
  result := [];
end;

function TFSDNewProjectRepository.IsVisible(Project: IOTAProject): Boolean;
begin
  result := True;
end;

class function TFSDNewProjectRepository.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
