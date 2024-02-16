unit FSD.NewProject.NewUnit.ComponentInterfaces;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitComponentInterfaces(ProjectPath, Namespace: String);

implementation

procedure CreateUnitComponentInterfaces(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\Source\Model\Components\';
  unitName  := Namespace + '.Components.Interfaces';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Components.Interfaces;');
    Add('');
    Add('interface');
    Add('');
    Add('uses');
    Add('  %0:s.Components.Connection.Interfaces;');
    Add('');
    Add('type');
    Add('  I%0:sComponentFactory = interface');
    Add('    [''%1:s'']');
    Add('    function Connection: I%0:sComponentsConnection;');
    Add('  end;');
    Add('');
    Add('implementation');
    Add('');
    Add('end.');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;
end;

end.
