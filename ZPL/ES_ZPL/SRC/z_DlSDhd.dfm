object FormDlgSDhd: TFormDlgSDhd
  Left = 585
  Top = 326
  Width = 450
  Height = 391
  BorderIcons = [biSystemMenu]
  Caption = 'FormDlgSDhd'
  Color = clBtnFace
  Constraints.MaxHeight = 435
  Constraints.MaxWidth = 450
  Constraints.MinHeight = 335
  Constraints.MinWidth = 320
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
    Width = 434
    Height = 352
    ActivePage = TabCommon
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControlResize
    object ts0: TTabSheet
      Caption = 'ts0'
      ImageIndex = 2
      object PanelTs0: TPanel
        Left = 11
        Top = 2
        Width = 286
        Height = 217
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label9: TLabel
          Left = 87
          Top = 72
          Width = 95
          Height = 13
          Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
        end
        object sBtnTabN0: TSpeedButton
          Left = 248
          Top = 68
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
          OnClick = sBtnTabN0Click
        end
        object LabelFio0: TLabel
          Left = 0
          Top = 150
          Width = 267
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
          Left = 45
          Top = 101
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1084#1080#1083#1080#1103
          WordWrap = True
        end
        object sBtnFindFam0: TSpeedButton
          Left = 248
          Top = 97
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
          OnClick = sBtnFindFam0Click
        end
        object Label12: TLabel
          Left = 43
          Top = 120
          Width = 109
          Height = 30
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' (TIN)'
          FocusControl = dbeTin0
          WordWrap = True
        end
        object sBtnFindTin0: TSpeedButton
          Left = 248
          Top = 125
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
          OnClick = sBtnFindTin0Click
        end
        object Label13: TLabel
          Left = 55
          Top = 169
          Width = 123
          Height = 13
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object Label14: TLabel
          Left = 35
          Top = 32
          Width = 169
          Height = 30
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1047#1072' '#1082#1072#1082#1086#1081' '#1075#1086#1076' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091'?:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object dbeTabN0: TDBEdit
          Left = 188
          Top = 68
          Width = 57
          Height = 21
          DataField = 'TabN'
          DataSource = dsrcTmp
          TabOrder = 0
          OnEnter = dbeEnter
          OnExit = dbeTabNExit
        end
        object dbeFam0: TDBEdit
          Left = 99
          Top = 97
          Width = 146
          Height = 21
          Hint = #1060#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
          DataField = 'Fam'
          DataSource = dsrcTmp
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeTin0: TDBEdit
          Left = 156
          Top = 125
          Width = 90
          Height = 21
          DataField = 'TIN'
          DataSource = dsrcTmp
          TabOrder = 2
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dtPicDtDoc0: TDateTimePicker
          Left = 184
          Top = 166
          Width = 85
          Height = 21
          Hint = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object UpDownZaGod: TUpDown
          Left = 253
          Top = 37
          Width = 16
          Height = 21
          Associate = edZaGod
          Min = 1990
          Max = 3000
          Position = 2024
          TabOrder = 4
          Thousands = False
        end
        object edZaGod: TEdit
          Left = 209
          Top = 37
          Width = 44
          Height = 21
          ReadOnly = True
          TabOrder = 5
          Text = '2024'
          OnChange = edZaGodChange
          OnEnter = edZaGodEnter
          OnExit = edZaGodExit
        end
        object ChBoxNoDtDoc0: TCheckBox
          Left = 160
          Top = 187
          Width = 109
          Height = 17
          Hint = #1053#1077' '#1089#1090#1072#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Alignment = taLeftJustify
          Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
      end
      object PanelButtons0: TPanel
        Left = 0
        Top = 294
        Width = 426
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          27)
        object sBtnGo0: TSpeedButton
          Left = 292
          Top = 2
          Width = 70
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1044#1072#1083#1077#1077
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
          Spacing = 1
          OnClick = sBtnGo0Click
        end
        object bBtnExit0: TBitBtn
          Left = 366
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkClose
        end
      end
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      ImageIndex = 1
      object PanelTs1: TPanel
        Left = 13
        Top = 1
        Width = 278
        Height = 228
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 15
          Top = 5
          Width = 256
          Height = 13
          Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1080' '#1082#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072' '#1076#1083#1103' '#1089#1087#1088#1072#1074#1082#1080':'
        end
        object Label2: TLabel
          Left = 5
          Top = 44
          Width = 265
          Height = 45
          Alignment = taRightJustify
          AutoSize = False
          Caption = 
            #1055#1088#1080' '#1083#1102#1073#1099#1093' '#1076#1072#1090#1072#1093' '#1089#1087#1088#1072#1074#1082#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '#1087#1077#1088#1074#1086#1075#1086' '#1095#1080#1089#1083#1072' '#1087#1077 +
            #1088#1074#1086#1081' '#1076#1072#1090#1099' '#1087#1086' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1095#1080#1089#1083#1086' '#1074#1090#1086#1088#1086#1081' '#1076#1072#1090#1099' ('#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label3: TLabel
          Left = 63
          Top = 24
          Width = 9
          Height = 13
          Caption = #1089':'
        end
        object Label4: TLabel
          Left = 167
          Top = 24
          Width = 15
          Height = 13
          Caption = #1087#1086':'
        end
        object Label5: TLabel
          Left = 91
          Top = 91
          Width = 95
          Height = 13
          Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
        end
        object sBtnTabN: TSpeedButton
          Left = 250
          Top = 87
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
        object LabelFamIO: TLabel
          Left = 2
          Top = 169
          Width = 271
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
        object Label7: TLabel
          Left = 47
          Top = 120
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = #1060#1072#1084#1080#1083#1080#1103
          WordWrap = True
        end
        object sBtnFindFam: TSpeedButton
          Left = 250
          Top = 116
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
        object Label6: TLabel
          Left = 45
          Top = 139
          Width = 109
          Height = 30
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' (TIN)'
          FocusControl = dbeTIN
          WordWrap = True
        end
        object sBtnFindTin: TSpeedButton
          Left = 250
          Top = 144
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
        object Label8: TLabel
          Left = 57
          Top = 190
          Width = 123
          Height = 13
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object dtPicDtBeg: TDateTimePicker
          Left = 77
          Top = 21
          Width = 85
          Height = 21
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          TabOrder = 0
          OnEnter = dtPicEnter
          OnExit = dtPicExit
        end
        object dtPicDtEnd: TDateTimePicker
          Left = 186
          Top = 21
          Width = 85
          Height = 21
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          TabOrder = 1
          OnEnter = dtPicEnter
          OnExit = dtPicExit
        end
        object dbeTabN: TDBEdit
          Left = 190
          Top = 87
          Width = 57
          Height = 21
          DataField = 'TabN'
          DataSource = dsrcTmp
          TabOrder = 2
          OnEnter = dbeEnter
          OnExit = dbeTabNExit
        end
        object dbeFam: TDBEdit
          Left = 101
          Top = 116
          Width = 146
          Height = 21
          Hint = #1060#1072#1084#1080#1083#1080#1102' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1086#1078#1085#1086' '#1074#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1077#1075#1080#1089#1090#1088#1077
          DataField = 'Fam'
          DataSource = dsrcTmp
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dbeTIN: TDBEdit
          Left = 158
          Top = 144
          Width = 90
          Height = 21
          DataField = 'TIN'
          DataSource = dsrcTmp
          TabOrder = 4
          OnEnter = dbeEnter
          OnExit = dbeExit
        end
        object dtPicDtDoc: TDateTimePicker
          Left = 186
          Top = 186
          Width = 85
          Height = 21
          Hint = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Date = 38771.000000000000000000
          Time = 38771.000000000000000000
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object ChBoxNoDtDoc1: TCheckBox
          Left = 162
          Top = 207
          Width = 109
          Height = 17
          Hint = #1053#1077' '#1089#1090#1072#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Alignment = taLeftJustify
          Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
      end
      object PanelButtons1: TPanel
        Left = 0
        Top = 296
        Width = 426
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          25)
        object sBtnGo1: TSpeedButton
          Left = 294
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1044#1072#1083#1077#1077
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
          Spacing = 1
          OnClick = sBtnGo1Click
        end
        object bBtnExit1: TBitBtn
          Left = 366
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkClose
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      object dbgrSpr: TDBGrid
        Left = 0
        Top = 0
        Width = 426
        Height = 296
        Align = alClient
        DataSource = dsrcSpr
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'MesGod'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDHD'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMMPM'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDETI'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMALIM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPDN'
            Width = 51
            Visible = True
          end>
      end
      object PanelButtons2: TPanel
        Left = 0
        Top = 296
        Width = 426
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          25)
        object Label10: TLabel
          Left = 3
          Top = 6
          Width = 118
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1044#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1086' '#1076#1086#1093#1086#1076#1072#1093
          Visible = False
        end
        object sBtnBack: TSpeedButton
          Left = 273
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
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
          Spacing = 1
          OnClick = sBtnBackClick
        end
        object bBtnPrt: TBitBtn
          Left = 203
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrtClick
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
        end
        object bBtnExit2: TBitBtn
          Left = 342
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
        end
      end
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
      object dbgrNlgInsp: TDBGrid
        Left = 0
        Top = 0
        Width = 426
        Height = 294
        Align = alClient
        DataSource = dsrcNlgInsp
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDHD'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPDN'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMVUPL'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_SS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_PF'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_FZ'
            Width = 45
            Visible = True
          end>
      end
      object PanelButtons4: TPanel
        Left = 0
        Top = 294
        Width = 426
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          27)
        object Label15: TLabel
          Left = -1
          Top = 1
          Width = 90
          Height = 26
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = #1044#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1074' '#1053#1083#1075' '#1048#1085#1089#1087#1077#1082#1094#1080#1102
          Visible = False
          WordWrap = True
        end
        object sBtnBack4: TSpeedButton
          Left = 297
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
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
          Spacing = 1
          OnClick = sBtnBack4Click
        end
        object bBtnPrt4: TBitBtn
          Left = 227
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrt4Click
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
        end
        object bBtnExit4: TBitBtn
          Left = 366
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
        end
      end
    end
    object ts5: TTabSheet
      Caption = 'ts5'
      ImageIndex = 5
      object dbgrNlgInsp2011: TDBGrid
        Left = 0
        Top = 0
        Width = 426
        Height = 294
        Align = alClient
        Color = 11009242
        DataSource = dsrcNlgInsp2011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDHD'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMVUPL'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_ESV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_WSB'
            Width = 75
            Visible = True
          end>
      end
      object PanelButtons5: TPanel
        Left = 0
        Top = 294
        Width = 426
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          27)
        object Label17: TLabel
          Left = -1
          Top = 1
          Width = 130
          Height = 26
          Anchors = [akLeft, akBottom]
          AutoSize = False
          Caption = #1044#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1074' '#1053#1083#1075' '#1048#1085#1089#1087#1077#1082#1094#1080#1102' '#1089' 2011 '#1075#1086#1076#1072
          Visible = False
          WordWrap = True
        end
        object sBtnBack5: TSpeedButton
          Left = 297
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
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
          Spacing = 1
          OnClick = sBtnBack5Click
        end
        object bBtnPrt5: TBitBtn
          Left = 227
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrt4Click
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
        end
        object bBtnExit5: TBitBtn
          Left = 366
          Top = 2
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
        end
      end
    end
    object tsSubs: TTabSheet
      Caption = 'tsSubs'
      ImageIndex = 4
      object dbgrSubs: TDBGrid
        Left = 0
        Top = 0
        Width = 426
        Height = 296
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcSubs
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'MesGod'
            Title.Caption = #1042' '#1052#1077#1089#1103#1094#1077
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDHD'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMMPM'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMDETI'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMALIM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMPDN'
            Width = 51
            Visible = True
          end>
      end
      object PanelButtonsSubs: TPanel
        Left = 0
        Top = 296
        Width = 426
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          426
          25)
        object Label16: TLabel
          Left = 3
          Top = 6
          Width = 130
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1044#1083#1103' '#1089#1087#1088#1072#1074#1082#1080' '#1086' '#1089#1091#1073#1089#1080#1076#1080#1103#1093
        end
        object SpeedButton1: TSpeedButton
          Left = 297
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
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
          Spacing = 1
          OnClick = sBtnBackClick
        end
        object bBtnPrtSubs: TBitBtn
          Left = 227
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrtClick
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
        end
        object BitBtn2: TBitBtn
          Left = 366
          Top = 0
          Width = 68
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 1
          Kind = bkClose
        end
      end
    end
    object TabCommon: TTabSheet
      Caption = 'TabCommon'
      ImageIndex = 6
      DesignSize = (
        426
        321)
      object PanelCmnButtons: TPanel
        Left = 0
        Top = 293
        Width = 426
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BtnCmnPrint: TBitBtn
          Left = 192
          Top = 3
          Width = 75
          Height = 25
          Caption = '&'#1055#1077#1095#1072#1090#1100
          TabOrder = 0
          OnClick = bBtnPrtClick
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
        end
        object BtnCmnBack: TBitBtn
          Left = 272
          Top = 3
          Width = 75
          Height = 25
          Caption = #1053#1072'&'#1079#1072#1076
          TabOrder = 1
          OnClick = BtnCmnBackClick
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
        end
        object BtnCmnExit: TBitBtn
          Left = 352
          Top = 3
          Width = 75
          Height = 25
          Caption = #1042'&'#1099#1093#1086#1076
          TabOrder = 2
          OnClick = BtnCmnExitClick
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
        end
      end
      object DbgrAbroad: TDBGrid
        Left = 1
        Top = 0
        Width = 433
        Height = 297
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DsrcAbroad
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object cdsTmp: TClientDataSet
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 78
    Top = 144
    object cdsTmpZaGod: TSmallintField
      FieldName = 'ZaGod'
    end
    object cdsTmpDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsTmpDtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cdsTmpTabN: TIntegerField
      FieldName = 'TabN'
      OnSetText = cdsTmpTabNSetText
    end
    object cdsTmpDtDoc: TDateField
      FieldName = 'DtDoc'
    end
    object cdsTmpFam: TStringField
      FieldName = 'Fam'
    end
    object cdsTmpFamIO: TStringField
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsTmpTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 94
    Top = 160
  end
  object qrySpr: TQuery
    OnCalcFields = qrySprCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * '
      ' from For_SprDhd (23838, '#39'01/01/2005'#39', '#39'12/01/2005'#39')')
    Left = 38
    Top = 176
    object qrySprZAMESGOD: TDateTimeField
      Alignment = taRightJustify
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
    end
    object qrySprMesGod: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094' '#1043#1086#1076
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
    object qrySprSMDHD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076#1099
      FieldName = 'SMDHD'
      DisplayFormat = '#.00'
    end
    object qrySprSMMPM: TFloatField
      DisplayLabel = #1052#1072#1090#1055#1086#1084
      FieldName = 'SMMPM'
      DisplayFormat = '#.00'
    end
    object qrySprSMPDN: TFloatField
      DisplayLabel = #1055#1086#1076#1086#1093#1086#1076#1085
      FieldName = 'SMPDN'
      DisplayFormat = '#.00'
    end
    object qrySprSMDETI: TFloatField
      DisplayLabel = #1044#1077#1090#1080#1052#1072#1090#1055#1086#1084
      FieldName = 'SMDETI'
      DisplayFormat = '#.00'
    end
    object qrySprSMALIM: TFloatField
      DisplayLabel = #1040#1083#1080#1084#1077#1085#1090#1099
      FieldName = 'SMALIM'
      DisplayFormat = '#.00'
    end
  end
  object dsrcSpr: TDataSource
    DataSet = qrySpr
    Left = 53
    Top = 187
  end
  object qryTmp: TQuery
    Left = 228
    Top = 147
  end
  object qryNlgInsp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * '
      'from For_SprNlgInsp (4716, '#39'01/01/2005'#39', '#39'12/01/2005'#39')')
    Left = 148
    Top = 187
    object qryNlgInspZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 7
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryNlgInspSMDHD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076#1099
      DisplayWidth = 10
      FieldName = 'SMDHD'
      DisplayFormat = '#.00'
    end
    object qryNlgInspSMPDN: TFloatField
      DisplayLabel = #1055#1086#1076#1086#1093#1086#1076#1085
      DisplayWidth = 10
      FieldName = 'SMPDN'
      DisplayFormat = '#.00'
    end
    object qryNlgInspSMVUPL: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1090#1099
      DisplayWidth = 11
      FieldName = 'SMVUPL'
      DisplayFormat = '#.00'
    end
    object qryNlgInspSM_SS: TFloatField
      DisplayLabel = #1057#1086#1094#1057#1090#1088
      DisplayWidth = 8
      FieldName = 'SM_SS'
      DisplayFormat = '#.00'
    end
    object qryNlgInspSM_PF: TFloatField
      DisplayLabel = #1055#1077#1085#1089#1060#1085#1076
      DisplayWidth = 10
      FieldName = 'SM_PF'
      DisplayFormat = '#.00'
    end
    object qryNlgInspSM_FZ: TFloatField
      DisplayLabel = #1060#1085#1076#1047#1072#1085
      DisplayWidth = 9
      FieldName = 'SM_FZ'
      DisplayFormat = '#.00'
    end
  end
  object dsrcNlgInsp: TDataSource
    DataSet = qryNlgInsp
    Left = 168
    Top = 200
  end
  object qrySubs: TQuery
    OnCalcFields = qrySubsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * '
      ' from For_SprSubs (23838, '#39'01/01/2005'#39', '#39'12/01/2005'#39')')
    Left = 38
    Top = 234
    object qrySubsDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qrySubsMesGod: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
    object qrySubsSMDHD: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076
      FieldName = 'SMDHD'
      DisplayFormat = '#.00'
    end
    object qrySubsSMMPM: TFloatField
      DisplayLabel = #1052#1072#1090#1055#1086#1084
      FieldName = 'SMMPM'
      DisplayFormat = '#.00'
    end
    object qrySubsSMDETI: TFloatField
      DisplayLabel = #1044#1077#1090#1103#1084
      FieldName = 'SMDETI'
      DisplayFormat = '#.00'
    end
    object qrySubsSMALIM: TFloatField
      DisplayLabel = #1040#1083#1080#1084#1077#1085#1090#1099
      FieldName = 'SMALIM'
      DisplayFormat = '#.00'
    end
    object qrySubsSMPDN: TFloatField
      DisplayLabel = #1055#1076#1093#1076#1085
      FieldName = 'SMPDN'
      DisplayFormat = '#.00'
    end
    object qrySubsSM_DUMMY: TFloatField
      DisplayLabel = 'Dummy'
      FieldName = 'SM_DUMMY'
      DisplayFormat = '#.00'
    end
  end
  object dsrcSubs: TDataSource
    DataSet = qrySubs
    Left = 53
    Top = 245
  end
  object qryNlgInsp2011: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * '
      'from For_Spr2011NlgInsp (1239, '#39'01/01/2015'#39', '#39'12/01/2015'#39')')
    Left = 212
    Top = 187
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 7
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object FloatField1: TFloatField
      DisplayLabel = #1044#1086#1093#1086#1076#1099
      DisplayWidth = 10
      FieldName = 'SMDHD'
      DisplayFormat = '#.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = #1055#1086#1076#1086#1093#1086#1076#1085
      DisplayWidth = 10
      FieldName = 'SMPDN'
      DisplayFormat = '#.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1090#1099
      DisplayWidth = 11
      FieldName = 'SMVUPL'
      DisplayFormat = '#.00'
    end
    object qryNlgInsp2011SM_ESV: TFloatField
      DisplayLabel = #1057#1084'_'#1045#1057#1042
      DisplayWidth = 10
      FieldName = 'SM_ESV'
      DisplayFormat = '#.00'
    end
    object qryNlgInsp2011SM_WSB: TFloatField
      DisplayLabel = #1057#1084'_'#1042#1057#1073
      FieldName = 'SM_WSB'
      DisplayFormat = '#.00'
    end
  end
  object dsrcNlgInsp2011: TDataSource
    DataSet = qryNlgInsp2011
    Left = 232
    Top = 200
  end
  object QryAbroad: TQuery
    OnCalcFields = QryAbroadCalcFields
    Left = 332
    Top = 147
    object QryAbroadDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object QryAbroadMesGod: TStringField
      DisplayLabel = #1052#1077#1089'.'#1043#1086#1076
      FieldKind = fkCalculated
      FieldName = 'MesGod'
      Calculated = True
    end
    object QryAbroadSumIncome: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083'.'
      FieldName = 'SumIncome'
      DisplayFormat = '#.00'
    end
    object QryAbroadSumTaxes: TFloatField
      DisplayLabel = #1055#1086#1076#1086#1093#1086#1076'.'
      FieldName = 'SumTaxes'
      DisplayFormat = '#.00'
    end
    object QryAbroadSumMilit: TFloatField
      DisplayLabel = #1042#1086#1077#1085'.'#1089#1073#1086#1088
      FieldName = 'SumMilit'
      DisplayFormat = '#.00'
    end
    object QryAbroadSumTradeUn: TFloatField
      DisplayLabel = #1055#1088#1086#1092#1089'.'
      FieldName = 'SumTradeUn'
      DisplayFormat = '#.00'
    end
    object QryAbroadSumAlimony: TFloatField
      DisplayLabel = #1040#1083#1080#1084'.'#1080' '#1076#1088'.'
      FieldName = 'SumAlimony'
      DisplayFormat = '#.00'
    end
    object QryAbroadSumToPay: TFloatField
      DisplayLabel = #1050' '#1074#1099#1076#1072#1095#1077
      FieldKind = fkCalculated
      FieldName = 'SumToPay'
      DisplayFormat = '#.00'
      Calculated = True
    end
  end
  object DsrcAbroad: TDataSource
    DataSet = QryAbroad
    Left = 352
    Top = 168
  end
end
