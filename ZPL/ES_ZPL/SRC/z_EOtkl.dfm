object FormEOtkl: TFormEOtkl
  Left = 162
  Top = 138
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Form4EOtkl'
  ClientHeight = 369
  ClientWidth = 581
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
  object panelInfo: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 369
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object LabelObj: TLabel
      Left = 24
      Top = 95
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FocusControl = dbeObj
    end
    object Label4: TLabel
      Left = 122
      Top = 191
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FocusControl = dbeDtBeg
    end
    object Label5: TLabel
      Left = 242
      Top = 191
      Width = 82
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FocusControl = dbeDtEnd
    end
    object LabelCntChas: TLabel
      Left = 360
      Top = 191
      Width = 99
      Height = 13
      AutoSize = False
      Caption = #1050#1086#1083'.'#1095#1072#1089'.'
      FocusControl = dbeChas
      WordWrap = True
    end
    object Label7: TLabel
      Left = 23
      Top = 52
      Width = 19
      Height = 13
      Hint = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103')'
      Alignment = taRightJustify
      Caption = #1042#1080#1076
      ParentShowHint = False
      ShowHint = True
    end
    object Label8: TLabel
      Left = 312
      Top = 95
      Width = 110
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FocusControl = dbeKatP
    end
    object Label9: TLabel
      Left = 122
      Top = 282
      Width = 22
      Height = 13
      Caption = #1055#1076#1053
      FocusControl = dbePdN
    end
    object Label10: TLabel
      Left = 168
      Top = 282
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FocusControl = dbeNotes
    end
    object Label11: TLabel
      Left = 24
      Top = 282
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
      FocusControl = dbeSumma
    end
    object Label12: TLabel
      Left = 312
      Top = 141
      Width = 49
      Height = 13
      Caption = #1057#1095#1105#1090' '#1041#1059
      FocusControl = dbeSPZ
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object sBtnVidN: TSpeedButton
      Left = 180
      Top = 65
      Width = 14
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
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
      OnClick = sBtnVidNClick
    end
    object sBtnObj: TSpeedButton
      Left = 207
      Top = 108
      Width = 14
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
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
      OnClick = sBtnObjClick
    end
    object sBtnKatP: TSpeedButton
      Left = 433
      Top = 108
      Width = 14
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
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
      OnClick = sBtnKatPClick
    end
    object Label1: TLabel
      Left = 24
      Top = 191
      Width = 48
      Height = 13
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
    end
    object Label2: TLabel
      Left = 24
      Top = 6
      Width = 92
      Height = 13
      Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    end
    object sBtnTabN: TSpeedButton
      Left = 327
      Top = 19
      Width = 14
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Enabled = False
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
    object Label3: TLabel
      Left = 312
      Top = 52
      Width = 39
      Height = 13
      Caption = #1057#1089#1099#1083#1082#1072
    end
    object sBtnSpecNR: TSpeedButton
      Left = 433
      Top = 65
      Width = 14
      Height = 21
      Hint = 
        #1042#1099#1073#1086#1088' '#1073#1072#1079#1086#1074#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1088#1080#1074#1103#1079#1099#1074#1072#1077#1090#1089#1103' '#1074#1074#1086#1076#1080#1084#1086#1077' '#1086#1090#1082#1083 +
        #1086#1085#1077#1085#1080#1077
      Enabled = False
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
      OnClick = sBtnSpecNRClick
    end
    object sBtnCalendar: TSpeedButton
      Left = 133
      Top = 335
      Width = 84
      Height = 25
      Hint = #1050#1072#1083#1077#1085#1076#1072#1088#1100
      Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 2
      OnClick = sBtnCalendarClick
    end
    object sBtnSPZ: TSpeedButton
      Left = 433
      Top = 156
      Width = 14
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
    object Label6: TLabel
      Left = 24
      Top = 141
      Width = 91
      Height = 13
      Caption = #1058' '#1077' '#1084' '#1072'   '#1053' '#1048' '#1063
      FocusControl = dbeNmTemu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object sBtnKdTemu: TSpeedButton
      Left = 243
      Top = 156
      Width = 14
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1090#1077#1084#1099' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1058#1077#1084#1099' '#1053#1048#1063'"'
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
      OnClick = sBtnKdTemuClick
    end
    object dbtNDBE: TDBText
      Left = 57
      Top = 52
      Width = 12
      Height = 17
      Hint = 'NDBE '#1076#1083#1103' '#1074#1080#1076#1072
      DataField = 'NDbe'
      DataSource = DmMain.dsrcOtkl
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      Transparent = True
      ShowHint = True
      Visible = False
    end
    object Label14: TLabel
      Left = 122
      Top = 234
      Width = 56
      Height = 13
      Caption = #8470' '#1087#1088#1080#1082#1072#1079#1072
    end
    object Label15: TLabel
      Left = 24
      Top = 234
      Width = 71
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
    end
    object dtPicDtBeg: TDateTimePicker
      Left = 121
      Top = 204
      Width = 91
      Height = 21
      Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099
      CalAlignment = dtaRight
      Date = 38008.000000000000000000
      Time = 38008.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
      OnChange = dtPicDtBegChange
      OnEnter = dtPicEnter
      OnExit = dtPicExit
    end
    object dbeChas: TDBEdit
      Left = 360
      Top = 204
      Width = 48
      Height = 21
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074
      TabStop = False
      Color = clBtnFace
      DataField = 'CHAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 17
      OnEnter = dbeChasEnter
      OnExit = dbeChasExit
    end
    object dbeNotes: TDBEdit
      Left = 168
      Top = 295
      Width = 280
      Height = 21
      Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1083#1102#1073#1086#1081' '#1090#1077#1082#1089#1090')'
      DataField = 'NOTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object bBtnOk: TBitBtn
      Left = 309
      Top = 335
      Width = 66
      Height = 25
      Hint = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Caption = #1042#1074#1086#1076
      Default = True
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 381
      Top = 335
      Width = 67
      Height = 25
      Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      Kind = bkCancel
      Spacing = 0
    end
    object dbePdN: TDBEdit
      Left = 122
      Top = 295
      Width = 22
      Height = 21
      Hint = #1055#1088#1080#1079#1072#1082' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072' (1)'
      DataField = 'PDN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeSumma: TDBEdit
      Left = 24
      Top = 295
      Width = 88
      Height = 21
      Hint = #1053#1072#1095#1080#1089#1083#1103#1077#1084#1072#1103' '#1089#1091#1084#1084#1072' ('#1087#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1085#1072#1078#1072#1090#1100' '#1087#1088#1072#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091' '#1084#1099#1096#1082#1080')'
      DataField = 'SUMMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popMnu
      ShowHint = True
      TabOrder = 20
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object DBComboZaMesGod: TDBComboBox
      Left = 24
      Top = 204
      Width = 70
      Height = 21
      Hint = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
      Style = csDropDownList
      DataField = 'ZAMESGOD'
      DropDownCount = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        '01-2003'
        '02-2003'
        '03-2003'
        '04-2003'
        '05-2003'
        '06-2003'
        '07-2003'
        '08-2003'
        '09-2003'
        '10-2003'
        '11-2003'
        '12-2003'
        '01-2004')
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popMnu
      ShowHint = True
      TabOrder = 12
      OnEnter = DBComboZaMesGodEnter
      OnExit = DBComboZaMesGodExit
      OnKeyDown = DBComboZaMesGodKeyDown
    end
    object dtPicDtEnd: TDateTimePicker
      Left = 241
      Top = 204
      Width = 91
      Height = 21
      Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Date = 38008.000000000000000000
      Time = 38008.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnChange = dtPicDtEndChange
      OnEnter = dtPicEnter
      OnExit = dtPicExit
    end
    object dbeVidN: TDBEdit
      Left = 24
      Top = 65
      Width = 56
      Height = 21
      Hint = #1050#1086#1076' '#1074#1080#1076#1072
      DataField = 'VIDN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnDblClick = sBtnVidNClick
      OnEnter = dbeEnter
      OnExit = dbeVidNExit
      OnKeyDown = dbeVidNKeyDown
    end
    object dbeMyNotes: TDBEdit
      Left = 312
      Top = 65
      Width = 120
      Height = 21
      Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1088#1080' '#1074#1074#1086#1076#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093', '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093', '#1072#1083#1080#1084#1077#1085#1090#1086#1074' '#1080' '#1087#1088'.'
      TabStop = False
      Color = clBtnFace
      DataField = 'MYNOTES'
      DataSource = DmMain.dsrcOtkl
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
      OnDblClick = sBtnSpecNRClick
      OnEnter = dbeMyNotesEnter
      OnExit = dbeMyNotesExit
      OnKeyDown = dbeMyNotesKeyDown
    end
    object dbeTabN: TDBEdit
      Left = 24
      Top = 19
      Width = 56
      Height = 21
      Hint = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      TabStop = False
      DataField = 'TABN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = sBtnTabNClick
      OnEnter = dbeEnter
      OnExit = dbeTabNExit
      OnKeyDown = dbeTabNKeyDown
    end
    object dbeFamIO: TDBEdit
      Left = 88
      Top = 19
      Width = 236
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      TabStop = False
      Color = clBtnFace
      DataField = 'FamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnDblClick = sBtnTabNClick
      OnKeyDown = dbeTabNKeyDown
    end
    object bBtnNew: TBitBtn
      Left = 224
      Top = 335
      Width = 79
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1086#1082#1091
      Caption = #1057#1086#1079#1076#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      OnClick = bBtnNewClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object dbeKdObj: TDBEdit
      Left = 24
      Top = 108
      Width = 56
      Height = 21
      Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      DataField = 'KDOBJ'
      DataSource = DmMain.dsrcOtkl
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnDblClick = sBtnObjClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeKdObjKeyDown
    end
    object dbeObj: TDBEdit
      Left = 88
      Top = 108
      Width = 118
      Height = 21
      Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      TabStop = False
      Color = clBtnFace
      DataField = 'ShObj'
      DataSource = DmMain.dsrcOtkl
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnDblClick = sBtnObjClick
      OnKeyDown = dbeObjKeyDown
    end
    object dbeShVidN: TDBEdit
      Left = 88
      Top = 65
      Width = 91
      Height = 21
      Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072
      TabStop = False
      Color = clBtnFace
      DataField = 'ShVidN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnDblClick = sBtnVidNClick
      OnKeyDown = dbeShVidNKeyDown
    end
    object dbeKdKatP: TDBEdit
      Left = 312
      Top = 108
      Width = 27
      Height = 21
      Hint = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      DataField = 'KDKATP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnDblClick = sBtnKatPClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeKatPKeyDown
    end
    object dbeKatP: TDBEdit
      Left = 348
      Top = 108
      Width = 84
      Height = 21
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      TabStop = False
      Color = clBtnFace
      DataField = 'ShKatP'
      DataSource = DmMain.dsrcOtkl
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnDblClick = sBtnKatPClick
      OnKeyDown = dbeKatPKeyDown
    end
    object dbeSPZ: TDBEdit
      Left = 312
      Top = 156
      Width = 120
      Height = 21
      Hint = #1057#1095#1077#1090' '#1041#1091#1093#1059#1095#1077#1090#1072' - '#1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
      DataField = 'SCHBU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnDblClick = sBtnSPZClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeSPZKeyDown
    end
    object dbeDtBeg: TDBEdit
      Left = 122
      Top = 204
      Width = 81
      Height = 21
      Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
      DataField = 'DT_BEG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnChange = dbeDtBegChange
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeDtEnd: TDBEdit
      Left = 242
      Top = 204
      Width = 81
      Height = 21
      Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      DataField = 'DT_END'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnChange = dbeDtEndChange
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object MaskEdZaMG: TMaskEdit
      Left = 24
      Top = 204
      Width = 65
      Height = 21
      EditMask = '!99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 7
      ParentFont = False
      PopupMenu = popMnu
      TabOrder = 13
      Text = '  -    '
      Visible = False
      OnEnter = MaskEdZaMGEnter
      OnExit = MaskEdZaMGExit
    end
    object dbeNmTemu: TDBEdit
      Left = 88
      Top = 156
      Width = 155
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
      TabStop = False
      Color = clBtnFace
      DataField = 'NmTemu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnDblClick = sBtnKdTemuClick
      OnKeyDown = dbeKdTemuKeyDown
    end
    object dbeKdTemu: TDBEdit
      Left = 24
      Top = 156
      Width = 57
      Height = 21
      Hint = #1050#1086#1076' '#1090#1077#1084#1099
      DataField = 'KdTemu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnDblClick = sBtnKdTemuClick
      OnEnter = dbeEnter
      OnExit = dbeKdTemuExit
      OnKeyDown = dbeKdTemuKeyDown
    end
    object dbeDtPrik: TDBEdit
      Left = 24
      Top = 246
      Width = 81
      Height = 21
      DataField = 'DtPrik'
      DataSource = dsrcTemp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeNrPrik: TDBEdit
      Left = 120
      Top = 246
      Width = 121
      Height = 21
      DataField = 'NrPrik'
      DataSource = dsrcTemp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
    end
  end
  object dbeKdSpZ: TDBEdit
    Left = 481
    Top = 48
    Width = 100
    Height = 21
    TabStop = False
    DataField = 'KDSPZ'
    TabOrder = 2
    Visible = False
  end
  object dbeZaMesGod: TDBEdit
    Left = 481
    Top = 16
    Width = 100
    Height = 21
    TabStop = False
    DataField = 'ZAMESGOD'
    TabOrder = 1
    Visible = False
  end
  object dbeCBudg: TDBEdit
    Left = 481
    Top = 80
    Width = 100
    Height = 21
    TabStop = False
    DataField = 'CBudg'
    TabOrder = 3
    Visible = False
  end
  object dbeSpec_NR: TDBEdit
    Left = 481
    Top = 112
    Width = 100
    Height = 21
    TabStop = False
    DataField = 'Spec_NR'
    Enabled = False
    TabOrder = 4
    Visible = False
  end
  object LbxFilter: TListBox
    Left = 481
    Top = 144
    Width = 100
    Height = 57
    TabStop = False
    Color = clLime
    ItemHeight = 13
    Items.Strings = (
      '1000-1100 // '#1054#1089#1085'. '#1074#1080#1076#1099
      '1200-1299// '#1044#1086#1087'.'#1074#1080#1076#1099
      '1400-1500 // '#1053#1072#1076#1073#1072#1074#1082#1080
      '1600-1700 // '#1044#1086#1087#1083#1072#1090#1099
      '1800-1900 // '#1052#1072#1090#1087#1086#1084#1086#1097#1080
      '1900-2000 // '#1055#1086#1089#1086#1073#1080#1103
      '2200-2300 // '#1055#1088#1077#1084#1080#1080
      
        '2400-5000 // '#1054#1090#1087' '#1080' '#1073#1086#1083#1100#1085#1080#1095#1085'. '#1080' '#1087#1088#1086#1095#1080#1077' ('#1087#1091#1089#1090#1100' '#1088#1072#1089#1093#1083#1077#1073#1099#1074#1072#1102#1090#1089#1103' '#1089#1072#1084#1080 +
        ')'
      '5000-5100 // '#1053#1077#1086#1087#1083#1072#1095#1080#1074#1072#1077#1084#1099#1077' '#1074#1080#1076#1099
      '6000-6899 // '#1059#1076#1077#1088#1078#1072#1085#1080#1103
      '7500-7600 // '#1042#1099#1087#1083#1072#1090#1099)
    TabOrder = 5
    Visible = False
  end
  object popMnu: TPopupMenu
    OnPopup = popMnuPopup
    Left = 480
    Top = 224
    object popMnuHead: TMenuItem
      Caption = '== '#1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' =='
      Enabled = False
    end
    object popMnuLittleHelp: TMenuItem
      Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1074#1080#1076#1072' '
      Checked = True
      Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1091' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1074#1080#1076#1072
      ShortCut = 16456
    end
    object popMnuEdCalendar: TMenuItem
      Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100' '#1085#1072' '#1076#1072#1090#1072#1093
      Checked = True
      Hint = #1050#1072#1083#1077#1085#1076#1072#1088#1100' '#1085#1072' '#1087#1086#1083#1103#1093' '#1074#1074#1086#1076#1072' '#1076#1072#1090
      ShortCut = 16459
      Visible = False
      OnClick = popMnuEdCalendarClick
    end
    object popShwBtns: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1080' "?" '#1080' "K"'
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1085#1086#1087#1082#1080' "?" '#1080' "K"'
      ShortCut = 16467
      Visible = False
      OnClick = popShwBtnsClick
    end
    object popBySredn3: TMenuItem
      Caption = '- '#1085#1072' '#1089#1088#1077#1076#1085#1077#1077' '#1079#1072' '#1087#1088#1077#1076'. 3 '#1084#1077#1089'.'
      Hint = #1055#1086' '#1089#1088#1077#1076#1085#1077#1084#1091' '#1079#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1090#1088#1080' '#1084#1077#1089#1103#1094#1072
      OnClick = popBySredn3Click
    end
    object popBySredn6: TMenuItem
      Caption = '- '#1085#1072' '#1089#1088#1077#1076#1085#1077#1077' '#1079#1072' '#1087#1088#1077#1076'. 6 '#1084#1077#1089'.'
      Hint = #1055#1086' '#1089#1088#1077#1076#1085#1077#1084#1091' '#1079#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1096#1077#1089#1090#1100' '#1084#1077#1089#1103#1094#1077#1074
      ShortCut = 16449
      OnClick = popBySredn6Click
    end
    object popBySredn12: TMenuItem
      Caption = '- '#1085#1072' '#1089#1088#1077#1076#1085#1077#1077' '#1079#1072' '#1087#1088#1077#1076'. 12 '#1084#1077#1089'.'
      OnClick = popBySredn12Click
    end
    object popByOklTrf: TMenuItem
      Caption = '- '#1085#1072' '#1086#1082#1083#1072#1076'/'#1090#1072#1088#1080#1092
      Hint = #1055#1086' '#1086#1082#1083#1072#1076#1091' ('#1090#1072#1088#1080#1092#1091') '#1085#1072' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1076#1072#1090#1091
      ShortCut = 16468
      OnClick = popByOklTrfClick
    end
    object popShowCalendar: TMenuItem
      Caption = #1055#1088#1086#1089#1090#1086' '#1082#1072#1083#1077#1085#1076#1072#1088#1100
      ShortCut = 16464
      OnClick = sBtnCalendarClick
    end
    object popZaMgCombo: TMenuItem
      Caption = #1052#1077#1089#1103#1094' "'#1047#1072'" '#1074#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      Checked = True
      OnClick = popZaMgComboClick
    end
    object popZaMgMaskEdit: TMenuItem
      Caption = #1052#1077#1089#1103#1094' "'#1047#1072'" '#1074#1074#1086#1076#1080#1090#1089#1103' '#1089' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099
      OnClick = popZaMgMaskEditClick
    end
  end
  object qryVOtp: TQuery
    CachedUpdates = True
    AfterPost = qryVOtpAfterPost
    AfterDelete = qryVOtpAfterDelete
    DatabaseName = 'DbMain'
    UpdateObject = updVOtp
    Left = 480
    Top = 264
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VOTP.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VOTP.KDSPS'
    end
    object qryVOtpDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VOTP.DTPROC'
    end
    object qryVOtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VOTP.TABN'
    end
    object qryVOtpCUROKLTRF: TFloatField
      FieldName = 'CUROKLTRF'
      Origin = 'DbMain.Z_VOTP.CUROKLTRF'
    end
    object qryVOtpALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VOTP.ALGRASCH'
    end
    object qryVOtpUSEKOEFOKL: TStringField
      FieldName = 'USEKOEFOKL'
      Origin = 'DbMain.Z_VOTP.USEKOEFOKL'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHMATPOM: TStringField
      FieldName = 'NCHMATPOM'
      Origin = 'DbMain.Z_VOTP.NCHMATPOM'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VOTP.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVOtpRK: TStringField
      FieldName = 'RK'
      Origin = 'DbMain.Z_VOTP.RK'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNRPRIK: TStringField
      FieldName = 'NRPRIK'
      Origin = 'DbMain.Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      FieldName = 'DTPRIK'
      Origin = 'DbMain.Z_VOTP.DTPRIK'
    end
    object qryVOtpDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VOTP.DTBEG'
    end
    object qryVOtpCNTDAYS: TSmallintField
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VOTP.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VOTP.DTEND'
    end
    object qryVOtpCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VOTP.CNTCHAS'
    end
    object qryVOtpVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VOTP.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVOtpPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VOTP.PROCOPL'
    end
    object qryVOtpKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VOTP.KDTEMU'
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VOTP.KDOBJ'
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VOTP.KDKATP'
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VOTP.KDSPZ'
    end
    object qryVOtpNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VOTP.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VOTP.SMSRDN'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VOTP.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      FieldName = 'SMOTP'
      Origin = 'DbMain.Z_VOTP.SMOTP'
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    Left = 496
    Top = 280
  end
  object updVOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VOtp'
      'set'
      '  NR = :NR,'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  CUROKLTRF = :CUROKLTRF,'
      '  ALGRASCH = :ALGRASCH,'
      '  USEKOEFOKL = :USEKOEFOKL,'
      '  NCHMATPOM = :NCHMATPOM,'
      '  NCHBUDMES = :NCHBUDMES,'
      '  RK = :RK,'
      '  NRPRIK = :NRPRIK,'
      '  DTPRIK = :DTPRIK,'
      '  DTBEG = :DTBEG,'
      '  CNTDAYS = :CNTDAYS,'
      '  DTEND = :DTEND,'
      '  CNTCHAS = :CNTCHAS,'
      '  VIDN = :VIDN,'
      '  PROCOPL = :PROCOPL,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  SMSRDN = :SMSRDN,'
      '  SPEC_NR = :SPEC_NR,'
      '  SMOTP = :SMOTP'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_VOtp'
      '  (NR, KDSPS, DTPROC, TABN, CUROKLTRF, ALGRASCH, USEKOEFOKL, '
      'NCHMATPOM, '
      
        '   NCHBUDMES, RK, NRPRIK, DTPRIK, DTBEG, CNTDAYS, DTEND, CNTCHAS' +
        ', '
      'VIDN, '
      
        '   PROCOPL, KDTEMU, KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, SPEC_NR' +
        ', '
      'SMOTP)'
      'values'
      
        '  (:NR, :KDSPS, :DTPROC, :TABN, :CUROKLTRF, :ALGRASCH, :USEKOEFO' +
        'KL, '
      ':NCHMATPOM, '
      '   :NCHBUDMES, :RK, :NRPRIK, :DTPRIK, :DTBEG, :CNTDAYS, :DTEND, '
      ':CNTCHAS, '
      
        '   :VIDN, :PROCOPL, :KDTEMU, :KDOBJ, :KDKATP, :KDSPZ, :NOTES, :S' +
        'MSRDN, '
      '   :SPEC_NR, :SMOTP)')
    DeleteSQL.Strings = (
      'delete from z_VOtp'
      'where'
      '  NR = :OLD_NR')
    Left = 512
    Top = 296
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 336
    object cdsTempDtPrik: TDateField
      FieldName = 'DtPrik'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTempNrPrik: TStringField
      DisplayWidth = 15
      FieldName = 'NrPrik'
      Size = 15
    end
    object cdsTempChas: TFloatField
      FieldName = 'Chas'
    end
  end
  object dsrcTemp: TDataSource
    DataSet = cdsTemp
    Left = 496
    Top = 352
  end
  object QryMultMnth: TQuery
    CachedUpdates = True
    UpdateObject = UpdMultMnth
    Left = 24
    Top = 320
  end
  object UpdMultMnth: TUpdateSQL
    InsertSQL.Strings = (
      'insert into z_OTKL'
      '  (KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, SUMMA, '
      ' KdTemu, KDOBJ, KDKATP, '
      
        '   DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, KTO, PRKR, SPEC' +
        '_NR, '
      'DTVDPV, '
      '   NRVDPV, MYNOTES, SPECPS, PBNK, STORN, KDBNK)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, :S' +
        'UMMA, '
      ' :KdTemu, :KDOBJ, '
      
        '   :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, :PRR, :PRPV,' +
        ' :KTO, '
      
        '   :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, :SPECPS, :PBNK, ' +
        ':STORN, '
      '   :KDBNK)')
    DeleteSQL.Strings = (
      'delete from z_OTKL'
      'where'
      '  NR = :OLD_NR')
    Left = 40
    Top = 336
  end
end
