unit FSD.NewProject.SourceFile;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type TFSDNewProjectSourceFile = class(TNotifierObject, IOTAFile)

  private
    FProjectName: string;

  protected
    function GetSource: string;
    function GetAge: TDateTime;

  public
    constructor create(ProjectName: String);
    class function New(ProjectName: String): IOTAFile;
end;

implementation

{ TFSDNewProjectSourceFile }

constructor TFSDNewProjectSourceFile.create(ProjectName: String);
begin
  FProjectName := ProjectName;
end;

function TFSDNewProjectSourceFile.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDNewProjectSourceFile.GetSource: string;
begin
  result :=
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  // Formacao Senior Developer ' + sLineBreak +
    '  Vcl.Forms, ' + sLineBreak +
    '  System.SysUtils, ' + sLineBreak +
    '  System.Classes; ' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  Application.Initialize;' + sLineBreak +
    '  Application.MainFormOnTaskbar := True;' + sLineBreak +
    '  Application.Run;' + sLineBreak +
    'end.';

  result := Format(result, [FProjectName]);
end;

class function TFSDNewProjectSourceFile.New(ProjectName: String): IOTAFile;
begin
  Result := Self.create(ProjectName);
end;

end.
