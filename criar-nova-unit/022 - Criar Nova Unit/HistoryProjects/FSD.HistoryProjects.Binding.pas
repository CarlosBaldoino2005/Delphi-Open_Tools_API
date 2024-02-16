unit FSD.HistoryProjects.Binding;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  FSD.HistoryProjects.Forms,
  Vcl.Menus;

type TFSDHistoryProjectsBinding = class(TNotifierObject, IOTAKeyboardBinding)

  private
    procedure Execute(const Context: IOTAKeyContext; KeyCode: TShortcut;
                      var BindingResult: TKeyBindingResult);

  protected
    function GetBindingType: TBindingType;
    function GetDisplayName: string;
    function GetName: string;
    procedure BindKeyboard(const BindingServices: IOTAKeyBindingServices);

  public
    class function New: IOTAKeyboardBinding;
end;

var
  Index: Integer = -1;

procedure RegisterKeyBindingHistory;

implementation

procedure RegisterKeyBindingHistory;
begin
  Index := (BorlandIDEServices as IOTAKeyboardServices)
    .AddKeyboardBinding(TFSDHistoryProjectsBinding.New);
end;

{ TFSDHistoryProjectsBinding }

procedure TFSDHistoryProjectsBinding.BindKeyboard( const BindingServices: IOTAKeyBindingServices);
begin
  BindingServices.AddKeyBinding([TextToShortCut('Ctrl+Shift+P')],
    Execute, nil, 0, '', 'imHistoricoProjetos');
end;

procedure TFSDHistoryProjectsBinding.Execute(const Context: IOTAKeyContext; KeyCode: TShortcut; var BindingResult: TKeyBindingResult);
begin
  BindingResult := krHandled;
  ShowHistoryProjects;
end;

function TFSDHistoryProjectsBinding.GetBindingType: TBindingType;
begin
  Result := TBindingType.btPartial;
end;

function TFSDHistoryProjectsBinding.GetDisplayName: string;
begin
  result := Self.ClassName;
end;

function TFSDHistoryProjectsBinding.GetName: string;
begin
  result := Self.ClassName;
end;

class function TFSDHistoryProjectsBinding.New: IOTAKeyboardBinding;
begin
  result := Self.Create;
end;

initialization

finalization
  (BorlandIDEServices as IOTAKeyboardServices)
    .RemoveKeyboardBinding(Index);

end.
