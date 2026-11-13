object FormEGoNumbs: TFormEGoNumbs
  Left = 412
  Top = 263
  BorderStyle = bsDialog
  Caption = 'FormEGoNumbs'
  ClientHeight = 121
  ClientWidth = 269
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
    Top = 6
    Width = 52
    Height = 13
    Caption = #1044#1083#1103' '#1089#1095#1105#1090#1072
    FocusControl = dbeSchBU
  end
  object Label2: TLabel
    Left = 117
    Top = 6
    Width = 55
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
    FocusControl = dbeDtBeg
  end
  object Label3: TLabel
    Left = 200
    Top = 6
    Width = 63
    Height = 13
    Caption = #8470' '#1078'/'#1086#1088#1076#1077#1088#1072
    FocusControl = dbeGoNR
  end
  object Label4: TLabel
    Left = 6
    Top = 48
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object sBtnVubSchBU: TSpeedButton
    Left = 95
    Top = 22
    Width = 15
    Height = 20
    Hint = #1042#1099#1073#1086#1088' '#1089#1095#1105#1090#1072' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
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
    OnClick = sBtnVubSchBUClick
  end
  object Label5: TLabel
    Left = 81
    Top = 47
    Width = 32
    Height = 13
    Caption = 'KdSbu'
    FocusControl = dbeKdSbu
    Transparent = True
  end
  object dbeSchBU: TDBEdit
    Left = 6
    Top = 22
    Width = 89
    Height = 21
    DataField = 'SCHBU'
    DataSource = FormGoNumbs.dsrcGo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnDblClick = sBtnVubSchBUClick
    OnEnter = dbEditEnter
    OnExit = dbEditExit
    OnKeyDown = dbeSchBUKeyDown
  end
  object dbeDtBeg: TDBEdit
    Left = 117
    Top = 22
    Width = 81
    Height = 21
    DataField = 'DTBEG'
    DataSource = FormGoNumbs.dsrcGo
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
  object dbeGoNR: TDBEdit
    Left = 205
    Top = 22
    Width = 58
    Height = 21
    DataField = 'GONR'
    DataSource = FormGoNumbs.dsrcGo
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
  object dbeNotes: TDBEdit
    Left = 6
    Top = 64
    Width = 257
    Height = 21
    DataField = 'NOTES'
    DataSource = FormGoNumbs.dsrcGo
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
  object bBtnApply: TBitBtn
    Left = 6
    Top = 90
    Width = 75
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1074' '#1041#1044' '#1080' '#1074#1074#1077#1089#1090#1080' '#1085#1086#1074#1091#1102
    Caption = #1047#1072#1087#1080#1089#1100
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = bBtnApplyClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    Spacing = 2
  end
  object bBtnCancel: TBitBtn
    Left = 188
    Top = 90
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Caption = #1054#1090#1084#1077#1085#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Kind = bkCancel
    Spacing = 0
  end
  object bBtnOk: TBitBtn
    Left = 111
    Top = 90
    Width = 75
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1080' '#1079#1072#1082#1086#1085#1095#1080#1090#1100' '#1074#1074#1086#1076
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Kind = bkOK
  end
  object dbeKdSbu: TDBEdit
    Left = 117
    Top = 43
    Width = 68
    Height = 21
    Hint = 'dbeKdSbu (dbg)'
    TabStop = False
    DataField = 'KDSBU'
    DataSource = FormGoNumbs.dsrcGo
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
  end
end
