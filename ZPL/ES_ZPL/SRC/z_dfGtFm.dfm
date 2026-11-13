object FormGetFam: TFormGetFam
  Left = 363
  Top = 241
  ActiveControl = edFam
  BorderStyle = bsDialog
  Caption = 'FormGetFam'
  ClientHeight = 59
  ClientWidth = 282
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 5
    Top = 9
    Width = 156
    Height = 13
    Hint = #1052#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1083#1102#1073#1091#1102' '#1095#1072#1089#1090#1100' '#1092#1072#1084#1080#1083#1080#1080' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
    ParentShowHint = False
    ShowHint = True
  end
  object BitBtn1: TBitBtn
    Left = 86
    Top = 31
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 204
    Top = 31
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object edFam: TEdit
    Left = 165
    Top = 6
    Width = 114
    Height = 21
    Hint = #1052#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1083#1102#1073#1091#1102' '#1095#1072#1089#1090#1100' '#1092#1072#1084#1080#1083#1080#1080' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
    MaxLength = 35
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = 'edFam'
    OnEnter = edFamEnter
    OnExit = edFamExit
  end
end
