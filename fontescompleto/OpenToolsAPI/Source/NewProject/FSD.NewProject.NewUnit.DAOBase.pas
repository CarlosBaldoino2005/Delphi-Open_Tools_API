unit FSD.NewProject.NewUnit.DAOBase;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitDAOBase(ProjectPath, Namespace: String);

implementation

procedure CreateUnitDAOBase(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\Source\Model\DAO\';
  unitName  := Namespace + '.DAO.Base';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.DAO.Base;																							');
    Add('                                                                                                               ');
    Add('interface                                                                                                      ');
    Add('                                                                                                               ');
    Add('uses                                                                                                           ');
    Add('  Data.DB,                                                                                                     ');
    Add('  %0:s.DAO.Interfaces,                                                                                         ');
    Add('  %0:s.Components.Connection.Interfaces;                                                                       ');
    Add('                                                                                                               ');
    Add('type T%0:sDAOBase<T: class, constructor> = class(TInterfacedObject, I%0:sDAOEntity<T>)                         ');
    Add('                                                                                                               ');
    Add('  protected                                                                                                    ');
    Add('    FConnection: I%0:sComponentsConnection;                                                                    ');
    Add('    FDataSource : TDataSource;                                                                                 ');
    Add('    FEntity  : T;                                                                                              ');
    Add('                                                                                                               ');
    Add('    function DataSet ( aValue : TDataSource ) : I%0:sDAOEntity<T>;  overload;                                  ');
    Add('    function DataSet : TDataSet; overload;                                                                     ');
    Add('    function Delete : I%0:sDAOEntity<T>; virtual; abstract;                                                    ');
    Add('    function Get : I%0:sDAOEntity<T>; overload; virtual; abstract;                                             ');
    Add('    function Get ( aValue : Variant ) : I%0:sDAOEntity<T>; overload; virtual; abstract;                        ');
    Add('    function Get ( aParam : String; aValue : Variant ) : I%0:sDAOEntity<T>; overload; virtual; abstract;       ');
    Add('    function Insert : I%0:sDAOEntity<T>; virtual; abstract;                                                    ');
    Add('    function This : T;                                                                                         ');
    Add('    function Update : I%0:sDAOEntity<T>; virtual; abstract;                                                    ');
    Add('                                                                                                               ');
    Add('  public                                                                                                       ');
    Add('    constructor Create(Connection: I%0:sComponentsConnection); virtual;                                        ');
    Add('    destructor Destroy; override;                                                                              ');
    Add('    class function New(Connection: I%0:sComponentsConnection) : I%0:sDAOEntity<T>;                             ');
    Add('                                                                                                               ');
    Add('                                                                                                               ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('implementation                                                                                                 ');
    Add('                                                                                                               ');
    Add('{ T%0:sDAOBase<T> }                                                                                            ');
    Add('                                                                                                               ');
    Add('constructor T%0:sDAOBase<T>.Create(Connection: I%0:sComponentsConnection);                                     ');
    Add('begin                                                                                                          ');
    Add('  FConnection := Connection;                                                                                   ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('function T%0:sDAOBase<T>.DataSet: TDataSet;                                                                    ');
    Add('begin                                                                                                          ');
    Add('  Result := FConnection.DataSet;                                                                               ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('function T%0:sDAOBase<T>.DataSet(aValue: TDataSource): I%0:sDAOEntity<T>;                                      ');
    Add('begin                                                                                                          ');
    Add('  Result := Self;                                                                                              ');
    Add('  FDataSource := aValue;                                                                                       ');
    Add('  FDataSource.DataSet := FConnection.DataSet;                                                                  ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('destructor T%0:sDAOBase<T>.Destroy;                                                                            ');
    Add('begin                                                                                                          ');
    Add('  FEntity.DisposeOf;                                                                                           ');
    Add('  inherited;                                                                                                   ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('class function T%0:sDAOBase<T>.New(Connection: I%0:sComponentsConnection) : I%0:sDAOEntity<T>;                 ');
    Add('begin                                                                                                          ');
    Add('  result := Self.Create(Connection);                                                                           ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('function T%0:sDAOBase<T>.This: T;                                                                              ');
    Add('begin                                                                                                          ');
    Add('  result := FEntity;                                                                                           ');
    Add('end;                                                                                                           ');
    Add('                                                                                                               ');
    Add('end.                                                                                                           ');

    Text := Format(Text, [Namespace]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;

end;

end.
