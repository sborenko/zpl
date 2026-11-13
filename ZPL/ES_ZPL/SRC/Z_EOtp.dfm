object FormEOtp: TFormEOtp
  Left = 195
  Top = 164
  Width = 788
  Height = 632
  BorderIcons = [biSystemMenu]
  Caption = 'FormEOtp'
  Color = clBtnFace
  Constraints.MinHeight = 632
  Constraints.MinWidth = 660
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
  object Label9: TLabel
    Left = 6
    Top = 52
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label14: TLabel
    Left = 83
    Top = 52
    Width = 49
    Height = 13
    Caption = #1050'-'#1074#1086' '#1076#1085#1077#1081
  end
  object Label15: TLabel
    Left = 136
    Top = 52
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 478
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label5: TLabel
      Left = 6
      Top = 42
      Width = 83
      Height = 13
      AutoSize = False
      Caption = #1042#1080#1076' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
    end
    object sBtnVidN: TSpeedButton
      Left = 228
      Top = 38
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
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
      OnClick = sBtnVidNClick
    end
    object LabelFamIO: TLabel
      Left = 112
      Top = 10
      Width = 134
      Height = 14
      AutoSize = False
      Caption = 'LabelFamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object LabelTabN: TLabel
      Left = 6
      Top = 10
      Width = 33
      Height = 13
      Caption = #1058#1072#1073' '#8470
      FocusControl = dbeTabN
    end
    object sBtnUpi: TSpeedButton
      Left = 90
      Top = 6
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
      OnClick = sBtnUpiClick
    end
    object LabelDtBeg: TLabel
      Left = 6
      Top = 63
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object Label13: TLabel
      Left = 103
      Top = 63
      Width = 49
      Height = 13
      Caption = #1050'-'#1074#1086' '#1076#1085#1077#1081
    end
    object Label4: TLabel
      Left = 168
      Top = 63
      Width = 61
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 31
      Width = 234
      Height = 9
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 6
      Top = 356
      Width = 52
      Height = 13
      Caption = #1055#1088#1080#1082#1072#1079' '#8470
      FocusControl = dbeNrPrik
    end
    object Label2: TLabel
      Left = 79
      Top = 356
      Width = 43
      Height = 13
      Caption = #1086#1090' ('#1076#1072#1090#1072')'
      FocusControl = dbeDtPrik
    end
    object Label7: TLabel
      Left = 189
      Top = 356
      Width = 48
      Height = 13
      Caption = '% '#1086#1087#1083#1072#1090#1099
      FocusControl = dbeProcOpl
    end
    object Label8: TLabel
      Left = 6
      Top = 276
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FocusControl = dbeShObj
    end
    object Label10: TLabel
      Left = 152
      Top = 276
      Width = 86
      Height = 13
      Caption = #1050#1072#1090#1077#1075'.'#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FocusControl = dbeShKatP
    end
    object Label11: TLabel
      Left = 6
      Top = 443
      Width = 42
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095'.'
      FocusControl = dbeNotes
      Transparent = True
    end
    object sBtnObj: TSpeedButton
      Left = 80
      Top = 290
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
      Left = 228
      Top = 290
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
      Left = 199
      Top = 319
      Width = 41
      Height = 13
      Caption = #1057#1095#1077#1090' '#1041#1059
      FocusControl = dbeSPZ
    end
    object sBtnSPZ: TSpeedButton
      Left = 228
      Top = 334
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1095#1041#1059')'
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
    object LabelKoefOkl: TLabel
      Left = 53
      Top = 394
      Width = 166
      Height = 13
      Hint = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1086#1074#1099#1096#1077#1085#1080#1103' '#1086#1082#1083#1072#1076#1072
      Alignment = taRightJustify
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1086#1082#1083#1072#1076#1072
      ParentShowHint = False
      ShowHint = True
    end
    object LabelNchBudMes: TLabel
      Left = 6
      Top = 410
      Width = 105
      Height = 29
      Hint = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076'.'#1084#1077#1089#1103#1094#1072' '#1076#1086' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object LabelMatPom: TLabel
      Left = 155
      Top = 410
      Width = 65
      Height = 29
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1083#1072#1075#1072#1077#1084#1091#1102' '#1084#1072#1090#1087#1086#1084#1086#1097#1100' '#1082' '#1086#1090#1087#1091#1089#1082#1085#1099#1084
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1084#1072#1090'.'#1087#1086#1084#1086#1097#1100
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object Label6: TLabel
      Left = 5
      Top = 315
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
      Left = 132
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
    object rGrpAlgoritm: TGroupBox
      Left = 8
      Top = 105
      Width = 233
      Height = 70
      Caption = ' '#1040#1083#1075#1086#1088#1080#1090#1084' '#1088#1072#1089#1095#1077#1090#1072' '
      TabOrder = 6
      object RBtnByLast12m: TRadioButton
        Left = 24
        Top = 16
        Width = 189
        Height = 17
        Caption = #1087#1086' 12-'#1090#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1084#1077#1089#1103#1094#1072#1084
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RBtnByLast12mClick
      end
      object RBtnByLastOkl: TRadioButton
        Left = 24
        Top = 50
        Width = 189
        Height = 17
        Caption = #1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1084#1091' '#1086#1082#1083#1072#1076#1091
        TabOrder = 2
        OnClick = RBtnByLast12mClick
      end
      object RBtnBy2023: TRadioButton
        Left = 24
        Top = 33
        Width = 189
        Height = 17
        Caption = #1087#1086' 2023-'#1084#1091' '#1075#1086#1076#1091
        TabOrder = 1
        OnClick = RBtnByLast12mClick
      end
    end
    object GrBoxSps: TGroupBox
      Left = 8
      Top = 231
      Width = 233
      Height = 36
      Caption = ' '#1057#1087#1086#1089#1086#1073' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1091#1084#1084' '#1076#1083#1103' '#1086#1090#1087#1091#1089#1085#1099#1093' '
      TabOrder = 8
      object rBtnAllSps: TRadioButton
        Left = 24
        Top = 16
        Width = 85
        Height = 17
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1089#1091#1084#1084#1099' '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1080#1089#1082#1072#1084
        Caption = #1074#1089#1077' '#1089#1087#1080#1089#1082#1080
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = rBtnAllSpsClick
      end
      object rBtnOnlyCurSps: TRadioButton
        Left = 115
        Top = 16
        Width = 96
        Height = 17
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1089#1091#1084#1084#1099' "'#1089#1074#1086#1077#1075#1086'" '#1089#1087#1080#1089#1082#1072
        Caption = #1090#1086#1083#1100#1082#1086' "'#1089#1074#1086#1081'"'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = True
        OnClick = rBtnOnlyCurSpsClick
      end
    end
    object dbeTabN: TDBEdit
      Left = 45
      Top = 6
      Width = 46
      Height = 21
      TabStop = False
      DataField = 'TABN'
      DataSource = dsrcVOtp
      TabOrder = 0
      OnEnter = dbeEnter
      OnExit = dbeTabNExit
    end
    object dbeShVidN: TDBEdit
      Left = 128
      Top = 38
      Width = 97
      Height = 21
      Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072' '#1086#1090#1087#1091#1089#1082#1072
      DataField = 'ShVidN'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShVidNKeyDown
    end
    object dbeVidN: TDBEdit
      Left = 86
      Top = 38
      Width = 37
      Height = 21
      Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1086#1090#1087#1091#1089#1082#1072
      TabStop = False
      DataField = 'VIDN'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShVidNKeyDown
    end
    object dbeDtBeg: TDBEdit
      Left = 6
      Top = 77
      Width = 78
      Height = 21
      Hint = #1055#1077#1088#1074#1099#1081' '#1076#1077#1085#1100' '#1086#1090#1087#1091#1089#1082#1072
      DataField = 'DTBEG'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnEnter = dbeEnter
      OnExit = dbeDtBegExit
    end
    object dbeCntDays: TDBEdit
      Left = 103
      Top = 77
      Width = 37
      Height = 21
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1086#1090#1087#1091#1089#1082#1072
      DataField = 'CNTDAYS'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnEnter = dbeEnter
      OnExit = dbeCntDaysExit
    end
    object dbeDtEnd: TDBEdit
      Left = 168
      Top = 77
      Width = 78
      Height = 21
      Hint = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1086#1090#1087#1091#1089#1082#1072
      TabStop = False
      Color = clBtnFace
      DataField = 'DTEND'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
      OnEnter = dbeEnter
      OnExit = dbeDtEndExit
    end
    object GrBoxDayType: TGroupBox
      Left = 8
      Top = 176
      Width = 233
      Height = 53
      Caption = ' '#1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1072' '
      TabOrder = 7
      object RBtnWorkDays: TRadioButton
        Left = 24
        Top = 16
        Width = 113
        Height = 17
        Caption = #1074' '#1088#1072#1073#1086#1095#1080#1093' '#1076#1085#1103#1093
        TabOrder = 0
      end
      object RBtnCalendDays: TRadioButton
        Left = 24
        Top = 33
        Width = 113
        Height = 17
        Caption = #1074' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1103#1093
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object dbeProcOpl: TDBEdit
      Left = 189
      Top = 370
      Width = 54
      Height = 21
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1087#1083#1072#1090#1099' '#1086#1090#1087#1091#1089#1082#1072
      DataField = 'PROCOPL'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeShObj: TDBEdit
      Left = 6
      Top = 290
      Width = 75
      Height = 21
      Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      DataField = 'ShObj'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnDblClick = sBtnObjClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShObjKeyDown
    end
    object dbeShKatP: TDBEdit
      Left = 152
      Top = 290
      Width = 75
      Height = 21
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      DataField = 'ShKatP'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnDblClick = sBtnKatPClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShKatPKeyDown
    end
    object dbeNotes: TDBEdit
      Left = 56
      Top = 440
      Width = 187
      Height = 21
      Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' "'#1085#1072' '#1087#1072#1084#1103#1090#1100'"'
      DataField = 'NOTES'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeSPZ: TDBEdit
      Left = 152
      Top = 334
      Width = 74
      Height = 21
      Hint = #1057#1095#1077#1090' '#1041#1059' ('#1082#1072#1082' '#1087#1088#1072#1074#1080#1083#1086', '#1086#1089#1085#1086#1074#1085#1086#1081' '#1057#1095#1041#1059' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072')'
      DataField = 'SPZ'
      DataSource = dsrcVOtp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnDblClick = sBtnSPZClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeSPZKeyDown
    end
    object dbChBoxKoefOkl: TDBCheckBox
      Left = 226
      Top = 394
      Width = 17
      Height = 17
      Hint = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1086#1074#1099#1096#1077#1085#1080#1103' '#1086#1082#1083#1072#1076#1072
      Alignment = taLeftJustify
      Color = clBtnFace
      DataField = 'USEKOEFOKL'
      DataSource = dsrcVOtp
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      ValueChecked = '1'
      ValueUnchecked = '0'
      WordWrap = True
      OnEnter = dbChBoxKoefOklEnter
      OnExit = dbChBoxKoefOklExit
    end
    object dbeDtPrik: TDBEdit
      Left = 79
      Top = 370
      Width = 79
      Height = 21
      Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1090#1087#1091#1089#1082#1077
      DataField = 'DTPRIK'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeNrPrik: TDBEdit
      Left = 6
      Top = 370
      Width = 71
      Height = 21
      Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1090#1087#1091#1089#1082#1077
      DataField = 'NRPRIK'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbChBoxNchBudMes: TDBCheckBox
      Left = 119
      Top = 418
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      DataField = 'NCHBUDMES'
      DataSource = dsrcVOtp
      Enabled = False
      TabOrder = 20
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnEnter = dbChBoxKoefOklEnter
      OnExit = dbChBoxKoefOklExit
    end
    object dbChBoxMatPom: TDBCheckBox
      Left = 226
      Top = 418
      Width = 17
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1083#1072#1075#1072#1077#1084#1091#1102' '#1084#1072#1090#1087#1086#1084#1086#1097#1100' '#1082' '#1086#1090#1087#1091#1089#1082#1085#1099#1084
      Alignment = taLeftJustify
      DataField = 'NCHMATPOM'
      DataSource = dsrcVOtp
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnEnter = dbChBoxKoefOklEnter
      OnExit = dbChBoxKoefOklExit
    end
    object dbeKdTemu: TDBEdit
      Left = 5
      Top = 332
      Width = 40
      Height = 21
      Hint = #1050#1086#1076' '#1090#1077#1084#1099
      DataField = 'KdTemu'
      DataSource = dsrcVOtp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnDblClick = sBtnKdTemuClick
      OnEnter = dbeEnter
      OnExit = dbeKdTemuExit
      OnKeyDown = dbeKdTemuKeyDown
    end
    object dbeNmTemu: TDBEdit
      Left = 49
      Top = 332
      Width = 81
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
      TabStop = False
      Color = clBtnFace
      DataField = 'NmTemu'
      DataSource = dsrcVOtp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnDblClick = sBtnKdTemuClick
      OnKeyDown = dbeKdTemuKeyDown
    end
    object dbeKdSpZ: TDBEdit
      Left = 113
      Top = 310
      Width = 73
      Height = 21
      TabStop = False
      DataField = 'KDSPZ'
      DataSource = dsrcVOtp
      TabOrder = 12
      Visible = False
    end
    object dbeKdObj: TDBEdit
      Left = 99
      Top = 289
      Width = 33
      Height = 21
      Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      DataField = 'KDOBJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      OnDblClick = sBtnObjClick
    end
    object LbxFilter: TListBox
      Left = 187
      Top = 444
      Width = 59
      Height = 21
      Color = clLime
      ItemHeight = 13
      Items.Strings = (
        '2400-2500 // '#1058#1086#1083#1100#1082#1086' '#1086#1090#1087#1091#1089#1082#1085#1099#1077)
      TabOrder = 23
      Visible = False
    end
  end
  object PanelRight: TPanel
    Left = 249
    Top = 0
    Width = 531
    Height = 478
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 249
      Width = 531
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clAqua
      ParentColor = False
    end
    object PanelRBottom: TPanel
      Left = 0
      Top = 252
      Width = 531
      Height = 226
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PanelResults: TPanel
        Left = 0
        Top = 0
        Width = 531
        Height = 30
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Constraints.MaxHeight = 30
        Constraints.MinHeight = 30
        TabOrder = 0
        DesignSize = (
          531
          30)
        object LabelMsg1: TLabel
          Left = 8
          Top = 2
          Width = 505
          Height = 13
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = #1057#1091#1084#1084#1072' '#1079#1072#1088#1072#1073#1086#1090#1082#1086#1074' = 3456.56, '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' = 567.'
          ParentShowHint = False
          ShowHint = True
        end
        object LabelMsg2: TLabel
          Left = 8
          Top = 15
          Width = 505
          Height = 13
          Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1086#1075#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '  '#1057#1088#1077#1076#1085#1077#1076#1085#1077#1074#1085#1072#1103' = 34.78'
          ParentShowHint = False
          ShowHint = True
        end
      end
      object DbgrMnthRes: TDBGrid
        Left = 0
        Top = 30
        Width = 531
        Height = 196
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084
        Align = alClient
        Color = clBtnFace
        DataSource = DsrcMnthRes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbgridEnter
        OnExit = dbgridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'VIDN'
            Title.Caption = #1042#1080#1076
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtProc'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBeg'
            Title.Caption = #1044#1090#1053#1072#1095#1072#1083#1072
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtEnd'
            Title.Caption = #1044#1090#1054#1082#1086#1085#1095'.'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CntDays'
            Title.Caption = #1044#1085#1077#1081
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CntChas'
            Title.Caption = #1063#1072#1089#1086#1074
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Smm'
            Title.Caption = #1057#1091#1084#1084#1072
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Title.Caption = #1055#1088#1080#1084#1077#1095'.'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
    end
    object PanelRTop: TPanel
      Left = 0
      Top = 0
      Width = 531
      Height = 249
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 18
        Width = 531
        Height = 231
        ActivePage = tsBy12mes
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object tsBy12mes: TTabSheet
          Caption = 'tsBy12mes'
          object DbgrROtp: TDBGrid
            Left = 0
            Top = 0
            Width = 523
            Height = 200
            Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
            Align = alClient
            DataSource = DsrcROtp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DbgrROtpDblClick
            OnEnter = dbgridEnter
            OnExit = dbgridExit
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'RusMesGod'
                ReadOnly = True
                Title.Caption = #1052#1077#1089'. '#1043#1086#1076
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMOKLADA'
                ReadOnly = True
                Title.Caption = #1054#1082#1083#1072#1076
                Width = 55
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
                Width = 46
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
                Width = 36
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmZpKoef'
                Title.Caption = #1057#1084#1084#1042#1047#1072#1095#1077#1090
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MYFOXFLD'
                Width = 22
                Visible = True
              end>
          end
        end
        object tsByOkl: TTabSheet
          Caption = 'tsByOkl'
          ImageIndex = 1
          object LabelRSrOkl: TLabel
            Left = 0
            Top = 0
            Width = 481
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
            Width = 241
            Height = 174
            Align = alLeft
            DataSource = dsrcRSrOkl
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnEnter = dbgridEnter
            OnExit = dbgridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'NMPOKAZ'
                ReadOnly = True
                Width = 51
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
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MinSal'
                Visible = True
              end>
          end
          object Memo2023Log: TMemo
            Left = 272
            Top = 48
            Width = 185
            Height = 89
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
          end
        end
      end
      object PanelSovmMsg: TPanel
        Left = 0
        Top = 0
        Width = 531
        Height = 18
        Align = alTop
        Caption = #1041#1077#1079' "'#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093'" '#1074#1080#1076#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 577
    Width = 780
    Height = 28
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      780
      28)
    object sBtnStep2: TSpeedButton
      Left = 55
      Top = 2
      Width = 52
      Height = 25
      Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1080' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Anchors = [akLeft, akBottom]
      Caption = #1064#1072#1075' 2'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep2Click
    end
    object sBtnStep3: TSpeedButton
      Left = 109
      Top = 2
      Width = 52
      Height = 25
      Hint = #1056#1072#1089#1095#1077#1090' '#1082#1086#1085#1077#1095#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
      Anchors = [akLeft, akBottom]
      Caption = #1064#1072#1075' 3'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep3Click
    end
    object sBtnStep1: TSpeedButton
      Left = 0
      Top = 2
      Width = 52
      Height = 25
      Hint = #1042#1074#1086#1076' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      Caption = #1064#1072#1075' 1'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep1Click
    end
    object sBtnPrt: TSpeedButton
      Left = 193
      Top = 2
      Width = 64
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1087#1091#1089#1082#1085#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
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
      Left = 166
      Top = 2
      Width = 25
      Height = 25
      Hint = #1050#1072#1083#1077#1085#1076#1072#1088#1100
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
    object LabelLastDtPriem: TLabel
      Left = 261
      Top = 15
      Width = 100
      Height = 13
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' ('#1087#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1086#1090#1087#1091#1089#1082#1072') '#1076#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
      Caption = 'LabelLastDtPriem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object sBtnShwStorn: TSpeedButton
      Left = 615
      Top = 2
      Width = 23
      Height = 25
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnShwStornClick
    end
    object LabelMsgDtPriem: TLabel
      Left = 261
      Top = 0
      Width = 67
      Height = 13
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' ('#1087#1077#1088#1077#1076' '#1085#1072#1095#1072#1083#1086#1084' '#1076#1077#1082#1088#1077#1090#1072') '#1076#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1105#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object bBtnVvod: TBitBtn
      Left = 640
      Top = 2
      Width = 64
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      Default = True
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bBtnVvodClick
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
      Left = 706
      Top = 2
      Width = 64
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
      Left = 513
      Top = 2
      Width = 100
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1080' '#1089' '#1085#1077#1084#1077#1076#1083#1077#1085#1085#1099#1084' '#1087#1077#1088#1077#1089#1095#1077#1090#1086#1084
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      Enabled = False
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
  end
  object PanelStorn: TPanel
    Left = 0
    Top = 478
    Width = 780
    Height = 99
    Align = alBottom
    TabOrder = 3
    Visible = False
    object Label3: TLabel
      Left = 38
      Top = 26
      Width = 133
      Height = 53
      Alignment = taCenter
      AutoSize = False
      Caption = #1042' '#1090#1072#1073#1083#1080#1094#1077' '#1089#1087#1088#1072#1074#1072' '#1089#1090#1086#1088#1085#1080#1088#1091#1102#1097#1080#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1076#1072#1085#1085#1086#1084#1091' '#1086#1090#1087#1091#1089#1082#1091
      WordWrap = True
    end
    object dbgrStorn: TDBGrid
      Left = 256
      Top = 1
      Width = 523
      Height = 97
      Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clCream
      DataSource = dsrcStorn
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrStornDrawColumnCell
      OnEnter = dbgridEnter
      OnExit = dbgridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'DTPROC'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHVIDN'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAS'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 57
          Visible = True
        end>
    end
  end
  object qryVOtp: TQuery
    CachedUpdates = True
    BeforePost = qryVOtpBeforePost
    AfterPost = qryVOtpAfterPost
    AfterDelete = qryVOtpAfterDelete
    OnCalcFields = qryVOtpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_vOtp')
    UpdateObject = updVOtp
    Left = 192
    Top = 8
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VOTP.KDSPS'
    end
    object qryVOtpDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
    end
    object qryVOtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object qryVOtpCUROKLTRF: TFloatField
      FieldName = 'CUROKLTRF'
      Origin = 'DbMain.Z_VOTP.CUROKLTRF'
    end
    object qryVOtpALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
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
    object qryVOtpDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVOtpCNTDAYS: TSmallintField
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVOtpNRPRIK: TStringField
      FieldName = 'NRPRIK'
      Origin = 'DbMain.Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      FieldName = 'DTPRIK'
      Origin = 'DbMain.Z_VOTP.DTPRIK'
      OnSetText = qryVOtpDTPRIKSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVOtpCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object qryVOtpVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VOTP.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVOtpShVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 10
      Lookup = True
    end
    object qryVOtpNmVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'NmVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'NMVIDN'
      KeyFields = 'VIDN'
      Size = 64
      Lookup = True
    end
    object qryVOtpPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object qryVOtpKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VOTP.KDTEMU'
    end
    object qryVOtpNmTemu: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1090#1077#1084#1099
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 35
      Calculated = True
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object qryVOtpShObj: TStringField
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object qryVOtpShKatP: TStringField
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object qryVOtpNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      FieldName = 'SMOTP'
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VOTP.KDSPZ'
    end
    object qryVOtpSPZ: TStringField
      FieldKind = fkLookup
      FieldName = 'SPZ'
      LookupDataSet = DmMain.qrySBU_LU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCH_17'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    Left = 200
    Top = 16
  end
  object updVOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_vOtp'
      'set'
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
      'insert into z_vOtp'
      
        '  (KDSPS, DTPROC, TABN, CUROKLTRF, ALGRASCH, USEKOEFOKL, NCHMATP' +
        'OM, NCHBUDMES, '
      
        '   RK, NRPRIK, DTPRIK, DTBEG, CNTDAYS, DTEND, CNTCHAS, VIDN, PRO' +
        'COPL, KDTEMU, '
      '   KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, SPEC_NR, SMOTP)'
      'values'
      
        '  (:KDSPS, :DTPROC, :TABN, :CUROKLTRF, :ALGRASCH, :USEKOEFOKL, :' +
        'NCHMATPOM, '
      
        '   :NCHBUDMES, :RK, :NRPRIK, :DTPRIK, :DTBEG, :CNTDAYS, :DTEND, ' +
        ':CNTCHAS, '
      
        '   :VIDN, :PROCOPL, :KDTEMU, :KDOBJ, :KDKATP, :KDSPZ, :NOTES, :S' +
        'MSRDN, '
      '   :SPEC_NR, :SMOTP)')
    DeleteSQL.Strings = (
      'delete from z_vOtp'
      'where'
      '  NR = :OLD_NR')
    Left = 216
    Top = 24
  end
  object qryTmp: TQuery
    Left = 336
    Top = 184
  end
  object DsrcMnthRes: TDataSource
    DataSet = CdsMnthRes
    Left = 352
    Top = 336
  end
  object QryROtp: TQuery
    CachedUpdates = True
    AfterPost = QryROtpAfterPost
    OnCalcFields = QryROtpCalcFields
    OnNewRecord = QryROtpNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select ro.*, Cast(-1 As SmallInt) As MyFoxFld '
      ' from Z_ROtp ro'
      ' where ro.Spec_NR = -1')
    UpdateObject = upd_ROtp
    Left = 268
    Top = 104
    object QryROtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_ROTP.NR'
    end
    object QryROtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_ROTP.TABN'
    end
    object QryROtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_ROTP.SPEC_NR'
    end
    object QryROtpZAMESGOD: TDateTimeField
      DisplayLabel = #1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_ROTP.ZAMESGOD'
      DisplayFormat = 'mm-yyyy'
    end
    object QryROtpRusMesGod: TStringField
      FieldKind = fkCalculated
      FieldName = 'RusMesGod'
      Size = 15
      Calculated = True
    end
    object QryROtpSMOKLADA: TFloatField
      FieldName = 'SMOKLADA'
      Origin = 'DbMain.Z_ROTP.SMOKLADA'
      DisplayFormat = '#.00'
    end
    object QryROtpSMZARABOTKA: TFloatField
      DisplayLabel = #1047#1072#1088#1072#1073#1086#1090#1086#1082
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_ROTP.SMZARABOTKA'
      OnChange = QryROtpChange
      DisplayFormat = '#.00'
    end
    object QryROtpKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_ROTP.KOEFZP'
      OnChange = QryROtpChange
    end
    object QryROtpCNTDAYS: TSmallintField
      DisplayLabel = #1044#1085#1077#1081
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_ROTP.CNTDAYS'
      OnChange = QryROtpChange
    end
    object QryROtpSmZpKoef: TFloatField
      DisplayLabel = #1047#1072#1088'_'#1050#1086#1101#1092
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object QryROtpSMDSREDN: TFloatField
      DisplayLabel = #1057#1084#1044#1083#1103#1057#1088#1077#1076#1085
      FieldName = 'SMDSREDN'
      Origin = 'DbMain.Z_ROTP.SMDSREDN'
      DisplayFormat = '#.00'
    end
    object QryROtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_ROTP.KDSPS'
    end
  end
  object DsrcROtp: TDataSource
    DataSet = QryROtp
    OnDataChange = DsrcROtpDataChange
    Left = 280
    Top = 120
  end
  object upd_ROtp: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_ROtp'
      'set'
      '  TABN = :TABN,'
      '  KDSPS = :KDSPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  SMOKLADA = :SMOKLADA,'
      '  SMZARABOTKA = :SMZARABOTKA,'
      '  KOEFZP = :KOEFZP,'
      '  CNTDAYS = :CNTDAYS,'
      '  SMDSREDN = :SMDSREDN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_ROtp'
      
        '  (TABN, KDSPS, SPEC_NR, ZAMESGOD, SMOKLADA, SMZARABOTKA, KOEFZP' +
        ', CNTDAYS, '
      '   SMDSREDN)'
      'values'
      
        '  (:TABN, :KDSPS, :SPEC_NR, :ZAMESGOD, :SMOKLADA, :SMZARABOTKA, ' +
        ':KOEFZP, '
      '   :CNTDAYS, :SMDSREDN)')
    DeleteSQL.Strings = (
      'delete from Z_ROtp'
      'where'
      '  NR = :OLD_NR')
    Left = 296
    Top = 136
  end
  object popMnu: TPopupMenu
    Left = 469
    Top = 112
    object popHead: TMenuItem
      Caption = '== '#1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1079#1072#1088#1072#1073#1086#1090#1082#1072#1093' =='
      Enabled = False
    end
    object popNuDetails: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093
      OnClick = DbgrROtpDblClick
    end
  end
  object dsrcRSrOkl: TDataSource
    DataSet = qryRSrOkl
    Left = 344
    Top = 120
  end
  object qryRSrOkl: TQuery
    CachedUpdates = True
    AfterPost = qryRSrOklAfterPost
    OnCalcFields = qryRSrOklCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select *'
      'from Z_ROTP2')
    UpdateObject = updRSrOkl
    Left = 329
    Top = 107
    object qryRSrOklNR: TIntegerField
      FieldName = 'NR'
    end
    object qryRSrOklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_ROTP2.TABN'
    end
    object qryRSrOklKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryRSrOklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryRSrOklNMPOKAZ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMPOKAZ'
      FixedChar = True
      Size = 12
    end
    object qryRSrOklVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryRSrOklShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 12
      Calculated = True
    end
    object qryRSrOklSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      FixedChar = True
      Size = 1
    end
    object qryRSrOklSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryRSrOklSMVZACHET: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090
      FieldName = 'SMVZACHET'
      DisplayFormat = '#.00'
    end
    object qryRSrOklMinSal: TFloatField
      DisplayLabel = #1052#1080#1085'.'#1047#1055
      FieldName = 'MinSal'
      DisplayFormat = '#.00'
    end
  end
  object updRSrOkl: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_ROTP2'
      'set'
      '  TABN = :TABN,'
      '  KDSPS = :KDSPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  NMPOKAZ = :NMPOKAZ,'
      '  VIDN = :VIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  SMVZACHET = :SMVZACHET,'
      '  MinSal = :MinSal'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_ROTP2'
      '  (TABN, KDSPS, SPEC_NR, NMPOKAZ, VIDN, SUMPROC, SP, SMVZACHET, '
      'MinSal)'
      'values'
      
        '  (:TABN, :KDSPS, :SPEC_NR, :NMPOKAZ, :VIDN, :SUMPROC, :SP, :SMV' +
        'ZACHET, '
      ':MinSal)')
    DeleteSQL.Strings = (
      'delete from Z_ROTP2'
      'where'
      '  NR = :OLD_NR')
    Left = 352
    Top = 136
  end
  object cdsStorn: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SHVIDN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KDSPS'
        DataType = ftSmallint
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'ZAMESGOD'
        DataType = ftDateTime
      end
      item
        Name = 'TABN'
        DataType = ftInteger
      end
      item
        Name = 'VIDN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'OLDKDVIDN'
        DataType = ftSmallint
      end
      item
        Name = 'CHAS'
        DataType = ftFloat
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'OLDKDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'KDKATP'
        DataType = ftSmallint
      end
      item
        Name = 'DT_BEG'
        DataType = ftDateTime
      end
      item
        Name = 'DT_END'
        DataType = ftDateTime
      end
      item
        Name = 'PDN'
        DataType = ftSmallint
      end
      item
        Name = 'KDSPZ'
        DataType = ftSmallint
      end
      item
        Name = 'NOTES'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'PRPV'
        DataType = ftSmallint
      end
      item
        Name = 'KTO'
        DataType = ftSmallint
      end
      item
        Name = 'PRKR'
        DataType = ftSmallint
      end
      item
        Name = 'SPEC_NR'
        DataType = ftInteger
      end
      item
        Name = 'DTVDPV'
        DataType = ftDateTime
      end
      item
        Name = 'NRVDPV'
        DataType = ftInteger
      end
      item
        Name = 'MYNOTES'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'SPECPS'
        DataType = ftInteger
      end
      item
        Name = 'PBNK'
        DataType = ftSmallint
      end
      item
        Name = 'STORN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspStorn'
    StoreDefs = True
    Left = 312
    Top = 480
    object cdsStornSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsStornNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsStornKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object cdsStornDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsStornZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsStornTABN: TIntegerField
      FieldName = 'TABN'
    end
    object cdsStornVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsStornOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object cdsStornCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object cdsStornSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object cdsStornOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object cdsStornKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object cdsStornKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object cdsStornDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsStornDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsStornPDN: TSmallintField
      FieldName = 'PDN'
    end
    object cdsStornKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsStornNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsStornPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsStornPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object cdsStornKTO: TSmallintField
      FieldName = 'KTO'
    end
    object cdsStornPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object cdsStornSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object cdsStornDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object cdsStornNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object cdsStornMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object cdsStornSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object cdsStornPBNK: TSmallintField
      FieldName = 'PBNK'
    end
    object cdsStornSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcStorn: TDataSource
    DataSet = cdsStorn
    Left = 328
    Top = 496
  end
  object qryStorn: TQuery
    DatabaseName = 'DbMain'
    Left = 264
    Top = 478
  end
  object dspStorn: TDataSetProvider
    DataSet = qryStorn
    Options = [poAllowCommandText]
    Left = 280
    Top = 496
  end
  object tblDbg: TTable
    Left = 281
    Top = 213
  end
  object qryTmp2: TQuery
    Left = 368
    Top = 184
  end
  object QryMinSals: TQuery
    Left = 489
    Top = 364
  end
  object CdsMnthRes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'VidN'
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
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Spec_Nr'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 337
    Top = 324
    object CdsMnthResDtProc: TDateField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object CdsMnthResVIDN: TStringField
      FieldName = 'VIDN'
      Size = 4
    end
    object CdsMnthResDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object CdsMnthResDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object CdsMnthResCntDays: TSmallintField
      FieldName = 'CntDays'
    end
    object CdsMnthResCntChas: TFloatField
      FieldName = 'CntChas'
      DisplayFormat = '#.00'
    end
    object CdsMnthResSmm: TFloatField
      FieldName = 'Smm'
      DisplayFormat = '#.00'
    end
    object CdsMnthResNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
    object CdsMnthResSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
  end
end
