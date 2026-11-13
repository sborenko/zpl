object FormEAPrp: TFormEAPrp
  Left = 484
  Top = 253
  BorderStyle = bsDialog
  Caption = 'FormEAPrp'
  ClientHeight = 230
  ClientWidth = 245
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
  object Bevel2: TBevel
    Left = 3
    Top = 77
    Width = 241
    Height = 98
  end
  object Bevel1: TBevel
    Left = 3
    Top = 30
    Width = 241
    Height = 47
  end
  object Label1: TLabel
    Left = 14
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
    Left = 29
    Top = 35
    Width = 157
    Height = 13
    Caption = #1042' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' - % '#1086#1073#1097#1080#1081':'
    FocusControl = dbePfCmn
  end
  object Label3: TLabel
    Left = 103
    Top = 57
    Width = 83
    Height = 13
    Caption = '- % '#1089' '#1080#1085#1074#1072#1083#1080#1076#1086#1074':'
    FocusControl = dbePfInv
  end
  object Label4: TLabel
    Left = 6
    Top = 83
    Width = 180
    Height = 13
    Caption = #1042' '#1089#1086#1094#1089#1090#1088#1072#1093' - '#1085#1072' '#1086#1087#1083#1072#1090#1091' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093':'
    FocusControl = dbeSs1Bln
  end
  object Label5: TLabel
    Left = 12
    Top = 105
    Width = 174
    Height = 13
    Caption = '- '#1085#1072' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1077' '#1086#1090' '#1085#1077#1089#1095'. '#1089#1083#1091#1095#1072#1077#1074':'
    FocusControl = dbeSs2nsl
  end
  object Label6: TLabel
    Left = 8
    Top = 127
    Width = 177
    Height = 13
    Caption = #1042' '#1092#1086#1085#1076' '#1079#1072#1085#1103#1090#1086#1089#1090#1080' - '#1089' '#1074#1080#1076#1086#1074', '#1082#1088#1086#1084#1077
    FocusControl = dbeFz
  end
  object Label7: TLabel
    Left = 6
    Top = 180
    Width = 42
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095'.'
    FocusControl = dbeNotes
  end
  object Bevel3: TBevel
    Left = 3
    Top = 125
    Width = 240
    Height = 2
    Shape = bsFrame
    Style = bsRaised
  end
  object Label8: TLabel
    Left = 132
    Top = 139
    Width = 54
    Height = 13
    Caption = #1074#1080#1076#1072' 1006:'
  end
  object Label9: TLabel
    Left = 16
    Top = 154
    Width = 170
    Height = 13
    Caption = '- '#1089' '#1076#1086#1075#1086#1074#1086#1088#1086#1074' '#1087#1086#1076#1088#1103#1076#1072' ('#1074#1080#1076' 1006):'
  end
  object dbeDtBeg: TDBEdit
    Left = 166
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
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePfCmn: TDBEdit
    Left = 187
    Top = 32
    Width = 55
    Height = 21
    Hint = #1042' '#1055#1060' ('#1082#1088#1086#1084#1077' '#1080#1085#1074#1072#1083#1080#1076#1086#1074')'
    DataField = 'PRCPFCMN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePfInv: TDBEdit
    Left = 187
    Top = 54
    Width = 55
    Height = 21
    Hint = #1042' '#1055#1060' '#1089' '#1080#1085#1074#1072#1083#1080#1076#1086#1074
    DataField = 'PRCPFINV'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeSs1Bln: TDBEdit
    Left = 187
    Top = 80
    Width = 55
    Height = 21
    Hint = #1053#1072' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1077' '#1087#1086' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1084' '#1083#1080#1089#1090#1072#1084
    DataField = 'PRCSS1BLN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeSs2nsl: TDBEdit
    Left = 187
    Top = 102
    Width = 55
    Height = 21
    Hint = #1053#1072' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1077' '#1086#1090' '#1085#1077#1089#1095#1072#1089#1090#1099#1093' '#1089#1083#1091#1095#1072#1077#1074
    DataField = 'PRCSS2NSL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeFz: TDBEdit
    Left = 187
    Top = 129
    Width = 55
    Height = 21
    Hint = #1042' '#1060#1047' ('#1082#1088#1086#1084#1077' '#1074#1080#1076#1072' 1006)'
    DataField = 'PRCFZ'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 50
    Top = 177
    Width = 192
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
    TabOrder = 7
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 80
    Top = 202
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 8
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 167
    Top = 202
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 9
    Kind = bkCancel
  end
  object dbeFz1006: TDBEdit
    Left = 187
    Top = 151
    Width = 55
    Height = 21
    Hint = #1042' '#1060#1047' '#1089' '#1074#1080#1076#1072' 1006 ('#1076#1086#1075#1086#1074#1086#1088#1099' '#1087#1086#1076#1088#1103#1076#1072')'
    DataField = 'PRCFZ1006'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
end
