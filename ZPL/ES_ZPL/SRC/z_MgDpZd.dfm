object FormMgDpZd: TFormMgDpZd
  Left = 332
  Top = 268
  BorderStyle = bsDialog
  Caption = 'FormMgDpZd'
  ClientHeight = 131
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    342
    131)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 1
    Top = 33
    Width = 339
    Height = 50
  end
  object Label1: TLabel
    Left = 19
    Top = 2
    Width = 306
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1079' '#1074#1072#1088#1080#1072#1085#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1091#1084#1084#1099', '#1074#1082#1083#1102#1095#1072#1077#1084#1086#1081' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 24
    Top = 112
    Width = 65
    Height = 13
    Caption = #1053#1072#1076#1086' '#1083#1080' '#1090#1091#1090'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object bBtnOk: TBitBtn
    Left = 185
    Top = 105
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 265
    Top = 105
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object rBtnCase1: TRadioButton
    Left = 9
    Top = 41
    Width = 326
    Height = 17
    Hint = 
      #1042' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1095#1072#1089#1090#1100' '#1089#1091#1084#1084#1099' '#1082' '#1074#1099#1087#1083#1072#1090#1077', '#1087#1088#1080#1093#1086#1076#1103#1097#1072#1103#1089#1103' '#1085#1072' '#1088#1072 +
      #1089#1089#1095#1080#1090#1072#1085#1085#1099#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086#1089#1083#1077' '#1074#1099#1095#1077#1090#1072' '#1074#1089#1077#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
    Caption = #1057#1091#1084#1084#1099' "'#1085#1072' '#1088#1091#1082#1080'", '#1087#1088#1080#1093#1086#1076#1103#1097#1080#1077#1089#1103' '#1085#1072' '#1074#1074#1077#1076#1077#1085#1085#1099#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
    Checked = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = True
  end
  object rBtnCase2: TRadioButton
    Left = 9
    Top = 61
    Width = 329
    Height = 17
    Hint = 
      #1042' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1074#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074#1089#1103' '#1089#1091#1084#1084#1072' '#1082' '#1074#1099#1087#1083#1072#1090#1077', '#1086#1089#1090#1072#1102#1097#1072#1103#1089#1103'  '#1087#1086#1089#1083#1077' '#1074#1099 +
      #1095#1077#1090#1072' '#1074#1089#1077#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
    Caption = #1057#1091#1084#1084#1099' "'#1085#1072' '#1088#1091#1082#1080'", '#1082#1072#1082' '#1087#1088#1080' '#1086#1082#1086#1085#1095#1072#1090#1077#1083#1100#1085#1086#1084' '#1088#1072#1089#1095#1077#1090#1077
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 87
    Width = 252
    Height = 17
    Alignment = taLeftJustify
    Caption = #1054#1073#1088#1077#1079#1072#1090#1100' ('#1085#1077' '#1086#1082#1088#1091#1075#1083#1103#1090#1100' !) '#1074#1099#1087#1083#1072#1090#1099' '#1076#1086' '#1094#1077#1083#1099#1093
    TabOrder = 4
    Visible = False
  end
end
