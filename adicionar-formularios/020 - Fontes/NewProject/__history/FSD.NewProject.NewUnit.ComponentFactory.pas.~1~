unit FSD.NewProject.NewUnit.ComponentFactory;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitComponentFactory(ProjectPath, Namespace: String);

implementation

procedure CreateUnitComponentFactory(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\Source\Model\Components\';
  unitName  := Namespace + '.Components.Factory';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Components.Factory;													');
    Add('                                                                               ');
    Add('interface                                                                      ');
    Add('                                                                               ');
    Add('uses                                                                           ');
    Add('  %0:s.Components.Interfaces,                                                  ');
    Add('  %0:s.Components.Connection.Interfaces,                                       ');
    Add('  %0:s.Components.Connection.Firedac;                                          ');
    Add('                                                                               ');
    Add('type T%0:sComponentsFactory = class(TInterfacedObject, I%0:sComponentFactory)  ');
    Add('                                                                               ');
    Add('  private                                                                      ');
    Add('    FConnection: I%0:sComponentsConnection;                                    ');
    Add('                                                                               ');
    Add('  protected                                                                    ');
    Add('    function Connection: I%0:sComponentsConnection;                            ');
    Add('                                                                               ');
    Add('  public                                                                       ');
    Add('    class function New : I%0:sComponentFactory;                                ');
    Add('                                                                               ');
    Add('end;                                                                           ');
    Add('                                                                               ');
    Add('implementation                                                                 ');
    Add('                                                                               ');
    Add('{ T%0:sComponentsFactory }                                                     ');
    Add('                                                                               ');
    Add('function T%0:sComponentsFactory.Connection: I%0:sComponentsConnection;         ');
    Add('begin                                                                          ');
    Add('  if not Assigned(FConnection) then                                            ');
    Add('    FConnection := T%0:sComponentsConnectionFiredac.New;                       ');
    Add('                                                                               ');
    Add('  result := FConnection;                                                       ');
    Add('end;                                                                           ');
    Add('                                                                               ');
    Add('class function T%0:sComponentsFactory.New: I%0:sComponentFactory;              ');
    Add('begin                                                                          ');
    Add('  result := Self.Create;                                                       ');
    Add('end;                                                                           ');
    Add('                                                                               ');
    Add('end.                                                                           ');

    Text := Format(Text, [Namespace]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;

end;

end.
