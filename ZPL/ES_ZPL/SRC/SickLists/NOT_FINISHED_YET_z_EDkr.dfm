object FormEDkr: TFormEDkr
  Left = 477
  Top = 460
  Width = 950
  Height = 583
  ActiveControl = DbeVidN
  BorderIcons = [biSystemMenu]
  Caption = 'FormEDkr'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 520
  Constraints.MinWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 512
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 360
      Width = 103
      Height = 13
      Caption = #1057#1077#1088#1080#1103' '#1080' '#1053'-'#1088' '#1073'/'#1083#1080#1089#1090#1072
      FocusControl = dbeNrList
    end
    object Label3: TLabel
      Left = 6
      Top = 232
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FocusControl = dbeDtBeg
    end
    object Label4: TLabel
      Left = 95
      Top = 232
      Width = 61
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
      FocusControl = dbeDtEnd
    end
    object Label5: TLabel
      Left = 6
      Top = 158
      Width = 63
      Height = 33
      AutoSize = False
      Caption = #1042#1080#1076' '#1080' '#1096#1080#1092#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      Transparent = True
      WordWrap = True
    end
    object LabelProcOpl: TLabel
      Left = 164
      Top = 427
      Width = 48
      Height = 13
      Caption = '% '#1086#1087#1083#1072#1090#1099
      FocusControl = dbeProcOpl
    end
    object Label8: TLabel
      Left = 6
      Top = 275
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FocusControl = dbeShObj
    end
    object Label10: TLabel
      Left = 148
      Top = 275
      Width = 86
      Height = 13
      Caption = #1050#1072#1090#1077#1075'.'#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FocusControl = dbeShKatP
    end
    object Label11: TLabel
      Left = 6
      Top = 468
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FocusControl = dbeNotes
    end
    object BtnVidN: TSpeedButton
      Left = 246
      Top = 162
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
      Enabled = False
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnVidNClick
    end
    object sBtnObj: TSpeedButton
      Left = 120
      Top = 289
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnObjClick
    end
    object sBtnKatP: TSpeedButton
      Left = 246
      Top = 289
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnKatPClick
    end
    object Label12: TLabel
      Left = 155
      Top = 318
      Width = 41
      Height = 13
      Caption = #1057#1095#1077#1090' '#1041#1059
      FocusControl = dbeSPZ
    end
    object sBtnSPZ: TSpeedButton
      Left = 246
      Top = 334
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnSPZClick
    end
    object LabelCntDays: TLabel
      Left = 188
      Top = 232
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #1050'-'#1074#1086' '#1076#1085#1077#1081
    end
    object LabelFamIO: TLabel
      Left = 119
      Top = 137
      Width = 137
      Height = 13
      AutoSize = False
      Caption = 'LabelFamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelTabN: TLabel
      Left = 6
      Top = 138
      Width = 33
      Height = 13
      Caption = #1058#1072#1073#1053#1088
      FocusControl = DbeTabN
    end
    object BtnUpi: TSpeedButton
      Left = 93
      Top = 134
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnUpiClick
    end
    object LabelNchBudMes: TLabel
      Left = 128
      Top = 438
      Width = 108
      Height = 29
      Hint = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076'.'#1084#1077#1089#1103#1094#1072' '#1076#1086' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      Visible = False
      WordWrap = True
    end
    object LabelCmnStg: TLabel
      Left = 6
      Top = 427
      Width = 63
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1089#1090#1072#1078
      FocusControl = dbeStgCmn
    end
    object LabelStg12: TLabel
      Left = 87
      Top = 427
      Width = 70
      Height = 13
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1091' 12'
      FocusControl = dbeStg12
      Transparent = True
    end
    object sBtnPredList: TSpeedButton
      Left = 246
      Top = 400
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnPredListClick
    end
    object Label6: TLabel
      Left = 58
      Top = 190
      Width = 151
      Height = 13
      Caption = #1055#1088#1080#1095#1080#1085#1072' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
    end
    object BtnPrBln: TSpeedButton
      Left = 246
      Top = 203
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1088#1080#1095#1080#1085' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnPrBlnClick
    end
    object Label7: TLabel
      Left = 5
      Top = 318
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
      Left = 134
      Top = 332
      Width = 15
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
    object dbeDtPrik: TDBEdit
      Left = 184
      Top = 372
      Width = 72
      Height = 21
      Hint = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1083#1080#1089#1090#1082#1072
      DataField = 'DTLIST'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Visible = False
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object dbeDtEnd: TDBEdit
      Left = 95
      Top = 246
      Width = 72
      Height = 21
      Hint = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'DTEND'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnEnter = DbEditEnter
      OnExit = dbeDtEndExit
    end
    object dbeProcOpl: TDBEdit
      Left = 166
      Top = 441
      Width = 48
      Height = 21
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      DataField = 'PROCOPL'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object dbeShObj: TDBEdit
      Left = 6
      Top = 289
      Width = 107
      Height = 21
      Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DataField = 'ShObj'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = dbeShObjKeyDown
    end
    object dbeShKatP: TDBEdit
      Left = 148
      Top = 289
      Width = 93
      Height = 21
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      DataField = 'ShKatP'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = dbeShKatPKeyDown
    end
    object dbeNotes: TDBEdit
      Left = 6
      Top = 483
      Width = 208
      Height = 21
      Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'"'
      DataField = 'NOTES'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object DbeShVidN: TDBEdit
      Left = 119
      Top = 162
      Width = 122
      Height = 21
      Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      TabStop = False
      Color = clBtnFace
      DataField = 'ShVidN'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyDown = DbeVidNKeyDown
    end
    object dbeSPZ: TDBEdit
      Left = 163
      Top = 334
      Width = 78
      Height = 21
      Hint = #1057#1095#1077#1090' '#1041#1059' ('#1082#1072#1082' '#1087#1088#1072#1074#1080#1083#1086', '#1086#1089#1085#1086#1074#1085#1086#1081' '#1057#1041#1059' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072')'
      DataField = 'SPZ'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = dbeSPZKeyDown
    end
    object dbeNrList: TDBEdit
      Left = 48
      Top = 372
      Width = 201
      Height = 21
      Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'NRLIST'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object dbeCntDays: TDBEdit
      Left = 188
      Top = 246
      Width = 37
      Height = 21
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081
      TabStop = False
      Color = clBtnFace
      DataField = 'CNTDAYS'
      DataSource = dsrcVBln
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
    end
    object dbeDtBeg: TDBEdit
      Left = 6
      Top = 246
      Width = 72
      Height = 21
      Hint = #1055#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'DTBEG'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnEnter = DbEditEnter
      OnExit = dbeDtBegExit
    end
    object DbeTabN: TDBEdit
      Left = 44
      Top = 134
      Width = 48
      Height = 21
      TabStop = False
      DataField = 'TABN'
      DataSource = dsrcVBln
      TabOrder = 0
      OnEnter = DbEditEnter
      OnExit = DbeTabNExit
    end
    object DbeVidN: TDBEdit
      Left = 77
      Top = 162
      Width = 37
      Height = 21
      Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      TabStop = False
      DataField = 'VIDN'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = DbeVidNKeyDown
    end
    object rGrpAlgoritm: TGroupBox
      Left = 6
      Top = 13
      Width = 208
      Height = 60
      Caption = '  '#1040#1083#1075#1086#1088#1080#1090#1084' '#1088#1072#1089#1095#1077#1090#1072'  '
      TabOrder = 22
      object RBtnByLastOkl: TRadioButton
        Left = 8
        Top = 33
        Width = 195
        Height = 17
        Hint = '- '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1084#1091' '#1086#1082#1083#1072#1076#1091' '#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084
        Caption = '- '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1084#1091' '#1086#1082#1083#1072#1076#1091
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = RBtnByLastOklClicr
      end
      object RBtnByLast12m: TRadioButton
        Left = 8
        Top = 16
        Width = 195
        Height = 17
        Hint = '- '#1087#1086' 12-'#1090#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1084#1077#1089#1103#1094#1072#1084' ('#1074' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1103#1093')'
        Caption = '- '#1087#1086' 12-'#1090#1080' '#1087#1088#1077#1076'.'#1084#1077#1089'. ('#1074' '#1082#1072#1083#1077#1085#1076'.'#1076#1085'.)'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = True
        OnClick = RBtnByLast12mClick
      end
    end
    object LbxFilter: TListBox
      Left = 232
      Top = 84
      Width = 97
      Height = 33
      Color = clLime
      ItemHeight = 13
      Items.Strings = (
        '2602-2603 // '#1044#1077#1082#1088#1077#1090#1085#1099#1077)
      TabOrder = 23
      Visible = False
    end
    object dbChBoxNchBudMes: TDBCheckBox
      Left = 237
      Top = 445
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      DataField = 'NCHBUDMES'
      DataSource = dsrcVBln
      Enabled = False
      TabOrder = 20
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
      OnEnter = dbChBoxNchBudMesEnter
      OnExit = dbChBoxNchBudMesExit
    end
    object DBChBoxListCont: TDBCheckBox
      Left = 6
      Top = 402
      Width = 66
      Height = 17
      Hint = #1051#1080#1089#1090#1086#1082' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077#1084
      Alignment = taLeftJustify
      Caption = #1055#1088#1086#1076#1086#1083#1078'.'
      DataField = 'LISTCONT'
      DataSource = dsrcVBln
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBChBoxListContClick
    end
    object dbeStgCmn: TDBEdit
      Left = 9
      Top = 441
      Width = 78
      Height = 21
      Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'STGCMN'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnDblClick = sBtnPredListClick
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = dbeStgCmnKeyDown
    end
    object dbeStg12: TDBEdit
      Left = 87
      Top = 441
      Width = 66
      Height = 21
      Hint = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1083#1080#1089#1090#1082#1072
      DataField = 'STG12'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnDblClick = sBtnPredListClick
      OnEnter = DbEditEnter
      OnExit = DbEditExit
      OnKeyDown = dbeStgCmnKeyDown
    end
    object dbeNmPrBln: TDBEdit
      Left = 88
      Top = 203
      Width = 153
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'NmPrBln'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnDblClick = BtnPrBlnClick
    end
    object dbePrBln: TDBEdit
      Left = 58
      Top = 203
      Width = 27
      Height = 21
      Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      DataField = 'PRBLN'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnDblClick = BtnPrBlnClick
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object GrBoxSps: TGroupBox
      Left = 5
      Top = 83
      Width = 209
      Height = 41
      Caption = ' '#1057#1087#1086#1089#1086#1073' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1091#1084#1084' '#1076#1083#1103' '#1076#1077#1082#1088#1077#1090#1085'. '
      TabOrder = 24
      object RBtnAllSps: TRadioButton
        Left = 8
        Top = 16
        Width = 85
        Height = 17
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1089#1091#1084#1084#1099' '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1080#1089#1082#1072#1084
        Caption = #1074#1089#1077' '#1089#1087#1080#1089#1082#1080
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = RBtnAllSpsClick
      end
      object RBtnOwnSpsOnly: TRadioButton
        Left = 107
        Top = 16
        Width = 96
        Height = 17
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1089#1091#1084#1084#1099' "'#1089#1074#1086#1077#1075#1086'" '#1089#1087#1080#1089#1082#1072
        Caption = #1090#1086#1083#1100#1082#1086' "'#1089#1074#1086#1081'"'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = True
        OnClick = RBtnOwnSpsOnlyClick
      end
    end
    object dbeKdTemu: TDBEdit
      Left = 5
      Top = 332
      Width = 43
      Height = 21
      Hint = #1050#1086#1076' '#1090#1077#1084#1099
      DataField = 'KdTemu'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnEnter = DbEditEnter
      OnExit = dbeKdTemuExit
    end
    object dbeNmTemu: TDBEdit
      Left = 50
      Top = 332
      Width = 81
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
      TabStop = False
      Color = clBtnFace
      DataField = 'NmTemu'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object DbeKdSpZ: TDBEdit
      Left = 209
      Top = 314
      Width = 73
      Height = 21
      TabStop = False
      DataField = 'KDSPZ'
      DataSource = dsrcVBln
      TabOrder = 25
      Visible = False
    end
    object dbeSerList: TDBEdit
      Left = 7
      Top = 372
      Width = 41
      Height = 21
      Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'SERLIST'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object dbePredNR: TDBEdit
      Left = 79
      Top = 400
      Width = 106
      Height = 21
      Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'PredNr'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
      Visible = False
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object dbePredDt: TDBEdit
      Left = 184
      Top = 400
      Width = 57
      Height = 21
      Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      DataField = 'PredDt'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
      Visible = False
      OnEnter = DbEditEnter
      OnExit = DbEditExit
    end
    object DBChBoxDigital: TDBCheckBox
      Left = 4
      Top = 205
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = #1062#1080#1092#1088'.'
      DataField = 'DIGITAL'
      DataSource = dsrcVBln
      TabOrder = 28
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      OnClick = DBChBoxDigitalClick
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 512
    Width = 934
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      934
      32)
    object sBtnStep2: TSpeedButton
      Left = 55
      Top = 4
      Width = 52
      Height = 25
      Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1080' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Anchors = [akTop, akRight]
      Caption = #1064#1072#1075' 2'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep2Click
    end
    object sBtnStep3: TSpeedButton
      Left = 109
      Top = 4
      Width = 52
      Height = 25
      Hint = #1056#1072#1089#1095#1077#1090' '#1082#1086#1085#1077#1095#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
      Anchors = [akTop, akRight]
      Caption = #1064#1072#1075' 3'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep3Click
    end
    object sBtnStep1: TSpeedButton
      Left = 0
      Top = 4
      Width = 52
      Height = 25
      Hint = #1042#1074#1086#1076' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      Anchors = [akTop, akRight]
      Caption = #1064#1072#1075' 1'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep1Click
    end
    object sBtnPrt: TSpeedButton
      Left = 277
      Top = 4
      Width = 64
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = sBtnPrtClick
    end
    object sBtnCalendar: TSpeedButton
      Left = 250
      Top = 4
      Width = 25
      Height = 25
      Hint = #1050#1072#1083#1077#1085#1076#1072#1088#1100
      Anchors = [akTop, akRight]
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
      OnClick = sBtnCalendarClick
    end
    object sBtnRecalcPred: TSpeedButton
      Left = 343
      Top = 4
      Width = 25
      Height = 25
      Hint = #1055#1077#1088#1077#1089#1095#1077#1090' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1077#1088#1074#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      Anchors = [akTop, akRight]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
        3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
        700077337F3333373777887007333337007733F773F333337733700070333333
        077037773733333F7F37703707333300080737F373333377737F003333333307
        78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
        078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
        70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
        3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
        33337F73FF737773333307800077033333337337773373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnRecalcPredClick
    end
    object sBtnStornOtp: TSpeedButton
      Left = 162
      Top = 4
      Width = 87
      Height = 25
      Hint = 
        #1069#1082#1088#1072#1085' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1072' ('#1077#1089#1083#1080' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1086' "'#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077'" '#1073#1086#1083#1100#1085 +
        #1080#1095#1085#1099#1093' '#1089' '#1086#1090#1087#1091#1089#1082#1086#1084')'
      Anchors = [akTop, akRight]
      Caption = #1057#1090#1086#1088#1085'.'#1086#1090#1087#1091#1089#1082#1072
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStornOtpClick
    end
    object LabelLastDtPriem: TLabel
      Left = 372
      Top = 14
      Width = 100
      Height = 13
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' ('#1087#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1073#1086#1083#1085#1080#1095#1085#1099#1093') '#1076#1072#1090#1072' '#1087#1088#1080#1105#1084#1072
      Caption = 'LabelLastDtPriem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object LabelMsgDtPriem: TLabel
      Left = 372
      Top = 0
      Width = 70
      Height = 13
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' ('#1087#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1073#1086#1083#1085#1080#1095#1085#1099#1093') '#1076#1072#1090#1072' '#1087#1088#1080#1105#1084#1072
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1105#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object BtnVvod: TBitBtn
      Left = 771
      Top = 4
      Width = 77
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      Default = True
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnVvodClick
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
      Left = 853
      Top = 4
      Width = 77
      Height = 25
      Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
    object bBtnPereschet: TBitBtn
      Left = 665
      Top = 4
      Width = 23
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1080' '#1089' '#1085#1077#1084#1077#1076#1083#1077#1085#1085#1099#1084' '#1087#1077#1088#1077#1089#1095#1077#1090#1086#1084
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = bBtnPereschetClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      Spacing = 1
    end
    object BtnNew: TBitBtn
      Left = 692
      Top = 4
      Width = 77
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1086#1082#1091
      Anchors = [akTop, akRight]
      Caption = #1053#1086#1074#1099#1081
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnNewClick
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
  end
  object PanelRight: TPanel
    Left = 264
    Top = 0
    Width = 670
    Height = 512
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 332
      Width = 670
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clAqua
      ParentColor = False
    end
    object PanelRBottom: TPanel
      Left = 0
      Top = 335
      Width = 670
      Height = 177
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object PanelResults: TPanel
        Left = 1
        Top = 1
        Width = 668
        Height = 43
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Constraints.MaxHeight = 43
        Constraints.MinHeight = 43
        TabOrder = 0
        DesignSize = (
          668
          43)
        object LabelMsgOsn: TLabel
          Left = 2
          Top = 2
          Width = 664
          Height = 13
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = #1057#1091#1084#1084#1072' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' = 3456.56, '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' = 567.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object LabelMsgSvm: TLabel
          Left = 2
          Top = 28
          Width = 664
          Height = 13
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
          Align = alBottom
          Alignment = taCenter
          Caption = '  '#1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103' = 34.78'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object LabelMsgCmn: TLabel
          Left = 2
          Top = 15
          Width = 664
          Height = 13
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
          Align = alTop
          Alignment = taCenter
          Caption = '  '#1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103' = 34.78'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object sBtnBackToBln: TSpeedButton
          Left = 604
          Top = 9
          Width = 68
          Height = 24
          Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1084
          Anchors = [akTop, akRight]
          Caption = #1053#1072#1079#1072#1076
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
            44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
            00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
            33833F333383F33300003333AA463362A433333333383F333833F33300003333
            6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
            33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
            6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
            000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
            333383333333F3330000333333322AAA4333333333333833333F333300003333
            333322A4333333333333338333F333330000333333344A433333333333333338
            3F333333000033333336A24333333333333333833F333333000033333336AA43
            33333333333333833F3333330000333333336663333333333333333888333333
            0000}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          Visible = False
          OnClick = sBtnBackToBlnClick
        end
      end
      object DbgrBlnResume: TDBGrid
        Left = 1
        Top = 44
        Width = 668
        Height = 132
        Hint = 
          #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084' ('#1087#1086#1076#1082#1083#1102#1095#1072#1102#1090#1089#1103' '#1082' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084' '#1090#1077#1082 +
          #1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072')'
        Align = alClient
        Color = clBtnFace
        DataSource = DsrcBlnResume
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbgrGridEnter
        OnExit = dbgrGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'VIDN'
            Title.Caption = #1042#1080#1076
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBeg'
            Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtEnd'
            Title.Caption = #1044#1090#1054#1082#1086#1085#1095'.'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CntDays'
            Title.Caption = #1044#1085#1077#1081
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CntChas'
            Title.Caption = #1063#1072#1089#1086#1074
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Smm'
            Title.Caption = #1057#1091#1084'.'#1054#1089#1085
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmmSovm'
            Title.Caption = #1057#1091#1084'.'#1057#1086#1074#1084
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Title.Caption = #1055#1088#1080#1084#1077#1095'.'
            Width = 34
            Visible = True
          end>
      end
    end
    object PanelRTop: TPanel
      Left = 0
      Top = 0
      Width = 670
      Height = 332
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PanelRTop'
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 668
        Height = 330
        ActivePage = TabByMes
        Align = alClient
        Constraints.MinHeight = 330
        Style = tsButtons
        TabOrder = 0
        object TabByMes: TTabSheet
          Caption = 'TabByMes'
          object DbgrRBln: TDBGrid
            Left = 0
            Top = 0
            Width = 660
            Height = 299
            Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
            Align = alClient
            DataSource = DsrcRBln
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DbgrRBlnDrawColumnCell
            OnDblClick = dbgridDblClick
            OnEnter = dbgrGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'RusMesGod'
                ReadOnly = True
                Title.Caption = #1052#1077#1089'. '#1043#1086#1076
                Width = 59
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMZARABOTKA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOEFZP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CNTDAYS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmZpKoef'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SM_SVM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clTeal
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 81
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNTDAYS_SVM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clTeal
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clTeal
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SPEC_NR'
                Width = 2
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MYFOXFLD'
                Title.Caption = 'MyFoxFld'
                Width = 2
                Visible = True
              end>
          end
        end
        object TabByOkl: TTabSheet
          Caption = 'TabByOkl'
          ImageIndex = 1
          object LabelRSrOkl: TLabel
            Left = 0
            Top = 0
            Width = 636
            Height = 26
            Align = alTop
            Alignment = taCenter
            Caption = 
              #1042' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1086#1073#1088#1072#1085#1099' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086#1073' '#1086#1082#1083#1072#1076#1077' ('#1090#1072#1088#1080#1092#1077') '#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1093' '#1085#1072' '#1085#1072#1095 +
              #1072#1083#1086' '#1086#1090#1087#1091#1089#1082#1072'. '#1045#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1074#1085#1077#1089#1080#1090#1077' '#1087#1086#1087#1088#1072#1074#1082#1080', '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1064#1072#1075 +
              ' 3"'
            WordWrap = True
          end
          object dbgrRSrOkl: TDBGrid
            Left = 0
            Top = 26
            Width = 660
            Height = 273
            Align = alClient
            DataSource = DsrcRBln
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbgrGridEnter
            OnExit = dbGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'NMPOKAZ'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                ReadOnly = True
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                ReadOnly = True
                Width = 63
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SP'
                ReadOnly = True
                Width = 16
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMPROC'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMVZACHET'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNTDAYS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clMaroon
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 40
                Visible = True
              end>
          end
        end
        object TabStornOtp: TTabSheet
          Caption = 'TabStornOtp'
          ImageIndex = 2
          DesignSize = (
            660
            299)
          object Splitter2: TSplitter
            Left = 0
            Top = 151
            Width = 660
            Height = 3
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clTeal
            ParentColor = False
          end
          object dbgrOtkl: TDBGrid
            Left = 0
            Top = 0
            Width = 660
            Height = 151
            Hint = #1047#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
            Align = alTop
            Color = clCream
            DataSource = dsrcOtkl
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = popOtkl
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrOtklDrawColumnCell
            OnDblClick = dbgrOtklDblClick
            OnEnter = dbgrGridEnter
            OnExit = dbgrGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                Width = 16
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTPROC'
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZAMESGOD'
                Width = 33
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAS'
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMMA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Width = 11
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SPEC_NR'
                Width = 2
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MYNOTES'
                Width = 2
                Visible = True
              end>
          end
          object dbgrStorn: TDBGrid
            Left = 0
            Top = 154
            Width = 660
            Height = 145
            Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
            Align = alClient
            Color = clInfoBk
            DataSource = dsrcStorn
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrStornDrawColumnCell
            OnEnter = dbgrGridEnter
            OnExit = dbgrGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                ReadOnly = True
                Width = 17
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTPROC'
                ReadOnly = True
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZAMESGOD'
                ReadOnly = True
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTSTORN'
                Width = 31
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                ReadOnly = True
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAS'
                ReadOnly = True
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMMA'
                ReadOnly = True
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDOBJ'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KDKATP'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SPEC_NR'
                Width = 3
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MYNOTES'
                Width = 4
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SVDTBEG'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SVDTEND'
                Visible = False
              end>
          end
          object LbxStornRec: TListBox
            Left = 555
            Top = 56
            Width = 66
            Height = 65
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
            Visible = False
          end
        end
      end
    end
  end
  object dsrcVBln: TDataSource
    Left = 336
    Top = 184
  end
  object qryTmp: TQuery
    Left = 536
    Top = 216
  end
  object tblRBln: TTable
    OnCalcFields = tblRBlnCalcFields
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'VIDN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'CntDays'
        DataType = ftSmallint
      end
      item
        Name = 'CntChas'
        DataType = ftFloat
      end
      item
        Name = 'Smm'
        DataType = ftFloat
      end
      item
        Name = 'SmmSovm'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 't__RBln'
    Left = 276
    Top = 392
    object tblRBlnDtProc: TDateField
      FieldName = 'DtProc'
    end
    object tblRBlnVIDN: TStringField
      FieldName = 'VIDN'
      Size = 4
    end
    object tblRBlnShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object tblRBlnDtBeg: TDateField
      FieldName = 'DtBeg'
      DisplayFormat = 'dd/mm/yy'
    end
    object tblRBlnDtEnd: TDateField
      FieldName = 'DtEnd'
      DisplayFormat = 'dd/mm/yy'
    end
    object tblRBlnCntDays: TSmallintField
      FieldName = 'CntDays'
    end
    object tblRBlnCntChas: TFloatField
      FieldName = 'CntChas'
      DisplayFormat = '#.00'
    end
    object tblRBlnSmm: TFloatField
      FieldName = 'Smm'
      DisplayFormat = '0.00'
    end
    object tblRBlnSmmSovm: TFloatField
      FieldName = 'SmmSovm'
      DisplayFormat = '0.00'
    end
    object tblRBlnNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
    object tblRBlnSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
  end
  object DsrcBlnResume: TDataSource
    DataSet = tblRBln
    Left = 288
    Top = 408
  end
  object DsrcRBln: TDataSource
    OnDataChange = DsrcRBlnDataChange
    OnUpdateData = DsrcRBlnUpdateData
    Left = 400
    Top = 184
  end
  object popMnu: TPopupMenu
    Left = 293
    Top = 80
    object popHead: TMenuItem
      Caption = '== '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072#1093' =='
      Enabled = False
    end
    object popNuDetails: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093
      OnClick = dbgridDblClick
    end
  end
  object tblSvRBln: TTable
    DatabaseName = 'Es_Ind'
    TableName = 't_SvRBln'
    Left = 593
    Top = 99
  end
  object qryOtkl: TQuery
    OnCalcFields = qryOtklCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select * from Z_Otkl where TabN = 1239 and DtProc >= "05/01/2007' +
        '"'
      '                               and VidN = "2404"'
      '')
    Left = 456
    Top = 400
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklDTSTORN: TDateTimeField
      DisplayLabel = #1057#1090#1086#1088#1085#1052#1077#1089
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryOtklKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object qryOtklSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 472
    Top = 408
  end
  object cdsF8: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SvDtBeg'
        DataType = ftDate
      end
      item
        Name = 'StornDtBeg'
        DataType = ftDate
      end
      item
        Name = 'SvDtEnd'
        DataType = ftDate
      end
      item
        Name = 'StornDtEnd'
        DataType = ftDate
      end
      item
        Name = 'StornFull'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 512
    Top = 397
    object cdsF8NR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsF8ZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object cdsF8SvDtBeg: TDateField
      FieldName = 'SvDtBeg'
    end
    object cdsF8StornDtBeg: TDateField
      FieldName = 'StornDtBeg'
    end
    object cdsF8SvDtEnd: TDateField
      FieldName = 'SvDtEnd'
    end
    object cdsF8StornDtEnd: TDateField
      FieldName = 'StornDtEnd'
    end
    object cdsF8StornFull: TBooleanField
      FieldName = 'StornFull'
    end
  end
  object dsrcF8: TDataSource
    DataSet = cdsF8
    Left = 524
    Top = 412
  end
  object qryTmpOtp: TQuery
    Left = 568
    Top = 397
  end
  object popOtkl: TPopupMenu
    Left = 416
    Top = 400
    object popOtklStornPart: TMenuItem
      Caption = 'C'#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '
      Hint = 
        #1055#1088#1077#1076#1083#1072#1075#1072#1077#1090#1089#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1083#1086#1075', '#1095#1090#1086#1073#1099' '#1074#1074#1077#1089#1090#1080' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086 +
        #1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1090#1086#1088#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      OnClick = popOtklStornPartClick
    end
    object popOtklDelStorn: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1059#1076#1072#1083#1103#1077#1090#1089#1103' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1080
      OnClick = popOtklDelStornClick
    end
  end
  object qryStorn: TQuery
    CachedUpdates = True
    OnCalcFields = qryStornCalcFields
    OnNewRecord = qryStornNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select Cast(Null as Date) as SvDtBeg, Cast(Null as Date) as SvDt' +
        'End, '
      
        '    o.* from Z_Otkl  o where o.TabN = 3107 and o.DtProc >= "05/0' +
        '1/2007"'
      '                               and o.VidN = "2404"')
    UpdateObject = updStorn
    Left = 456
    Top = 440
    object qryStornNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryStornKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryStornDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryStornZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryStornDTSTORN: TDateTimeField
      DisplayLabel = #1057#1090#1086#1088#1085#1052#1077#1089
      FieldName = 'DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object qryStornTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryStornVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryStornShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryStornOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object qryStornCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object qryStornSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryStornOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryStornKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object qryStornKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object qryStornDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryStornDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryStornPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryStornKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryStornNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
    end
    object qryStornPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryStornPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryStornKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryStornPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryStornSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryStornDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object qryStornNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryStornMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryStornSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object qryStornPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object qryStornSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryStornSVDTBEG: TDateTimeField
      FieldName = 'SVDTBEG'
    end
    object qryStornSVDTEND: TDateTimeField
      FieldName = 'SVDTEND'
    end
  end
  object dsrcStorn: TDataSource
    DataSet = qryStorn
    Left = 472
    Top = 456
  end
  object updStorn: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Otkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  DTSTORN = :DTSTORN,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  PBNK = :PBNK,'
      '  STORN = :STORN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Otkl'
      
        '  (KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, SUMMA, KD' +
        'OBJ, KDKATP, '
      
        '   DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, KTO, PRKR, SPEC' +
        '_NR, DTVDPV, '
      '   NRVDPV, MYNOTES, SPECPS, PBNK, STORN)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, :S' +
        'UMMA, :KDOBJ, '
      
        '   :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, :PRR, :PRPV,' +
        ' :KTO, '
      
        '   :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, :SPECPS, :PBNK, ' +
        ':STORN)')
    DeleteSQL.Strings = (
      'delete from z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 488
    Top = 472
  end
  object TblDM: TTable
    FieldDefs = <
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'PlusB'
        DataType = ftSmallint
      end
      item
        Name = 'MinusB'
        DataType = ftSmallint
      end
      item
        Name = 'NoVid'
        DataType = ftSmallint
      end>
    StoreDefs = True
    Left = 353
    Top = 277
  end
  object tblDbg: TTable
    Left = 393
    Top = 277
  end
  object qryTmp2: TQuery
    Left = 576
    Top = 216
  end
  object QryPeek: TQuery
    Left = 789
    Top = 212
  end
end
