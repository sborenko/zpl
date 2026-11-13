object FormEBln: TFormEBln
  Left = 416
  Top = 213
  Width = 761
  Height = 650
  BorderIcons = [biSystemMenu]
  Caption = 'FormEBln'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 554
  Constraints.MinWidth = 652
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 595
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 386
      Width = 103
      Height = 13
      Caption = #1057#1077#1088#1080#1103' '#1080' '#8470' '#1073'/'#1083#1080#1089#1090#1082#1072
      FocusControl = dbeNrList
    end
    object Label2: TLabel
      Left = 82
      Top = 386
      Width = 49
      Height = 13
      Caption = ' '#1086#1090' ('#1076#1072#1090#1072'):'
      FocusControl = dbeDtPrik
      Visible = False
    end
    object Label3: TLabel
      Left = 13
      Top = 195
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FocusControl = dbeDtBeg
    end
    object Label4: TLabel
      Left = 104
      Top = 195
      Width = 61
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
      FocusControl = dbeDtEnd
    end
    object Label5: TLabel
      Left = 13
      Top = 133
      Width = 81
      Height = 13
      Caption = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      Transparent = True
    end
    object Label8: TLabel
      Left = 13
      Top = 305
      Width = 80
      Height = 13
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FocusControl = dbeShObj
    end
    object Label10: TLabel
      Left = 178
      Top = 305
      Width = 86
      Height = 13
      Caption = #1050#1072#1090#1077#1075'.'#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FocusControl = dbeShKatP
    end
    object sBtnVidN: TSpeedButton
      Left = 255
      Top = 129
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
    object sBtnObj: TSpeedButton
      Left = 88
      Top = 319
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
      Left = 253
      Top = 319
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
      Left = 178
      Top = 346
      Width = 41
      Height = 13
      Caption = #1057#1095#1077#1090' '#1041#1059
      FocusControl = dbeSPZ
    end
    object sBtnSPZ: TSpeedButton
      Left = 253
      Top = 363
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
      Left = 195
      Top = 195
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = #1050'-'#1074#1086' '#1076#1085#1077#1081
    end
    object LabelFamIO: TLabel
      Left = 120
      Top = 105
      Width = 153
      Height = 18
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
      Left = 13
      Top = 105
      Width = 33
      Height = 13
      Caption = #1058#1072#1073#1053#1088
      FocusControl = dbeTabN
    end
    object sBtnUpi: TSpeedButton
      Left = 99
      Top = 103
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
    object LabelNchBudMes: TLabel
      Left = 156
      Top = 396
      Width = 107
      Height = 29
      Hint = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076'.'#1084#1077#1089#1103#1094#1072' '#1076#1086' '#1085#1072#1095#1072#1083#1072' '#1086#1090#1087#1091#1089#1082#1072
      AutoSize = False
      Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1083#1077#1076'. '#1084#1077#1089#1103#1094#1072
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      Visible = False
      WordWrap = True
    end
    object Label6: TLabel
      Left = 70
      Top = 153
      Width = 151
      Height = 13
      Caption = #1055#1088#1080#1095#1080#1085#1072' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
    end
    object sBtnPrBln: TSpeedButton
      Left = 255
      Top = 168
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
      OnClick = sBtnPrBlnClick
    end
    object Label7: TLabel
      Left = 13
      Top = 346
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
      Left = 140
      Top = 363
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
    object dbChBoxNchBudMes: TDBCheckBox
      Left = 249
      Top = 402
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      DataField = 'NCHBUDMES'
      DataSource = dsrcVBln
      Enabled = False
      TabOrder = 23
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnEnter = dbChBoxNchBudMesEnter
      OnExit = dbChBoxNchBudMesExit
    end
    object dbeDtPrik: TDBEdit
      Left = 174
      Top = 400
      Width = 51
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
      TabOrder = 22
      Visible = False
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbeDtEnd: TDBEdit
      Left = 104
      Top = 209
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
      TabOrder = 9
      OnEnter = dbEditEnter
      OnExit = dbeDtEndExit
    end
    object dbeShObj: TDBEdit
      Left = 14
      Top = 319
      Width = 75
      Height = 21
      Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Color = clBtnFace
      DataField = 'ShObj'
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
      TabOrder = 12
      OnKeyDown = dbeShObjKeyDown
    end
    object dbeShKatP: TDBEdit
      Left = 178
      Top = 319
      Width = 75
      Height = 21
      Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      Color = clBtnFace
      DataField = 'ShKatP'
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
      TabOrder = 13
      OnKeyDown = dbeShKatPKeyDown
    end
    object dbeShVidN: TDBEdit
      Left = 140
      Top = 129
      Width = 113
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
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
      OnDblClick = sBtnVidNClick
      OnKeyDown = dbeShVidNKeyDown
    end
    object dbeSPZ: TDBEdit
      Left = 178
      Top = 363
      Width = 75
      Height = 21
      Hint = #1057#1095#1077#1090' '#1041#1059' ('#1082#1072#1082' '#1087#1088#1072#1074#1080#1083#1086', '#1086#1089#1085#1086#1074#1085#1086#1081' '#1057#1041#1059' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072')'
      Color = clBtnFace
      DataField = 'SPZ'
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
      TabOrder = 16
      OnKeyDown = dbeSPZKeyDown
    end
    object dbeNrList: TDBEdit
      Left = 57
      Top = 400
      Width = 208
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
      TabOrder = 18
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbeCntDays: TDBEdit
      Left = 195
      Top = 209
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
      TabOrder = 10
    end
    object dbeDtBeg: TDBEdit
      Left = 14
      Top = 209
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
      TabOrder = 8
      OnEnter = dbEditEnter
      OnExit = dbeDtBegExit
    end
    object dbeTabN: TDBEdit
      Left = -46
      Top = -67
      Width = 48
      Height = 21
      TabStop = False
      DataField = 'TABN'
      DataSource = dsrcVBln
      TabOrder = 2
      OnEnter = dbEditEnter
      OnExit = dbeTabNExit
    end
    object dbeVidN: TDBEdit
      Left = 102
      Top = 129
      Width = 37
      Height = 21
      Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      Color = clBtnFace
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
      TabOrder = 3
      OnDblClick = sBtnVidNClick
      OnKeyDown = dbeVidNKeyDown
    end
    object rGrpAlgoritm: TGroupBox
      Left = 14
      Top = 4
      Width = 208
      Height = 55
      Caption = '  '#1040#1083#1075#1086#1088#1080#1090#1084' '#1088#1072#1089#1095#1077#1090#1072'  '
      TabOrder = 0
      object rBtnByLastOkl: TRadioButton
        Left = 8
        Top = 34
        Width = 195
        Height = 17
        Hint = '- '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1084#1091' '#1086#1082#1083#1072#1076#1091' '#1080' '#1085#1072#1076#1073#1072#1074#1082#1072#1084
        Caption = #1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1084#1091' '#1086#1082#1083#1072#1076#1091
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = rBtnByLastOklClick
      end
      object rBtnByLast12m: TRadioButton
        Left = 8
        Top = 16
        Width = 195
        Height = 17
        Hint = '- '#1087#1086' 12-'#1090#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1084' '#1084#1077#1089#1103#1094#1072#1084' ('#1074' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1099#1093' '#1076#1085#1103#1093')'
        Caption = #1087#1086' 12-'#1090#1080' '#1087#1088#1077#1076'.'#1084#1077#1089'. ('#1074' '#1082#1072#1083#1077#1085#1076'.'#1076#1085'.)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = rBtnByLast12mClick
      end
    end
    object LbxFilter: TListBox
      Left = 253
      Top = 66
      Width = 97
      Height = 49
      TabStop = False
      Color = clLime
      ItemHeight = 13
      Items.Strings = (
        '2600-2602 // '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
        '2603-2607 // '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
        '2621-2626 // '#1041#1083#1085'.'#1057#1086#1074#1084#1077#1089#1090)
      TabOrder = 21
      Visible = False
    end
    object dbeNmPrBln: TDBEdit
      Left = 98
      Top = 168
      Width = 155
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
      ReadOnly = True
      ShowHint = True
      TabOrder = 7
      OnDblClick = sBtnPrBlnClick
    end
    object dbePrBln: TDBEdit
      Left = 70
      Top = 168
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
      TabOrder = 6
      OnDblClick = sBtnPrBlnClick
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object GrBoxSps: TGroupBox
      Left = 13
      Top = 59
      Width = 209
      Height = 37
      Caption = ' '#1057#1087#1086#1089#1086#1073' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1091#1084#1084' '#1076#1083#1103' '#1073#1086#1083#1100#1085#1080#1095#1085'. '
      TabOrder = 1
      object rBtnAllSps: TRadioButton
        Left = 8
        Top = 16
        Width = 85
        Height = 17
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1089#1091#1084#1084#1099' '#1087#1086' '#1074#1089#1077#1084' '#1089#1087#1080#1089#1082#1072#1084
        Caption = #1074#1089#1077' '#1089#1087#1080#1089#1082#1080
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object rBtnOnlyCurSps: TRadioButton
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
      end
    end
    object dbeNmTemu: TDBEdit
      Left = 54
      Top = 363
      Width = 85
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
      ReadOnly = True
      ShowHint = True
      TabOrder = 15
    end
    object dbeKdTemu: TDBEdit
      Left = 13
      Top = 363
      Width = 40
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
      TabOrder = 14
      OnEnter = dbEditEnter
      OnExit = dbeKdTemuExit
    end
    object dbeKdSpZ: TDBEdit
      Left = 244
      Top = 21
      Width = 59
      Height = 21
      TabStop = False
      DataField = 'KDSPZ'
      DataSource = dsrcVBln
      TabOrder = 20
      Visible = False
    end
    object dbeSerListC: TDBEdit
      Left = 13
      Top = 400
      Width = 43
      Height = 21
      DataField = 'SERLIST'
      DataSource = dsrcVBln
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object DBChBoxDigital: TDBCheckBox
      Left = 11
      Top = 168
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = #1062#1080#1092#1088'.'
      DataField = 'DIGITAL'
      DataSource = dsrcVBln
      TabOrder = 5
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
    end
    object PanelOther: TPanel
      Left = 8
      Top = 465
      Width = 265
      Height = 113
      TabOrder = 24
      object sBtnPredList: TSpeedButton
        Left = 245
        Top = 15
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
        OnClick = sBtnPredListClick
      end
      object LabelProcOpl: TLabel
        Left = 209
        Top = 41
        Width = 48
        Height = 13
        Caption = '% '#1086#1087#1083#1072#1090#1099
        FocusControl = dbeProcOpl
      end
      object Label11: TLabel
        Left = 5
        Top = 77
        Width = 63
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        FocusControl = dbeNotes
      end
      object LabelPredListNr: TLabel
        Left = 79
        Top = 1
        Width = 95
        Height = 13
        Caption = #1053'-'#1088' '#1080' '#1076#1072#1090#1072' '#1073'/'#1083#1080#1089#1090#1072
        FocusControl = dbePredNR
      end
      object Label15: TLabel
        Left = 113
        Top = 41
        Width = 54
        Height = 13
        Caption = #1047#1072' 12 '#1084#1077#1089'.'
        FocusControl = dbeProcOpl
      end
      object Label16: TLabel
        Left = 44
        Top = 41
        Width = 35
        Height = 13
        Caption = #1054#1073#1097#1080#1081
        FocusControl = dbeProcOpl
      end
      object Label9: TLabel
        Left = 5
        Top = 56
        Width = 26
        Height = 13
        Caption = #1057#1090#1072#1078
        FocusControl = dbeProcOpl
      end
      object dbePredDt: TDBEdit
        Left = 173
        Top = 15
        Width = 72
        Height = 21
        Hint = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1083#1080#1089#1090#1082#1072
        Color = clBtnFace
        DataField = 'PredDt'
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
        TabOrder = 3
        OnDblClick = sBtnPredListClick
        OnKeyDown = dbePredNRKeyDown
      end
      object dbePredNR: TDBEdit
        Left = 112
        Top = 15
        Width = 60
        Height = 21
        Hint = #8470' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
        Color = clBtnFace
        DataField = 'PredNr'
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
        TabOrder = 2
        OnDblClick = sBtnPredListClick
        OnKeyDown = dbePredNRKeyDown
      end
      object dbePredSer: TDBEdit
        Left = 79
        Top = 15
        Width = 32
        Height = 21
        Color = clBtnFace
        DataField = 'PredSer'
        DataSource = dsrcVBln
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnDblClick = sBtnPredListClick
        OnKeyDown = dbePredNRKeyDown
      end
      object dbeProcOpl: TDBEdit
        Left = 208
        Top = 54
        Width = 50
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
        TabOrder = 6
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeNotes: TDBEdit
        Left = 5
        Top = 90
        Width = 254
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
        TabOrder = 7
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object DBChBoxContList: TDBCheckBox
        Left = 5
        Top = 16
        Width = 66
        Height = 17
        Hint = #1051#1080#1089#1090#1086#1082' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077#1084
        Alignment = taLeftJustify
        Caption = #1055#1088#1086#1076#1086#1083#1078'.'
        DataField = 'LISTCONT'
        DataSource = dsrcVBln
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = DBChBoxContListClick
      end
      object dbeStagL12: TDBEdit
        Left = 113
        Top = 54
        Width = 50
        Height = 21
        Hint = #1057#1090#1072#1078' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 12 '#1084#1077#1089#1103#1094#1077#1074
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
        TabOrder = 5
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeStagCmn: TDBEdit
        Left = 44
        Top = 54
        Width = 50
        Height = 21
        Hint = #1054#1073#1097#1080#1081' '#1089#1090#1072#1078
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
        TabOrder = 4
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
    end
    object PanelAct: TPanel
      Left = 8
      Top = 424
      Width = 265
      Height = 41
      TabOrder = 19
      object LblActDt: TLabel
        Left = 8
        Top = 2
        Width = 52
        Height = 13
        Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072
      end
      object Label14: TLabel
        Left = 96
        Top = 2
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object DBEActDt: TDBEdit
        Left = 8
        Top = 18
        Width = 73
        Height = 21
        DataField = 'Act_Dt'
        DataSource = dsrcVBln
        TabOrder = 0
      end
      object DBEActNum: TDBEdit
        Left = 96
        Top = 18
        Width = 161
        Height = 21
        DataField = 'Act_Num'
        DataSource = dsrcVBln
        TabOrder = 1
      end
    end
    object GrpBxDays: TGroupBox
      Left = 14
      Top = 237
      Width = 257
      Height = 66
      Caption = ' '#1056#1072#1089#1095#1105#1090' '#1076#1085#1077#1081' '
      TabOrder = 11
      inline PrincDays: TFrameDisPregDays
        Left = 8
        Top = 19
        Width = 241
        Height = 17
        TabOrder = 0
        inherited LblPrincSuppl: TLabel
          Width = 65
          Caption = #1054#1089#1085#1086#1074#1085#1099#1093
        end
        inherited ChBoxEntDays: TCheckBox
          OnClick = ChBoxDaysClick
        end
        inherited ChBoxFndDays: TCheckBox
          Caption = #1060#1086#1085#1076
          OnClick = ChBoxDaysClick
        end
      end
      inline SupplDays: TFrameDisPregDays
        Left = 8
        Top = 43
        Width = 241
        Height = 17
        TabOrder = 1
        inherited LblPrincSuppl: TLabel
          Width = 65
          Caption = #1057#1086#1074#1084#1077#1089#1090#1080#1090'.'
        end
        inherited ChBoxEntDays: TCheckBox
          OnClick = ChBoxDaysClick
        end
        inherited ChBoxFndDays: TCheckBox
          Caption = #1060#1086#1085#1076
          OnClick = ChBoxDaysClick
        end
      end
    end
  end
  object PanelRight: TPanel
    Left = 281
    Top = 0
    Width = 472
    Height = 595
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 332
      Width = 472
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
      Width = 472
      Height = 260
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object PanelResults: TPanel
        Left = 1
        Top = 1
        Width = 470
        Height = 43
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Constraints.MaxHeight = 43
        Constraints.MinHeight = 43
        TabOrder = 0
        DesignSize = (
          470
          43)
        object LblTopAvrg: TLabel
          Left = 2
          Top = 2
          Width = 466
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
        object LblMidAvrg: TLabel
          Left = 2
          Top = 15
          Width = 466
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
        object LblBtmAvrg: TLabel
          Left = 2
          Top = 28
          Width = 466
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
        object sBtnBackToBln: TSpeedButton
          Left = 398
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
      object dbgrRBln: TDBGrid
        Left = 1
        Top = 44
        Width = 470
        Height = 215
        Hint = 
          #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084' ('#1087#1086#1076#1082#1083#1102#1095#1072#1102#1090#1089#1103' '#1082' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084' '#1090#1077#1082 +
          #1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072')'
        Align = alClient
        Color = clBtnFace
        DataSource = dsrcRBln
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
            Width = 45
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
      Width = 472
      Height = 332
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PanelRTop'
      TabOrder = 1
      object PageControl: TPageControl
        Left = 1
        Top = 1
        Width = 470
        Height = 330
        ActivePage = tsBy12Mes
        Align = alClient
        Constraints.MinHeight = 330
        Style = tsButtons
        TabOrder = 0
        object tsBy12Mes: TTabSheet
          Caption = 'tsBy12Mes'
          object dbgr_RBln: TDBGrid
            Left = 0
            Top = 0
            Width = 462
            Height = 299
            Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
            Align = alClient
            DataSource = dsrc_RBln
            ParentShowHint = False
            PopupMenu = popMnu
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgr_RBlnDrawColumnCell
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
        object tsByOkl: TTabSheet
          Caption = 'tsByOkl'
          ImageIndex = 1
          object LabelRSrOkl: TLabel
            Left = 0
            Top = 0
            Width = 444
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
            Width = 462
            Height = 273
            Align = alClient
            DataSource = dsrc_RBln
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
                FieldName = 'SmVZachet'
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
        object tsStornOtp: TTabSheet
          Caption = 'tsStornOtp'
          ImageIndex = 2
          DesignSize = (
            462
            299)
          object Splitter2: TSplitter
            Left = 0
            Top = 151
            Width = 462
            Height = 3
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clTeal
            ParentColor = False
          end
          object DbgrOtkl: TDBGrid
            Left = 0
            Top = 0
            Width = 462
            Height = 151
            Hint = #1047#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
            Align = alTop
            Color = clCream
            DataSource = DmVacatStorn.DsrcOrig
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DbgrOtklDrawColumnCell
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
                Title.Caption = #1055#1088#1080#1084#1077#1095'.'
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
          object DbgrStorn: TDBGrid
            Left = 0
            Top = 154
            Width = 462
            Height = 145
            Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1086#1090#1087#1091#1089#1082#1091' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
            Align = alClient
            Color = clInfoBk
            DataSource = DmVacatStorn.DsrcParts
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentShowHint = False
            PopupMenu = PopOtkl
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DbgrStornDrawColumnCell
            OnEnter = dbgrGridEnter
            OnExit = dbgrGridExit
            Columns = <
              item
                Expanded = False
                FieldName = 'KDSPS'
                ReadOnly = True
                Title.Caption = #1057#1087#1089
                Width = 17
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTPROC'
                ReadOnly = True
                Title.Caption = #1056#1052#1077#1089
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZAMESGOD'
                ReadOnly = True
                Title.Caption = #1047#1072#1052#1043
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTSTORN'
                Title.Caption = #1044#1090'.'#1089#1090#1086#1088#1085
                Width = 31
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_BEG'
                Title.Caption = #1044#1090'.'#1085#1072#1095#1072#1083#1072
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_END'
                Title.Caption = #1044#1090'.'#1086#1082#1086#1085#1095
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIDN'
                ReadOnly = True
                Title.Caption = #1042#1080#1076#1053#1072#1095
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ShVidN'
                ReadOnly = True
                Title.Caption = #1064#1092#1088#1042#1080#1076#1072#1053#1072#1095
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CHAS'
                ReadOnly = True
                Title.Caption = #1063#1072#1089#1099
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUMMA'
                ReadOnly = True
                Title.Caption = #1057#1091#1084#1084#1072
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KDOBJ'
                Title.Caption = #1050#1086#1076#1055#1086#1076#1088
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'KDKATP'
                Title.Caption = #1050#1086#1076#1050#1072#1090#1055#1077#1088#1089'.'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'NOTES'
                Title.Caption = #1055#1088#1080#1084#1077#1095'.'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SPEC_NR'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'MYNOTES'
                Visible = False
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
              end
              item
                Expanded = False
                FieldName = 'NR'
                Visible = False
              end>
          end
          object LbxStornRec: TListBox
            Left = 349
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
  object PanelBottom: TPanel
    Left = 0
    Top = 595
    Width = 753
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      753
      28)
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
      Hint = #1042#1074#1086#1076' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
      Caption = #1064#1072#1075' 1'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStep1Click
    end
    object sBtnPrt: TSpeedButton
      Left = 277
      Top = 2
      Width = 64
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1073#1086#1083#1100#1085#1080#1095#1085#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
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
    object sBtnRecalcPred: TSpeedButton
      Left = 343
      Top = 2
      Width = 25
      Height = 25
      Hint = #1055#1077#1088#1077#1089#1095#1077#1090' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1077#1088#1074#1080#1095#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
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
      Top = 2
      Width = 87
      Height = 25
      Hint = 
        #1069#1082#1088#1072#1085' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1072' ('#1077#1089#1083#1080' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1086' "'#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077'" '#1073#1086#1083#1100#1085 +
        #1080#1095#1085#1099#1093' '#1089' '#1086#1090#1087#1091#1089#1082#1086#1084')'
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
    object BtnStep2: TBitBtn
      Left = 55
      Top = 2
      Width = 52
      Height = 25
      Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1080' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Anchors = [akLeft, akBottom]
      Caption = #1064#1072#1075' 2'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnStep2Click
    end
    object bBtnVvod: TBitBtn
      Left = 622
      Top = 2
      Width = 64
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
      Anchors = [akRight, akBottom]
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
      Left = 688
      Top = 2
      Width = 64
      Height = 25
      Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
    object bBtnPereschet: TBitBtn
      Left = 470
      Top = 2
      Width = 77
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1100' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1080' '#1089' '#1085#1077#1084#1077#1076#1083#1077#1085#1085#1099#1084' '#1087#1077#1088#1077#1089#1095#1077#1090#1086#1084
      Anchors = [akRight, akBottom]
      Caption = #1055#1077#1088#1077#1089#1095#1105#1090
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
    object bBtnNew: TBitBtn
      Left = 550
      Top = 2
      Width = 70
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1086#1082#1091
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1087#1080#1089#1100
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
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
  end
  object qryVBln: TQuery
    CachedUpdates = True
    BeforePost = qryVBlnBeforePost
    AfterPost = qryVBlnAfterPost
    OnCalcFields = qryVBlnCalcFields
    AutoRefresh = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_vBln')
    UpdateObject = updVBln
    Left = 312
    Top = 128
    object qryVBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VBLN.KDSPS'
    end
    object qryVBlnDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
    end
    object qryVBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object qryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
    end
    object qryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VBLN.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVBlnSERLIST: TStringField
      DisplayWidth = 8
      FieldName = 'SERLIST'
      Origin = 'DbMain.Z_VBLN.SERLIST'
      Size = 8
    end
    object qryVBlnNRLIST: TStringField
      DisplayWidth = 25
      FieldName = 'NRLIST'
      Origin = 'DbMain.Z_VBLN.NRLIST'
      Size = 25
    end
    object qryVBlnDTLIST: TDateTimeField
      FieldName = 'DTLIST'
      Origin = 'DbMain.Z_VBLN.DTLIST'
      OnSetText = qryVBlnDTLISTSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVBlnDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
      OnChange = qryVBlnDTBEGChange
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVBlnDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
      OnChange = qryVBlnDTENDChange
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVBlnCNTDAYS: TSmallintField
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object qryVBlnCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object qryVBlnVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VBLN.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVBlnShVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 10
      Lookup = True
    end
    object qryVBlnPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object qryVBlnKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VBLN.KDTEMU'
    end
    object qryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object qryVBlnShObj: TStringField
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object qryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object qryVBlnShKatP: TStringField
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object qryVBlnNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object qryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object qryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
    object qryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_VBLN.SMBLN'
    end
    object qryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VBLN.KDSPZ'
    end
    object qryVBlnSPZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'SPZ'
      Size = 10
      Calculated = True
    end
    object qryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      Origin = 'DbMain.Z_VBLN.DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object qryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      Origin = 'DbMain.Z_VBLN.LISTCONT'
      OnChange = qryVBlnLISTCONTChange
      FixedChar = True
      Size = 1
    end
    object qryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object qryVBlnPredSer: TStringField
      FieldKind = fkCalculated
      FieldName = 'PredSer'
      Size = 5
      Calculated = True
    end
    object qryVBlnPredNr: TStringField
      FieldKind = fkCalculated
      FieldName = 'PredNr'
      Size = 25
      Calculated = True
    end
    object qryVBlnPredDt: TDateField
      FieldKind = fkCalculated
      FieldName = 'PredDt'
      Calculated = True
    end
    object qryVBlnLNKSTOTP: TIntegerField
      FieldName = 'LNKSTOTP'
      Origin = 'DbMain.Z_VBLN.LNKSTOTP'
    end
    object qryVBlnPRBLN: TSmallintField
      FieldName = 'PRBLN'
      Origin = 'DbMain.Z_VBLN.PRBLN'
      OnChange = qryVBlnPRBLNChange
    end
    object qryVBlnNmPrBln: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmPrBln'
      Size = 55
      Calculated = True
    end
    object qryVBlnSHEMA: TSmallintField
      FieldName = 'SHEMA'
      Origin = 'DbMain.Z_VBLN.SHEMA'
    end
    object qryVBlnNmTemu: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 35
      Calculated = True
    end
    object qryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
      Origin = 'DbMain.Z_VBLN.STGCMN'
    end
    object qryVBlnSTG12: TFloatField
      FieldName = 'STG12'
      Origin = 'DbMain.Z_VBLN.STG12'
    end
    object qryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object qryVBlnDIGITAL: TStringField
      FieldName = 'DIGITAL'
      Size = 1
    end
    object qryVBlnAct_Dt: TDateTimeField
      FieldName = 'Act_Dt'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryVBlnAct_Num: TStringField
      FieldName = 'Act_Num'
      Size = 25
    end
    object qryVBlnDayFlags: TWordField
      FieldName = 'DayFlags'
    end
  end
  object dsrcVBln: TDataSource
    DataSet = qryVBln
    Left = 328
    Top = 144
  end
  object updVBln: TUpdateSQL
    ModifySQL.Strings = (
      'update z_vBln'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  ALGRASCH = :ALGRASCH,'
      '  NCHBUDMES = :NCHBUDMES,'
      '  SERLIST = :SERLIST,'
      '  NRLIST = :NRLIST,'
      '  DTLIST = :DTLIST,'
      '  DTBEG = :DTBEG,'
      '  DTEND = :DTEND,'
      '  CNTDAYS = :CNTDAYS,'
      '  VIDN = :VIDN,'
      '  PRBLN = :PRBLN,'
      '  DAY5FIRST = :DAY5FIRST,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  CNTCHAS = :CNTCHAS,'
      '  PROCOPL = :PROCOPL,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  SMSRDN = :SMSRDN,'
      '  SMBLN = :SMBLN,'
      '  SPEC_NR = :SPEC_NR,'
      '  LISTCONT = :LISTCONT,'
      '  PREDSPEC_NR = :PREDSPEC_NR,'
      '  LNKSTOTP = :LNKSTOTP,'
      '  SHEMA = :SHEMA,'
      '  STGCMN = :STGCMN,'
      '  STG12 = :STG12,'
      '  DIGITAL = :DIGITAL,'
      '  ACT_DT = :ACT_DT,'
      '  ACT_NUM = :ACT_NUM,'
      '  DAYFLAGS = :DAYFLAGS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_vBln ('
      
        '  KDSPS, DTPROC, TABN, ALGRASCH, NCHBUDMES, SERLIST, NRLIST, DTL' +
        'IST,'
      
        '  DTBEG, DTEND, CNTDAYS, VIDN, PRBLN, DAY5FIRST, OLDKDVIDN, CNTC' +
        'HAS,'
      
        '  PROCOPL, KDTEMU, KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, SMBLN, S' +
        'PEC_NR,'
      
        '  LISTCONT, PREDSPEC_NR, LNKSTOTP, SHEMA, STGCMN, STG12, DIGITAL' +
        ','
      '  ACT_DT, ACT_NUM, DAYFLAGS'
      ')'
      'values ('
      
        '  :KDSPS, :DTPROC, :TABN, :ALGRASCH, :NCHBUDMES, :SERLIST, :NRLI' +
        'ST, :DTLIST,'
      
        '  :DTBEG, :DTEND, :CNTDAYS, :VIDN, :PRBLN, :DAY5FIRST, :OLDKDVID' +
        'N, :CNTCHAS,'
      
        '  :PROCOPL, :KDTEMU, :KDOBJ, :KDKATP, :KDSPZ, :NOTES, :SMSRDN, :' +
        'SMBLN, :SPEC_NR,'
      
        '  :LISTCONT, :PREDSPEC_NR, :LNKSTOTP, :SHEMA, :STGCMN, :STG12, :' +
        'DIGITAL,'
      '  :ACT_DT, :ACT_NUM, :DAYFLAGS'
      ')')
    DeleteSQL.Strings = (
      'delete from z_vBln'
      'where'
      '  NR = :OLD_NR')
    Left = 344
    Top = 160
  end
  object qryTmp: TQuery
    Left = 592
    Top = 124
  end
  object tblRBln: TTable
    OnCalcFields = tblRBlnCalcFields
    DatabaseName = 'ES_IND'
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
        Size = 20
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 't__RBln'
    Left = 332
    Top = 437
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
  object dsrcRBln: TDataSource
    DataSet = tblRBln
    Left = 352
    Top = 456
  end
  object qryRBln: TQuery
    CachedUpdates = True
    AfterPost = qryRBlnAfterPost
    OnCalcFields = qryRBlnCalcFields
    OnNewRecord = qryRBlnNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 1 rb.*, Cast(-1 As SmallInt) As MyFoxFld '
      ' from Z_RBln rb'
      ' where rb.Spec_NR = -1'
      ''
      '')
    UpdateObject = upd_RBln
    Left = 392
    Top = 128
    object qryRBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_ROTP.NR'
    end
    object qryRBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_RBLN.TABN'
    end
    object qryRBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_ROTP.SPEC_NR'
    end
    object qryRBlnZAMESGOD: TDateTimeField
      DisplayLabel = #1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_ROTP.ZAMESGOD'
      DisplayFormat = 'mm-yyyy'
    end
    object qryRBlnRusMesGod: TStringField
      FieldKind = fkCalculated
      FieldName = 'RusMesGod'
      Size = 15
      Calculated = True
    end
    object qryRBlnSMZARABOTKA: TFloatField
      DisplayLabel = #1047#1072#1088#1072#1073' '#1054#1089#1085
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_ROTP.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object qryRBlnCNTDAYS: TFloatField
      DisplayLabel = #1044#1085#1080' '#1054#1089#1085
      FieldName = 'CNTDAYS'
    end
    object qryRBlnKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_ROTP.KOEFZP'
    end
    object qryRBlnSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090#1054#1089#1085
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryRBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_RBLN.KDSPS'
    end
    object qryRBlnMYFOXFLD: TSmallintField
      FieldName = 'MYFOXFLD'
    end
    object qryRBlnNMPOKAZ: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
      FieldName = 'NMPOKAZ'
      FixedChar = True
      Size = 12
    end
    object qryRBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryRBlnShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryRBlnSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMPROC'
    end
    object qryRBlnSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      FixedChar = True
      Size = 1
    end
    object qryRBlnSM_SVM: TFloatField
      DisplayLabel = #1047#1072#1088#1086#1073#1057#1074#1084
      FieldName = 'SM_SVM'
      DisplayFormat = '#.00'
    end
    object qryRBlnCNTDAYS_SVM: TFloatField
      DisplayLabel = #1044#1085#1080#1057#1074#1084
      FieldName = 'CNTDAYS_SVM'
    end
    object qryRBlnSMVZACHET_SVM: TFloatField
      DisplayLabel = #1057#1084#1057#1074#1084#1042#1047#1072#1095#1105#1090
      FieldName = 'SMVZACHET_SVM'
      DisplayFormat = '#.00'
    end
    object qryRBlnSMVZACHET_CMN: TFloatField
      DisplayLabel = #1057#1084#1054#1073#1097#1042#1047#1072#1095#1105#1090
      FieldName = 'SMVZACHET_CMN'
      DisplayFormat = '#.00'
    end
    object qryRBlnSmVZachet: TFloatField
      FieldName = 'SmVZachet'
    end
  end
  object dsrc_RBln: TDataSource
    DataSet = qryRBln
    OnDataChange = dsrc_RBlnDataChange
    OnUpdateData = dsrc_RBlnUpdateData
    Left = 408
    Top = 144
  end
  object upd_RBln: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_RBln'
      'set'
      '  TABN = :TABN,'
      '  KDSPS = :KDSPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  SMZARABOTKA = :SMZARABOTKA,'
      '  KOEFZP = :KOEFZP,'
      '  CNTDAYS = :CNTDAYS,'
      '  NMPOKAZ = :NMPOKAZ,'
      '  VIDN = :VIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  SM_SVM = :SM_SVM,'
      '  CNTDAYS_SVM = :CNTDAYS_SVM,'
      '  SMVZACHET_SVM = :SMVZACHET_SVM,'
      '  SMVZACHET_CMN = :SMVZACHET_CMN,'
      '  SMVZACHET = :SMVZACHET'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_RBln'
      
        '  (TABN, KDSPS, SPEC_NR, ZAMESGOD, SMZARABOTKA, KOEFZP, CNTDAYS,' +
        ' '
      'NMPOKAZ, '
      '   VIDN, SUMPROC, SP,  SM_SVM, CNTDAYS_SVM, '
      'SMVZACHET_SVM, SMVZACHET_CMN, SmVZachet)'
      'values'
      '  (:TABN, :KDSPS, :SPEC_NR, :ZAMESGOD, :SMZARABOTKA, :KOEFZP, '
      ':CNTDAYS, '
      '   :NMPOKAZ, :VIDN, :SUMPROC, :SP, :SM_SVM, :CNTDAYS_SVM, '
      ':SMVZACHET_SVM, '
      '   :SMVZACHET_CMN, :SmVZachet)')
    DeleteSQL.Strings = (
      'delete from Z_RBln'
      'where'
      '  NR = :OLD_NR')
    Left = 424
    Top = 160
  end
  object popMnu: TPopupMenu
    Left = 309
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
    Left = 633
    Top = 85
  end
  object PopOtkl: TPopupMenu
    OnPopup = PopOtklPopup
    Left = 464
    Top = 248
    object PopOtklStorn: TMenuItem
      Caption = '&C'#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '
      Hint = 
        #1055#1088#1077#1076#1083#1072#1075#1072#1077#1090#1089#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1083#1086#1075', '#1095#1090#1086#1073#1099' '#1074#1074#1077#1089#1090#1080' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086 +
        #1082#1086#1085#1095#1072#1085#1080#1103' '#1089#1090#1086#1088#1085#1080#1088#1091#1077#1084#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      OnClick = PopOtklStornClick
    end
    object PopOtklUnstorn: TMenuItem
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1059#1076#1072#1083#1103#1077#1090#1089#1103' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1080
      OnClick = PopOtklUnstornClick
    end
  end
  object tblDbg: TTable
    Left = 593
    Top = 85
  end
  object qryTmp2: TQuery
    Left = 632
    Top = 124
  end
  object qryViNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 10 * from ViNuMain '
      'where TabN = 1239 and ZaMesGod = '#39'08/01/2015'#39)
    Left = 554
    Top = 124
  end
  object QryPeek: TQuery
    Left = 654
    Top = 252
  end
  object QryVBlnTree: TQuery
    Left = 342
    Top = 252
  end
end
