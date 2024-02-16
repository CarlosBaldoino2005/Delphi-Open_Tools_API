unit FSD.NewProject.NewForm.Cadastro.SourceFile;

interface

uses
  ToolsAPI,
  System.SysUtils,
  System.Classes;

type
  TFSDNewProjectNewFormCadastroSourcePAS = class(TNotifierObject, IOTAFile)
  protected
    FNamespace: string;

    function GetSource: string;
    function GetAge: TDateTime;
  public
    class function New(Namespace: String): IOTAFile;
    constructor create(Namespace: String);
  end;

  TFSDNewProjectNewFormCadastroSourceDFM = class(TNotifierObject, IOTAFile)
  protected
    FNamespace: string;

    function GetSource: string;
    function GetAge: TDateTime;
  public
    class function New(Namespace: String): IOTAFile;
    constructor create(Namespace: String);
  end;

implementation

{ TFSDNewProjectNewFormCadastroSourcePAS }

constructor TFSDNewProjectNewFormCadastroSourcePAS.create(Namespace: String);
begin
  FNamespace := Namespace;
end;

function TFSDNewProjectNewFormCadastroSourcePAS.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDNewProjectNewFormCadastroSourcePAS.GetSource: string;
begin
  with TStringList.Create do
  try
    Add('unit %0:s.View.Cadastro;																				');
    Add('                                                                                                       ');
    Add('interface                                                                                              ');
    Add('                                                                                                       ');
    Add('uses                                                                                                   ');
    Add('  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,     ');
    Add('  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,                                    ');
    Add('  Data.DB, Vcl.Grids, Vcl.DBGrids,                                                                     ');
    Add('  %0:s.Controller.Interfaces;                                                                          ');
    Add('                                                                                                       ');
    Add('type                                                                                                   ');
    Add('  T%0:sViewCadastro = class(TForm)                                                                     ');
    Add('    pnlTop: TPanel;                                                                                    ');
    Add('    lblTitle: TLabel;                                                                                  ');
    Add('    gridCadastro: TDBGrid;                                                                             ');
    Add('    dsCadastro: TDataSource;                                                                           ');
    Add('    Panel1: TPanel;                                                                                    ');
    Add('    btnDelete: TButton;                                                                                ');
    Add('    btnUpdate: TButton;                                                                                ');
    Add('    btnInsert: TButton;                                                                                ');
    Add('    btnList: TButton;                                                                                  ');
    Add('  private                                                                                              ');
    Add('    FController: I%0:sController;                                                                      ');
    Add('    { Private declarations }                                                                           ');
    Add('  protected                                                                                            ');
    Add('    function Controller: I%0:sController;                                                              ');
    Add('  public                                                                                               ');
    Add('    { Public declarations }                                                                            ');
    Add('  end;                                                                                                 ');
    Add('                                                                                                       ');
    Add('var                                                                                                    ');
    Add('  %0:sViewCadastro: T%0:sViewCadastro;                                                                 ');
    Add('                                                                                                       ');
    Add('implementation                                                                                         ');
    Add('                                                                                                       ');
    Add('{$R *.dfm}                                                                                             ');
    Add('                                                                                                       ');
    Add('{ T%0:sViewCadastro }                                                                                  ');
    Add('                                                                                                       ');
    Add('function T%0:sViewCadastro.Controller: I%0:sController;                                                ');
    Add('begin                                                                                                  ');
    Add('  if not Assigned(FController) then                                                                    ');
    Add('    FController := T%0:sController.New;                                                                ');
    Add('  result := FController;                                                                               ');
    Add('end;                                                                                                   ');
    Add('                                                                                                       ');
    Add('end.                                                                                                   ');

    result := Format(Text, [FNamespace]);
  finally
    Free;
  end;
end;

class function TFSDNewProjectNewFormCadastroSourcePAS.New(Namespace: String): IOTAFile;
begin
  result := Self.create(Namespace);
end;

{ TFSDNewProjectNewFormCadastroSourceDFM }

constructor TFSDNewProjectNewFormCadastroSourceDFM.create(Namespace: String);
begin
  FNamespace := Namespace;
end;

function TFSDNewProjectNewFormCadastroSourceDFM.GetAge: TDateTime;
begin
  result := -1;
end;

function TFSDNewProjectNewFormCadastroSourceDFM.GetSource: string;
begin
  with TStringList.Create do
  try
    Add('object %0:sViewCadastro: T%0:sViewCadastro ');
    Add('  Left = 0                                 ');
    Add('  Top = 0                                  ');
    Add('  BorderStyle = bsDialog                   ');
    Add('  ClientHeight = 390                       ');
    Add('  ClientWidth = 582                        ');
    Add('  Color = clBtnFace                        ');
    Add('  Font.Charset = DEFAULT_CHARSET           ');
    Add('  Font.Color = clWindowText                ');
    Add('  Font.Height = -20                        ');
    Add('  Font.Name = ''Segoe UI''                 ');
    Add('  Font.Style = []                          ');
    Add('  OldCreateOrder = False                   ');
    Add('  Position = poScreenCenter                ');
    Add('  PixelsPerInch = 96                       ');
    Add('  TextHeight = 28                          ');
    Add('  object pnlTop: TPanel                    ');
    Add('    Left = 0                               ');
    Add('    Top = 0                                ');
    Add('    Width = 582                            ');
    Add('    Height = 41                            ');
    Add('    Align = alTop                          ');
    Add('    BevelOuter = bvNone                    ');
    Add('    TabOrder = 0                           ');
    Add('    object lblTitle: TLabel                ');
    Add('      AlignWithMargins = True              ');
    Add('      Left = 10                            ');
    Add('      Top = 3                              ');
    Add('      Width = 61                           ');
    Add('      Height = 35                          ');
    Add('      Margins.Left = 10                    ');
    Add('      Align = alLeft                       ');
    Add('      Caption = ''Titulo''                 ');
    Add('      Font.Charset = DEFAULT_CHARSET       ');
    Add('      Font.Color = clWindowText            ');
    Add('      Font.Height = -24                    ');
    Add('      Font.Name = ''Segoe UI''             ');
    Add('      Font.Style = []                      ');
    Add('      ParentFont = False                   ');
    Add('      Layout = tlCenter                    ');
    Add('      ExplicitHeight = 32                  ');
    Add('    end                                    ');
    Add('  end                                      ');
    Add('  object gridCadastro: TDBGrid             ');
    Add('    Left = 0                               ');
    Add('    Top = 176                              ');
    Add('    Width = 582                            ');
    Add('    Height = 214                           ');
    Add('    Align = alBottom                       ');
    Add('    DataSource = dsCadastro                ');
    Add('    TabOrder = 1                           ');
    Add('    TitleFont.Charset = DEFAULT_CHARSET    ');
    Add('    TitleFont.Color = clWindowText         ');
    Add('    TitleFont.Height = -20                 ');
    Add('    TitleFont.Name = ''Segoe UI''          ');
    Add('    TitleFont.Style = []                   ');
    Add('  end                                      ');
    Add('  object Panel1: TPanel                    ');
    Add('    Left = 0                               ');
    Add('    Top = 128                              ');
    Add('    Width = 582                            ');
    Add('    Height = 48                            ');
    Add('    Align = alBottom                       ');
    Add('    BevelOuter = bvNone                    ');
    Add('    TabOrder = 2                           ');
    Add('    object btnDelete: TButton              ');
    Add('      Left = 295                           ');
    Add('      Top = 6                              ');
    Add('      Width = 89                           ');
    Add('      Height = 34                          ');
    Add('      Caption = ''Delete''                 ');
    Add('      TabOrder = 0                         ');
    Add('    end                                    ');
    Add('    object btnUpdate: TButton              ');
    Add('      Left = 200                           ');
    Add('      Top = 6                              ');
    Add('      Width = 89                           ');
    Add('      Height = 34                          ');
    Add('      Caption = ''Update''                 ');
    Add('      TabOrder = 1                         ');
    Add('    end                                    ');
    Add('    object btnInsert: TButton              ');
    Add('      Left = 105                           ');
    Add('      Top = 6                              ');
    Add('      Width = 89                           ');
    Add('      Height = 34                          ');
    Add('      Caption = ''Insert''                 ');
    Add('      TabOrder = 2                         ');
    Add('    end                                    ');
    Add('    object btnList: TButton                ');
    Add('      Left = 10                            ');
    Add('      Top = 6                              ');
    Add('      Width = 89                           ');
    Add('      Height = 34                          ');
    Add('      Caption = ''List''                   ');
    Add('      TabOrder = 3                         ');
    Add('    end                                    ');
    Add('  end                                      ');
    Add('  object dsCadastro: TDataSource           ');
    Add('    Left = 304                             ');
    Add('    Top = 256                              ');
    Add('  end                                      ');
    Add('end                                        ');

    result := Format(Text, [FNamespace]);
  finally
    Free;
  end;
end;

class function TFSDNewProjectNewFormCadastroSourceDFM.New(Namespace: String): IOTAFile;
begin
  result := Self.create(Namespace);
end;

end.
