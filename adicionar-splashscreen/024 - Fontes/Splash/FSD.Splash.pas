unit FSD.Splash;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics;

procedure AddSplash;

implementation

procedure AddSplash;
var
  bitmap: TBitmap;
begin
  bitmap := TBitmap.Create;
  try
    bitmap.LoadFromResourceName(HInstance, 'postgres');
    SplashScreenServices.AddPluginBitmap
      ('Formação Senior Developer',
        bitmap.Handle,
        True,
        '2020-12-31',
        'v1.0.0');
  finally
    bitmap.Free;
  end;
end;

end.