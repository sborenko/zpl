object FormGetDates: TFormGetDates
  Left = 350
  Top = 299
  BorderStyle = bsDialog
  Caption = 'FormGetDates'
  ClientHeight = 100
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 2
    Width = 293
    Height = 69
  end
  object LabelPrompt: TLabel
    Left = 10
    Top = 8
    Width = 154
    Height = 13
    Caption = #1056#1072#1089#1095#1077#1090' '#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
  end
  object Label2: TLabel
    Left = 164
    Top = 30
    Width = 15
    Height = 13
    Caption = #1087#1086':'
  end
  object Label3: TLabel
    Left = 94
    Top = 52
    Width = 187
    Height = 13
    Caption = '('#1086' '#1073' '#1077'   '#1076' '#1072' '#1090' '#1099'   '#1074' '#1082' '#1083' '#1102' '#1095' '#1080' '#1090' '#1077' '#1083' '#1100' '#1085' '#1086')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 12
    Top = 30
    Width = 9
    Height = 13
    Caption = #1089':'
  end
  object BitBtn1: TBitBtn
    Left = 134
    Top = 74
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 221
    Top = 74
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object dtPicDtBeg: TDateTimePicker
    Left = 35
    Top = 26
    Width = 94
    Height = 21
    Date = 36850.000000000000000000
    Time = 36850.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dtPicEnter
    OnExit = dtPicExit
  end
  object dtPicDtEnd: TDateTimePicker
    Left = 192
    Top = 26
    Width = 94
    Height = 21
    Date = 36850.000000000000000000
    Time = 36850.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dtPicEnter
    OnExit = dtPicExit
  end
  object chBoxSvDates: TCheckBox
    Left = 4
    Top = 72
    Width = 114
    Height = 28
    Hint = #1055#1086#1084#1085#1080#1090#1100' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1076#1072#1090#1099' '#1080' '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1090#1100' '#1080#1093' '#1087#1088#1080' '#1089#1083#1077#1076#1091#1102#1097#1077#1084' '#1074#1099#1079#1086#1074#1077
    TabStop = False
    Caption = #1055#1086#1084#1085#1080#1090#1100' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1076#1072#1090#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    WordWrap = True
  end
end
