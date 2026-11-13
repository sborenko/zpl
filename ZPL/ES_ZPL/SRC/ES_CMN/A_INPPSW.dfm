object FormMyInputPsw: TFormMyInputPsw
  Left = 321
  Top = 307
  BorderStyle = bsDialog
  Caption = 'FormMyInputPsw'
  ClientHeight = 94
  ClientWidth = 187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelPrompt: TLabel
    Left = 10
    Top = 12
    Width = 59
    Height = 13
    Caption = 'LabelPrompt'
  end
  object EditValue: TEdit
    Left = 9
    Top = 29
    Width = 169
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object bBtnOk: TBitBtn
    Left = 26
    Top = 61
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 103
    Top = 61
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
