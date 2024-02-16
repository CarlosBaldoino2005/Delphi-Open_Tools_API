unit FSD.NewProject.Forms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFSDNewProjectForms = class(TForm)
    Label1: TLabel;
    edtNomeProjeto: TEdit;
    Label3: TLabel;
    edtNamespace: TEdit;
    edtDiretorio: TEdit;
    Label2: TLabel;
    btnCriar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSDNewProjectForms: TFSDNewProjectForms;

implementation

{$R *.dfm}

uses
  ToolsAPI,
  FSD.NewProject.Creator;

procedure TFSDNewProjectForms.btnCriarClick(Sender: TObject);
var
  projectCreator: IOTAProjectCreator;
  module: IOTAModule;
begin
  projectCreator := TFSDNewProjectCreator.New(edtNomeProjeto.Text,
                                              edtNamespace.Text,
                                              edtDiretorio.Text);

  module := (BorlandIDEServices as IOTAModuleServices).CreateModule(projectCreator);
  module.FileName := edtDiretorio.Text + edtNomeProjeto.Text + '.dproj';
  module.Save(False, True);
  module.Refresh(True);
end;

procedure TFSDNewProjectForms.FormShow(Sender: TObject);
var
  i: Integer;
begin
  {$IF CompilerVersion >= 32.0}
  (BorlandIDEServices as IOTAIDEThemingServices250)
    .RegisterFormClass(TFSDNewProjectForms);

  for i := 0 to ComponentCount - 1 do
    (BorlandIDEServices as IOTAIDEThemingServices250)
      .ApplyTheme(Components[i]);
  {$ENDIF}
end;

end.
