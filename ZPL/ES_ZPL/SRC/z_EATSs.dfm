object FormEATSs: TFormEATSs
  Left = 499
  Top = 313
  BorderStyle = bsDialog
  Caption = 'FormEATSs'
  ClientHeight = 137
  ClientWidth = 249
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
    Left = 4
    Top = 1
    Width = 148
    Height = 29
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1084#1077#1089#1103#1094#1072' ('#1074#1074#1086#1076#1080#1090#1077' 1-'#1077' '#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072'):'
    FocusControl = dbeDtBeg
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 54
    Top = 44
    Width = 122
    Height = 13
    Caption = '- '#1089' '#1089#1091#1084#1084' "'#1044#1086#1055#1088#1078#1052#1080#1085'2":'
    FocusControl = dbePrcDoMin
  end
  object Label3: TLabel
    Left = 67
    Top = 65
    Width = 109
    Height = 13
    Caption = '- '#1089' '#1089#1091#1084#1084' "'#1044#1086#1055#1092#1052#1072#1093'":'
    FocusControl = dbePrcDoMax
  end
  object Label7: TLabel
    Left = 6
    Top = 87
    Width = 66
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    FocusControl = dbeNotes
  end
  object Label4: TLabel
    Left = 6
    Top = 27
    Width = 238
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1074' '#1092#1086#1085#1076' '#1089#1086#1094'. '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1103
  end
  object dbeDtBeg: TDBEdit
    Left = 169
    Top = 6
    Width = 76
    Height = 21
    Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099' ('#1074#1089#1077#1075#1076#1072' '#1089' 1-'#1075#1086' '#1095#1080#1089#1083#1072' '#1084#1077#1089#1103#1094#1072')'
    DataField = 'DTBEG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbeDtBegExit
  end
  object dbePrcDoMin: TDBEdit
    Left = 190
    Top = 41
    Width = 55
    Height = 21
    DataField = 'PRCDOMIN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcDoMax: TDBEdit
    Left = 190
    Top = 62
    Width = 55
    Height = 21
    DataField = 'PRCDOMAX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 80
    Top = 109
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 170
    Top = 109
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object dbeNotes: TDBEdit
    Left = 80
    Top = 84
    Width = 165
    Height = 21
    Hint = #1058#1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'"'
    DataField = 'NOTES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
end
