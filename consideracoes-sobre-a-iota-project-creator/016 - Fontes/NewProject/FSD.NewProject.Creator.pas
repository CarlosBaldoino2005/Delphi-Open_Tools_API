unit FSD.NewProject.Creator;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type TFSDNewProjectCreator = class(TNotifierObject, IOTACreator,
                                                    IOTAProjectCreator,
                                                    IOTAProjectCreator80)

  private
    FProjectName: string;
    FNamespace: String;
    FPath: string;

  protected
    // IOTACREATOR

    { Return a string representing the default creator type in which to augment.
      See the definitions of sApplication, sConsole, sLibrary and
      sPackage, etc.. above.  Return an empty string indicating that this
      creator will provide *all* information }
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

    // IOTAPROJECTCREATOR
    { Return the project filename. NOTE: This *must* be a fully qualified file name. }
    function GetFileName: string;
    { Deprecated!! Return the option file name (C++ .bpr, .bpk, etc...) }
    function GetOptionFileName: string; deprecated;
    { Return True to show the source }
    function GetShowSource: Boolean;
    { Deprecated!! Called to create a new default module for this project.
      Please implement and use the method on IOTAProjectCreator50. }
    procedure NewDefaultModule; deprecated;
    { Deprecated!! Create and return the project option source. (C++) }
    function NewOptionSource(const ProjectName: string): IOTAFile; deprecated;
    { Called to indicate when to create/modify the project resource file }
    procedure NewProjectResource(const Project: IOTAProject);
    { Create and return the Project source file }
    function NewProjectSource(const ProjectName: string): IOTAFile;
    procedure NewDefaultProjectModule(const Project: IOTAProject);

    function GetProjectPersonality: string;
  public
    constructor create(ProjectName, Namespace, Path: String);
    class function New(ProjectName, Namespace, Path: String): IOTAProjectCreator;
end;

implementation

uses
  FSD.NewProject.SourceFile;

{ TFSDNewProjectCreator }

constructor TFSDNewProjectCreator.create(ProjectName, Namespace, Path: String);
begin
  FProjectName := ProjectName;
  FNamespace := Namespace;
  FPath := Path;
end;

function TFSDNewProjectCreator.GetCreatorType: string;
begin
  result := sApplication;
end;

function TFSDNewProjectCreator.GetExisting: Boolean;
begin
  result := False;
end;

function TFSDNewProjectCreator.GetFileName: string;
begin
  result := FPath + FProjectName + '.dpr';
end;

function TFSDNewProjectCreator.GetFileSystem: string;
begin
  result := EmptyStr;
end;

function TFSDNewProjectCreator.GetOptionFileName: string;
begin
  result := EmptyStr;
end;

function TFSDNewProjectCreator.GetOwner: IOTAModule;
begin
  result := (BorlandIDEServices as IOTAModuleServices).MainProjectGroup;
end;

function TFSDNewProjectCreator.GetProjectPersonality: string;
begin
  result := sDelphiPersonality;
end;

function TFSDNewProjectCreator.GetShowSource: Boolean;
begin
  result := True;
end;

function TFSDNewProjectCreator.GetUnnamed: Boolean;
begin
  result := True;
end;

class function TFSDNewProjectCreator.New(ProjectName, Namespace, Path: String): IOTAProjectCreator;
begin
  result := Self.create(ProjectName, Namespace, Path);
end;

procedure TFSDNewProjectCreator.NewDefaultModule;
begin

end;

procedure TFSDNewProjectCreator.NewDefaultProjectModule(
  const Project: IOTAProject);
begin

end;

function TFSDNewProjectCreator.NewOptionSource(const ProjectName: string): IOTAFile;
begin

end;

procedure TFSDNewProjectCreator.NewProjectResource(const Project: IOTAProject);
begin
end;

function TFSDNewProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
begin
  result := TFSDNewProjectSourceFile.New(FProjectName);
end;

end.
