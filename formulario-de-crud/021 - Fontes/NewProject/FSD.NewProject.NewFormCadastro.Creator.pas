unit FSD.NewProject.NewFormCadastro.Creator;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.NewProject.NewFormCadastro.SourceFile;

type TFSDNewProjectNewFormCadastroCreator = class(TNotifierObject,
                                                  IOTACreator,
                                                  IOTAModuleCreator)
  private
    FNamespace: String;

  protected
    function GetCreatorType: string;
    { Return False if this is a new module }
    function GetExisting: Boolean;
    { Return the File system IDString that this module uses for reading/writing }
    function GetFileSystem: string;
    { Return the Owning module, if one exists (for a project module, this would
      be a project; for a project this is a project group) }
    function GetOwner: IOTAModule;
    { Return true, if this item is to be marked as un-named.  This will force the
      save as dialog to appear the first time the user saves. }
    function GetUnnamed: Boolean;

    function GetAncestorName: string;
    { Return the implementation filename, or blank to have the IDE create a new
      unique one. (C++ .cpp file or Delphi unit) NOTE: If a value is returned then it *must* be a
      fully qualified filename.  This also applies to GetIntfFileName and
      GetAdditionalFileName on the IOTAAdditionalFilesModuleCreator interface. }
    function GetImplFileName: string;
    { Return the interface filename, or blank to have the IDE create a new
      unique one.  (C++ header) }
    function GetIntfFileName: string;
    { Return the form name }
    function GetFormName: string;
    { Return True to Make this module the main form of the given Owner/Project }
    function GetMainForm: Boolean;
    { Return True to show the form }
    function GetShowForm: Boolean;
    { Return True to show the source }
    function GetShowSource: Boolean;
    { Create and return the Form resource for this new module if applicable }
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Implementation source for this module. (C++ .cpp
      file or Delphi unit) }
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Interface (C++ header) source for this module }
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Called when the new form/datamodule/custom module is created }
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  public
    constructor create(Path, Namespace: String);
    class function New(Path, Namespace: String): IOTACreator;
end;

implementation

{ TFSDNewProjectNewFormCadastroCreator }

constructor TFSDNewProjectNewFormCadastroCreator.create(Path, Namespace: String);
var
  unitFileName: string;
  unitPath: string;
  module: IOTAModule;
begin
  FNamespace := Namespace;
  unitPath := Path + 'src\View\';
  unitFileName := unitPath + FNamespace + '.View.Cadastro.pas';

  ForceDirectories(unitPath);

  module := (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
  module.FileName := unitFileName;
  module.Save(False, True);
end;

procedure TFSDNewProjectNewFormCadastroCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin

end;

function TFSDNewProjectNewFormCadastroCreator.GetAncestorName: string;
begin
  Result := 'TForm';
end;

function TFSDNewProjectNewFormCadastroCreator.GetCreatorType: string;
begin
  result := sForm;
end;

function TFSDNewProjectNewFormCadastroCreator.GetExisting: Boolean;
begin
  result := False;
end;

function TFSDNewProjectNewFormCadastroCreator.GetFileSystem: string;
begin
  result := '';
end;

function TFSDNewProjectNewFormCadastroCreator.GetFormName: string;
begin
  result := '';
end;

function TFSDNewProjectNewFormCadastroCreator.GetImplFileName: string;
begin
  result := '';
end;

function TFSDNewProjectNewFormCadastroCreator.GetIntfFileName: string;
begin
  result := '';
end;

function TFSDNewProjectNewFormCadastroCreator.GetMainForm: Boolean;
begin
  result := False;
end;

function TFSDNewProjectNewFormCadastroCreator.GetOwner: IOTAModule;
begin
  result := GetActiveProject;
end;

function TFSDNewProjectNewFormCadastroCreator.GetShowForm: Boolean;
begin
  result := False;
end;

function TFSDNewProjectNewFormCadastroCreator.GetShowSource: Boolean;
begin
  Result := False;
end;

function TFSDNewProjectNewFormCadastroCreator.GetUnnamed: Boolean;
begin
  result := True;
end;

class function TFSDNewProjectNewFormCadastroCreator.New(Path, Namespace: String): IOTACreator;
begin
  result := Self.create(Path, Namespace);
end;

function TFSDNewProjectNewFormCadastroCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := TFSDNewProjectNewFormCadastroSourceDFM.New(FNamespace);
end;

function TFSDNewProjectNewFormCadastroCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := TFSDNewProjectNewFormCadastroSourcePAS.New(FNamespace);
end;

function TFSDNewProjectNewFormCadastroCreator.NewIntfSource(
  const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin

end;

end.
