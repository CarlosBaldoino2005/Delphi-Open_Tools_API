unit FSD.Modelo.DAO.SourceFile;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.StrUtils,
  FSD.Modelo.Classes;

type TFSDModeloDAOSourceFile = class(TNotifierObject, IOTAFile)

  private
    FNamespace: string;
    FTabela : TFSDModeloTabela;

    function GetInsertSQL: string;
    function GetUpdateSQL: string;

  protected
    function GetSource: string;
    function GetAge: TDateTime;

  public
    constructor create(Namespace: String; Tabela: TFSDModeloTabela);
    class function New(Namespace: String; Tabela: TFSDModeloTabela): IOTAFile;
end;

implementation

{ TFSDModeloDAOSourceFile }

constructor TFSDModeloDAOSourceFile.create(Namespace: String; Tabela: TFSDModeloTabela);
begin
  FNamespace := Namespace;
  FTabela := Tabela;
end;

function TFSDModeloDAOSourceFile.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDModeloDAOSourceFile.GetInsertSQL: string;
var
  i: Integer;
begin
  result :=
    Format('      .SQL(''insert into %s'')', [FTabela.nome]) + sLineBreak;

  result := result + '      .SQL(''(';
  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    result := result + FTabela.campos[i].nome;
    if i = Pred(FTabela.campos.Count) then
      result := result + ')'')'
    else
      result := result + ', ';

  end;

  result := result + sLineBreak;
  result := result + '      .SQL(''values (';

  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    result := result + ':' + FTabela.campos[i].nome;
    if i = Pred(FTabela.campos.Count) then
      result := result + ')'')'
    else
      result := result + ', ';
  end;

  result := result + sLineBreak;

  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    result := result + Format('      .AddParam(''%s'', FEntity.%s)',
                        [FTabela.campos[i].nome, FTabela.campos[i].nome]) + sLineBreak;
  end;
end;

function TFSDModeloDAOSourceFile.GetSource: string;
begin
  result :=
    'unit %0:s.DAO.%1:s;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Data.DB,' + sLineBreak +
    '  %0:s.DAO.Interfaces,' + sLineBreak +
    '  %0:s.DAO.Base,' + sLineBreak +
    '  %0:s.Entities.%1:s,' + sLineBreak +
    '  %0:s.Components.Connection.Interfaces,' + sLineBreak +
    '  System.SysUtils;' + sLineBreak +
    '' + sLineBreak +
    'type T%0:sDAO%1:s = class(T%0:sDAOBase<T%1:s>, I%0:sDAOEntity<T%1:s>)' + sLineBreak +
    '' + sLineBreak +
    '  protected' + sLineBreak +
    '    function Delete : I%0:sDAOEntity<T%1:s>; override;' + sLineBreak +
    '    function Get : I%0:sDAOEntity<T%1:s>; overload; override;' + sLineBreak +
    '    function Get ( aValue : Variant ) : I%0:sDAOEntity<T%1:s>; overload; override;' + sLineBreak +
    '    function Get ( aParam : String; aValue : Variant ) : I%0:sDAOEntity<T%1:s>; overload; override;' + sLineBreak +
    '    function Insert : I%0:sDAOEntity<T%1:s>; override;' + sLineBreak +
    '    function Update : I%0:sDAOEntity<T%1:s>; override;' + sLineBreak +
    '' + sLineBreak +
    '  public' + sLineBreak +
    '    constructor Create(Connection: I%0:sComponentsConnection); override;' + sLineBreak +
    '    class function New(Connection: I%0:sComponentsConnection): I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    '' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'constructor T%0:sDAO%1:s.Create(Connection: I%0:sComponentsConnection);' + sLineBreak +
    'begin' + sLineBreak +
    '  inherited;' + sLineBreak +
    '  FEntity := T%1:s.create(Self);' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Delete: I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '      .SQL(''delete from %1:s'')' + sLineBreak +
    '      .SQL(''where id = :id'')' + sLineBreak +
    '      .AddParam(''id'', FEntity.Id)' + sLineBreak +
    '    .ExecSQL;' + sLineBreak +
    '  except' + sLineBreak +
    '    on e: Exception do' + sLineBreak +
    '    begin' + sLineBreak +
    '      e.Message := ''Erro ao excluir %1:s: '' + e.Message;' + sLineBreak +
    '      raise;' + sLineBreak +
    '    end;' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Get: I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '      .SQL(''select * from %1:s'')' + sLineBreak +
    '    .Open;' + sLineBreak +
    '  except' + sLineBreak +
    '    on e: Exception do' + sLineBreak +
    '    begin' + sLineBreak +
    '      e.Message := ''Erro ao consultar %1:s: '' + e.Message;' + sLineBreak +
    '      raise;' + sLineBreak +
    '    end;' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Get(aValue: Variant): I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '      .SQL(''select * from %1:s where id = '' + AValue)' + sLineBreak +
    '    .Open;' + sLineBreak +
    '  except' + sLineBreak +
    '    on e: Exception do' + sLineBreak +
    '    begin' + sLineBreak +
    '      e.Message := ''Erro ao consultar %1:s: '' + e.Message;' + sLineBreak +
    '      raise;' + sLineBreak +
    '    end;' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Get(aParam: String; aValue: Variant): I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '      .SQL(''select * from %1:s where '' + aParam + '' = '' + QuotedStr(aValue))' + sLineBreak +
    '    .Open;' + sLineBreak +
    '  except' + sLineBreak +
    '    on e: Exception do' + sLineBreak +
    '    begin' + sLineBreak +
    '      e.Message := ''Erro ao consultar %1:s: '' + e.Message;' + sLineBreak +
    '      raise;' + sLineBreak +
    '    end;' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Insert: I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  Result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '%2:s' +
    '    .ExecSQL;' + sLineBreak +
    '  except on ex:exception do' + sLineBreak +
    '    raise Exception.Create(''Erro ao inserir %1:s: '' + ex.Message);' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'class function T%0:sDAO%1:s.New(Connection: I%0:sComponentsConnection): I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  result := Self.Create(Connection);' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function T%0:sDAO%1:s.Update: I%0:sDAOEntity<T%1:s>;' + sLineBreak +
    'begin' + sLineBreak +
    '  Result := Self;' + sLineBreak +
    '  try' + sLineBreak +
    '    FConnection' + sLineBreak +
    '      .Active(False)' + sLineBreak +
    '      .SQLClear' + sLineBreak +
    '%3:s' +
    '    .ExecSQL;' + sLineBreak +
    '  except on ex:exception do' + sLineBreak +
    '    raise Exception.Create(''Erro ao atualizar %1:s: '' + ex.Message);' + sLineBreak +
    '  end;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'end.';

  result := Format(Result, [FNamespace,
                            FTabela.nome,
                            GetInsertSQL,
                            GetUpdateSQL]);
end;

function TFSDModeloDAOSourceFile.GetUpdateSQL: string;
var
  i: Integer;
  linhaSet: String;
begin
  result :=
    Format('      .SQL(''update %s set'')', [FTabela.nome]) + sLineBreak;

  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    if FTabela.campos[i].nome.ToLower = 'id' then
      Continue;

    linhaSet := Format('''%0:s = :%0:s', [FTabela.campos[i].nome]);
    if i < Pred(FTabela.campos.Count) then
      linhaSet := linhaSet + ',';
    linhaSet := linhaSet + '''';

    result := Result + Format('      .SQL(%s)', [linhaSet]) + sLineBreak;
  end;

  result := result + '      .SQL(''where id = :id'')' + sLineBreak;

  for i := 0 to Pred(FTabela.campos.Count) do
  begin
    result := result + Format('      .AddParam(''%0:s'', FEntity.%0:s)',
                        [FTabela.campos[i].nome]) + sLineBreak;
  end;
end;

class function TFSDModeloDAOSourceFile.New(Namespace: String; Tabela: TFSDModeloTabela): IOTAFile;
begin
  result := Self.create(Namespace, Tabela);
end;

end.
