object FormVvZdSm: TFormVvZdSm
  Left = 337
  Top = 453
  BorderStyle = bsDialog
  Caption = 'FormVvZdSm'
  ClientHeight = 124
  ClientWidth = 206
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
    206
    124)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 2
    Width = 188
    Height = 13
    Caption = #1048#1079' '#1082#1072#1082#1080#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1073#1091#1076#1077#1084' '#1074#1099#1073#1080#1088#1072#1090#1100' ?:'
  end
  object Bevel1: TBevel
    Left = 5
    Top = 16
    Width = 198
    Height = 78
    Shape = bsFrame
  end
  object bBrnOk: TBitBtn
    Left = 37
    Top = 97
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 127
    Top = 97
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object rBtnVsBudget: TRadioButton
    Left = 9
    Top = 19
    Width = 190
    Height = 17
    Hint = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1074#1080#1076#1091' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1099#1076#1072#1077#1090#1089#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
    Caption = '- '#1073#1102#1076#1078#1077#1090' ('#1089#1095'. 801)'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = True
  end
  object rBtnVsSpecSr: TRadioButton
    Left = 9
    Top = 37
    Width = 190
    Height = 17
    Hint = #1055#1086' '#1082#1072#1082#1086#1084#1091' '#1074#1080#1076#1091' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1099#1076#1072#1077#1090#1089#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
    Caption = '- '#1089#1087#1077#1094#1089#1088#1077#1076#1089#1090#1074#1072' ('#1089#1095'. 811)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object rBtnVsDp: TRadioButton
    Left = 9
    Top = 55
    Width = 190
    Height = 17
    Caption = '- '#1076#1077#1090#1089#1082#1080#1077' '#1087#1086#1089#1086#1073#1080#1103' ('#1089#1095'. 801/'#1044#1055')'
    TabOrder = 4
  end
  object rBtnVsRz: TRadioButton
    Left = 9
    Top = 73
    Width = 190
    Height = 17
    Caption = '- '#1088#1077#1089#1090#1088#1091#1082#1090#1091#1088#1080#1079#1072#1094#1080#1103' ('#1089#1095'. 801/'#1088#1079')'
    TabOrder = 5
  end
end
