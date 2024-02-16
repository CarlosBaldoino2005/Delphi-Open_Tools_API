unit FSD.NewUnit.ToolsAPI.Creator;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type TFSDNewUnitToolsAPI = class(TNotifierObject, IOTACreator,
                                                  IOTAModuleCreator,
                                                  IOTAFile)

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

    function GetSource: string;
    { Return the age of the file. -1 if new }
    function GetAge: TDateTime;

  public
    class function NEw: IOTACreator;
end;

implementation

{ TFSDNewUnitToolsAPI }

procedure TFSDNewUnitToolsAPI.FormCreated(
  const FormEditor: IOTAFormEditor);
begin

end;

function TFSDNewUnitToolsAPI.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDNewUnitToolsAPI.GetAncestorName: string;
begin
  result := '';
end;

function TFSDNewUnitToolsAPI.GetCreatorType: string;
begin
  result := sUnit;
end;

function TFSDNewUnitToolsAPI.GetExisting: Boolean;
begin
  result := False;
end;

function TFSDNewUnitToolsAPI.GetFileSystem: string;
begin
  result := '';
end;

function TFSDNewUnitToolsAPI.GetFormName: string;
begin

end;

function TFSDNewUnitToolsAPI.GetImplFileName: string;
begin
  result := '';
end;

function TFSDNewUnitToolsAPI.GetIntfFileName: string;
begin
  result := '';
end;

function TFSDNewUnitToolsAPI.GetMainForm: Boolean;
begin
  result := False;
end;

function TFSDNewUnitToolsAPI.GetOwner: IOTAModule;
begin
  result := GetActiveProject;
end;

function TFSDNewUnitToolsAPI.GetShowForm: Boolean;
begin
  result := False;
end;

function TFSDNewUnitToolsAPI.GetShowSource: Boolean;
begin
  result := True;
end;

function TFSDNewUnitToolsAPI.GetSource: string;
begin
  result :=
    'unit Unit1;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  ToolsAPI,' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  System.Classes;' + sLineBreak +
    '' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'end.';
end;

function TFSDNewUnitToolsAPI.GetUnnamed: Boolean;
begin
  result := True;
end;

class function TFSDNewUnitToolsAPI.NEw: IOTACreator;
begin
  result := Self.Create;
end;

function TFSDNewUnitToolsAPI.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

function TFSDNewUnitToolsAPI.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  result := Self;
end;

function TFSDNewUnitToolsAPI.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin

end;

end.
