object Form1: TForm1
  Left = 747
  Top = 564
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 64
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblDone: TLabel
    Left = 144
    Top = 16
    Width = 105
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BtnRun: TBitBtn
    Left = 32
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = BtnRunClick
  end
end
