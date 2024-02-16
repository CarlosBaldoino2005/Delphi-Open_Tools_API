unit FSD.HelloWorld.Wizard;

interface

uses
  ToolsAPI,
  Vcl.Dialogs;

type TFSDHelloWorldWizard = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)

  protected
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    function GetMenuText: string;

    { Launch the AddIn }
    procedure Execute;

  public
    class function New: IOTAWizard;
end;

procedure Register;

implementation

procedure Register;
begin
  RegisterPackageWizard(TFSDHelloWorldWizard.New);
end;

{ TFSDBasicMenuWizard }

procedure TFSDHelloWorldWizard.Execute;
begin
  ShowMessage('Hello World');
end;

function TFSDHelloWorldWizard.GetIDString: string;
begin
  result := Self.ClassName;
end;

function TFSDHelloWorldWizard.GetMenuText: string;
begin
  result := 'Hello World';
end;

function TFSDHelloWorldWizard.GetName: string;
begin
  result := 'Hello World';
end;

function TFSDHelloWorldWizard.GetState: TWizardState;
begin
  result := [wsEnabled]
end;

class function TFSDHelloWorldWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
