object FormEAUdrg: TFormEAUdrg
  Left = 337
  Top = 229
  BorderStyle = bsDialog
  Caption = 'FormEAUdrg'
  ClientHeight = 576
  ClientWidth = 307
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
  object PanelTools: TPanel
    Left = 0
    Top = 542
    Width = 307
    Height = 34
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object bBtnOk: TBitBtn
      Left = 131
      Top = 2
      Width = 75
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Caption = #1042#1074#1086#1076
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 225
      Top = 2
      Width = 75
      Height = 25
      Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
      Caption = #1054#1090#1082#1072#1079
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 367
    Width = 307
    Height = 170
    ActivePage = tsAlim
    Align = alTop
    MultiLine = True
    TabOrder = 2
    TabPosition = tpBottom
    object tsAlim: TTabSheet
      Caption = 'tsAlim'
      object LabelPosta: TLabel
        Left = 2
        Top = 3
        Width = 52
        Height = 13
        Caption = #1042#1080#1076' '#1087#1086#1095#1090#1099
      end
      object LabelAdres: TLabel
        Left = 2
        Top = 19
        Width = 55
        Height = 13
        Caption = #1054#1090#1088#1080#1084#1091#1074#1072#1095
      end
      object sBtnPst: TSpeedButton
        Left = 280
        Top = 1
        Width = 15
        Height = 21
        Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088'-'#1082#1072' '#1074#1080#1076#1086#1074' '#1087#1086#1095#1090#1099
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
        OnClick = sBtnPstClick
      end
      object LblInn: TLabel
        Left = 0
        Top = 104
        Width = 84
        Height = 13
        Caption = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      end
      object LblOznDoh: TLabel
        Left = 184
        Top = 104
        Width = 77
        Height = 13
        Caption = #1054#1079#1085#1072#1082#1072' '#1076#1086#1076#1086#1076#1072
      end
      object BtnOznDoh: TSpeedButton
        Left = 280
        Top = 120
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
        OnClick = BtnOznDohClick
      end
      object dbePosta: TDBEdit
        Left = 64
        Top = 0
        Width = 215
        Height = 21
        Hint = #1042#1080#1076' ('#1082#1086#1076') '#1087#1086#1095#1090#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' ('#1074#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072')'
        DataField = 'NmPst'
        DataSource = DmMain.dsrcUdrg
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
        OnKeyDown = dbePostaKeyDown
      end
      object DbMemAddress: TDBMemo
        Left = 0
        Top = 32
        Width = 297
        Height = 65
        DataField = 'Adres'
        TabOrder = 1
        OnEnter = DbMemEnter
        OnExit = DbMemExit
      end
      object DbeInn: TDBEdit
        Left = 0
        Top = 120
        Width = 145
        Height = 21
        DataField = 'TargetInn'
        TabOrder = 2
        OnExit = DbeInnExit
      end
      object DbeOznDoh: TDBEdit
        Left = 184
        Top = 120
        Width = 89
        Height = 21
        DataField = 'OznDoh'
        TabOrder = 3
      end
    end
    object tsSberk: TTabSheet
      Caption = 'tsSberk'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 7
        Width = 91
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1089#1073#1077#1088#1073#1072#1085#1082#1072
        FocusControl = dbeNomSberBank
      end
      object Label3: TLabel
        Left = 3
        Top = 32
        Width = 115
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
        FocusControl = dbeLicSchet
      end
      object dbeNomSberBank: TDBEdit
        Left = 127
        Top = 4
        Width = 157
        Height = 21
        DataField = 'NOMSBERBANK'
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
      object dbeLicSchet: TDBEdit
        Left = 127
        Top = 29
        Width = 157
        Height = 21
        DataField = 'LICSCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnEnter = dbeEnter
        OnExit = dbeExit
      end
    end
    object tsDummy: TTabSheet
      Caption = 'tsDummy'
      ImageIndex = 2
      object Label4: TLabel
        Left = 0
        Top = 3
        Width = 63
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        FocusControl = dbeNotes
      end
      object dbeNotes: TDBEdit
        Left = 0
        Top = 19
        Width = 295
        Height = 21
        DataField = 'NOTES'
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
    end
  end
  object PanelComu: TPanel
    Left = 0
    Top = 289
    Width = 307
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label10: TLabel
      Left = 4
      Top = 7
      Width = 112
      Height = 13
      Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1090#1077#1078#1091
      Transparent = True
    end
    object DbMemKomu: TDBMemo
      Left = 0
      Top = 20
      Width = 305
      Height = 56
      DataField = 'Komu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = DbMemEnter
      OnExit = DbMemExit
    end
  end
  object PanelCommon: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 289
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 43
      Top = 72
      Width = 77
      Height = 13
      Caption = #1042#1080#1076' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
    end
    object LabelSumDolg: TLabel
      Left = 3
      Top = 179
      Width = 70
      Height = 13
      Caption = #1054#1073#1097#1057#1084#1044#1086#1083#1075#1072
      FocusControl = dbeSumDolg
    end
    object LabelSumVzn: TLabel
      Left = 89
      Top = 179
      Width = 57
      Height = 13
      Caption = #1057#1084'(%)'#1059#1076#1088#1078
      FocusControl = dbeSumVzn
    end
    object Label6: TLabel
      Left = 3
      Top = 220
      Width = 52
      Height = 13
      Hint = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1099'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
      Caption = #8470' '#1087#1086#1089#1090#1072#1085'.'
      FocusControl = dbeNomDok
    end
    object Label7: TLabel
      Left = 3
      Top = 265
      Width = 52
      Height = 13
      Caption = #1044#1090' '#1085#1072#1095#1072#1083#1072
      FocusControl = dbeDt_Beg
    end
    object LabelDt_End: TLabel
      Left = 153
      Top = 265
      Width = 61
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
      FocusControl = dbeDt_End
    end
    object Label9: TLabel
      Left = 200
      Top = 179
      Width = 41
      Height = 13
      Caption = #1057#1095#1077#1090' '#1041#1059
      FocusControl = dbeSPZ
    end
    object sBtnVidN: TSpeedButton
      Left = 285
      Top = 72
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
    object sBtnSPZ: TSpeedButton
      Left = 285
      Top = 193
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
      OnClick = sBtnSPZClick
    end
    object LabelFamIO: TLabel
      Left = 5
      Top = 4
      Width = 276
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelFamIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtSP: TDBText
      Left = 159
      Top = 197
      Width = 38
      Height = 17
      DataField = 'SP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNrPost: TLabel
      Left = 3
      Top = 241
      Width = 46
      Height = 13
      Caption = #8470' '#1076#1086#1082'-'#1090#1072
      FocusControl = dbeNrPost
    end
    object LabelDtPost: TLabel
      Left = 205
      Top = 241
      Width = 11
      Height = 13
      Caption = #1086#1090
      FocusControl = dbeDtPost
    end
    object Label5: TLabel
      Left = 205
      Top = 220
      Width = 11
      Height = 13
      Caption = #1086#1090
    end
    object sBtnKdSlg: TSpeedButton
      Left = 288
      Top = 40
      Width = 11
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
      OnClick = sBtnKdSlgClick
    end
    object Label8: TLabel
      Left = 4
      Top = 24
      Width = 125
      Height = 13
      Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1087#1103' '#1089#1083#1091#1078#1073#1072
    end
    object dbeSumDolg: TDBEdit
      Left = 3
      Top = 193
      Width = 75
      Height = 21
      Hint = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1083#1075#1072' '
      DataField = 'SUMDOLG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeSumVzn: TDBEdit
      Left = 89
      Top = 193
      Width = 64
      Height = 21
      Hint = #1057#1091#1084#1084#1072' ('#1080#1083#1080' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084#1099' '#1076#1086#1083#1075#1072')'
      DataField = 'SUMVZN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeNomDok: TDBEdit
      Left = 63
      Top = 238
      Width = 137
      Height = 21
      Hint = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
      DataField = 'NOMDOK'
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
      OnExit = dbeExit
    end
    object dbeDt_Beg: TDBEdit
      Left = 63
      Top = 262
      Width = 80
      Height = 21
      Hint = #1044#1072#1090#1072' ('#1084#1077#1089#1103#1094') '#1085#1072#1095#1072#1083#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
      DataField = 'DT_BEG'
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
    object dbeDt_End: TDBEdit
      Left = 220
      Top = 262
      Width = 80
      Height = 21
      Hint = #1044#1072#1090#1072' ('#1084#1077#1089#1103#1094') '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
      DataField = 'DT_END'
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
    object dbeSPZ: TDBEdit
      Left = 200
      Top = 193
      Width = 83
      Height = 21
      Hint = #1057#1095#1077#1090' '#1041#1091#1093#1059#1095#1077#1090#1072
      DataField = 'SPZ'
      DataSource = DmMain.dsrcUdrg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnDblClick = sBtnSPZClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeSPZKeyDown
    end
    object dbeShVidN: TDBEdit
      Left = 163
      Top = 72
      Width = 121
      Height = 21
      Hint = #1057#1086#1082#1088#1072#1097'.'#1085#1072#1079#1074#1072#1085#1080#1077' ('#1096#1080#1092#1088') '#1074#1080#1076#1072
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
      OnKeyDown = dbeVidNKeyDown
    end
    object dbeVidN: TDBEdit
      Left = 128
      Top = 72
      Width = 35
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
    object GroupBox1: TGroupBox
      Left = 2
      Top = 96
      Width = 298
      Height = 81
      Caption = ' '#1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072' '
      TabOrder = 4
      object rBtnSps2: TRadioButton
        Left = 9
        Top = 28
        Width = 270
        Height = 17
        Hint = 
          #1055#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' ('#1077#1089#1083#1080' '#1086#1085#1072' '#1085#1077' '#1087#1088#1077#1074#1099#1096#1072#1077#1090' '#1089#1091#1084#1084#1099' '#1079#1072#1088#1072#1073#1086#1090#1082#1072' '#1079#1072' '#1074#1099#1095#1077#1090 +
          #1086#1084' '#1091#1076#1077#1088#1078#1072#1085#1080#1081')'
        Caption = #1087#1086#1089#1090'. '#1089#1091#1084#1084#1072' '#1086#1090' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1076#1086' '#1076#1072#1090#1099' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = rBtnSpsClick
      end
      object rBtnSps1: TRadioButton
        Left = 9
        Top = 13
        Width = 270
        Height = 17
        Hint = '% '#1090#1086#1083#1100#1082#1086' '#1086#1090' '#1089#1091#1084#1084#1099' '#1086#1082#1083#1072#1076#1072' ('#1090#1072#1088#1080#1092#1072')'
        Caption = '% '#1086#1090' '#1086#1082#1083#1072#1076#1072' '#1086#1090' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1076#1086' '#1076#1072#1090#1099' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        TabOrder = 0
        OnClick = rBtnSpsClick
      end
      object rBtnSps4: TRadioButton
        Left = 9
        Top = 58
        Width = 270
        Height = 17
        Caption = #1087#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1090' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1076#1086' '#1087#1086#1075#1072#1096#1077#1085#1080#1103
        TabOrder = 3
        OnClick = rBtnSpsClick
      end
      object rBtnSps3: TRadioButton
        Left = 9
        Top = 43
        Width = 282
        Height = 17
        Hint = 
          '% '#1086#1090' '#1089#1091#1084#1084#1099' '#1079#1072#1088#1072#1073#1086#1090#1082#1072' '#1087#1086#1089#1083#1077' '#1074#1089#1077#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1080#1083#1080' '#1076#1086' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1086#1073#1097#1077#1081 +
          ' '#1089#1091#1084#1084#1099' '#1076#1086#1083#1075#1072
        Caption = '% '#1086#1090' '#1089#1091#1084#1084#1099' '#1079#1072#1088#1072#1073#1086#1090#1082#1072' '#1086#1090' '#1076#1072#1090#1099' '#1085#1072#1095'. '#1076#1086' '#1087#1086#1075#1072#1096#1077#1085#1080#1103
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = rBtnSpsClick
      end
    end
    object LbxFilter: TListBox
      Left = 264
      Top = -7
      Width = 30
      Height = 35
      Color = clLime
      ItemHeight = 13
      Items.Strings = (
        '6000-6001 // '#1059#1076#1077#1088#1078#1072#1085#1080#1103' ('#1091#1079#1077#1083')'
        '6601-6602 // '#1040#1083#1080#1084#1077#1085#1090#1099
        '6611-6612 // '#1055#1077#1088#1077#1074#1086#1076#1099
        '6615-6615 // '#1044#1077#1087#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077
        '6637-6728 // '#1056#1072#1079#1085#1099#1077' ('#1089#1084'.'#1089#1087#1088'-'#1082')'
        '7500-7501 // '#1042#1099#1087#1083#1072#1090#1099' ('#1091#1079#1077#1083')'
        '7519-7520 // '#1057#1073#1077#1088#1082#1072#1089#1089#1072)
      TabOrder = 14
      Visible = False
    end
    object dbeNrPost: TDBEdit
      Left = 63
      Top = 217
      Width = 137
      Height = 21
      Hint = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
      DataField = 'NRPOST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeDtPost: TDBEdit
      Left = 220
      Top = 217
      Width = 80
      Height = 21
      Hint = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
      DataField = 'DTPOST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeDtDok: TDBEdit
      Left = 220
      Top = 238
      Width = 80
      Height = 21
      Hint = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DataField = 'DtDok'
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
    object dbeKdSlg: TDBEdit
      Left = 4
      Top = 40
      Width = 24
      Height = 21
      Hint = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1083#1075#1072' '
      DataField = 'KDSLG'
      DataSource = DmMain.dsrcUdrg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = sBtnKdSlgClick
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeNmSlg: TDBEdit
      Left = 26
      Top = 40
      Width = 259
      Height = 21
      Hint = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      TabStop = False
      Color = clBtnFace
      DataField = 'NmSlg'
      DataSource = DmMain.dsrcUdrg
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
  end
end
