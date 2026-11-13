object FormEAKdLgt: TFormEAKdLgt
  Left = 301
  Top = 446
  BorderStyle = bsDialog
  Caption = 'FormEAKdLgt'
  ClientHeight = 115
  ClientWidth = 440
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
  object Label1: TLabel
    Left = 6
    Top = 8
    Width = 58
    Height = 13
    Caption = #1050#1086#1076' '#1083#1100#1075#1086#1090#1099
    FocusControl = dbeKdLgt
  end
  object Label2: TLabel
    Left = 132
    Top = 8
    Width = 72
    Height = 13
    Hint = #1044#1083#1103' '#1086#1090#1095#1077#1090#1072' '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' (1'#1044#1060')'
    Caption = #1054#1079#1085#1072#1082#1072' '#1087'i'#1083#1100#1075#1080
    FocusControl = dbeOznPilg
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 269
    Top = 8
    Width = 68
    Height = 13
    Caption = #1064#1080#1092#1088' '#1083#1100#1075#1086#1090#1099
    FocusControl = dbeShLg
  end
  object Label4: TLabel
    Left = 6
    Top = 25
    Width = 89
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1100#1075#1086#1090#1099
    FocusControl = dbeNmLg
  end
  object Label5: TLabel
    Left = 6
    Top = 65
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeKdLgt: TDBEdit
    Left = 71
    Top = 4
    Width = 35
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDLGT'
    DataSource = FormKdLgt.dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeOznPilg: TDBEdit
    Left = 211
    Top = 4
    Width = 35
    Height = 21
    Hint = #1044#1083#1103' '#1086#1090#1095#1077#1090#1072' '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' (1'#1044#1060')'
    DataField = 'OZN_PILG'
    DataSource = FormKdLgt.dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeKdLgtEnter
    OnExit = dbeKdLgtExit
  end
  object dbeShLg: TDBEdit
    Left = 344
    Top = 4
    Width = 91
    Height = 21
    DataField = 'SHLGT'
    DataSource = FormKdLgt.dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeKdLgtEnter
    OnExit = dbeKdLgtExit
  end
  object dbeNmLg: TDBEdit
    Left = 6
    Top = 39
    Width = 429
    Height = 21
    DataField = 'NMLGT'
    DataSource = FormKdLgt.dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbeKdLgtEnter
    OnExit = dbeKdLgtExit
  end
  object dbeNotes: TDBEdit
    Left = 76
    Top = 62
    Width = 359
    Height = 21
    DataField = 'NOTES'
    DataSource = FormKdLgt.dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbeKdLgtEnter
    OnExit = dbeKdLgtExit
  end
  object bBtnOk: TBitBtn
    Left = 278
    Top = 87
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCacel: TBitBtn
    Left = 360
    Top = 87
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
end
