unit FSD.NewProject.NewUnit.ModelInterfaces;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitModelInterfaces(ProjectPath, Namespace: String);

implementation

procedure CreateUnitModelInterfaces(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\src\Model\';
  unitName  := Namespace + '.Model.Interfaces';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Model.Interfaces;						');
    Add('                                                   ');
    Add('interface                                          ');
    Add('                                                   ');
    Add('uses                                               ');
    Add('  %0:s.Components.Interfaces,                      ');
    Add('  %0:s.DAO.Factory;                                ');
    Add('                                                   ');
    Add('type                                               ');
    Add('  I%0:sModel = interface                           ');
    Add('    [''%1:s'']');
    Add('    function DAO: I%0:sDAOFactory;                 ');
    Add('    function Components: I%0:sComponentFactory;    ');
    Add('  end;                                             ');
    Add('                                                   ');
    Add('implementation                                     ');
    Add('                                                   ');
    Add('end.                                               ');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;

end;

end.

