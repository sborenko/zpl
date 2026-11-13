object FormEAPrmUv: TFormEAPrmUv
  Left = 341
  Top = 236
  BorderStyle = bsDialog
  Caption = 'FormEAPrmUv'
  ClientHeight = 167
  ClientWidth = 355
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
    Left = 4
    Top = 7
    Width = 67
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
    FocusControl = dbeDtPriem
  end
  object Label2: TLabel
    Left = 174
    Top = 7
    Width = 88
    Height = 13
    Caption = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
    FocusControl = dbeDtUvoln
  end
  object Label3: TLabel
    Left = 42
    Top = 28
    Width = 108
    Height = 13
    Caption = #1055#1088#1080#1082#1072#1079' '#1086' '#1087#1088#1080#1077#1084#1077':  '#8470
    FocusControl = dbeNrPrikaza
  end
  object Label4: TLabel
    Left = 251
    Top = 27
    Width = 11
    Height = 13
    Caption = #1086#1090
    FocusControl = dbeDtPrikaza
  end
  object Label5: TLabel
    Left = 4
    Top = 100
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
    FocusControl = dbeNotes
  end
  object Label6: TLabel
    Left = 15
    Top = 49
    Width = 135
    Height = 13
    Caption = #1055#1088#1080#1082#1072#1079' '#1086#1073' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1080':  '#8470
    FocusControl = dbeNrPrUvoln
  end
  object Label7: TLabel
    Left = 251
    Top = 49
    Width = 11
    Height = 13
    Caption = #1086#1090
    FocusControl = dbeDtPrikaza
  end
  object Label8: TLabel
    Left = 4
    Top = 65
    Width = 105
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
  end
  object sBtnKdPidZv: TSpeedButton
    Left = 337
    Top = 79
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088'-'#1082#1072' "'#1055#1088#1080#1095#1080#1085#1099' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103'"'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnKdPidZvClick
  end
  object dbeDtPriem: TDBEdit
    Left = 77
    Top = 4
    Width = 77
    Height = 21
    DataField = 'DT_PRIEM'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = DbeEnter
    OnExit = dbeDtPriemExit
  end
  object dbeDtUvoln: TDBEdit
    Left = 267
    Top = 4
    Width = 85
    Height = 21
    DataField = 'DT_UVOLN'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = DbeEnter
    OnExit = dbeDtUvolnExit
  end
  object dbeNrPrikaza: TDBEdit
    Left = 157
    Top = 25
    Width = 85
    Height = 21
    DataField = 'NR_PRIKAZA'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = DbeEnter
    OnExit = DbeExit
  end
  object dbeDtPrikaza: TDBEdit
    Left = 267
    Top = 25
    Width = 85
    Height = 21
    DataField = 'DT_PRIKAZA'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = DbeEnter
    OnExit = DbeExit
  end
  object dbeNotes: TDBEdit
    Left = 4
    Top = 113
    Width = 348
    Height = 21
    Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090'-'#1087#1072#1084#1103#1090#1082#1072
    DataField = 'NOTES'
    DataSource = DmMain.dsrcPrmUv
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnEnter = DbeEnter
    OnExit = DbeExit
  end
  object bBtnOk: TBitBtn
    Left = 192
    Top = 139
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 10
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 277
    Top = 139
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 11
    Kind = bkCancel
  end
  object dbeKdSps: TDBEdit
    Left = 165
    Top = 140
    Width = 20
    Height = 21
    Hint = #1050#1086#1076' '#1089#1087#1080#1089#1082#1072' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1080#1085#1076#1080#1082#1072#1094#1080#1080')'
    TabStop = False
    Color = clBtnFace
    DataField = 'KdSps'
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 9
    Visible = False
  end
  object dbeNrPrUvoln: TDBEdit
    Left = 157
    Top = 46
    Width = 85
    Height = 21
    DataField = 'NR_PRUVOLN'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = DbeEnter
    OnExit = DbeExit
  end
  object dbeDtPrUvoln: TDBEdit
    Left = 267
    Top = 46
    Width = 85
    Height = 21
    DataField = 'DT_PRUVOLN'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = DbeEnter
    OnExit = DbeExit
  end
  object dbeKdPidZv: TDBEdit
    Left = 4
    Top = 79
    Width = 28
    Height = 21
    DataField = 'KDPIDZV'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnDblClick = dbePidZvilnDblClick
    OnEnter = DbeEnter
    OnExit = dbeKdPidZvExit
    OnKeyDown = dbePidZvilnKeyDown
  end
  object dbePidZviln: TDBEdit
    Left = 32
    Top = 79
    Width = 305
    Height = 21
    Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090'-'#1087#1072#1084#1103#1090#1082#1072
    TabStop = False
    Color = clBtnFace
    DataField = 'PidZviln'
    DataSource = DmMain.dsrcPrmUv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 7
    OnDblClick = dbePidZvilnDblClick
    OnKeyDown = dbePidZvilnKeyDown
  end
  object qryTmp: TQuery
    Left = 72
    Top = 133
  end
end
