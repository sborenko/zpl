object FormPsPdnZapros: TFormPsPdnZapros
  Left = 486
  Top = 313
  BorderStyle = bsDialog
  Caption = #1063#1090#1086' '#1073#1091#1076#1077#1084' '#1076#1077#1083#1072#1090#1100'?:'
  ClientHeight = 70
  ClientWidth = 288
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 288
    Height = 70
    Align = alClient
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 237
    Height = 13
    Caption = #1060#1072#1081#1083' '#1089' '#1080#1090#1086#1075#1072#1084#1080' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1091#1078#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1077#1090'.'
  end
  object bBtnAsIs: TBitBtn
    Left = 6
    Top = 36
    Width = 75
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 0
    OnClick = bBtnAsIsClick
  end
  object bBtnReBuild: TBitBtn
    Left = 87
    Top = 36
    Width = 114
    Height = 25
    Hint = #1041#1091#1076#1091#1090' '#1091#1085#1080#1095#1090#1086#1078#1077#1085#1099' '#1074#1089#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103', '#1074#1085#1077#1089#1077#1085#1085#1099#1077' '#1074' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077' '#1092#1072#1081#1083#1099'.'
    Caption = #1055#1077#1088#1077#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = bBtnReBuildClick
  end
  object bBtnCancel: TBitBtn
    Left = 206
    Top = 36
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
end
