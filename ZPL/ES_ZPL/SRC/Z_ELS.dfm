object FormLS: TFormLS
  Left = 644
  Top = 490
  ActiveControl = dbeDtBeg
  BorderStyle = bsDialog
  Caption = 'FormLS'
  ClientHeight = 123
  ClientWidth = 325
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
  object Label2: TLabel
    Left = 6
    Top = 52
    Width = 69
    Height = 13
    Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
    FocusControl = dbeLS
  end
  object Label3: TLabel
    Left = 6
    Top = 29
    Width = 40
    Height = 13
    Caption = #1042' '#1073#1072#1085#1082#1077
    FocusControl = dbeNmBnk
  end
  object Label4: TLabel
    Left = 6
    Top = 75
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object sBtnBank: TSpeedButton
    Left = 305
    Top = 26
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
    OnClick = sBtnBankClick
  end
  object Label1: TLabel
    Left = 146
    Top = 6
    Width = 80
    Height = 13
    Hint = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1089#1095#1105#1090#1072
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099
    FocusControl = dbeDtBeg
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 6
    Top = 6
    Width = 37
    Height = 13
    Caption = #1058#1072#1073'.'#1085'-'#1088
    FocusControl = dbeTabN
  end
  object bBtnOk: TBitBtn
    Left = 197
    Top = 96
    Width = 61
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 6
    Kind = bkOK
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 260
    Top = 96
    Width = 62
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 7
    Kind = bkCancel
    Spacing = 0
  end
  object dbeLS: TDBEdit
    Left = 91
    Top = 49
    Width = 231
    Height = 21
    DataField = 'LICSCH'
    DataSource = FormBnkLS.dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object dbeNotes: TDBEdit
    Left = 91
    Top = 72
    Width = 231
    Height = 21
    DataField = 'NOTES'
    DataSource = FormBnkLS.dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object dbeDtBeg: TDBEdit
    Left = 232
    Top = 3
    Width = 90
    Height = 21
    Hint = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1089#1095#1105#1090#1072
    DataField = 'DTBEG'
    DataSource = FormBnkLS.dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object dbeTabN: TDBEdit
    Left = 55
    Top = 3
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'TABN'
    DataSource = FormBnkLS.dsrcLS
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeNmBnk: TDBEdit
    Left = 97
    Top = 26
    Width = 208
    Height = 21
    DataField = 'NMBNK'
    DataSource = FormBnkLS.dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnDblClick = sBtnBankClick
    OnEnter = DBEditEnter
    OnExit = DBEditExit
    OnKeyDown = dbeKdBnkKeyDown
  end
  object dbeKdBnk: TDBEdit
    Left = 55
    Top = 26
    Width = 43
    Height = 21
    DataField = 'KDBNK'
    DataSource = FormBnkLS.dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnDblClick = sBtnBankClick
    OnEnter = DBEditEnter
    OnExit = DBEditExit
    OnKeyDown = dbeKdBnkKeyDown
  end
end
