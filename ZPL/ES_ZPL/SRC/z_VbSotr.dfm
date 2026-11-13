object FormVbSotr: TFormVbSotr
  Left = 327
  Top = 348
  Width = 735
  Height = 460
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormVbSotr'
  Color = clBtnFace
  Constraints.MaxHeight = 850
  Constraints.MaxWidth = 735
  Constraints.MinHeight = 460
  Constraints.MinWidth = 735
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      727
      30)
    object sBtnStayOnTop: TSpeedButton
      Left = 4
      Top = 3
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
      AllowAllUp = True
      GroupIndex = 5
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStayOnTopClick
    end
    object bBtnClose: TBitBtn
      Left = 649
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      Spacing = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 280
    Height = 384
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 280
      Height = 223
      Align = alTop
      Alignment = taCenter
      Color = clBtnFace
      Lines.Strings = (
        #1057#1087#1088#1072#1074#1072' '#1087#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074' '
        #1074#1074#1086#1076#1080#1084#1086#1075#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103'. '#1055#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '
        #1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1093' '#1087#1086#1083#1077#1081' '#1074#1089#1077#1084' '#1087#1086#1076#1082#1083#1102#1095#1072#1077#1084#1099#1084' '#1074' '
        #1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084' '#1073#1091#1076#1091#1090' '#1074' '
        #1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1099' '#1079#1072#1087#1080#1089#1080' '#1074' '
        #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '
        #1089' '#1074#1074#1077#1076#1077#1085#1085#1099#1084#1080' '#1042#1072#1084#1080' '#1074#1082#1072#1079'i'#1074#1082#1072#1084#1080'.'
        #1063#1090#1086#1073#1099' '#1074#1082#1083#1102#1095#1080#1090#1100' ('#1074#1099#1082#1083#1102#1095#1080#1090#1100') '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '
        #1094#1077#1083#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1089#1076#1077#1083#1072#1081#1090#1077' '#1085#1072' '#1085#1077#1084' '
        #1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081'. '#1040#1085#1072#1083#1086#1075#1080#1095#1085#1086' '#1084#1086#1078#1085#1086' '
        #1074#1082#1083#1102#1095#1080#1090#1100' ('#1074#1099#1082#1083#1102#1095#1080#1090#1100') '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '
        #1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
        '')
      ReadOnly = True
      TabOrder = 0
    end
    object LbxFilter: TListBox
      Left = 13
      Top = 241
      Width = 62
      Height = 32
      Color = clRed
      ItemHeight = 13
      Items.Strings = (
        '1000-2399')
      TabOrder = 1
      Visible = False
    end
    object dbgrObj: TDBGrid
      Left = 0
      Top = 223
      Width = 280
      Height = 161
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Align = alClient
      Color = clBtnFace
      DataSource = dsrcObj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrObjDblClick
      OnEnter = dbgrEnter
      OnExit = dbgrExit
      OnKeyDown = dbgrObjKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOBJ'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COUNT'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMOBJ'
          Width = 85
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 727
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 287
    Top = 30
    Width = 440
    Height = 384
    ActivePage = tsOtkl
    Align = alRight
    Constraints.MaxWidth = 440
    Constraints.MinWidth = 440
    Style = tsButtons
    TabOrder = 3
    object tsOtkl: TTabSheet
      Caption = 'tsOtkl'
      object panelOtkl: TPanel
        Left = 0
        Top = 0
        Width = 432
        Height = 223
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Bevel1: TBevel
          Left = 8
          Top = 53
          Width = 427
          Height = 29
        end
        object Label1: TLabel
          Left = 5
          Top = 1
          Width = 91
          Height = 32
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103')'
          FocusControl = dbeVidN
          WordWrap = True
        end
        object Label3: TLabel
          Left = 278
          Top = 8
          Width = 51
          Height = 13
          Caption = #1047#1072' '#1084#1077#1089#1103#1094':'
          FocusControl = dbeZaMesGod
        end
        object Label4: TLabel
          Left = 52
          Top = 32
          Width = 46
          Height = 13
          Caption = #1044#1072#1090#1099': - '#1089
          FocusControl = dbeDtBeg
        end
        object Label5: TLabel
          Left = 193
          Top = 32
          Width = 61
          Height = 13
          Caption = '- '#1087#1086' ('#1074#1082#1083#1102#1095'.)'
          FocusControl = dbeDtEnd
        end
        object Label6: TLabel
          Left = 344
          Top = 25
          Width = 39
          Height = 28
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1050#1086#1083#1080#1095'. '#1095#1072#1089#1086#1074
          FocusControl = dbeChas
          WordWrap = True
        end
        object Label8: TLabel
          Left = 8
          Top = 84
          Width = 80
          Height = 13
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          FocusControl = dbeShObj
        end
        object Label9: TLabel
          Left = 283
          Top = 84
          Width = 110
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          FocusControl = dbeShKatP
        end
        object Label10: TLabel
          Left = 283
          Top = 125
          Width = 72
          Height = 13
          Caption = #1057#1095#1077#1090' '#1073#1091#1093'.'#1091#1095#1077#1090#1072
          FocusControl = dbeSPZ
        end
        object Label11: TLabel
          Left = 28
          Top = 170
          Width = 130
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1077#1089#1083#1080' '#1085#1091#1078#1085#1086')'
          FocusControl = dbeNotes
        end
        object sBtnVidN: TSpeedButton
          Left = 253
          Top = 5
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
        object sBtnZaMesGod: TSpeedButton
          Left = 416
          Top = 5
          Width = 15
          Height = 21
          Hint = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
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
          OnClick = sBtnZaMesGodClick
        end
        object sBtnKdObj: TSpeedButton
          Left = 115
          Top = 99
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
          OnClick = sBtnKdObjClick
        end
        object sBtnKdKatP: TSpeedButton
          Left = 366
          Top = 99
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
          OnClick = sBtnKdKatPClick
        end
        object sBtnKdSpZ: TSpeedButton
          Left = 366
          Top = 140
          Width = 15
          Height = 21
          Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' ('#1087#1083#1072#1085#1072') '#1089#1095#1077#1090#1086#1074
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
          OnClick = sBtnKdSpZClick
        end
        object Label2: TLabel
          Left = 14
          Top = 60
          Width = 93
          Height = 13
          Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1088#1072#1089#1095#1077#1090#1072
        end
        object Bevel2: TBevel
          Left = 110
          Top = 53
          Width = 2
          Height = 29
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel3: TBevel
          Left = 226
          Top = 53
          Width = 2
          Height = 29
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel4: TBevel
          Left = 368
          Top = 53
          Width = 2
          Height = 29
          Shape = bsFrame
          Style = bsRaised
        end
        object Label12: TLabel
          Left = 8
          Top = 125
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
          Left = 214
          Top = 140
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
        object dbeShVidN: TDBEdit
          Left = 147
          Top = 5
          Width = 105
          Height = 21
          Hint = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'/'#1091#1076#1077#1088#1078#1072#1085#1080#1103
          TabStop = False
          DataField = 'ShVidN'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnDblClick = sBtnVidNClick
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeVidNKeyDown
        end
        object dbeVidN: TDBEdit
          Left = 105
          Top = 5
          Width = 43
          Height = 21
          Hint = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'/'#1091#1076#1077#1088#1078#1072#1085#1080#1103
          DataField = 'VidN'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnDblClick = sBtnVidNClick
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeVidNKeyDown
        end
        object dbeZaMesGod: TDBEdit
          Left = 332
          Top = 5
          Width = 82
          Height = 21
          Hint = #1047#1072' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
          DataField = 'MyZaMesGod'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnDblClick = sBtnZaMesGodClick
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeZaMesGodKeyDown
        end
        object dbeDtBeg: TDBEdit
          Left = 105
          Top = 29
          Width = 80
          Height = 21
          DataField = 'Dt_Beg'
          DataSource = dsrcTmp
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
        object dbeDtEnd: TDBEdit
          Left = 256
          Top = 29
          Width = 80
          Height = 21
          DataField = 'Dt_End'
          DataSource = dsrcTmp
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
        object dbeChas: TDBEdit
          Left = 387
          Top = 29
          Width = 47
          Height = 21
          DataField = 'Chas'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeSumma: TDBEdit
          Left = 373
          Top = 57
          Width = 58
          Height = 21
          Hint = #1057#1091#1084#1084#1072' ('#1055#1088#1086#1094#1077#1085#1090')'
          DataField = 'Summa'
          DataSource = dsrcTmp
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
        object dbeShObj: TDBEdit
          Left = 8
          Top = 99
          Width = 107
          Height = 21
          Hint = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1086#1090' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
          DataField = 'ShObj'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnDblClick = sBtnKdObjClick
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeShObjKeyDown
        end
        object dbeShKatP: TDBEdit
          Left = 283
          Top = 99
          Width = 83
          Height = 21
          Hint = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '#1087#1086' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1102
          DataField = 'ShKatP'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnDblClick = sBtnKdKatPClick
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeShKatPKeyDown
        end
        object dbeSPZ: TDBEdit
          Left = 283
          Top = 140
          Width = 83
          Height = 21
          Hint = #1057#1095#1077#1090' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072
          DataField = 'SPZ'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnEnter = dbEditEnter
          OnExit = dbEditExit
          OnKeyDown = dbeSPZKeyDown
        end
        object dbeNotes: TDBEdit
          Left = 169
          Top = 167
          Width = 264
          Height = 21
          Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
          DataField = 'Notes'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object chBoxKdObj: TCheckBox
          Left = 143
          Top = 101
          Width = 45
          Height = 17
          Hint = #1045#1089#1083#1080' '#1089#1090#1086#1080#1090' '#1084#1077#1090#1082#1072' - '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1087#1088#1077#1076#1077#1083#1103#1077#1090#1089#1103' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1084
          TabStop = False
          Caption = #1072#1074#1090#1086
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnClick = chBoxKdObjClick
        end
        object chBoxKdKatP: TCheckBox
          Left = 385
          Top = 101
          Width = 45
          Height = 17
          Hint = #1045#1089#1083#1080' '#1089#1090#1086#1080#1090' '#1084#1077#1090#1082#1072' - '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1087#1088#1077#1076#1077#1083#1103#1077#1090#1089#1103' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1084
          TabStop = False
          BiDiMode = bdLeftToRight
          Caption = #1072#1074#1090#1086
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          OnClick = chBoxKdKatPClick
        end
        object chBoxKdSpZ: TCheckBox
          Left = 385
          Top = 142
          Width = 45
          Height = 17
          Hint = #1045#1089#1083#1080' '#1089#1090#1086#1080#1090' '#1084#1077#1090#1082#1072' - '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1087#1088#1077#1076#1077#1083#1103#1077#1090#1089#1103' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1084
          TabStop = False
          Caption = #1072#1074#1090#1086
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          OnClick = chBoxKdSpZClick
        end
        object rBtnSmm: TRadioButton
          Left = 114
          Top = 59
          Width = 108
          Height = 17
          Hint = #1042#1099#1073#1088#1072#1085#1085#1099#1084' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084' '#1074#1074#1086#1076#1080#1090#1089#1103' '#1079#1072#1076#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
          Alignment = taLeftJustify
          Caption = '- '#1079#1072#1076#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          TabStop = True
        end
        object rBtnPrc: TRadioButton
          Left = 229
          Top = 59
          Width = 137
          Height = 17
          Hint = #1042#1074#1086#1076#1080#1090#1089#1103' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1086#1082#1083#1072#1076#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          Alignment = taLeftJustify
          Caption = '- '#1079#1072#1076#1072#1085#1085#1099#1081' % '#1086#1090' '#1086#1082#1083#1072#1076#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          TabStop = True
        end
        object PanelKatPers: TPanel
          Left = 1
          Top = 192
          Width = 430
          Height = 30
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clMoneyGreen
          TabOrder = 18
          object Label7: TLabel
            Left = 110
            Top = 7
            Width = 218
            Height = 13
            Caption = #1047#1072#1076#1072#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1082#1080
            Enabled = False
          end
          object sBtnNeedKdKatP: TSpeedButton
            Left = 414
            Top = 4
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
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
            OnClick = sBtnNeedKdKatPClick
          end
          object chBoxAllKatP: TCheckBox
            Left = 8
            Top = 5
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = #1042#1089#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chBoxAllKatPClick
          end
          object dbeShNeedKatP: TDBEdit
            Left = 333
            Top = 4
            Width = 80
            Height = 21
            DataField = 'ShNeedKatP'
            DataSource = dsrcTmp
            Enabled = False
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
        end
        object dbeKdTemu: TDBEdit
          Left = 8
          Top = 140
          Width = 45
          Height = 21
          Hint = #1050#1086#1076' '#1090#1077#1084#1099
          DataField = 'KdTemu'
          DataSource = dsrcTmp
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
          OnEnter = dbEditEnter
          OnExit = dbeKdTemuExit
        end
        object dbeNmTemu: TDBEdit
          Left = 56
          Top = 140
          Width = 154
          Height = 21
          Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
          TabStop = False
          Color = clBtnFace
          DataField = 'NmTemu'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object dbeKdSpZ: TDBEdit
          Left = 192
          Top = 81
          Width = 73
          Height = 21
          TabStop = False
          DataField = 'KDSPZ'
          DataSource = dsrcTmp
          TabOrder = 19
          Visible = False
        end
      end
      object dbgrSps: TDBGrid
        Left = 0
        Top = 223
        Width = 432
        Height = 130
        Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Align = alClient
        Color = clSkyBlue
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSpsDrawColumnCell
        OnDblClick = dbgrSpsDblClick
        OnEnter = dbgrEnter
        OnExit = dbgrExit
        OnKeyDown = dbgrSpsKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHKATP'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 118
            Visible = True
          end>
      end
    end
    object tsNdb: TTabSheet
      Caption = 'tsNdb'
      ImageIndex = 1
      object panelNdb: TPanel
        Left = 0
        Top = 0
        Width = 432
        Height = 223
        Align = alTop
        Caption = 'panelNdb'
        TabOrder = 0
      end
      object dbgrSpsNdb: TDBGrid
        Left = 0
        Top = 223
        Width = 432
        Height = 130
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsStrikeOut]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object qryObj: TQuery
    OnCalcFields = qryObjCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct ko.AIndx, s.KdObj, Count(s.NR), ko.ShObj, ko.NmO' +
        'bj'
      'from z_sps s'
      '     Left outer join z_KdObj ko on ko.KdObj = s.KdObj'
      'where s.dtProc = '#39'2005/09/01'#39' '
      'group by ko.AIndx, s.KdObj, ko.ShObj, ko.NmObj')
    Left = 56
    Top = 296
    object qryObjAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object qryObjKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryObjCOUNT: TIntegerField
      DisplayLabel = #1050'-'#1074#1086#1057#1086#1090#1088
      FieldName = 'COUNT'
    end
    object qryObjSHOBJ: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryObjNMOBJ: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NMOBJ'
      Size = 65
    end
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcObj
    SQL.Strings = (
      
        'Select sps.TabN, sps.KdKatP, ktg.ShKatP, upi.Fam, Upi.Ima, upi.O' +
        'tch '
      'from z_sps sps'
      '     Left outer join z_Upi upi on upi.TabN = sps.TabN'
      '     Left outer join z_KatPers ktg on Ktg.KdKatP = sps.KdKatP'
      'where sps.dtProc = '#39'2005/09/01'#39' and sps.KdObj = :KdObj'
      'order by Fam, Ima, otch')
    Left = 312
    Top = 304
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDOBJ'
        ParamType = ptUnknown
        Size = 2
      end>
    object qrySpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qrySpsKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qrySpsSHKATP: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'SHKATP'
      Size = 10
    end
    object qrySpsFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    Left = 72
    Top = 304
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 328
    Top = 320
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NeedKdKatP'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'Chas'
        DataType = ftFloat
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'KdKatP'
        DataType = ftInteger
      end
      item
        Name = 'KdSpZ'
        DataType = ftInteger
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'NmTemu'
        DataType = ftString
        Size = 65
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsTmpCalcFields
    Left = 194
    Top = 198
    object cdsTmpNeedKdKatP: TIntegerField
      FieldName = 'NeedKdKatP'
    end
    object cdsTmpShNeedKatP: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShNeedKatP'
      Calculated = True
    end
    object cdsTmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsTmpShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object cdsTmpDtProc: TDateField
      FieldName = 'DtProc'
    end
    object cdsTmpZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      OnSetText = cdsTmpZaMesGodSetText
    end
    object cdsTmpMyZaMesGod: TStringField
      FieldKind = fkCalculated
      FieldName = 'MyZaMesGod'
      Size = 7
      Calculated = True
    end
    object cdsTmpDt_Beg: TDateField
      FieldName = 'Dt_Beg'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDt_End: TDateField
      FieldName = 'Dt_End'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpChas: TFloatField
      FieldName = 'Chas'
    end
    object cdsTmpSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '#.00'
    end
    object cdsTmpKdObj: TIntegerField
      FieldName = 'KdObj'
    end
    object cdsTmpShObj: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 15
      Calculated = True
    end
    object cdsTmpKdKatP: TIntegerField
      FieldName = 'KdKatP'
    end
    object cdsTmpShKatP: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Size = 10
      Calculated = True
    end
    object cdsTmpKdSpZ: TIntegerField
      FieldName = 'KdSpZ'
    end
    object cdsTmpSPZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'SPZ'
      Size = 10
      Calculated = True
    end
    object cdsTmpNotes: TStringField
      DisplayWidth = 20
      FieldName = 'Notes'
      Size = 254
    end
    object cdsTmpKdTemu: TSmallintField
      FieldName = 'KdTemu'
    end
    object cdsTmpNmTemu: TStringField
      FieldName = 'NmTemu'
      Size = 65
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 208
    Top = 216
  end
end
