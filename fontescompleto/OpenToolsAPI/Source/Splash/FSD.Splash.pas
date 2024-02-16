unit FSD.Splash;

interface

uses
  ToolsAPI,
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
    SplashScreenServices
      .AddPluginBitmap('Forma��o Delphi Senior', bitmap.Handle, False, '', 'AA');
  finally
    bitmap.Free;
  end;
end;

end.
