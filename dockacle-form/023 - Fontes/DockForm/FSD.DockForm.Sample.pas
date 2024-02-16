unit FSD.DockForm.Sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  DockForm;

type
  TFSDDockFormSample = class(TDockableForm)
    btnDockForm: TButton;
    procedure btnDockFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  FSDDockFormSample: TFSDDockFormSample;

procedure ShowDockFormSample;
procedure RegisterDockFormSample;
procedure Unregister;

implementation

uses
  DeskUtil,
  ToolsAPI;

procedure RegisterDockFormSample;
begin
  {$IF CompilerVersion >= 32.0}
  (BorlandIDEServices as IOTAIDEThemingServices250)
    .RegisterFormClass(TFSDDockFormSample);
  {$ENDIF}

  if not Assigned(FSDDockFormSample) then
    FSDDockFormSample := TFSDDockFormSample.Create(nil);

  if @RegisterFieldAddress <> nil then
    RegisterFieldAddress(FSDDockFormSample.Name, @FSDDockFormSample);

  RegisterDesktopFormClass(TFSDDockFormSample,
                           FSDDockFormSample.Name,
                           FSDDockFormSample.Name);
end;

procedure Unregister;
begin
  if @UnRegisterFieldAddress <> nil then
    UnRegisterFieldAddress(@FSDDockFormSample);
  FreeAndNil(FSDDockFormSample);
end;

procedure ShowDockFormSample;
begin
  ShowDockableForm(FSDDockFormSample);
  FocusWindow(FSDDockFormSample);
end;

{$R *.dfm}

procedure TFSDDockFormSample.btnDockFormClick(Sender: TObject);
begin
  ShowMessage('Hello Dock.');
end;

constructor TFSDDockFormSample.create(AOwner: TComponent);
begin
  inherited;
  DeskSection := Name;
  AutoSave := True;
  SaveStateNecessary := True;
end;

initialization

finalization
  Unregister;

end.
