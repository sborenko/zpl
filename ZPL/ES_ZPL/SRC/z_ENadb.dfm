object FormENadb: TFormENadb
  Left = 116
  Top = 121
  BorderStyle = bsDialog
  Caption = 'FormENadb'
  ClientHeight = 619
  ClientWidth = 766
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDebug: TPanel
    Left = 440
    Top = 64
    Width = 205
    Height = 469
    TabOrder = 0
    Visible = False
    OnClick = PanelDebugClick
    DesignSize = (
      205
      469)
    object sBtnHlp: TSpeedButton
      Left = 80
      Top = 436
      Width = 25
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = BtnHlpClick
    end
    object LblFilter: TLabel
      Left = 67
      Top = 41
      Width = 73
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1074#1080#1076#1086#1074
    end
    object LblKdSpZ: TLabel
      Left = 67
      Top = 112
      Width = 68
      Height = 13
      Caption = #1050#1086#1076' '#1089#1095#1105#1090#1072' '#1041#1059
    end
    object LbxFilter: TListBox
      Left = 67
      Top = 58
      Width = 86
      Height = 32
      Color = clLime
      ItemHeight = 13
      Items.Strings = (
        '1400-1500 // '#1053#1072#1076#1073#1072#1074#1082#1080
        '1600-1700 // '#1044#1086#1087#1083#1072#1090#1099
        '1900-1905 // '#1055#1086#1089#1086#1073#1080#1103' ('#1082#1088#1086#1084#1077' 1905 -'#1074#1099#1093'.'#1087#1088#1080' '#1091#1074#1086#1083#1100#1085'.)'
        '1906-1951 // '#1055#1086#1089#1086#1073#1080#1103' ('#1082#1088#1086#1084#1077' 1905 -'#1074#1099#1093'.'#1087#1088#1080' '#1091#1074#1086#1083#1100#1085'.)'
        '')
      TabOrder = 0
    end
    object dbeKdSpZ: TDBEdit
      Left = 67
      Top = 129
      Width = 73
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'KdSpZ'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 673
    BevelOuter = bvNone
    Caption = 'PanelMain'
    TabOrder = 1
    object PanelTabN: TPanel
      Left = 0
      Top = 0
      Width = 409
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LblTabN: TLabel
        Left = 9
        Top = 12
        Width = 92
        Height = 13
        Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object LblFamIO: TLabel
        Left = 176
        Top = 12
        Width = 201
        Height = 13
        Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        AutoSize = False
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object SpeedButton1: TSpeedButton
        Left = 382
        Top = 8
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
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
      end
      object LblVidN: TLabel
        Left = 9
        Top = 38
        Width = 70
        Height = 13
        Caption = #1042#1080#1076' '#1085#1072#1076#1073#1072#1074#1082#1080
      end
      object BtnVidN: TSpeedButton
        Left = 382
        Top = 35
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
        OnClick = BtnVidNClick
      end
      object dbeTabN: TDBEdit
        Left = 110
        Top = 9
        Width = 58
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TabN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbeVidN: TDBEdit
        Left = 110
        Top = 35
        Width = 49
        Height = 21
        Hint = #1042#1080#1076
        DataField = 'VidN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentFont = False
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeVidNExit
      end
      object dbeShVidN: TDBEdit
        Left = 176
        Top = 35
        Width = 201
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
        ReadOnly = True
        TabOrder = 2
      end
    end
    object PanelSovm: TPanel
      Left = 0
      Top = 61
      Width = 409
      Height = 67
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LblDolgn: TLabel
        Left = 8
        Top = 2
        Width = 58
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      end
      object sBtnGetDlzhn: TSpeedButton
        Left = 234
        Top = 18
        Width = 15
        Height = 22
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
        OnClick = sBtnGetDlzhnClick
      end
      object LblVidSovm: TLabel
        Left = 260
        Top = 2
        Width = 96
        Height = 13
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        Caption = #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1086
      end
      object sBtnSovm: TSpeedButton
        Left = 382
        Top = 18
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
      object dbeKdDlzhn: TDBEdit
        Left = 9
        Top = 18
        Width = 32
        Height = 21
        DataField = 'KD_DLZHN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeDlzhn: TDBEdit
        Left = 43
        Top = 18
        Width = 129
        Height = 21
        TabStop = False
        DataField = 'DLZHN'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbeKdSovm: TDBEdit
        Left = 260
        Top = 18
        Width = 17
        Height = 21
        Hint = #1050#1086#1076' '#1074#1080#1076#1072' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'KD_SOVM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
      object dbeShSovm: TDBEdit
        Left = 280
        Top = 18
        Width = 101
        Height = 21
        Hint = #1042#1080#1076' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        DataField = 'SHSOVM'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object dbeKdProf: TDBEdit
        Left = 174
        Top = 18
        Width = 57
        Height = 21
        DataField = 'KD_PROF'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DbChBoxElTrudKn: TDBCheckBox
        Left = 10
        Top = 44
        Width = 103
        Height = 17
        Caption = #1042' '#1090#1088#1091#1076'. '#1082#1085#1080#1078#1082#1091
        DataField = 'IS_PERE'
        TabOrder = 5
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DbChBoxSpovMerge: TDBCheckBox
        Left = 288
        Top = 44
        Width = 105
        Height = 17
        Caption = #1055#1077#1088#1077#1074#1086#1076' ('#1057#1055#1054#1042')'
        DataField = 'SPOV_MERGE'
        TabOrder = 6
        ValueChecked = 'Y'
        ValueUnchecked = ' '
      end
    end
    object PanelGeneral: TPanel
      Left = 0
      Top = 128
      Width = 409
      Height = 381
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object grBoxSposob: TGroupBox
        Left = 0
        Top = 0
        Width = 409
        Height = 83
        Align = alTop
        Caption = ' '#1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' '
        Color = clBtnFace
        ParentColor = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object RBtnSposb1: TRadioButton
          Left = 24
          Top = 14
          Width = 297
          Height = 17
          Caption = #1087#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' ('#1089' '#1091#1095#1077#1090#1086#1084' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080')'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RBtnSposbClick
          OnEnter = BtnSpsRschEnter
          OnExit = BtnSpsRschExit
        end
        object RBtnSposb2: TRadioButton
          Left = 24
          Top = 30
          Width = 273
          Height = 17
          Caption = #1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1086#1081' '#1089#1091#1084#1084#1099' '#1086#1082#1083#1072#1076#1072' ('#1090#1072#1088#1080#1092#1072')'
          TabOrder = 1
          OnClick = RBtnSposbClick
          OnEnter = BtnSpsRschEnter
          OnExit = BtnSpsRschExit
        end
        object RBtnSposb3: TRadioButton
          Left = 24
          Top = 46
          Width = 313
          Height = 17
          Hint = #1055#1088#1080#1084#1077#1085#1103#1077#1090#1089#1103' '#1076#1083#1103' '#1090#1072#1082#1080#1093' '#1074#1080#1076#1086#1074', '#1082#1072#1082' '#1087#1086#1089#1086#1073#1080#1077' '#1085#1072' '#1063#1054#1054
          Caption = #1087#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' ('#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1086#1090#1088#1072#1073#1086#1090'.'#1074#1088#1077#1084#1077#1085#1080' '#1080' '#1086#1082#1083#1072#1076#1072')'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = RBtnSposbClick
          OnEnter = BtnSpsRschEnter
          OnExit = BtnSpsRschExit
        end
        object RBtnSposb4: TRadioButton
          Left = 24
          Top = 62
          Width = 313
          Height = 17
          Hint = 
            #1055#1088#1080#1084#1077#1085#1103#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1095#1090#1086#1073#1099' '#1086#1090#1084#1077#1090#1080#1090#1100' "'#1089#1086#1075#1083#1072#1096#1077#1085#1094#1077#1074'" '#1080' "'#1076#1086#1075#1086#1074#1086#1088#1085#1080#1082#1086#1074'"' +
            ' ('#1057#1091#1084#1084#1072' '#1074#1089#1077#1075#1076#1072' '#1076'.'#1073'. '#1085#1091#1083#1077#1084')'
          Caption = #1053#1091#1083#1077#1074#1072#1103' '#1089#1091#1084#1084#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' ('#1076#1083#1103' '#1090#1088#1091#1076'.'#1089#1086#1075#1083#1072#1096'. '#1080' '#1076#1086#1075#1086#1074#1086#1088#1086#1074')'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = True
          OnClick = RBtnSposbClick
        end
      end
      object PanelPartSal: TPanel
        Left = 0
        Top = 83
        Width = 409
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LblPartSal: TLabel
          Left = 8
          Top = 8
          Width = 89
          Height = 13
          Caption = #1063#1072#1089#1090#1080#1095#1085#1099#1081' '#1086#1082#1083#1072#1076
        end
        object CmbBxPartSal: TComboBoxEx
          Left = 112
          Top = 3
          Width = 289
          Height = 22
          ItemsEx = <>
          ItemHeight = 16
          TabOrder = 0
          Text = 'CmbBxPartSal'
          DropDownCount = 8
        end
      end
      object PanelOthers: TPanel
        Left = 0
        Top = 113
        Width = 409
        Height = 268
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object LblPeriod: TLabel
          Left = 9
          Top = 162
          Width = 101
          Height = 13
          Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080
          FocusControl = dbeDtBeg
          WordWrap = True
        end
        object LblObj: TLabel
          Left = 9
          Top = 66
          Width = 80
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        end
        object LblKatP: TLabel
          Left = 279
          Top = 66
          Width = 110
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        end
        object LblSchBU: TLabel
          Left = 279
          Top = 108
          Width = 41
          Height = 13
          Caption = #1057#1095#1077#1090' '#1041#1059
          FocusControl = dbeSpZ
        end
        object BtnObj: TSpeedButton
          Left = 210
          Top = 81
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
          OnClick = BtnObjClick
        end
        object BtnKatP: TSpeedButton
          Left = 382
          Top = 81
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
          OnClick = BtnKatPClick
        end
        object BtnSpZ: TSpeedButton
          Left = 382
          Top = 124
          Width = 15
          Height = 21
          Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
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
          OnClick = BtnSpZClick
        end
        object LblPrcWrkTm: TLabel
          Left = 9
          Top = 24
          Width = 112
          Height = 13
          Hint = 
            #1055#1088#1086#1094#1077#1085#1090' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1076#1083#1103' "'#1089#1086#1074#1080#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093'" '#1074#1080#1076#1086#1074' '#1080#1083#1080' '#1088#1072#1073#1086#1090#1072 +
            #1102#1097#1080#1093' '#1076#1077#1082#1088#1077#1090#1095#1080#1094
          AutoSize = False
          Caption = '% '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
          WordWrap = True
        end
        object LblNotes: TLabel
          Left = 9
          Top = 243
          Width = 63
          Height = 13
          Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
          Alignment = taRightJustify
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          ParentShowHint = False
          ShowHint = True
        end
        object LblPrBegNum: TLabel
          Left = 9
          Top = 197
          Width = 85
          Height = 13
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #1055#1088#1080#1082#1072#1079' '#1086' '#1085#1072#1095#1072#1083#1077
          FocusControl = dbeNrPrBeg
          ParentShowHint = False
          ShowHint = True
        end
        object LblPrEnd: TLabel
          Left = 9
          Top = 219
          Width = 109
          Height = 13
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #1055#1088#1080#1082#1072#1079' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080
          FocusControl = dbeNrPrEnd
          ParentShowHint = False
          ShowHint = True
        end
        object LblPrEndDt: TLabel
          Left = 261
          Top = 219
          Width = 11
          Height = 13
          Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #1086#1090
          FocusControl = dbeDtPrEnd
          ParentShowHint = False
          ShowHint = True
        end
        object LblPrBegDt: TLabel
          Left = 261
          Top = 197
          Width = 11
          Height = 13
          Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #1086#1090
          ParentShowHint = False
          ShowHint = True
        end
        object LblSmPrc: TLabel
          Left = 279
          Top = 24
          Width = 66
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1080#1083#1080' %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LblNICh: TLabel
          Left = 9
          Top = 108
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
        object BtnKdTemu: TSpeedButton
          Left = 210
          Top = 124
          Width = 16
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
          OnClick = BtnKdTemuClick
        end
        object LblGrp: TLabel
          Left = 170
          Top = 24
          Width = 35
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label14: TLabel
          Left = 143
          Top = 197
          Width = 11
          Height = 13
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #8470
          FocusControl = dbeNrPrBeg
          ParentShowHint = False
          ShowHint = True
        end
        object LblPrEndNum: TLabel
          Left = 143
          Top = 219
          Width = 11
          Height = 13
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #8470
          FocusControl = dbeNrPrEnd
          ParentShowHint = False
          ShowHint = True
        end
        object LblPeriodFrom: TLabel
          Left = 142
          Top = 162
          Width = 6
          Height = 13
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          Caption = #1089
          FocusControl = dbeNrPrBeg
          ParentShowHint = False
          ShowHint = True
        end
        object LblPeriodTo: TLabel
          Left = 261
          Top = 163
          Width = 12
          Height = 13
          Caption = #1087#1086
          FocusControl = dbeDtEnd
          Transparent = True
          WordWrap = True
        end
        object dbeSumProc: TDBEdit
          Left = 279
          Top = 39
          Width = 95
          Height = 21
          DataField = 'SUMPROC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtBeg: TDBEdit
          Left = 161
          Top = 158
          Width = 73
          Height = 21
          Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1083#1072#1090#1099
          DataField = 'DT_BEG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnEnter = dbeEnter
          OnExit = dbeDtBegExit
        end
        object dbeDtEnd: TDBEdit
          Left = 279
          Top = 158
          Width = 73
          Height = 21
          Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1074#1099#1087#1083#1072#1090#1099
          DataField = 'DT_END'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeSpZ: TDBEdit
          Left = 279
          Top = 124
          Width = 95
          Height = 21
          Hint = #1057#1095#1077#1090' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
          DataField = 'SchBU'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnDblClick = BtnSpZClick
          OnEnter = dbeEnter
          OnExit = dbeSpZExit
          OnKeyDown = dbeSpZKeyDown
        end
        object dbePrcWrkTm: TDBEdit
          Left = 9
          Top = 39
          Width = 52
          Height = 21
          Hint = 
            #1055#1088#1086#1094#1077#1085#1090' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '#1076#1083#1103' "'#1089#1086#1074#1080#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1093'" '#1074#1080#1076#1086#1074' (!!'#1042#1072#1078#1085#1086' '#1087 +
            #1088#1080' '#1088#1072#1089#1095#1105#1090#1072#1093' '#1076#1086#1087#1083#1072#1090' '#1076#1086' '#1052#1080#1085' '#1047#1087') '#1080#1083#1080' '#1088#1072#1073#1086#1090#1072#1102#1097#1080#1093' '#1076#1077#1082#1088#1077#1090#1095#1080#1094' '
          DataField = 'Prc_WT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeNotes: TDBEdit
          Left = 82
          Top = 240
          Width = 311
          Height = 21
          Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
          DataField = 'NOTES'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeNrPrBeg: TDBEdit
          Left = 161
          Top = 193
          Width = 73
          Height = 21
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          DataField = 'NRPRBEG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtPrBeg: TDBEdit
          Left = 279
          Top = 193
          Width = 73
          Height = 21
          Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          DataField = 'DTPRBEG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeNrPrEnd: TDBEdit
          Left = 161
          Top = 216
          Width = 73
          Height = 21
          Hint = #8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          DataField = 'NRPREND'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeDtPrEnd: TDBEdit
          Left = 279
          Top = 216
          Width = 73
          Height = 21
          Hint = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076#1073#1072#1074#1082#1080
          DataField = 'DTPREND'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeKdObj: TDBEdit
          Left = 9
          Top = 81
          Width = 45
          Height = 21
          Hint = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          DataField = 'KDOBJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 4
          ParentFont = False
          TabOrder = 3
          OnDblClick = BtnObjClick
          OnEnter = dbeEnter
          OnExit = dbeExit
          OnKeyDown = dbeShObjKeyDown
        end
        object dbeKdKatP: TDBEdit
          Left = 279
          Top = 81
          Width = 25
          Height = 21
          Hint = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          DataField = 'KdKatP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnDblClick = BtnKatPClick
          OnEnter = dbeEnter
          OnExit = dbeExit
          OnKeyDown = dbeKatPKeyDown
        end
        object dbeKatP: TDBEdit
          Left = 304
          Top = 81
          Width = 71
          Height = 21
          Hint = #1064#1080#1092#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          TabStop = False
          DataField = 'SHKATP'
          DataSource = DmMain.dsrcNadb
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnDblClick = BtnKatPClick
          OnKeyDown = dbeKatPKeyDown
        end
        object dbeNmTemu: TDBEdit
          Left = 55
          Top = 124
          Width = 155
          Height = 21
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
          TabStop = False
          Enabled = False
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
          OnDblClick = BtnKdTemuClick
          OnKeyDown = dbeKdTemuKeyDown
        end
        object dbeKdTemu: TDBEdit
          Left = 9
          Top = 124
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
          TabOrder = 7
          OnDblClick = BtnKdTemuClick
          OnEnter = dbeEnter
          OnExit = dbeExit
          OnKeyDown = dbeKdTemuKeyDown
        end
        object dbeGrp: TDBEdit
          Left = 170
          Top = 39
          Width = 31
          Height = 21
          DataField = 'GRP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeShObj: TDBEdit
          Left = 55
          Top = 81
          Width = 155
          Height = 21
          Hint = #1064#1080#1092#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1086#1090' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1074#1099#1087#1083#1072#1095#1080#1074#1072#1077#1090#1089#1103' '#1085#1072#1076#1073#1072#1074#1082#1072' ('#1076#1086#1087#1083#1072#1090#1072')'
          TabStop = False
          DataField = 'ShObj'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnKeyDown = dbeShObjKeyDown
        end
        object DbChBoxIgnNoPayVac: TDBCheckBox
          Left = 9
          Top = 4
          Width = 129
          Height = 17
          Caption = #1048#1075#1085#1086#1088'. '#1085#1077#1086#1087#1083'. '#1086#1090#1087'.'
          Color = clGradientActiveCaption
          DataField = 'IgnNoPayVac'
          ParentColor = False
          TabOrder = 17
          ValueChecked = 'Y'
          ValueUnchecked = ' '
        end
      end
    end
    object PanelRecalc: TPanel
      Left = 0
      Top = 509
      Width = 409
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      object LblPeresch: TLabel
        Left = 163
        Top = 20
        Width = 64
        Height = 13
        Alignment = taCenter
        Caption = 'LblPeresch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object LabelAlreadyExists: TLabel
        Left = 151
        Top = 3
        Width = 88
        Height = 13
        Alignment = taCenter
        Caption = 'LabelAlreadyExists'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ChBoxPS: TCheckBox
        Left = 133
        Top = 40
        Width = 125
        Height = 17
        Hint = 
          #1042#1074#1077#1089#1090#1080' '#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1074#1080#1076' 8801 '#1080#1083#1080' 8802 ('#1087#1088#1080#1085#1091#1076#1080 +
          #1090#1077#1083#1100#1085#1099#1081' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090')'
        Caption = #1042#1074#1077#1089#1090#1080' '#1087#1077#1088#1077#1089#1095#1077#1090
        Checked = True
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 0
        OnEnter = ChBoxEnter
        OnExit = ChBoxExit
      end
    end
    object PanelButtons: TPanel
      Left = 0
      Top = 573
      Width = 409
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object chBoxSvSpsRsch: TCheckBox
        Left = 13
        Top = 5
        Width = 101
        Height = 28
        Hint = 
          #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1089#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1080' '#1087#1088#1077#1076#1083#1072#1075#1072#1090#1100' '#1077#1075#1086' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102' ' +
          #1087#1088#1080' '#1089#1083#1077#1076#1091#1102#1097#1077#1084' '#1074#1074#1086#1076#1077' '#1085#1072#1076#1073#1072#1074#1086#1082
        Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1089#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        WordWrap = True
        OnEnter = ChBoxEnter
        OnExit = ChBoxExit
      end
      object bBtnCancel: TBitBtn
        Left = 317
        Top = 8
        Width = 74
        Height = 25
        Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
        Caption = #1054#1090#1082#1072#1079
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Kind = bkCancel
      end
      object bBtnOk: TBitBtn
        Left = 237
        Top = 8
        Width = 74
        Height = 25
        Hint = #1042#1099#1093#1086#1076' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
        Caption = #1042#1074#1086#1076
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Kind = bkOK
      end
      object bBtnNew: TBitBtn
        Left = 157
        Top = 8
        Width = 74
        Height = 25
        Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1100', '#1086#1090#1082#1088#1099#1074' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1086#1082#1091
        Caption = #1047#1072#1087#1080#1089#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
  end
  object qryTmp: TQuery
    Left = 445
    Top = 16
  end
end
