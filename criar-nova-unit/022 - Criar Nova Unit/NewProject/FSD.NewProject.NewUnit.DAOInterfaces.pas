unit FSD.NewProject.NewUnit.DAOInterfaces;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitDAOInterfaces(ProjectPath, Namespace: String);

implementation

procedure CreateUnitDAOInterfaces(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\src\Model\DAO\';
  unitName  := Namespace + '.DAO.Interfaces';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.DAO.Interfaces;	');
    Add('');
    Add('interface ');
    Add('');
    Add('uses');
    Add('  Data.DB;');
    Add('');
    Add('type                                                                                    ');
    Add('  I%0:sDAOEntity<T> = interface                                                         ');
    Add('    [''%1:s'']');
    Add('    function DataSet ( aValue : TDataSource ) : I%0:sDAOEntity<T>; overload;            ');
    Add('    function DataSet : TDataSet; overload;                                              ');
    Add('    function Delete : I%0:sDAOEntity<T>;                                                ');
    Add('    function Get : I%0:sDAOEntity<T>; overload;                                         ');
    Add('    function Get ( aValue : Variant ) : I%0:sDAOEntity<T>; overload;                    ');
    Add('    function Get ( aParam : String; aValue : Variant ) : I%0:sDAOEntity<T>; overload;   ');
    Add('    function Insert : I%0:sDAOEntity<T>;                                                ');
    Add('    function This : T;                                                                  ');
    Add('    function Update : I%0:sDAOEntity<T>;                                                ');
    Add('  end;                                                                                  ');
    Add('																						');
    Add('implementation                                                                          ');
    Add('																						');
    Add('end. ');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;
end;

end.
