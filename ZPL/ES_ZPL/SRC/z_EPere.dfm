object FormEPere: TFormEPere
  Left = 340
  Top = 81
  Width = 731
  Height = 619
  HelpContext = 2030
  Caption = 'FormEPere'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopPositions
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 592
    Align = alLeft
    TabOrder = 0
    object PanelDate: TPanel
      Left = 1
      Top = 1
      Width = 340
      Height = 56
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 0
      object Label19: TLabel
        Left = 6
        Top = 9
        Width = 62
        Height = 13
        Caption = #1054#1089#1085'. '#1089#1087#1080#1089#1086#1082
        FocusControl = dbeShSps
      end
      object sBtnKdSps: TSpeedButton
        Left = 141
        Top = 5
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1089#1087#1080#1089#1082#1086#1074'"'
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKdSpsClick
      end
      object Label1: TLabel
        Left = 171
        Top = 9
        Width = 52
        Height = 13
        Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089
        FocusControl = DbeDtBeg
      end
      object dbeShSps: TDBEdit
        Left = 80
        Top = 5
        Width = 59
        Height = 21
        Hint = #1054#1089#1085#1086#1074#1085#1086#1081' "'#1089#1087#1080#1089#1086#1082'"'
        DataField = 'ShSps'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sBtnKdSpsClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShSpsKeyDown
      end
      object DbeDtBeg: TDBEdit
        Left = 233
        Top = 5
        Width = 78
        Height = 21
        Hint = #1044#1077#1081#1089#1090#1074#1091#1077#1090', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
        DataField = 'DT_BEG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = dbEditEnter
        OnExit = DbeDtBegExit
      end
      object dbcheckElTrudKn: TDBCheckBox
        Left = 171
        Top = 33
        Width = 161
        Height = 17
        Caption = #1042' '#1101#1083#1077#1082#1090#1088'. '#1090#1088#1091#1076'. '#1082#1085#1080#1078#1082#1091
        DataField = 'IS_PERE'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ValueChecked = 'Y'
        ValueUnchecked = ' '
      end
      object DbChBoxBM: TDBCheckBox
        Left = 6
        Top = 33
        Width = 67
        Height = 17
        Hint = '"'#1055#1090#1080#1095#1082#1072'" - '#1041#1072#1079#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
        Caption = #1041#1072#1079'.'#1084#1077#1089'.'
        DataField = 'BM'
        DataSource = DmMain.dsrcPere
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = 'Y'
        ValueUnchecked = ' '
        OnEnter = DbChBoxBMEnter
        OnExit = DbChBoxBMExit
      end
      object dbeDtBM: TDBEdit
        Left = 78
        Top = 31
        Width = 78
        Height = 21
        Hint = #1044#1077#1081#1089#1090#1074#1091#1077#1090', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
        DataField = 'DTBM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
    end
    object PanelSalary: TPanel
      Left = 1
      Top = 97
      Width = 340
      Height = 87
      Align = alTop
      Color = clSilver
      TabOrder = 1
      object Label3: TLabel
        Left = 10
        Top = 43
        Width = 87
        Height = 13
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1087#1088#1080' '#1085#1077#1087#1086#1083#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1076#1085#1077
        AutoSize = False
        Caption = '% '#1088#1072#1073'. '#1074#1088#1077#1084#1077#1085#1080
        FocusControl = dbePrcWrkTime
        WordWrap = True
      end
      object Label4: TLabel
        Left = 184
        Top = 43
        Width = 113
        Height = 13
        Hint = #1055#1088#1080#1079#1085#1072#1082' '#1085#1077#1087#1086#1083#1085#1086#1075#1086' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1076#1085#1103' ('#1076#1083#1103' '#1086#1090#1095#1105#1090#1086#1074' '#1074' '#1057#1055#1054#1042')'
        AutoSize = False
        Caption = #1053#1077#1087#1086#1083#1085#1099#1081' '#1088#1072#1073'. '#1076#1077#1085#1100
        FocusControl = dbeNPD
        WordWrap = True
      end
      object LabelOklTrf: TLabel
        Left = 10
        Top = 67
        Width = 41
        Height = 13
        AutoSize = False
        Caption = #1054#1082#1083#1072#1076
        FocusControl = dbeOklTrf
      end
      object Label8: TLabel
        Left = 184
        Top = 67
        Width = 31
        Height = 13
        Caption = #1040#1074#1072#1085#1089
        FocusControl = dbeAvans
      end
      object Label9: TLabel
        Left = 292
        Top = 67
        Width = 8
        Height = 13
        Caption = '%'
        FocusControl = dbeSpAv
      end
      object grBoxSchOkl: TGroupBox
        Left = 4
        Top = 2
        Width = 333
        Height = 34
        Caption = '  '#1057#1093#1077#1084#1072' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103'  '#1086#1082#1083#1072#1076#1072'  '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object rBtnSimpleOkl: TRadioButton
          Left = 46
          Top = 16
          Width = 105
          Height = 17
          Hint = #1054#1073#1099#1095#1085#1099#1081' '#1086#1082#1083#1072#1076
          Caption = #1086#1073#1099#1095#1085#1099#1081
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
          OnClick = rBtnOklClick
        end
        object rBtnCmbOkl: TRadioButton
          Left = 166
          Top = 16
          Width = 140
          Height = 17
          Hint = #1054#1082#1083#1072#1076' '#1080#1079' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1095#1072#1089#1090#1077#1081
          Caption = #1080#1079' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1095#1072#1089#1090#1077#1081
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rBtnOklClick
        end
      end
      object dbePrcWrkTime: TDBEdit
        Left = 95
        Top = 39
        Width = 43
        Height = 21
        Hint = 
          #1055#1088#1080' '#1085#1077#1087#1086#1083#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1076#1085#1077' % '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' ('#1053#1086#1088#1084#1072#1083#1100#1085#1086' 100% '#1080#1083#1080' ' +
          #1087#1091#1089#1090#1086')'
        DataField = 'PrcWrkTime'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnEnter = dbEditEnter
        OnExit = dbePrcWrkTimeExit
      end
      object dbeNPD: TDBEdit
        Left = 305
        Top = 39
        Width = 20
        Height = 21
        Hint = #1055#1088#1080#1079#1085#1072#1082' '#1085#1077#1087#1086#1083#1085#1086#1075#1086' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1076#1085#1103' (1 - '#1076#1083#1103' '#1086#1090#1095#1105#1090#1086#1074' '#1074' '#1057#1055#1054#1042')'
        TabStop = False
        Color = clBtnFace
        DataField = 'NPD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbeOklTrf: TDBEdit
        Left = 73
        Top = 63
        Width = 65
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072' '#1080#1083#1080' '#1090#1072#1088#1080#1092#1072
        DataField = 'OKLTRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeSmCmbOkl: TDBEdit
        Left = 104
        Top = 63
        Width = 65
        Height = 21
        Hint = #1057#1091#1084#1084#1072' "'#1089#1073#1086#1088#1085#1086#1075#1086'" '#1086#1082#1083#1072#1076#1072
        Color = clBtnFace
        DataField = 'SmCmbOkl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
      end
      object dbeAvans: TDBEdit
        Left = 223
        Top = 63
        Width = 65
        Height = 21
        Hint = #1057#1091#1084#1084#1072' '#1080#1083#1080' '#1087#1088#1086#1094#1077#1085#1090' '#1072#1074#1072#1085#1089#1072
        DataField = 'AVANS'
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
      object dbeSpAv: TDBEdit
        Left = 305
        Top = 63
        Width = 20
        Height = 21
        Hint = #1055#1088#1080' '#1072#1074#1072#1085#1089#1077' '#1074' '#1087#1088#1086#1094#1077#1085#1090#1072#1093' '#1087#1088#1086#1089#1090#1072#1074#1100#1090#1077' '#1079#1085#1072#1095#1086#1082' %'
        DataField = 'SP_AV'
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
    end
    object PanelNICh: TPanel
      Left = 1
      Top = 184
      Width = 340
      Height = 41
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 2
      object Label15: TLabel
        Left = 2
        Top = 2
        Width = 75
        Height = 13
        Caption = #1058' '#1077' '#1084' '#1072'   '#1053' '#1048' '#1063
        FocusControl = dbeNmTemu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 240
        Top = 2
        Width = 76
        Height = 13
        Hint = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1057#1041#1059
        Caption = #1057#1095#1105#1090' '#1041#1091#1093'.'#1059#1095#1105#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object sBtnKdTemu: TSpeedButton
        Left = 202
        Top = 17
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
      object sBtnSPZ: TSpeedButton
        Left = 322
        Top = 17
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
      object dbeKdTemu: TDBEdit
        Left = 2
        Top = 17
        Width = 45
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
        TabOrder = 0
        OnDblClick = sBtnKdTemuClick
        OnEnter = dbEditEnter
        OnExit = dbeKdTemuExit
        OnKeyDown = dbeKdTemuKeyDown
      end
      object dbeNmTemu: TDBEdit
        Left = 47
        Top = 17
        Width = 154
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
        TabOrder = 1
        OnDblClick = sBtnKdTemuClick
        OnKeyDown = dbeKdTemuKeyDown
      end
      object edSpZ: TEdit
        Left = 240
        Top = 17
        Width = 81
        Height = 21
        Hint = #1057#1095#1077#1090' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'edSpZ'
        OnDblClick = sBtnSPZClick
        OnEnter = edSpZEnter
        OnExit = edSpZExit
        OnKeyDown = dbeSPZKeyDown
      end
      object dbeKdSpZ: TDBEdit
        Left = 254
        Top = 17
        Width = 61
        Height = 21
        DataField = 'KdSpZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object dbeSPZ: TDBEdit
        Left = 266
        Top = 17
        Width = 50
        Height = 21
        Hint = #1054#1089#1085#1086#1074#1085#1086#1081' '#1057#1041#1059
        TabStop = False
        DataField = 'Spz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        OnDblClick = sBtnSPZClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeSPZKeyDown
      end
    end
    object PanelPrevPos: TPanel
      Left = 1
      Top = 225
      Width = 340
      Height = 82
      Align = alTop
      Color = clSilver
      TabOrder = 3
      object labelDkpp: TLabel
        Left = 2
        Top = 4
        Width = 153
        Height = 13
        Caption = #1055#1088#1077#1076#1099#1076'. '#1050#1086#1076' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1054#1050
      end
      object sBtnGetOldOK: TSpeedButton
        Left = 322
        Top = 18
        Width = 15
        Height = 21
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072' '#1054#1050
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnGetOldOKClick
      end
      object Label20: TLabel
        Left = 2
        Top = 42
        Width = 134
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      end
      object Label21: TLabel
        Left = 168
        Top = 42
        Width = 169
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080' '#1087#1086' '#1044#1050
      end
      object Label22: TLabel
        Left = 245
        Top = 4
        Width = 52
        Height = 13
        Caption = #1050#1086#1076' '#1047#1050#1055#1055
      end
      object Label28: TLabel
        Left = 174
        Top = 4
        Width = 37
        Height = 13
        Caption = #1050#1086#1076' '#1050#1055
      end
      object dbePrevCode: TDBEdit
        Left = 169
        Top = 18
        Width = 75
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'OldCode'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dbePrevZ_kpp: TDBEdit
        Left = 244
        Top = 18
        Width = 77
        Height = 21
        Hint = #1050#1086#1076' '#1047#1050#1055#1055
        TabStop = False
        Color = clBtnFace
        DataField = 'OldD_zkpp'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbePrevNameD: TDBEdit
        Left = 2
        Top = 57
        Width = 167
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        Ctl3D = True
        DataField = 'OldNameD'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
      end
      object dbePrevNameFull: TDBEdit
        Left = 169
        Top = 57
        Width = 165
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        DataField = 'OldNameFull'
        DataSource = DmMain.dsrcPere
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
      end
      object DbePrevKdOK: TDBEdit
        Left = 2
        Top = 18
        Width = 46
        Height = 21
        DataField = 'OLDKDOK'
        DataSource = DmMain.dsrcPere
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
      object DbePrevDolgnOK: TDBEdit
        Left = 47
        Top = 18
        Width = 122
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'OldDolgnOK'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
    end
    object PanelNewPos: TPanel
      Left = 1
      Top = 307
      Width = 340
      Height = 81
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 4
      object Label23: TLabel
        Left = 2
        Top = 2
        Width = 144
        Height = 13
        Caption = #1053#1086#1074#1099#1077' '#1050#1086#1076' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1054#1050
      end
      object Label30: TLabel
        Left = 174
        Top = 2
        Width = 37
        Height = 13
        Caption = #1050#1086#1076' '#1050#1055
      end
      object Label26: TLabel
        Left = 245
        Top = 2
        Width = 52
        Height = 13
        Caption = #1050#1086#1076' '#1047#1050#1055#1055
      end
      object sBtnGetNewOK: TSpeedButton
        Left = 322
        Top = 16
        Width = 15
        Height = 21
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088#1072' '#1054#1050
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnGetNewOKClick
      end
      object Label24: TLabel
        Left = 2
        Top = 40
        Width = 134
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      end
      object Label25: TLabel
        Left = 168
        Top = 40
        Width = 169
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080' '#1087#1086' '#1044#1050
      end
      object dbeNewKdOK: TDBEdit
        Left = 2
        Top = 16
        Width = 46
        Height = 21
        DataField = 'NEWKDOK'
        DataSource = DmMain.dsrcPere
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
      object dbeNewDolgnOK: TDBEdit
        Left = 47
        Top = 16
        Width = 122
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NewDolgnOK'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeNewCode: TDBEdit
        Left = 169
        Top = 16
        Width = 75
        Height = 21
        Hint = #1050#1086#1076' '#1055#1060
        TabStop = False
        Color = clBtnFace
        DataField = 'NewCode'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbeNewZ_kpp: TDBEdit
        Left = 244
        Top = 16
        Width = 77
        Height = 21
        Hint = #1050#1086#1076' '#1047#1050#1055#1055
        TabStop = False
        Color = clBtnFace
        DataField = 'NewD_zkpp'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object dbeNewNameD: TDBEdit
        Left = 2
        Top = 55
        Width = 167
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        DataField = 'NewNameD'
        DataSource = DmMain.dsrcPere
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
      end
      object dbeNewNameFull: TDBEdit
        Left = 169
        Top = 55
        Width = 165
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
        TabStop = False
        Color = clBtnFace
        DataField = 'NewNameFull'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
    end
    object PanelOldPos: TPanel
      Left = 1
      Top = 388
      Width = 340
      Height = 28
      Align = alTop
      Color = clSilver
      TabOrder = 5
      object Label10: TLabel
        Left = 2
        Top = 7
        Width = 58
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        FocusControl = dbeDolgn
      end
      object sBtnDolgn: TSpeedButton
        Left = 322
        Top = 4
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081
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
        OnClick = sBtnDolgnClick
      end
      object dbeDolgn: TDBEdit
        Left = 64
        Top = 3
        Width = 257
        Height = 21
        Hint = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        DataField = 'DOLGNOST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sBtnDolgnClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeDolgnKeyDown
      end
    end
    object PanelOthers: TPanel
      Left = 1
      Top = 416
      Width = 340
      Height = 125
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 6
      object Label16: TLabel
        Left = 4
        Top = 6
        Width = 70
        Height = 29
        AutoSize = False
        Caption = #1057#1093#1077#1084#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086
        FocusControl = dbeShPdNlg
        WordWrap = True
      end
      object Label17: TLabel
        Left = 229
        Top = 39
        Width = 47
        Height = 13
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091
        Caption = '% '#1083#1100#1075#1086#1090#1099
        FocusControl = dbeProcLg
      end
      object sBtnPdNlg: TSpeedButton
        Left = 151
        Top = 11
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1093#1077#1084' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnPdNlgClick
      end
      object Label2: TLabel
        Left = 4
        Top = 86
        Width = 63
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        FocusControl = dbeNotes
      end
      object Label7: TLabel
        Left = 173
        Top = 14
        Width = 47
        Height = 13
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Caption = #1057#1086#1074#1084#1077#1089#1090'.'
      end
      object sBtnSovm: TSpeedButton
        Left = 322
        Top = 11
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnSovmClick
      end
      object Label18: TLabel
        Left = 125
        Top = 39
        Width = 53
        Height = 13
        Hint = #1055#1088#1086#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080' '#1080#1083#1080' 0'
        Caption = #1048#1085#1074#1072#1083#1080#1076#1085'.'
        FocusControl = dbeInv
        ParentShowHint = False
        ShowHint = True
      end
      object sBtnLgt: TSpeedButton
        Left = 322
        Top = 36
        Width = 15
        Height = 21
        Hint = #1055#1077#1088#1077#1095#1077#1085#1100' '#1080' '#1080#1089#1090#1086#1088#1080#1103' '#1083#1100#1075#1086#1090
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnLgtClick
      end
      object sBtnInvDocs: TSpeedButton
        Left = 208
        Top = 36
        Width = 15
        Height = 21
        Hint = #1044#1086#1082#1091#1084#1077#1085#1090#1099', '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1077' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnInvDocsClick
      end
      object Label11: TLabel
        Left = 6
        Top = 66
        Width = 56
        Height = 13
        Caption = #8470' '#1087#1088#1080#1082#1072#1079#1072
        FocusControl = dbeNrPrikaza
      end
      object Label12: TLabel
        Left = 160
        Top = 66
        Width = 11
        Height = 13
        Caption = #1086#1090
        FocusControl = dbeDtPrikaza
      end
      object dbeShPdNlg: TDBEdit
        Left = 90
        Top = 11
        Width = 60
        Height = 21
        Hint = #1057#1093#1077#1084#1072' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        DataField = 'ShPdNlg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = sBtnPdNlgClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShPdNlgKeyDown
      end
      object DBChBoxPens: TDBCheckBox
        Left = 4
        Top = 38
        Width = 53
        Height = 17
        Hint = #1055#1088#1080#1079#1085#1072#1082' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1072
        Alignment = taLeftJustify
        Caption = #1055#1077#1085#1089'-'#1088
        DataField = 'PR_PENS'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeNotes: TDBEdit
        Left = 4
        Top = 100
        Width = 333
        Height = 21
        Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1076#1083#1103' '#1089#1077#1073#1103')'
        DataField = 'NOTES'
        DataSource = DmMain.dsrcPere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object DBChBoxProfs: TDBCheckBox
        Left = 63
        Top = 38
        Width = 55
        Height = 17
        Hint = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1089#1086#1102#1079#1085#1099#1093' '#1074#1079#1085#1086#1089#1086#1074
        Alignment = taLeftJustify
        Caption = #1055#1088#1086#1092#1089'.'
        DataField = 'PRFS'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnEnter = DBCheckBoxEnter
        OnExit = DBCheckBoxExit
      end
      object dbeShSovm: TDBEdit
        Left = 241
        Top = 11
        Width = 80
        Height = 21
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'ShSovm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = sBtnSovmClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShSovmKeyDown
      end
      object dbeInv: TDBEdit
        Left = 181
        Top = 36
        Width = 26
        Height = 21
        Hint = #1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100'. '#1055#1088#1086#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080' (1-3) '#1080#1083#1080' 0'
        DataField = 'INV'
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
        OnExit = dbeInvExit
      end
      object dbeSovm: TDBEdit
        Left = 225
        Top = 11
        Width = 17
        Height = 21
        Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'Sovm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnDblClick = sBtnSovmClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShSovmKeyDown
      end
      object dbePdNlg: TDBEdit
        Left = 74
        Top = 11
        Width = 17
        Height = 21
        Hint = #1050#1086#1076' '#1089#1093#1077#1084#1099' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        DataField = 'PdNlg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnDblClick = sBtnPdNlgClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShPdNlgKeyDown
      end
      object dbeProcLg: TDBEdit
        Left = 280
        Top = 36
        Width = 41
        Height = 21
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091'. '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1081' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
        DataField = 'ProcLG'
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
        OnDblClick = sBtnLgtClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
      object dbeNrPrikaza: TDBEdit
        Left = 74
        Top = 62
        Width = 72
        Height = 21
        Hint = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072' ('#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1103')'
        DataField = 'NR_PRIKAZA'
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
        OnExit = dbEditExit
      end
      object dbeDtPrikaza: TDBEdit
        Left = 181
        Top = 62
        Width = 77
        Height = 21
        Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' ('#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1103')'
        DataField = 'DT_PRIKAZA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnEnter = dbEditEnter
        OnExit = dbEditExit
      end
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 561
      Width = 340
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 7
      DesignSize = (
        340
        30)
      object BtnOk: TBitBtn
        Left = 172
        Top = 3
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1074#1086#1076
        TabOrder = 1
        Kind = bkOK
      end
      object BtnCancel: TBitBtn
        Left = 256
        Top = 3
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 2
        Kind = bkCancel
      end
      object chBoxPS: TCheckBox
        Left = 5
        Top = 4
        Width = 141
        Height = 22
        Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1074#1074#1086#1076#1080#1084#1086#1075#1086
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1088#1086#1096#1083#1099#1077' '#1084#1077#1089#1103#1094#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        WordWrap = True
        OnClick = chBoxPSClick
      end
    end
    object PanelDept: TPanel
      Left = 1
      Top = 57
      Width = 340
      Height = 40
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 8
      object LabelObj: TLabel
        Left = 4
        Top = 1
        Width = 80
        Height = 13
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        FocusControl = dbeShObj
      end
      object sBtnObj: TSpeedButton
        Left = 116
        Top = 16
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076'.'
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnObjClick
      end
      object Label5: TLabel
        Left = 133
        Top = 1
        Width = 110
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        FocusControl = dbeShKatP
      end
      object sBtnKatP: TSpeedButton
        Left = 233
        Top = 16
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnKatPClick
      end
      object Label6: TLabel
        Left = 250
        Top = 1
        Width = 84
        Height = 13
        Caption = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1083#1072#1090#1099
        FocusControl = dbeShSO
      end
      object sBtnSO: TSpeedButton
        Left = 322
        Top = 16
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1080#1089#1090#1077#1084' '#1086#1087#1083#1072#1090#1099
        Glyph.Data = {
          9E000000424D9E000000000000007600000028000000070000000A0000000100
          0400000000002800000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
          0070777077707700077070000070000000007700077077000770770007707777
          7770}
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnSOClick
      end
      object dbeKdObj: TDBEdit
        Left = 4
        Top = 16
        Width = 42
        Height = 21
        Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        DataField = 'KdObj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 0
        OnDblClick = dbeShObjDblClick
        OnEnter = dbEditEnter
        OnExit = dbeKdObjExit
        OnKeyDown = dbeShObjKeyDown
      end
      object dbeShObj: TDBEdit
        Left = 46
        Top = 16
        Width = 69
        Height = 21
        Hint = #1064#1080#1092#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        DataField = 'ShObj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = dbeShObjDblClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShObjKeyDown
      end
      object dbeKdKatP: TDBEdit
        Left = 133
        Top = 16
        Width = 27
        Height = 21
        DataField = 'KdKatP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        OnDblClick = sBtnKatPClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShKatPKeyDown
      end
      object dbeShKatP: TDBEdit
        Left = 160
        Top = 16
        Width = 72
        Height = 21
        Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        DataField = 'ShKatP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = sBtnKatPClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShKatPKeyDown
      end
      object dbeSO: TDBEdit
        Left = 250
        Top = 16
        Width = 19
        Height = 21
        DataField = 'SO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 4
        OnDblClick = sBtnSOClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShSOKeyDown
      end
      object dbeShSO: TDBEdit
        Left = 269
        Top = 16
        Width = 52
        Height = 21
        Hint = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1083#1072#1090#1099' ('#1086#1082#1083#1072#1076'.'#1090#1072#1088#1080#1092', '#1089#1076#1077#1083#1100#1085#1086')'
        DataField = 'ShSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnDblClick = sBtnSOClick
        OnEnter = dbEditEnter
        OnExit = dbEditExit
        OnKeyDown = dbeShSOKeyDown
      end
    end
  end
  object PanelCombSal: TPanel
    Left = 342
    Top = 0
    Width = 381
    Height = 592
    Align = alClient
    TabOrder = 1
    object Label14: TLabel
      Left = 1
      Top = 1
      Width = 379
      Height = 17
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1082#1086#1084#1073#1080#1085#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1086#1082#1083#1072#1076#1072
    end
    object dbgrDPere: TDBGrid
      Left = 1
      Top = 18
      Width = 379
      Height = 573
      Hint = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1082#1086#1084#1073#1080#1085#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1086#1082#1083#1072#1076#1072
      Align = alClient
      Color = 11597779
      DataSource = DmMain.dsrcDPere
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopCombSalary
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrDPereDrawColumnCell
      OnDblClick = dbgrDPereDblClick
      OnEnter = dbgrDPereEnter
      OnExit = dbgrDPereExit
      Columns = <
        item
          Expanded = False
          FieldName = 'PRCOKL'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OKLTRF'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Spz'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 92
          Visible = True
        end>
    end
  end
  object QryCmn: TQuery
    Left = 455
    Top = 113
  end
  object PopCombSalary: TPopupMenu
    OnPopup = PopCombSalaryPopup
    Left = 456
    Top = 64
    object popHead: TMenuItem
      Caption = '== '#1057#1086#1089#1090#1072#1074#1085#1086#1081' '#1086#1082#1083#1072#1076' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = '&'#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object PopPositions: TPopupMenu
    OnPopup = PopPositionsPopup
    Left = 392
    Top = 64
    object NCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnClick = NCopyClick
    end
    object NInsert: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      ShortCut = 16470
      OnClick = NInsertClick
    end
    object NCut: TMenuItem
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      ShortCut = 16472
      OnClick = NCutClick
    end
    object Sep2: TMenuItem
      Caption = '-'
    end
    object NView: TMenuItem
      Caption = #1042#1080#1076
      object NShowPrevPos: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' &'#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
        OnClick = NShowPrevPosClick
      end
      object NShowOldPos: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086#1083#1078#1085#1086#1089#1090#1100' '#1087#1086' &'#1089#1090#1072#1088#1086#1084#1091' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
        OnClick = NShowOldPosClick
      end
      object Sep1: TMenuItem
        Caption = '-'
      end
      object NFlatView: TMenuItem
        Caption = #1055#1083#1086#1089#1082#1080#1081' '#1074#1080#1076
        OnClick = NFlatViewClick
      end
    end
  end
end
