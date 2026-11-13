object FormEASpB: TFormEASpB
  Left = 475
  Top = 249
  BorderStyle = bsDialog
  Caption = 'FormEASpB'
  ClientHeight = 200
  ClientWidth = 351
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
    Top = 4
    Width = 33
    Height = 13
    Caption = #1058#1072#1073#1053#1088
    FocusControl = dbeTabN
  end
  object Label2: TLabel
    Left = 53
    Top = 4
    Width = 74
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
    FocusControl = dbeFamIO
  end
  object Label3: TLabel
    Left = 7
    Top = 42
    Width = 37
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082
    FocusControl = dbeKdSps
  end
  object Label4: TLabel
    Left = 109
    Top = 42
    Width = 80
    Height = 13
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    FocusControl = dbeKdObj
  end
  object Label5: TLabel
    Left = 234
    Top = 42
    Width = 110
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    FocusControl = dbeKdKatP
  end
  object Label6: TLabel
    Left = 7
    Top = 136
    Width = 37
    Height = 13
    Caption = #1050#1076#1064#1055#1047
    FocusControl = dbeKdSpZ
    Visible = False
  end
  object Label7: TLabel
    Left = 238
    Top = 83
    Width = 23
    Height = 13
    Caption = #1057#1095#1105#1090
    FocusControl = dbeSpZ
  end
  object Label8: TLabel
    Left = -5
    Top = 165
    Width = 168
    Height = 13
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1074#1086#1079#1084#1086#1078#1085#1072#1103' '#1089#1091#1084#1084#1072
    FocusControl = dbeMaxSm
    Visible = False
  end
  object Label9: TLabel
    Left = 88
    Top = 146
    Width = 115
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1077#1076#1086#1084#1086#1084#1086#1089#1090#1100
    FocusControl = dbeSmToVed
  end
  object Label10: TLabel
    Left = 7
    Top = 102
    Width = 43
    Height = 13
    Caption = #1041'  '#1072'  '#1085'  '#1082
    FocusControl = dbeKdBnk
  end
  object Label11: TLabel
    Left = 192
    Top = 102
    Width = 69
    Height = 13
    Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
    FocusControl = dbeLS
  end
  object sBtnTabN: TSpeedButton
    Left = 327
    Top = 18
    Width = 17
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
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
    OnClick = sBtnTabNClick
  end
  object sBtnSpZ: TSpeedButton
    Left = 327
    Top = 80
    Width = 17
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1073#1072#1085#1082#1072
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
    OnClick = sBtnSpZClick
  end
  object sBtnBnkLS: TSpeedButton
    Left = 327
    Top = 116
    Width = 17
    Height = 21
    Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
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
    OnClick = sBtnBnkLSClick
  end
  object dbeTabN: TDBEdit
    Left = 6
    Top = 18
    Width = 47
    Height = 21
    DataField = 'TabN'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeFamIO: TDBEdit
    Left = 53
    Top = 18
    Width = 273
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'FamIO'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object dbeKdSps: TDBEdit
    Left = 7
    Top = 56
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KdSps'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dbeKdObj: TDBEdit
    Left = 109
    Top = 56
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KdObj'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object dbeKdKatP: TDBEdit
    Left = 299
    Top = 56
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KdKatP'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object dbeKdSpZ: TDBEdit
    Left = 7
    Top = 150
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KdSpZ'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Visible = False
  end
  object dbeSpZ: TDBEdit
    Left = 269
    Top = 80
    Width = 57
    Height = 21
    Hint = #1057#1095#1105#1090' '#1041#1091#1093#1059#1095#1077#1090#1072' ('#1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103')'
    DataField = 'SpZ'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnDblClick = sBtnSpZClick
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeMaxSm: TDBEdit
    Left = 23
    Top = 143
    Width = 58
    Height = 21
    Hint = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1074#1086#1079#1084#1086#1078#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
    TabStop = False
    Color = clBtnFace
    DataField = 'MaxSm'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object dbeSmToVed: TDBEdit
    Left = 210
    Top = 143
    Width = 134
    Height = 21
    DataField = 'SmToVed'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 173
    Top = 168
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1074' '#1041#1044
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Kind = bkOK
  end
  object bBtnCacel: TBitBtn
    Left = 269
    Top = 168
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1074' '#1041#1044
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Kind = bkCancel
  end
  object dbeKdBnk: TDBEdit
    Left = 7
    Top = 116
    Width = 35
    Height = 21
    Hint = #1050#1086#1076' '#1073#1072#1085#1082#1072
    TabStop = False
    Color = clBtnFace
    DataField = 'KdBnk'
    DataSource = FormVedV.dsrcSpB
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
    OnDblClick = dbeKdBnkDblClick
    OnKeyDown = dbeLSKeyDown
  end
  object dbeLS: TDBEdit
    Left = 192
    Top = 116
    Width = 134
    Height = 21
    Hint = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090' '#1074' '#1073#1072#1085#1082#1077
    DataField = 'LS'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnDblClick = dbeKdBnkDblClick
    OnEnter = dbEditEnter
    OnExit = dbEditExit
    OnKeyDown = dbeLSKeyDown
  end
  object dbeNmBnk: TDBEdit
    Left = 42
    Top = 116
    Width = 150
    Height = 21
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
    TabStop = False
    Color = clBtnFace
    DataField = 'NmBnk'
    DataSource = FormVedV.dsrcSpB
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    OnDblClick = dbeKdBnkDblClick
    OnKeyDown = dbeLSKeyDown
  end
end
