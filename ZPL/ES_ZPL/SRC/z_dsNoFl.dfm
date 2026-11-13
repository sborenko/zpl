object FormNoFiles: TFormNoFiles
  Left = 335
  Top = 396
  Width = 380
  Height = 285
  ActiveControl = ListBox1
  BorderIcons = [biSystemMenu]
  Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090' '#1092#1072#1081#1083#1099
  Color = clBtnFace
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 285
  Constraints.MinWidth = 280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    372
    258)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 3
    Width = 372
    Height = 223
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 230
    Width = 104
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 266
    Top = 230
    Width = 104
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103
    TabOrder = 2
    Kind = bkCancel
  end
end
