unit FSD.NewProject.NewUnit.DAOFactory;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitDAOFactory(ProjectPath, Namespace: String);

implementation

procedure CreateUnitDAOFactory(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\src\Model\DAO\';
  unitName  := Namespace + '.DAO.Factory';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.DAO.Factory;																				');
    Add('                                                                                                   ');
    Add('interface                                                                                          ');
    Add('                                                                                                   ');
    Add('uses                                                                                               ');
    Add('  %0:s.DAO.Interfaces,                                                                             ');
    Add('  %0:s.Components.Connection.Interfaces;                                                           ');
    Add('                                                                                                   ');
    Add('type                                                                                               ');
    Add('  I%0:sDAOFactory = interface                                                                      ');
    Add('    [''%1:s'']');
    Add('  end;                                                                                             ');
    Add('                                                                                                   ');
    Add('  T%0:sDAOFactory = class(TInterfacedObject, I%0:sDAOFactory)                                      ');
    Add('  private                                                                                          ');
    Add('    FConnection: I%0:sComponentsConnection;                                                        ');
    Add('                                                                                                   ');
    Add('  protected                                                                                        ');
    Add('                                                                                                   ');
    Add('  public                                                                                           ');
    Add('    constructor create(Connection: I%0:sComponentsConnection);                                     ');
    Add('    class function New(Connection: I%0:sComponentsConnection): I%0:sDAOFactory;                    ');
    Add('  end;                                                                                             ');
    Add('                                                                                                   ');
    Add('implementation                                                                                     ');
    Add('                                                                                                   ');
    Add('{ T%0:sDAOFactory }                                                                                ');
    Add('                                                                                                   ');
    Add('constructor T%0:sDAOFactory.create(Connection: I%0:sComponentsConnection);                         ');
    Add('begin                                                                                              ');
    Add('  FConnection := Connection;                                                                       ');
    Add('end;                                                                                               ');
    Add('                                                                                                   ');
    Add('class function T%0:sDAOFactory.New(Connection: I%0:sComponentsConnection): I%0:sDAOFactory;        ');
    Add('begin                                                                                              ');
    Add('  result := Self.Create(Connection);                                                               ');
    Add('end;                                                                                               ');
    Add('                                                                                                   ');
    Add('end.                                                                                               ');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;

end;

end.
