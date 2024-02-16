unit FSD.NewProject.Wizard;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  Vcl.Dialogs;

type TFSDNewRepositoryWizard = class(TNotifierObject, IOTAWizard,
                                                      IOTAProjectWizard,
                                                      IOTARepositoryWizard)
  protected
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;

    { Launch the AddIn }
    procedure Execute;

    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    { Handle to an Icon }
    function GetGlyph: Cardinal;

  public
    class function New: IOTAWizard;

end;

procedure RegisterRepositoryWizard;

implementation

procedure RegisterRepositoryWizard;
begin
  RegisterPackageWizard(TFSDNewRepositoryWizard.New);
end;

{ TFSDNewRepositoryWizard }

procedure TFSDNewRepositoryWizard.Execute;
begin
  ShowMessage('Novo Projeto');
end;

function TFSDNewRepositoryWizard.GetAuthor: string;
begin
  result := 'Gabriel Baltazar';
end;

function TFSDNewRepositoryWizard.GetComment: string;
begin
  result := 'Criar Novo projeto com estrutura MVC.';
end;

function TFSDNewRepositoryWizard.GetGlyph: Cardinal;
begin
  result := LoadIcon(HInstance, 'delphi_ico');
end;

function TFSDNewRepositoryWizard.GetIDString: string;
begin
  result := Self.ClassName;
end;

function TFSDNewRepositoryWizard.GetName: string;
begin
  result := 'Novo Projeto';
end;

function TFSDNewRepositoryWizard.GetPage: string;
begin
  result := 'Formação Senior Developer';
end;

function TFSDNewRepositoryWizard.GetState: TWizardState;
begin
  result := [];
end;

class function TFSDNewRepositoryWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
