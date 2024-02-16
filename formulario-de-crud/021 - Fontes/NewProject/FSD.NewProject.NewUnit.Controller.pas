unit FSD.NewProject.NewUnit.Controller;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

procedure CreateUnitController(ProjectPath, Namespace: String);

implementation

procedure CreateUnitController(ProjectPath, Namespace: String);
var
  unitName: String;
  unitPath: string;
  unitFileName: string;
begin
  unitPath  := ProjectPath + '\src\Controller\';
  unitName  := Namespace + '.Controller.Interfaces';
  unitFileName := unitPath + unitName + '.pas';

  ForceDirectories(unitPath);

  with TStringList.Create do
  try
    Add('unit %0:s.Controller.Interfaces;									');
    Add('                                                                   ');
    Add('interface                                                          ');
    Add('                                                                   ');
    Add('uses                                                               ');
    Add('  %0:s.Model.Interfaces,                                           ');
    Add('  %0:s.Model;                                                      ');
    Add('                                                                   ');
    Add('type                                                               ');
    Add('  I%0:sController = interface                                      ');
    Add('    [''%1:s'']');
    Add('    function Model: I%0:sModel;                                    ');
    Add('  end;                                                             ');
    Add('                                                                   ');
    Add('  T%0:sController = class(TInterfacedObject, I%0:sController)      ');
    Add('  private                                                          ');
    Add('    FModel: I%0:sModel;                                            ');
    Add('                                                                   ');
    Add('  protected                                                        ');
    Add('    function Model: I%0:sModel;                                    ');
    Add('                                                                   ');
    Add('  public                                                           ');
    Add('    class function New: I%0:sController;                           ');
    Add('  end;                                                             ');
    Add('                                                                   ');
    Add('implementation                                                     ');
    Add('                                                                   ');
    Add('{ T%0:sController }                                                ');
    Add('                                                                   ');
    Add('function T%0:sController.Model: I%0:sModel;                        ');
    Add('begin                                                              ');
    Add('  if not Assigned(FModel) then                                     ');
    Add('    FModel := T%0:sModel.New;                                      ');
    Add('  result := FModel;                                                ');
    Add('end;                                                               ');
    Add('                                                                   ');
    Add('class function T%0:sController.New: I%0:sController;               ');
    Add('begin                                                              ');
    Add('  result := Self.Create;                                           ');
    Add('end;                                                               ');
    Add('                                                                   ');
    Add('end.                                                               ');

    Text := Format(Text, [Namespace, TGuid.NewGuid.ToString]);
    SaveToFile(unitFileName);

    GetActiveProject.AddFile(unitFileName, True);
  finally
    Free;
  end;
end;

end.
