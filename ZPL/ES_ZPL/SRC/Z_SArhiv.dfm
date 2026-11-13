object FormArhivka: TFormArhivka
  Left = 294
  Top = 182
  Width = 384
  Height = 378
  BorderIcons = [biSystemMenu]
  Caption = 'FormArhivka'
  Color = clBtnFace
  Constraints.MaxHeight = 525
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 378
  Constraints.MinWidth = 335
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 376
    Height = 351
    ActivePage = ts0
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControlResize
    object ts0: TTabSheet
      Caption = 'ts0'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = False
      object PanelTs0: TPanel
        Left = 9
        Top = 2
        Width = 304
        Height = 279
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label9: TLabel
          Left = 13
          Top = 89
          Width = 95
          Height = 13
          Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
        end
        object sBtnTabN: TSpeedButton
          Left = 268
          Top = 85
          Width = 21
          Height = 23
          Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
            33333377838387733333307BEBEB7033333337F8383838F3333377BEBEBEB773
            333337838383833F333307EBEBEBE703333378383838383F333307BEBEBEB703
            33337F838383838F333307EBEBEBE703333373F838383873333377BEBEBEB773
            33333783838387F33333307BEBEB703333333738F838F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnTabNClick
        end
        object LabelFio0: TLabel
          Left = 12
          Top = 170
          Width = 277
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelFamIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 13
          Top = 117
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1084#1080#1083#1080#1103
          WordWrap = True
        end
        object sBtnFindFam: TSpeedButton
          Left = 268
          Top = 113
          Width = 21
          Height = 23
          Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' ('#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077')'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
            33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
            333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
            33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
            33333783838387F33333307B8B8B703333333738F838F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnFindFamClick
        end
        object Label12: TLabel
          Left = 13
          Top = 142
          Width = 134
          Height = 13
          AutoSize = False
          Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' (TIN)'
          FocusControl = dbeTin
        end
        object sBtnFindTin: TSpeedButton
          Left = 268
          Top = 139
          Width = 21
          Height = 23
          Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1058#1048#1053' ('#1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102')'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7833F77733333307777700B3
            33333377838387733333307B8B8B7033333337F8383838F3333377B8B8B8B773
            333337838383833F3333078B8B8B8703333378383838383F333307B8B8B8B703
            33337F838383838F3333078B8B8B8703333373F838383873333377B8B8B8B773
            33333783838387F33333307B8B8B703333333738F838F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnFindTinClick
        end
        object Label13: TLabel
          Left = 13
          Top = 199
          Width = 123
          Height = 13
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object Label10: TLabel
          Left = 13
          Top = 14
          Width = 163
          Height = 13
          Caption = #1055#1086' '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100':'
        end
        object Label14: TLabel
          Left = 16
          Top = 39
          Width = 273
          Height = 45
          Alignment = taCenter
          AutoSize = False
          Caption = 
            #1055#1088#1080' '#1083#1102#1073#1086#1081' '#1074#1074#1077#1076#1077#1085#1085#1086#1081' '#1076#1072#1090#1077' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '#1085#1072#1095#1072#1083#1072 +
            ' '#1075#1086#1076#1072' '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object dbeTabN: TDBEdit
          Left = 205
          Top = 85
          Width = 62
          Height = 21
          DataField = 'TabN'
          DataSource = dsrcShap
          TabOrder = 0
          OnEnter = dbeEnter
          OnExit = dbeTabNExit
        end
        object dbeFam: TDBEdit
          Left = 107
          Top = 113
          Width = 160
          Height = 21
          Hint = #1060#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
          DataField = 'Fam'
          DataSource = dsrcShap
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeTin: TDBEdit
          Left = 172
          Top = 139
          Width = 95
          Height = 21
          DataField = 'TIN'
          DataSource = dsrcShap
          TabOrder = 2
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object DtPickDtIssue: TDateTimePicker
          Left = 204
          Top = 196
          Width = 85
          Height = 21
          Hint = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object DtPickArchYear: TDateTimePicker
          Left = 204
          Top = 11
          Width = 85
          Height = 21
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          TabOrder = 4
          OnEnter = dtPicEnter
          OnExit = dtPicExit
        end
        object GroupBoxScope: TGroupBox
          Left = 8
          Top = 230
          Width = 289
          Height = 41
          TabOrder = 5
          object RBtnNoNich: TRadioButton
            Left = 20
            Top = 16
            Width = 69
            Height = 17
            Hint = #1044#1072#1085#1085#1099#1077' '#1073#1077#1079' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086' '#1053#1048#1063
            Caption = #1041#1077#1079' '#1053#1048#1063
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object RBtnNichOnly: TRadioButton
            Left = 107
            Top = 16
            Width = 86
            Height = 17
            Hint = #1058#1086#1083#1100#1082#1086' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1084' '#1053#1048#1063
            Caption = #1058#1086#1083#1100#1082#1086' '#1053#1048#1063
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object RBtnNichBoth: TRadioButton
            Left = 213
            Top = 16
            Width = 60
            Height = 17
            Hint = #1059#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1042#1057#1045' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            Caption = #1042#1084#1077#1089#1090#1077
            Checked = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = True
          end
        end
      end
      object PanelButtons1: TPanel
        Left = 0
        Top = 295
        Width = 368
        Height = 25
        Align = alBottom
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          368
          25)
        object BtnPrintNew: TSpeedButton
          Left = 58
          Top = 0
          Width = 99
          Height = 25
          Hint = #1055#1077#1095#1072#1090#1100' '#1087#1086' "'#1082#1086#1084#1087#1072#1082#1090#1085#1086#1081'" '#1092#1086#1088#1084#1077
          Anchors = [akTop, akRight]
          Caption = #1050#1086#1084#1087#1072#1082#1090#1085#1072#1103
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
          OnClick = BtnPrintNewClick
        end
        object BtnPrintOld: TSpeedButton
          Left = 162
          Top = 0
          Width = 108
          Height = 25
          Hint = '"'#1057#1090#1072#1088#1099#1077'" '#1092#1086#1088#1084#1099' '#1087#1077#1095#1072#1090#1080
          Anchors = [akTop, akRight]
          Caption = #1057#1090#1072#1088#1099#1077' '#1092#1086#1088#1084#1099
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            04000000000068010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00334444333336
            4444333FFFF333333FFFF3330000334A23333334AAA3333F38833333F3388333
            0000334A23333364A233333F38333333F383333300003366A6333342A2333333
            F383333F3383333300003334A263364AA3333333F338333F3833333300003336
            4A2644AA633333333F338FF3383333330000333364222AA23333333333F33333
            8333333300003364622AAA633333333FF8F33338333333330000334A634AA664
            4443333F383F3388FFF833330000334A6342A642AA63333F383F338F33883333
            0000334A244AA42A6333333F38FF33F33833333300003334AA2AA2A333333333
            F333333383333333000033334AAA2233333333333F3333383333333300003333
            34A223333333333333F333833333333300003333334A443333333333333F3833
            33333333000033333342A63333333333333F33833333333300003333334AA633
            33333333333F3383333333330000333333666333333333333338883333333333
            0000}
          NumGlyphs = 2
          Spacing = 0
          OnClick = BtnPrintOldClick
        end
        object BtnExit1: TBitBtn
          Left = 281
          Top = 0
          Width = 78
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkClose
          Spacing = 3
        end
        object BtnCompareArchives: TButton
          Left = 0
          Top = 0
          Width = 57
          Height = 25
          Caption = 'Compare'
          TabOrder = 1
          Visible = False
          OnClick = BtnCompareArchivesClick
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      object dbgrArh: TDBGrid
        Left = 0
        Top = 0
        Width = 368
        Height = 286
        Align = alClient
        DataSource = dsrcArh
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object PanelButtons2: TPanel
        Left = 0
        Top = 286
        Width = 368
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          368
          34)
        object LblRecCnt: TLabel
          Left = 0
          Top = 14
          Width = 50
          Height = 13
          Caption = 'LblRecCnt'
        end
        object BtnPrtThreeCols: TSpeedButton
          Left = 203
          Top = 8
          Width = 65
          Height = 25
          Hint = #1055#1077#1095#1072#1090#1100' '#1090#1088#1077#1084#1103' '#1082#1086#1083#1086#1085#1082#1072#1084#1080
          Anchors = [akTop, akRight]
          Caption = ' 3 '#1082#1086#1083
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = BtnPrtThreeColsClick
        end
        object BtnBack: TSpeedButton
          Left = 274
          Top = 8
          Width = 27
          Height = 25
          Hint = #1053#1072#1079#1072#1076
          Anchors = [akTop, akRight]
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
          Spacing = 0
          OnClick = BtnBackClick
        end
        object BtnPrtOneCol: TBitBtn
          Left = 135
          Top = 8
          Width = 65
          Height = 25
          Hint = #1055#1077#1095#1072#1090#1100' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1086#1081
          Anchors = [akTop, akRight]
          Caption = ' 1 '#1082#1086#1083
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BtnPrtOneColClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          Spacing = 1
        end
        object BtnExit2: TBitBtn
          Left = 304
          Top = 8
          Width = 65
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
          Spacing = 0
        end
      end
    end
  end
  object cdsShap: TClientDataSet
    Aggregates = <>
    FileName = 'c:\Temp\cdsspov.cds'
    FieldDefs = <
      item
        Name = 'ZaGod'
        DataType = ftSmallint
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
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'DtDoc'
        DataType = ftDate
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ArhDtEnd'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 8
    object cdsShapZaGod: TSmallintField
      FieldName = 'ZaGod'
    end
    object cdsShapArhDtEnd: TDateField
      FieldName = 'ArhDtEnd'
    end
    object cdsShapDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsShapDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cdsShapTabN: TIntegerField
      FieldName = 'TabN'
      OnSetText = cdsShapTabNSetText
    end
    object cdsShapDtDoc: TDateField
      FieldName = 'DtDoc'
    end
    object cdsShapFam: TStringField
      FieldName = 'Fam'
    end
    object cdsShapFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsShapTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
  end
  object dsrcShap: TDataSource
    DataSet = cdsShap
    Left = 400
    Top = 24
  end
  object qryArh: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select DtProc, ZaMesGod, VidN, ShVidN, NmVidN,'
      
        '       Sum(Chas) as Chasu, Sum(Cast(Summa as numeric(18,2))) as ' +
        'Summa,'
      '        count(*) as CNTREC'
      ' from vinu_main'
      'where TabN = 23838 and dtproc >= '#39'01/01/2006'#39' and'
      '      dtproc <= '#39'10/01/2006'#39' and vidn < '#39'8000'#39
      'group by DtProc, VidN, ShVidN, NmVidN, ZaMesGod')
    Left = 448
    Top = 8
    object qryArhDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 7
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryArhZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1103#1094
      DisplayWidth = 7
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryArhVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryArhSHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      DisplayWidth = 16
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryArhNMVIDN: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1080#1076#1072
      DisplayWidth = 24
      FieldName = 'NMVIDN'
      Size = 64
    end
    object qryArhCHASU: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      DisplayWidth = 7
      FieldName = 'CHASU'
      OnGetText = qryArhCHASUGetText
    end
    object qryArhSUMMA: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
      Precision = 15
      Size = 2
    end
    object qryArhCNTREC: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 8
      FieldName = 'CNTREC'
    end
  end
  object dsrcArh: TDataSource
    DataSet = qryArh
    Left = 464
    Top = 24
  end
  object qryTmp: TQuery
    Left = 448
    Top = 80
  end
  object cdsArh: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'Kvart'
        DataType = ftSmallint
      end
      item
        Name = 'dtProc1'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg1'
        DataType = ftDate
      end
      item
        Name = 'Vidn1'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu1'
        DataType = ftFloat
      end
      item
        Name = 'Summa1'
        DataType = ftFloat
      end
      item
        Name = 'dtProc2'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg2'
        DataType = ftDate
      end
      item
        Name = 'Vidn2'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu2'
        DataType = ftFloat
      end
      item
        Name = 'Summa2'
        DataType = ftFloat
      end
      item
        Name = 'dtProc3'
        DataType = ftDate
      end
      item
        Name = 'dtZaMg3'
        DataType = ftDate
      end
      item
        Name = 'Vidn3'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidn3'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Chasu3'
        DataType = ftFloat
      end
      item
        Name = 'Summa3'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 380
    Top = 75
  end
  object CdsUni: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NmVidN'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Sm01'
        DataType = ftFloat
      end
      item
        Name = 'Sm02'
        DataType = ftFloat
      end
      item
        Name = 'Sm03'
        DataType = ftFloat
      end
      item
        Name = 'Sm04'
        DataType = ftFloat
      end
      item
        Name = 'Sm05'
        DataType = ftFloat
      end
      item
        Name = 'Sm06'
        DataType = ftFloat
      end
      item
        Name = 'Sm07'
        DataType = ftFloat
      end
      item
        Name = 'Sm08'
        DataType = ftFloat
      end
      item
        Name = 'Sm09'
        DataType = ftFloat
      end
      item
        Name = 'Sm10'
        DataType = ftFloat
      end
      item
        Name = 'Sm11'
        DataType = ftFloat
      end
      item
        Name = 'Sm12'
        DataType = ftFloat
      end
      item
        Name = 'SmYY'
        DataType = ftFloat
      end
      item
        Name = 'SmZa01'
        DataType = ftFloat
      end
      item
        Name = 'SmZa02'
        DataType = ftFloat
      end
      item
        Name = 'SmZa03'
        DataType = ftFloat
      end
      item
        Name = 'SmZa04'
        DataType = ftFloat
      end
      item
        Name = 'SmZa05'
        DataType = ftFloat
      end
      item
        Name = 'SmZa06'
        DataType = ftFloat
      end
      item
        Name = 'SmZa07'
        DataType = ftFloat
      end
      item
        Name = 'SmZa08'
        DataType = ftFloat
      end
      item
        Name = 'SmZa09'
        DataType = ftFloat
      end
      item
        Name = 'SmZa10'
        DataType = ftFloat
      end
      item
        Name = 'SmZa11'
        DataType = ftFloat
      end
      item
        Name = 'SmZa12'
        DataType = ftFloat
      end
      item
        Name = 'NSovm'
        DataType = ftString
        Precision = 1
        Size = 20
      end
      item
        Name = 'VSovm'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 112
  end
  object popVar: TPopupMenu
    Left = 324
    Top = 257
    object popVarHead: TMenuItem
      Caption = '== '#1042#1072#1088#1080#1072#1085#1090' '#1072#1088#1093#1080#1074#1082#1080' =='
      Enabled = False
      Hint = #1042#1072#1088#1080#1072#1085#1090' '#1087#1077#1095#1072#1090#1080' '#1072#1088#1093#1080#1074#1082#1080
    end
    object PopArcDtProc: TMenuItem
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084' '#1088#1072#1089#1095#1105#1090#1072
      Hint = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084', '#1074' '#1082#1086#1090#1086#1088#1099#1093' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1083#1080#1089#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnClick = PopArchClick
    end
    object PopArcMnthYear: TMenuItem
      Caption = #1055#1086' '#1084#1077#1089#1103#1094#1072#1084' "'#1047#1072#1052#1077#1089#1043#1086#1076'"'
      Hint = 
        #1055#1086' '#1084#1077#1089#1103#1094#1072#1084', '#1079#1072' '#1082#1086#1090#1086#1088#1099#1077' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1085#1077' '#1074#1079#1080#1088#1072#1103' '#1085#1072' '#1090#1086', '#1074' '#1082#1072#1082#1086#1084 +
        ' '#1084#1077#1089#1103#1094#1077' '#1073#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103')'
      OnClick = PopArchClick
    end
    object PopArcBoth: TMenuItem
      Caption = #1057#1086#1074#1084#1077#1089#1090#1085#1086' '#1086#1073#1072' '#1074#1072#1088#1080#1072#1085#1090#1072
      Hint = #1042' '#1086#1076#1085#1086#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1077' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1100' '#1086#1073#1072' '#1074#1072#1088#1080#1072#1085#1090#1072
      OnClick = PopArchClick
    end
  end
end
