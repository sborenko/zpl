object FormAEInclRS: TFormAEInclRS
  Left = 594
  Top = 197
  BorderStyle = bsDialog
  Caption = 'FormAEInclRS'
  ClientHeight = 177
  ClientWidth = 337
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
    Top = 3
    Width = 81
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
    FocusControl = dbeShPPdr
  end
  object LabelKdRSch: TLabel
    Left = 156
    Top = 3
    Width = 40
    Height = 13
    Caption = 'KdRSch'
    FocusControl = dbeKdRSch
    Visible = False
  end
  object Label4: TLabel
    Left = 4
    Top = 75
    Width = 120
    Height = 13
    Caption = #1064#1080#1092#1088' '#1080' '#1088#1072#1089#1095#1105#1090#1085#1099#1081' '#1089#1095#1105#1090
    FocusControl = dbeRSch
  end
  object Label5: TLabel
    Left = 163
    Top = 75
    Width = 28
    Height = 13
    Caption = #1052#1060#1054
    FocusControl = dbeMfo
  end
  object Label6: TLabel
    Left = 248
    Top = 75
    Width = 31
    Height = 13
    Caption = #1054#1050#1055#1054
    FocusControl = dbeOkpo
  end
  object Label7: TLabel
    Left = 4
    Top = 109
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DeNotes
  end
  object Label2: TLabel
    Left = 5
    Top = 147
    Width = 73
    Height = 27
    AutoSize = False
    Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1105#1090' '#1041#1091#1093#1059#1095#1077#1090#1072
    FocusControl = dbeSchBU
    WordWrap = True
  end
  object sBtnSchBU: TSpeedButton
    Left = 153
    Top = 150
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1072' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
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
    OnClick = sBtnSchBUClick
  end
  object LabelKdSbu: TLabel
    Left = 248
    Top = 3
    Width = 32
    Height = 13
    Caption = 'KdSbu'
    FocusControl = dbeKdSbu
    Visible = False
  end
  object Label3: TLabel
    Left = 4
    Top = 38
    Width = 83
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
    FocusControl = dbeNmBank
  end
  object dbeKdSbu: TDBEdit
    Left = 288
    Top = 0
    Width = 41
    Height = 21
    TabStop = False
    DataField = 'KDSBU'
    DataSource = FormEABnkPdr.dsrcInclRS
    TabOrder = 11
    Visible = False
  end
  object dbeShPPdr: TDBEdit
    Left = 4
    Top = 89
    Width = 20
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'SHPPDR'
    DataSource = FormEABnkPdr.dsrcInclRS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbeKdRSch: TDBEdit
    Left = 201
    Top = 0
    Width = 41
    Height = 21
    TabStop = False
    DataField = 'KDRSCH'
    DataSource = FormEABnkPdr.dsrcInclRS
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object dbeNmRSch: TDBEdit
    Left = 4
    Top = 17
    Width = 329
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'NMSCH'
    DataSource = FormEABnkPdr.dsrcInclRS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeRSch: TDBEdit
    Left = 25
    Top = 89
    Width = 138
    Height = 21
    DataField = 'RSCH'
    DataSource = FormEABnkPdr.dsrcInclRS
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
  object dbeMfo: TDBEdit
    Left = 163
    Top = 89
    Width = 85
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'MFO'
    DataSource = FormEABnkPdr.dsrcInclRS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object dbeOkpo: TDBEdit
    Left = 248
    Top = 89
    Width = 85
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'OKPO'
    DataSource = FormEABnkPdr.dsrcInclRS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object DeNotes: TDBEdit
    Left = 4
    Top = 123
    Width = 329
    Height = 21
    DataField = 'NOTES'
    DataSource = FormEABnkPdr.dsrcInclRS
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
  object bBtnOk: TBitBtn
    Left = 179
    Top = 148
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 9
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 258
    Top = 148
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 10
    Kind = bkCancel
  end
  object dbeSchBU: TDBEdit
    Left = 82
    Top = 150
    Width = 71
    Height = 21
    Hint = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
    TabStop = False
    Color = clBtnFace
    DataField = 'SCHBU'
    DataSource = FormEABnkPdr.dsrcInclRS
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
    OnEnter = dbEditEnter
    OnExit = dbeSchBUExit
  end
  object dbeNmBank: TDBEdit
    Left = 4
    Top = 52
    Width = 329
    Height = 21
    DataField = 'NMBANK'
    DataSource = FormEABnkPdr.dsrcInclRS
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
end
