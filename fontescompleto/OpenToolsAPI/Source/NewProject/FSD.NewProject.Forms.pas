unit FSD.NewProject.Forms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  ToolsAPI;

type
  TFSDNewProjectForms = class(TForm)
    Label1: TLabel;
    edtNomeProjeto: TEdit;
    Label2: TLabel;
    edtDiretorio: TEdit;
    btnCriar: TButton;
    Label3: TLabel;
    edtNamespace: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function ProjectName: string;
    function Path: string;
    function Namespace: string;
    { Public declarations }
  end;

var
  FSDNewProjectForms: TFSDNewProjectForms;

implementation

{$R *.dfm}

{ TFSDNewProjectForms }

procedure TFSDNewProjectForms.FormShow(Sender: TObject);
{$IF CompilerVersion >= 32.0}
var
  i: Integer;
{$ENDIF}
begin
  {$IF CompilerVersion >= 32.0}
  (BorlandIDEServices as IOTAIDEThemingServices250)
    .RegisterFormClass(TFSDNewProjectForms);

  for i := 0 to Pred(ComponentCount) do
  begin
    (BorlandIDEServices as IOTAIDEThemingServices250)
      .ApplyTheme(Components[i]);
  end;
  {$ENDIF}
end;

function TFSDNewProjectForms.Namespace: string;
begin
  result := edtNamespace.Text;
end;

function TFSDNewProjectForms.Path: string;
begin
  Result := edtDiretorio.Text;
end;

function TFSDNewProjectForms.ProjectName: string;
begin
  result := edtNomeProjeto.Text;
end;

end.
