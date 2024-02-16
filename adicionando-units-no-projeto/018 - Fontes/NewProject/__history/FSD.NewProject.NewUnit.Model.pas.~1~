unit FSD.NewProject.NewUnit.Model;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitModel(ProjectPath, Namespace: String);

implementation

procedure CreateUnitModel(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\Source\Model\';
  unitName  := Namespace + '.Model';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Model;														');
    Add('                                                                       ');
    Add('interface                                                              ');
    Add('                                                                       ');
    Add('uses                                                                   ');
    Add('  %0:s.Model.Interfaces,                                               ');
    Add('  %0:s.DAO.Factory,                                                    ');
    Add('  %0:s.Components.Interfaces,                                          ');
    Add('  %0:s.Components.Factory,                                             ');
    Add('  %0:s.Components.Connection.Interfaces;                               ');
    Add('                                                                       ');
    Add('type T%0:sModel = class(TInterfacedObject, I%0:sModel)                 ');
    Add('                                                                       ');
    Add('  private                                                              ');
    Add('    FConnection: I%0:sComponentsConnection;                            ');
    Add('    FDAO: I%0:sDAOFactory;                                             ');
    Add('    FComponents: I%0:sComponentFactory;                                ');
    Add('                                                                       ');
    Add('    function GetConnection: I%0:sComponentsConnection;                 ');
    Add('  protected                                                            ');
    Add('    function DAO: I%0:sDAOFactory;                                     ');
    Add('    function Components: I%0:sComponentFactory;                        ');
    Add('                                                                       ');
    Add('  public                                                               ');
    Add('    constructor create;                                                ');
    Add('    destructor Destroy; override;                                      ');
    Add('    class function New: I%0:sModel;                                    ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('implementation                                                         ');
    Add('                                                                       ');
    Add('{ T%0:sModel }                                                         ');
    Add('                                                                       ');
    Add('function T%0:sModel.Components: I%0:sComponentFactory;                 ');
    Add('begin                                                                  ');
    Add('  if not Assigned(FComponents) then                                    ');
    Add('    FComponents := T%0:sComponentsFactory.New;                         ');
    Add('  result := FComponents;                                               ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('constructor T%0:sModel.create;                                         ');
    Add('begin                                                                  ');
    Add('                                                                       ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('function T%0:sModel.DAO: I%0:sDAOFactory;                              ');
    Add('begin                                                                  ');
    Add('  if not Assigned(FDAO) then                                           ');
    Add('    FDAO := T%0:sDAOFactory.New(GetConnection);                        ');
    Add('  result := FDAO;                                                      ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('destructor T%0:sModel.Destroy;                                         ');
    Add('begin                                                                  ');
    Add('                                                                       ');
    Add('  inherited;                                                           ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('function T%0:sModel.GetConnection: I%0:sComponentsConnection;          ');
    Add('begin                                                                  ');
    Add('  if not Assigned(FConnection) then                                    ');
    Add('    FConnection := Components.Connection;                              ');
    Add('  result := FConnection;                                               ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('class function T%0:sModel.New: I%0:sModel;                             ');
    Add('begin                                                                  ');
    Add('  result := Self.create;                                               ');
    Add('end;                                                                   ');
    Add('                                                                       ');
    Add('end.                                                                   ');

    Text := Format(Text, [Namespace]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;
end;

end.
