object Form1: TForm1
  Left = -2
  Top = 110
  Width = 1305
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnRun: TBitBtn
    Left = 632
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = BtnRunClick
  end
  object EdtPathName: TEdit
    Left = 496
    Top = 72
    Width = 409
    Height = 21
    TabOrder = 1
  end
  object BtnBrowse: TBitBtn
    Left = 920
    Top = 72
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = BtnBrowseClick
  end
end
