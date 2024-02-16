unit FSD.Modelo.FormCadastro.SourceFile;

interface

uses
  ToolsAPI,
  Data.DB,
  System.SysUtils,
  FSD.Modelo.Classes;

type
  TFSDModeloFormCadastroSourceFilePAS = class(TNotifierObject, IOTAFile)
  private
    FTabela: TFSDModeloTabela;
    FNamespace: string;

    function DeclareFields: string;
    function SetFields: String;
  protected
    function GetAge: TDateTime;
    function GetSource: string;

  public
    constructor create(Tabela: TFSDModeloTabela; Namespace: String);
    class function New(Tabela: TFSDModeloTabela; Namespace: String): IOTAFile;
  end;

  TFSDModeloFormCadastroSourceFileDFM = class(TNotifierObject, IOTAFile)
  private
    FTabela: TFSDModeloTabela;
    FNamespace: string;

    function DeclareComponents: string;
  protected
    function GetAge: TDateTime;
    function GetSource: string;

  public
    constructor create(Tabela: TFSDModeloTabela; Namespace: String);
    class function New(Tabela: TFSDModeloTabela; Namespace: String): IOTAFile;
  end;

implementation

{ TFSDModeloFormCadastroSourceFilePAS }

constructor TFSDModeloFormCadastroSourceFilePAS.create(Tabela: TFSDModeloTabela; Namespace: String);
begin
  FTabela := Tabela;
  FNamespace := Namespace;
end;

function TFSDModeloFormCadastroSourceFilePAS.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDModeloFormCadastroSourceFilePAS.GetSource: string;
begin
  result :=
    'unit %0:s.View.%1:s;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  %0:s.View.Cadastro,' + sLineBreak +
    '  Data.DB,' + sLineBreak +
    '  Winapi.Windows,' + sLineBreak +
    '  Winapi.Messages,' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  System.Variants,' + sLineBreak +
    '  System.Classes,' + sLineBreak +
    '  Vcl.Graphics,' + sLineBreak +
    '  Vcl.Controls,' + sLineBreak +
    '  Vcl.Forms,' + sLineBreak +
    '  Vcl.Dialogs,' + sLineBreak +
    '  Vcl.StdCtrls,' + sLineBreak +
    '  Vcl.Grids,' + sLineBreak +
    '  Vcl.DBGrids,' + sLineBreak +
    '  Vcl.ExtCtrls;' + sLineBreak +
    '' + sLineBreak +
    'type' + sLineBreak +
    '  T%0:sView%1:s = class(T%0:sViewCadastro)' + sLineBreak +
    '%2:s' +
    '    procedure btnListClick(Sender: TObject);' + sLineBreak +
    '    procedure FormCreate(Sender: TObject);' + sLineBreak +
    '    procedure btnInsertClick(Sender: TObject);' + sLineBreak +
    '    procedure btnUpdateClick(Sender: TObject);' + sLineBreak +
    '    procedure btnDeleteClick(Sender: TObject);' + sLineBreak +
    '  private' + sLineBreak +
    '    { Private declarations }' + sLineBreak +
    '  public' + sLineBreak +
    '    { Public declarations }' + sLineBreak +
    '  end;' + sLineBreak +
    '' + sLineBreak +
    'var' + sLineBreak +
    '  %0:sView%1:s: T%0:sView%1:s;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    '{$R *.dfm}' + sLineBreak +
    '' + sLineBreak +
    'procedure T%0:sView%1:s.btnDeleteClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  inherited;' + sLineBreak +
    '  Controller' + sLineBreak +
    '    .Model' + sLineBreak +
    '      .DAO' + sLineBreak +
    '        .%1:sDAO' + sLineBreak +
    '          .This' + sLineBreak +
    '            .Id(dsCadastro.DataSet.FieldByName(''id'').AsInteger)' + sLineBreak +
    '          .&End' + sLineBreak +
    '        .Delete' + sLineBreak +
    '        .Get;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure T%0:sView%1:s.btnInsertClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  Controller' + sLineBreak +
    '    .Model' + sLineBreak +
    '      .DAO' + sLineBreak +
    '        .%1:sDAO' + sLineBreak +
    '          .This' + sLineBreak +
    '%3:s' +
    '          .&End' + sLineBreak +
    '        .Insert' + sLineBreak +
    '        .Get;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure T%0:sView%1:s.btnListClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  inherited;' + sLineBreak +
    '  Controller.Model.DAO.%1:sDAO.Get;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure T%0:sView%1:s.btnUpdateClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  inherited;' + sLineBreak +
    '  Controller' + sLineBreak +
    '    .Model' + sLineBreak +
    '      .DAO' + sLineBreak +
    '        .%1:sDAO' + sLineBreak +
    '          .This' + sLineBreak +
    '            .Id(dsCadastro.DataSet.FieldByName(''id'').AsInteger)' + sLineBreak +
    '%3:s' +
    '          .&End' + sLineBreak +
    '        .Update' + sLineBreak +
    '        .Get;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure T%0:sView%1:s.FormCreate(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  inherited;' + sLineBreak +
    '  Controller.Model.DAO.%1:sDAO.DataSet(dsCadastro);' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'end.';

  Result := Format(Result, [FNamespace, FTabela.nome, DeclareFields, SetFields]);
end;

class function TFSDModeloFormCadastroSourceFilePAS.New(Tabela: TFSDModeloTabela; Namespace: String): IOTAFile;
begin
  result := Self.create(Tabela, Namespace);
end;

function TFSDModeloFormCadastroSourceFilePAS.SetFields: String;
var
  i: Integer;
  parse: string;
begin
  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    parse := 'edt' + FTabela.campos[i].nome + '.Text';
    if FTabela.campos[i].dataType = ftFloat then
      parse := Format('StrToFloatDef(%s, 0)', [parse])
    else
    if FTabela.campos[i].dataType = ftInteger then
      parse := Format('StrToIntDef(%s, 0)', [parse]);

    parse := '(' + parse + ')';

    result := result + ''.PadLeft(12, ' ') + '.' +
                  FTabela.campos[i].nome + parse + sLineBreak;
  end;
end;

function TFSDModeloFormCadastroSourceFilePAS.DeclareFields: string;
var
  i: Integer;
begin
  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    Result := Result + Format('    edt%s: TLabeledEdit;', [FTabela.campos[i].nome])
      + sLineBreak;
  end;

end;

{ TFSDModeloFormCadastroSourceFileDFM }

constructor TFSDModeloFormCadastroSourceFileDFM.create(Tabela: TFSDModeloTabela; Namespace: String);
begin
  FTabela := Tabela;
  FNamespace := Namespace;
end;

function TFSDModeloFormCadastroSourceFileDFM.DeclareComponents: string;
var
  i: Integer;
  left: Integer;
begin
  left := 10;

  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    Result := Result + Format(
    '  object edt%0:s: TLabeledEdit [%1:s]' + sLineBreak +
    '    Left = ' + left.ToString + sLineBreak +
    '    Top = 72' + sLineBreak +
    '    Width = 121' + sLineBreak +
    '    Height = 29' + sLineBreak +
    '    EditLabel.Width = 43' + sLineBreak +
    '    EditLabel.Height = 21' + sLineBreak +
    '    EditLabel.Caption = ''%0:s''' + sLineBreak +
//    '    TabOrder = %1:s' + sLineBreak +
    '  end', [FTabela.campos[i].nome, (i + 1).ToString]);

    left := left + 140;
  end;
end;

function TFSDModeloFormCadastroSourceFileDFM.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDModeloFormCadastroSourceFileDFM.GetSource: string;
begin
  result :=
    'inherited %0:sView%1:s: T%0:sView%1:s' + sLineBreak +
    '  Caption = ''%0:sView%1:s''' + sLineBreak +
    '  Font.Height = -16' + sLineBreak +
    '  OnCreate = FormCreate' + sLineBreak +
    '  PixelsPerInch = 96' + sLineBreak +
    '  TextHeight = 21' + sLineBreak +
    '  inherited pnlTop: TPanel' + sLineBreak +
    '    ExplicitLeft = 0' + sLineBreak +
    '    ExplicitWidth = 582' + sLineBreak +
    '    inherited lblTitle: TLabel' + sLineBreak +
    '      Width = 85' + sLineBreak +
    '      Height = 35' + sLineBreak +
    '      Caption = ''%1:s''' + sLineBreak +
    '      ExplicitWidth = 85' + sLineBreak +
    '    end' + sLineBreak +
    '  end' + sLineBreak +
    '%2:s' +
    '  inherited gridCadastro: TDBGrid' + sLineBreak +
    '    TitleFont.Height = -16' + sLineBreak +
    '  end' + sLineBreak +
    '  inherited Panel1: TPanel' + sLineBreak +
    '    ExplicitTop = 128' + sLineBreak +
    '    inherited btnDelete: TButton' + sLineBreak +
    '      OnClick = btnDeleteClick' + sLineBreak +
    '    end' + sLineBreak +
    '    inherited btnUpdate: TButton' + sLineBreak +
    '      OnClick = btnUpdateClick' + sLineBreak +
    '    end' + sLineBreak +
    '    inherited btnInsert: TButton' + sLineBreak +
    '      OnClick = btnInsertClick' + sLineBreak +
    '    end' + sLineBreak +
    '    inherited btnList: TButton' + sLineBreak +
    '      OnClick = btnListClick' + sLineBreak +
    '    end' + sLineBreak +
    '  end' + sLineBreak +
    'end';

  result := Format(result, [FNamespace, FTabela.nome, DeclareComponents]);
end;

class function TFSDModeloFormCadastroSourceFileDFM.New(Tabela: TFSDModeloTabela; Namespace: String): IOTAFile;
begin
  result := Self.create(Tabela, Namespace);
end;

end.
