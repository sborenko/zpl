object FormEAEsv: TFormEAEsv
  Left = 512
  Top = 156
  BorderStyle = bsDialog
  Caption = 'FormEAEsv'
  ClientHeight = 249
  ClientWidth = 298
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
  object Bevel1: TBevel
    Left = 9
    Top = 25
    Width = 146
    Height = 35
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 115
    Top = 8
    Width = 83
    Height = 13
    Hint = #1042#1089#1077#1075#1076#1072' 1-'#1077' '#1095#1080#1089#1083#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1075#1086' '#1084#1077#1103#1094#1072
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
    FocusControl = dbeDtBeg
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 53
    Top = 61
    Width = 114
    Height = 13
    Caption = #1044#1083#1103' '#1086#1073#1097#1080#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
    FocusControl = dbePrcCmn
  end
  object LabelPPS: TLabel
    Left = 53
    Top = 85
    Width = 114
    Height = 13
    Alignment = taRightJustify
    Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1055#1055#1057
    FocusControl = dbePrcPps
  end
  object Label6: TLabel
    Left = 16
    Top = 109
    Width = 151
    Height = 13
    Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
    FocusControl = dbePrcBln
  end
  object Label8: TLabel
    Left = 53
    Top = 154
    Width = 114
    Height = 13
    Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1043#1055#1044
    FocusControl = dbePrcGpd
  end
  object Label10: TLabel
    Left = 5
    Top = 177
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label11: TLabel
    Left = 172
    Top = 30
    Width = 59
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = '% '#1076#1086' '#1057#1084#1055#1092#1052#1072#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    WordWrap = True
  end
  object Label12: TLabel
    Left = 235
    Top = 30
    Width = 60
    Height = 27
    Hint = #1059#1076#1077#1088#1078#1072#1085#1080#1077' '#1089' '#1089#1091#1084#1084#1099', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1077#1081' '#1057#1084#1055#1092#1052#1072#1093' (% * '#1057#1084#1055#1092#1052#1072#1093')'
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1091#1084#1084#1072' '#1089' '#1057#1084#1055#1092#1052#1072#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Label3: TLabel
    Left = 15
    Top = 28
    Width = 132
    Height = 28
    AutoSize = False
    Caption = #1042' '#1087#1077#1085#1089#1080#1086#1085#1085#1099#1081' '#1092#1086#1085#1076' '#1089' '#1079#1072#1088#1087#1083#1072#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object LabelDekr: TLabel
    Left = 22
    Top = 131
    Width = 145
    Height = 13
    Caption = #1044#1083#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1076#1077#1082#1088#1077#1090#1085#1099#1093
    FocusControl = dbePrcDekr
  end
  object dbeDtBeg: TDBEdit
    Left = 215
    Top = 5
    Width = 79
    Height = 21
    Hint = #1042#1089#1077#1075#1076#1072' 1-'#1077' '#1095#1080#1089#1083#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1075#1086' '#1084#1077#1103#1094#1072
    DataField = 'DTBEG'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcCmn: TDBEdit
    Left = 180
    Top = 58
    Width = 46
    Height = 21
    DataField = 'PRCCMN'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmCmn: TDBEdit
    Left = 226
    Top = 58
    Width = 68
    Height = 21
    DataField = 'SMCMN'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcPps: TDBEdit
    Left = 180
    Top = 82
    Width = 46
    Height = 21
    DataField = 'PRCPPS'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmPps: TDBEdit
    Left = 226
    Top = 82
    Width = 68
    Height = 21
    DataField = 'SMPPS'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcBln: TDBEdit
    Left = 180
    Top = 106
    Width = 46
    Height = 21
    DataField = 'PRCBLN'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmBln: TDBEdit
    Left = 226
    Top = 106
    Width = 68
    Height = 21
    DataField = 'SMBLN'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcGpd: TDBEdit
    Left = 180
    Top = 151
    Width = 46
    Height = 21
    DataField = 'PRCGPD'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmGpd: TDBEdit
    Left = 226
    Top = 151
    Width = 68
    Height = 21
    DataField = 'SMGPD'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 5
    Top = 193
    Width = 289
    Height = 21
    DataField = 'NOTES'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object bBtnOk: TBitBtn
    Left = 135
    Top = 219
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1074' '#1041#1044
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 219
    Top = 219
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1074' '#1041#1044
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Kind = bkCancel
  end
  object dbePrcDekr: TDBEdit
    Left = 180
    Top = 128
    Width = 46
    Height = 21
    Hint = '% '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1076#1077#1082#1088#1077#1090#1085#1099#1093
    DataField = 'PRCDEKR'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmDekr: TDBEdit
    Left = 226
    Top = 128
    Width = 68
    Height = 21
    DataField = 'SMDEKR'
    DataSource = DmMain.dsrcEsv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
end
