object FormGtMesPkt: TFormGtMesPkt
  Left = 355
  Top = 353
  BorderStyle = bsDialog
  Caption = 'FormGtMesPkt'
  ClientHeight = 152
  ClientWidth = 249
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
    Left = 5
    Top = 5
    Width = 237
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1079#1072' 2013 '#1075#1086#1076' '#1087#1072#1082#1077#1090#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1082' '#1090#1077#1082#1091#1097#1077#1084#1091' ' +
      #1084#1077#1089#1103#1094#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 7
    Top = 43
    Width = 168
    Height = 13
    Hint = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1099#1073#1088#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' "'#1057#1091#1084#1084#1099' '#1076#1083#1103' '#1074#1080#1076#1072' 1005"'
    Caption = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1099#1073#1088#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 8
    Top = 62
    Width = 170
    Height = 26
    AutoSize = False
    Caption = #1050' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1084#1077#1089#1103#1094#1091' '#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1089#1086' '#1079#1085#1072#1095#1077#1085#1080#1077#1084' '#1087#1086#1083#1103' "'#1047#1072#1052#1077#1089#1103#1094'"'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 8
    Top = 89
    Width = 105
    Height = 25
    AutoSize = False
    Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072' '#1086#1090#1085#1077#1089#1090#1080' '#1085#1072' '#1089#1095#1105#1090':'
    WordWrap = True
  end
  object sBtnSPZ: TSpeedButton
    Left = 226
    Top = 94
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
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
    OnClick = sBtnSPZClick
  end
  object MaskEdZaMG: TMaskEdit
    Left = 184
    Top = 67
    Width = 57
    Height = 21
    EditMask = '!99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 7
    ParentFont = False
    TabOrder = 2
    Text = '  -    '
    OnEnter = MaskEdZaMGEnter
    OnExit = MaskEdZaMGExit
  end
  object UpDown: TUpDown
    Left = 226
    Top = 40
    Width = 15
    Height = 21
    Associate = edZaMesFakt
    Min = 1
    Max = 12
    Position = 1
    TabOrder = 1
  end
  object edZaMesFakt: TEdit
    Left = 200
    Top = 40
    Width = 26
    Height = 21
    Hint = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1099#1073#1088#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' "'#1057#1091#1084#1084#1099' '#1076#1083#1103' '#1074#1080#1076#1072' 1005"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    Text = '1'
    OnEnter = EditEnter
    OnExit = EeZaMesFaktExit
  end
  object bBtnOk: TBitBtn
    Left = 70
    Top = 122
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 166
    Top = 122
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
  object edSpZ: TEdit
    Left = 128
    Top = 94
    Width = 98
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnDblClick = sBtnSPZClick
    OnEnter = EditEnter
    OnExit = edSpZExit
    OnKeyDown = edSpZKeyDown
  end
  object edKdSpZ: TEdit
    Left = 8
    Top = 122
    Width = 57
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
end
