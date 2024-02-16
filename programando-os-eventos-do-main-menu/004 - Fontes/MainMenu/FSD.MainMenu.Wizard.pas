unit FSD.MainMenu.Wizard;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  Winapi.ShellAPI,
  Vcl.Menus,
  Vcl.Dialogs;

type TFSDMainMenuWizard = class(TNotifierObject, IOTAWizard)

  private
    procedure createMenu;

    procedure OnClickHelloWorld(Sender: TObject);
    procedure OnClickMenuSQLite(Sender: TObject);
    procedure OnClickMenuSQLDeveloper(Sender: TObject);
    procedure OnClickMenuMySQL(Sender: TObject);
    procedure OnClickMenuPostgres(Sender: TObject);

    function createSubMenu(AParent: TMenuItem;
                            ACaption: string;
                            AName: string;
                            AOnClick: TNotifyEvent): TMenuItem;
  protected
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;

    { Launch the AddIn }
    procedure Execute;

  public
    constructor create;
end;

procedure Register;

implementation

procedure Register;
begin
  RegisterPackageWizard(TFSDMainMenuWizard.create);
end;

{ TFSDMainMenuWizard }

constructor TFSDMainMenuWizard.create;
begin
  createMenu;
end;

procedure TFSDMainMenuWizard.createMenu;
var
  menu: TMainMenu;
  menuName: string;
  itemFormacao: TMenuItem;
  itemUtilitarios: TMenuItem;
begin
  menu := (BorlandIDEServices as INTAServices).MainMenu;
  menuName := 'imFormacaoSeniorDeveloper';

  if menu.FindComponent(menuName) <> nil then
    menu.FindComponent(menuName).Free;

  itemFormacao := TMenuItem.Create(menu);
  itemFormacao.Name := menuName;
  itemFormacao.Caption := 'Formação Senior Developer';
  menu.Items.Add(itemFormacao);

  createSubMenu(itemFormacao, 'Hello World', 'imHelloWorld', OnClickHelloWorld);
  createSubMenu(itemFormacao, 'Modelo', 'imModelo', nil);
  createSubMenu(itemFormacao, 'Histórico Projetos', 'imHistoricoProjetos', nil);

  itemUtilitarios := createSubMenu(itemFormacao, 'Utilitários', 'imUtilitarios', nil);

  createSubMenu(itemUtilitarios, 'SQLite', 'imSQLite', OnClickMenuSQLite);
  createSubMenu(itemUtilitarios, 'MySQL', 'imMySQL', OnClickMenuMySQL);
  createSubMenu(itemUtilitarios, 'SQL Developer', 'imSQLDeveloper', OnClickMenuSQLDeveloper);
  createSubMenu(itemUtilitarios, 'Postgres', 'imPostgres', OnClickMenuPostgres);
end;

function TFSDMainMenuWizard.createSubMenu(AParent: TMenuItem;
                            ACaption: string;
                            AName: string;
                            AOnClick: TNotifyEvent): TMenuItem;
var
  subMenu: TMenuItem;
begin
  subMenu := TMenuItem.Create(AParent);
  subMenu.Caption := ACaption;
  subMenu.Name := AName;
  subMenu.OnClick := AOnClick;

  AParent.Add(subMenu);
  result := subMenu;
end;

procedure TFSDMainMenuWizard.Execute;
begin

end;

function TFSDMainMenuWizard.GetIDString: string;
begin
  Result := Self.ClassName;
end;

function TFSDMainMenuWizard.GetName: string;
begin
  result := Self.ClassName;
end;

function TFSDMainMenuWizard.GetState: TWizardState;
begin
  result := [wsEnabled];
end;

procedure TFSDMainMenuWizard.OnClickHelloWorld(Sender: TObject);
begin
  ShowMessage('Hello World');
end;

procedure TFSDMainMenuWizard.OnClickMenuMySQL(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files\MySQL\MySQL Workbench 8.0 CE\MySQLWorkbench.exe',
    '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickMenuPostgres(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'http://127.0.0.1:55944/browser/',
    '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickMenuSQLDeveloper(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'D:\Arquivos e Programas\sqldeveloper\sqldeveloper.exe',
    '', '', 0);
end;

procedure TFSDMainMenuWizard.OnClickMenuSQLite(Sender: TObject);
begin
  ShellExecute(HInstance, 'open', 'C:\Program Files\SQLite Expert\Personal 5\SQLiteExpertPers64.exe',
    '', '', 0);
end;

end.
