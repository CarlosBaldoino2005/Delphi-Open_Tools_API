object FSDHistoryProjectsForms: TFSDHistoryProjectsForms
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FSDHistoryProjectsForms'
  ClientHeight = 332
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edtSearch: TEdit
      Left = 8
      Top = 6
      Width = 265
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object lstProjects: TListBox
    Left = 0
    Top = 33
    Width = 580
    Height = 299
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
    OnKeyDown = lstProjectsKeyDown
  end
end
