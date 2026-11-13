object FormRs5: TFormRs5
  Left = 148
  Top = 123
  Width = 1044
  Height = 679
  BorderIcons = [biSystemMenu]
  Caption = #1056#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' Rs5 (c 01.09.2019)'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 845
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    1036
    652)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      1036
      31)
    object sBtnPart1: TSpeedButton
      Left = 169
      Top = 3
      Width = 48
      Height = 25
      Hint = #1056#1072#1089#1095#1077#1090' '#1087#1077#1088#1080#1086#1076#1072
      Caption = 'Part01'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPart1Click
    end
    object LabelDbgMsg: TLabel
      Left = 271
      Top = 8
      Width = 40
      Height = 13
      Caption = 'labeldbg'
    end
    object sBtnPart2: TSpeedButton
      Left = 218
      Top = 3
      Width = 49
      Height = 25
      Hint = #1056#1072#1089#1095#1077#1090' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      Caption = 'Part02'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnPart2Click
    end
    object sBtnSaveRes: TSpeedButton
      Left = 713
      Top = 3
      Width = 103
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080' '#1074#1099#1081#1090#1080
      Anchors = [akRight]
      Caption = 'SaveResults'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      OnClick = sBtnSaveResClick
    end
    object sBtnTblNuFilter: TSpeedButton
      Left = 948
      Top = 3
      Width = 57
      Height = 25
      Hint = #1060#1080#1083#1100#1090#1088' VidN < '#39'8000'#39
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 5
      Down = True
      Caption = 'NuFilter'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnTblNuFilterClick
    end
    object sBtnOpenOldNU: TSpeedButton
      Left = 3
      Top = 3
      Width = 84
      Height = 25
      Caption = 'OpenOldNU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sBtnOpenOldNUClick
    end
    object sBtnObrOtkl: TSpeedButton
      Left = 88
      Top = 3
      Width = 80
      Height = 25
      Caption = 'NewObrOtkl'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sBtnObrOtklClick
    end
    object sBtnLbxPeriodu: TSpeedButton
      Left = 818
      Top = 3
      Width = 62
      Height = 25
      Hint = 'LbxPeriodu_Visible On/Off'
      AllowAllUp = True
      Anchors = [akRight]
      GroupIndex = 6
      Caption = 'LbxPeriodu'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnLbxPerioduClick
    end
    object sBtnF8: TSpeedButton
      Left = 587
      Top = 3
      Width = 10
      Height = 25
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1074' Cds '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1081' SQL-'#1079#1072#1087#1088#1086#1089
      Anchors = [akRight]
      Caption = 'F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnF8Click
    end
    object sBtnCheckOks: TSpeedButton
      Left = 578
      Top = 3
      Width = 8
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' OKS '#1085#1072' "'#1074#1096#1080#1074#1086#1089#1090#1100'"'
      Anchors = [akRight]
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
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnCheckOksClick
    end
    object sBtnOks2Filter: TSpeedButton
      Left = 882
      Top = 3
      Width = 64
      Height = 25
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 7
      Caption = 'Oks2_Filter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sBtnOks2FilterClick
    end
    object sBtnPredSave: TSpeedButton
      Left = 593
      Top = 3
      Width = 62
      Height = 25
      Hint = #1059#1074#1080#1076#1077#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1074' '#1041#1044
      Anchors = [akRight]
      Caption = 'PredSave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnPredSaveClick
    end
    object sBtnOtklNuToExcel: TSpeedButton
      Left = 683
      Top = 3
      Width = 26
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1043#1083#1072#1074#1085#1086#1081' '#1092#1086#1088#1084#1099
      Anchors = [akRight]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD0000000000000000000000FDFDFDFD0007070707
        0707070707000700FDFD000000000000000000000000000700FD000707070707
        07FBFBFB0707000000FD00070707070707F8F8F80707000700FD000000000000
        0000000000000007070000070707070707070707070007000700FD0000000000
        00000000000700070000FDFD00FFFFFFFFFFFFFFFF0007000700FDFDFD00FF00
        00000000FF00000000FDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00FF
        0000000000FF00FDFDFDFDFDFDFD00FFFFFFFFFFFFFFFF00FDFDFDFDFDFDFD00
        0000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnOtklNuToExcelClick
    end
    object BitBtn1: TBitBtn
      Left = 1011
      Top = 3
      Width = 78
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 31
    Width = 1036
    Height = 601
    ActivePage = ts4
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsButtons
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'tbl_Periodu, qry_PrmUv'
      ImageIndex = 3
      object Splitter3: TSplitter
        Left = 0
        Top = 82
        Width = 1084
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clAqua
        ParentColor = False
      end
      object dbgrPeriodu: TDBGrid
        Left = 0
        Top = 0
        Width = 1084
        Height = 82
        Hint = #1055#1077#1088#1080#1086#1076#1099' '#1089' '#1087#1088#1086#1074#1077#1088#1082#1086#1081' '#1087#1086' Spec_PS'
        Align = alTop
        Color = clMoneyGreen
        DataSource = dsrcPeriodu
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
      end
      object Panel2: TPanel
        Left = 0
        Top = 85
        Width = 1084
        Height = 483
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        object dbgrMD: TDBGrid
          Left = 0
          Top = 0
          Width = 1084
          Height = 483
          Hint = #1058#1072#1073#1083#1080#1094#1072' '#1087#1088#1080#1077#1084#1086#1074'-'#1091#1074#1086#1083#1100#1085#1077#1085#1080#1081
          Align = alClient
          Color = clSkyBlue
          DataSource = dsrcMD
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'RMes'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DtMes'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OklTrf'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmMinZp'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DayOklTrf'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmDoMZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PrcWrkTime'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CntWrkChs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RabotalPrp'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RabotalSps'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsPravo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Isneopl'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsBln'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsOtp'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsOtpSovm'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsInKmd'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IsBdgZan'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmNdb'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmNdbSovm'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CmbOkl'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdSps'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdTemu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdObj'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdKatP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdSPZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Spec_NR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PdNlg'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sovm'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pr_Pens'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Prfs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Inv'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rang'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Razr'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ProcLg'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AllBM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR'
              Visible = True
            end>
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'qry_Otkl, tbl MD'
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Width = 1028
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter6: TSplitter
        Left = 0
        Top = 125
        Width = 1028
        Height = 4
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object dbgrPere: TDBGrid
        Left = 0
        Top = 129
        Width = 1028
        Height = 439
        Hint = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1080' '#1087#1088#1080#1077#1084#1099'-'#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcMD
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RMes'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtMes'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CmbOkl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OklTrf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DayOklTrf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmMinZp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcWrkTime'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmDoMZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RabotalPrp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RabotalSps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsBln'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsOtp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsOtpSovm'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsInKmd'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsPravo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNdb'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNdbSovm'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Isneopl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AllBM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdTemu'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSPZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Spec_NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CntWrkChs'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PdNlg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pr_Pens'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prfs'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Inv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Rang'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Razr'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ProcLg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsBdgZan'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LockBlnOsn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LockBlnSovm'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsOtpSps6'
            Title.Caption = #1054#1090#1087#1057#1087#1089'6'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsOtpSovmSps6'
            Title.Caption = #1054#1090#1087#1057#1074#1084#1057#1087#1089'6'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NeoplSovmSps6'
            Title.Caption = #1053#1077#1086#1087#1083#1057#1087#1089'6'
            Visible = True
          end>
      end
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 3
        Width = 1028
        Height = 122
        Hint = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103
        Align = alTop
        Color = 8580811
        DataSource = dsrcOtkl
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
        OnDrawColumnCell = dbgrOtklDrawColumnCell
        OnDblClick = dbgridEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTSTORN'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDTEMU'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRPV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRKR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPEC_NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVDPV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRVDPV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MYNOTES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPECPS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMVIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AINDX'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PINDX'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LVL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INDX'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HSCH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDVIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOSHOW'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZP13'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTPUSKN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOLNIC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPRM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPRM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETIM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETIK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DETIG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IND'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DHD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OKLFND'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CBUDG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SNDB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SWSB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPRF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPENS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALIM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNDB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SSOCSTRAH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SBZR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LITTLEHLP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSPZ_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDSZATR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_PF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FSTVP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FSNV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOVM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPOV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KEKV'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDOBJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDKDVIDN_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PBNK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STORN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDBNK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDBE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DKR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SSRK'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSCHDT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDSCHKT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AINDX'
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'tbl_NU,   cds_OKS'
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 0
        Top = 397
        Width = 1028
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clFuchsia
        ParentColor = False
      end
      object Splitter4: TSplitter
        Left = 0
        Top = 488
        Width = 1028
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clBtnFace
        ParentColor = False
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1028
        Height = 397
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel3'
        TabOrder = 0
        DesignSize = (
          1028
          397)
        object SplitterEsv: TSplitter
          Left = 1025
          Top = 0
          Height = 208
          Align = alRight
          Beveled = True
          Color = clTeal
          ParentColor = False
        end
        object Splitter5: TSplitter
          Left = 0
          Top = 208
          Width = 1028
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clBtnFace
          ParentColor = False
        end
        object dbgrNU: TDBGrid
          Left = 0
          Top = 0
          Width = 1025
          Height = 208
          Hint = #1057#1091#1084#1084#1072#1088#1085#1099#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'-'#1091#1076#1077#1088#1078#1072#1085#1080#1103
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsrcNU
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = popNu
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrNUDrawColumnCell
          OnDblClick = sBtnF8Click
          OnEnter = dbgridEnter
          OnExit = dbgridExit
          OnKeyDown = dbgrNUKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'NR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPROC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TABN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHVIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDSM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D__Smm'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDTEMU'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDKATP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCHBU'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRPV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRKR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MYNOTES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPECPS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPEC_NR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVDPV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRVDPV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDKDVIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDCH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D__Chs'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_CH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_SM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OZN_PILG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AINDX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PINDX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LVL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INDX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HSCH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOSHOW'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZP13'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BLN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTPUSKN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BOLNIC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPRM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IND'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SSRK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DETIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPRM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DETI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DETIM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DETIK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DHD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OKLFND'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CBUDG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SNDB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SWSB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPRF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPENS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALIM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNDB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SSOCSTRAH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SBZR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPZ_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDSZATR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_PF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_FSTVP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_FSNV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP_FZ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SOVM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPOV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KEKV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDBNK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LITTLEHLP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMVIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PSCH'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDBE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DKR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSCHDT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSCHKT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NuSovm'
              Visible = True
            end>
        end
        object LbxF8: TListBox
          Left = 456
          Top = 75
          Width = 73
          Height = 104
          ItemHeight = 15
          TabOrder = 1
          Visible = False
        end
        object PanelSelTts: TPanel
          Left = 446
          Top = 24
          Width = 249
          Height = 80
          Anchors = [akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          Visible = False
          object Label1: TLabel
            Left = 16
            Top = 20
            Width = 84
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' OldSm'
            Caption = #1057#1091#1084#1084#1072' OldSm:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label2: TLabel
            Left = 16
            Top = 38
            Width = 106
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' Summa'
            Caption = #1057#1091#1084#1084#1072' NewSumm:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label3: TLabel
            Left = 16
            Top = 56
            Width = 88
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' D__Smm'
            Caption = #1057#1091#1084#1084#1072' D__Sm:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object LabelOldSm: TLabel
            Left = 106
            Top = 20
            Width = 119
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' OldSm'
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LabelOldSm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object LabelNewSm: TLabel
            Left = 106
            Top = 38
            Width = 119
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' Summa'
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LabelNewSm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object LabelD__Sm: TLabel
            Left = 106
            Top = 56
            Width = 119
            Height = 13
            Hint = #1057#1091#1084#1084#1072' '#1087#1086' '#1087#1086#1083#1102' D__Smm'
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'LabelD__Sm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object sBtnClosePanelSelTts: TSpeedButton
            Left = 230
            Top = 1
            Width = 17
            Height = 17
            Hint = #1047#1072#1082#1088#1099#1090#1100
            Flat = True
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333000033338833333333333333333F333333333333
              0000333911833333983333333388F333333F3333000033391118333911833333
              38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
              911118111118333338F3338F833338F3000033333911111111833333338F3338
              3333F8330000333333911111183333333338F333333F83330000333333311111
              8333333333338F3333383333000033333339111183333333333338F333833333
              00003333339111118333333333333833338F3333000033333911181118333333
              33338333338F333300003333911183911183333333383338F338F33300003333
              9118333911183333338F33838F338F33000033333913333391113333338FF833
              38F338F300003333333333333919333333388333338FFF830000333333333333
              3333333333333333333888330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 1
            OnClick = sBtnClosePanelSelTtsClick
          end
        end
        object dbgrOKS: TDBGrid
          Left = 0
          Top = 211
          Width = 1028
          Height = 186
          Hint = 'cdsOKS (M'#1054#1042#1050')'
          Align = alBottom
          Color = 13565421
          DataSource = dsrcOKS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrOKSDrawColumnCell
          OnDblClick = dbgrOKSDblClick
          OnEnter = dbgridEnter
          OnExit = dbgridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'Step'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Metka'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DtPrc'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZaMesGod'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdSps'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdTemu'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdObj'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdKatP'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KdSpZ'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SchBU'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRR'
              Width = 19
              Visible = True
            end
            item
              Color = 12182013
              Expanded = False
              FieldName = 'sForCmn'
              Width = 60
              Visible = True
            end
            item
              Color = 12182013
              Expanded = False
              FieldName = 'sNwCmn'
              Width = 60
              Visible = True
            end
            item
              Color = 12182013
              Expanded = False
              FieldName = 'svPrgCmn'
              Width = 60
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'sForDgv'
              Width = 60
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'sNwDgv'
              Width = 60
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'svPrgDgv'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sForPps'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sNwPps'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'svPrgPps'
              Width = 60
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'sForBln'
              Width = 60
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'sNwBln'
              Width = 60
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'svPrgBln'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sForDkr'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sNwDkr'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'svPrgDkr'
              Width = 60
              Visible = True
            end
            item
              Color = 12182013
              Expanded = False
              FieldName = 'sSgmCmn'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sSgmPps'
              Width = 60
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'sSgmBln'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sSgmDkr'
              Width = 60
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'sSgmDgv'
              Width = 60
              Visible = True
            end
            item
              Color = 15921597
              Expanded = False
              FieldName = 'sForPrf'
              Visible = True
            end
            item
              Color = 15921597
              Expanded = False
              FieldName = 'sNwPrf'
              Visible = True
            end
            item
              Color = 9818610
              Expanded = False
              FieldName = 'sForWSb'
              Visible = True
            end
            item
              Color = 9818610
              Expanded = False
              FieldName = 'sNwWSb'
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'sForPdnC'
              Visible = True
            end
            item
              Color = 10807033
              Expanded = False
              FieldName = 'sNwPdnC'
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'sForPdnD'
              Visible = True
            end
            item
              Color = 8580811
              Expanded = False
              FieldName = 'sNwPdnD'
              Visible = True
            end>
        end
        object LbxPeriodu: TListBox
          Left = 200
          Top = 75
          Width = 73
          Height = 97
          Anchors = [akLeft, akBottom]
          Color = clInfoBk
          ItemHeight = 15
          TabOrder = 4
        end
      end
      object dbgrOks2: TDBGrid
        Left = 0
        Top = 400
        Width = 1028
        Height = 88
        Hint = 'dbgrOks2'
        Align = alTop
        Color = 8580811
        DataSource = dsrcOks2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RMes'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMG'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RepMes'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdTemu'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchBU'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prr'
            Width = 17
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sp_PF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPdn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPrf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SWSb'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MyNotes'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOld'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNew'
            Visible = True
          end
          item
            Color = 13565421
            Expanded = False
            FieldName = 'PrcECmn'
            Width = 43
            Visible = True
          end
          item
            Color = 13565421
            Expanded = False
            FieldName = 'PrcEPps'
            Width = 43
            Visible = True
          end
          item
            Color = 13565421
            Expanded = False
            FieldName = 'PrcEBln'
            Width = 43
            Visible = True
          end
          item
            Color = 13565421
            Expanded = False
            FieldName = 'PrcEDkr'
            Width = 43
            Visible = True
          end
          item
            Color = 13565421
            Expanded = False
            FieldName = 'PrcEDgv'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcECmnPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEInvPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEBlnPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEBlnInvPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEDkrPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEDkrInvPrp'
            Width = 43
            Visible = True
          end
          item
            Color = 12182013
            Expanded = False
            FieldName = 'PrcEDgvPrp'
            Width = 43
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'PrcPdnCmn'
            Width = 43
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'PrcPdnDgv'
            Width = 43
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'PrcPrfs'
            Width = 43
            Visible = True
          end
          item
            Color = clSkyBlue
            Expanded = False
            FieldName = 'PrcWSb'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmMinZp'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmProgMin'
            Width = 43
            Visible = True
          end
          item
            Color = clYellow
            Expanded = False
            FieldName = 'SmDelta'
            Width = 1
            Visible = True
          end>
      end
      object dbgrOks3: TDBGrid
        Left = 0
        Top = 491
        Width = 1028
        Height = 77
        Hint = 'dbgrOks3'
        Align = alClient
        Color = 11058685
        DataSource = dsrcOks3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'RMes'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RepMes'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMG'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdTemu'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SchBU'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prr'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcECmn'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEPps'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEBln'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEDkr'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEDgv'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcECmnPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEInvPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEBlnPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEBlnInvPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEDkrPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEDkrInvPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcEDgvPrp'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwCmn'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwPps'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwBln'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwDkr'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwDgv'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwCmnPrp'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwInvPrp'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwBlnPrp'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwBlnInvPrp'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwDkrPrp'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwDkrInvPrp'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sNwDgvPrp'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'svPrgCmn'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'svPrgPps'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'svPrgBln'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'svPrgDgv'
            Width = 60
            Visible = True
          end>
      end
    end
    object ts4: TTabSheet
      Caption = 'tbl_SvRes'
      ImageIndex = 3
      object dbgrSvRes: TDBGrid
        Left = 0
        Top = 0
        Width = 1028
        Height = 568
        Align = alClient
        DataSource = dsrcSvRes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgrSvResDrawColumnCell
        OnKeyDown = dbgrSvResKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Step'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtProc'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Chas'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dt_Beg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dt_End'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdTemu'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PdN'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ozn_Pilg'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrPV'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Kto'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrKr'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MyNotes'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SpecPS'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Spec_NR'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtVdPV'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NrVdPV'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdBnk'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Storn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SAlim'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CBudg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sovm'
            Visible = True
          end>
      end
    end
    object ts5: TTabSheet
      Caption = 'cdsZ_NU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      object dbgrZ_NU: TDBGrid
        Left = 0
        Top = 0
        Width = 1084
        Height = 459
        Align = alClient
        Color = 9818610
        DataSource = dsrcZ_NU
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = popNu
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrZ_NUDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ShVidN'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Chas'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dt_Beg'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dt_End'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PdN'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ozn_Pilg'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prr'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrPV'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Kto'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrKr'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MyNotes'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Spec_NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtVdPv'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NrVdPv'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdBnk'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtProc'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SpecPS'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OldKdObj'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OldKdVidN'
            Width = 2
            Visible = True
          end>
      end
    end
  end
  object PanelTotals: TPanel
    Left = 0
    Top = 632
    Width = 1036
    Height = 20
    Align = alBottom
    Alignment = taRightJustify
    BevelOuter = bvNone
    Caption = 'PanelTotals'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object PanelNmTblNU: TPanel
    Left = 536
    Top = 32
    Width = 552
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Caption = 'PanelNmTblNU'
    TabOrder = 3
  end
  object tblMD: TTable
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'RMes'
        DataType = ftDate
      end
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'SmMinZp'
        DataType = ftFloat
      end
      item
        Name = 'PrcWrkTime'
        DataType = ftFloat
      end
      item
        Name = 'CntWrkChs'
        DataType = ftFloat
      end
      item
        Name = 'RabotalPrp'
        DataType = ftBoolean
      end
      item
        Name = 'RabotalSps'
        DataType = ftBoolean
      end
      item
        Name = 'IsPravo'
        DataType = ftBoolean
      end
      item
        Name = 'IsBln'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtp'
        DataType = ftSmallint
      end
      item
        Name = 'IsOtpSovm'
        DataType = ftSmallint
      end
      item
        Name = 'IsInKmd'
        DataType = ftBoolean
      end
      item
        Name = 'dayOklTrf'
        DataType = ftFloat
      end
      item
        Name = 'SmDoMZ'
        DataType = ftFloat
      end
      item
        Name = 'SmNdb'
        DataType = ftFloat
      end
      item
        Name = 'SmNdbSovm'
        DataType = ftFloat
      end
      item
        Name = 'AllBM'
        DataType = ftBoolean
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
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
        Name = 'KdSPZ'
        DataType = ftInteger
      end
      item
        Name = 'SO'
        DataType = ftInteger
      end
      item
        Name = 'CmbOkl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'PdNlg'
        DataType = ftSmallint
      end
      item
        Name = 'Sovm'
        DataType = ftSmallint
      end
      item
        Name = 'Pr_Pens'
        DataType = ftSmallint
      end
      item
        Name = 'Prfs'
        DataType = ftSmallint
      end
      item
        Name = 'Inv'
        DataType = ftSmallint
      end
      item
        Name = 'Rang'
        DataType = ftSmallint
      end
      item
        Name = 'Razr'
        DataType = ftSmallint
      end
      item
        Name = 'ProcLg'
        DataType = ftFloat
      end
      item
        Name = 'IsBdgZan'
        DataType = ftBoolean
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'IsNeopl'
        DataType = ftBoolean
      end
      item
        Name = 'LockBlnOsn'
        DataType = ftInteger
      end
      item
        Name = 'LockBlnSovm'
        DataType = ftInteger
      end
      item
        Name = 'BlnSovmSps6'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtpSovmSps6'
        DataType = ftSmallint
      end
      item
        Name = 'NeoplSovmSps6'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'OnNR'
        Fields = 'NR'
        Options = [ixPrimary]
      end
      item
        Name = 'OnDtMes'
        CaseInsFields = 'DtMes'
        Fields = 'DtMes'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    Left = 80
    Top = 241
    object tblMDNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblMDRMes: TDateField
      FieldName = 'RMes'
      DisplayFormat = 'mm/yyy'
    end
    object tblMDDtMes: TDateField
      FieldName = 'DtMes'
    end
    object tblMDAllBM: TBooleanField
      FieldName = 'AllBM'
    end
    object tblMDKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object tblMDKdTemu: TSmallintField
      FieldName = 'KdTemu'
    end
    object tblMDKdObj: TIntegerField
      FieldName = 'KdObj'
    end
    object tblMDKdKatP: TIntegerField
      FieldName = 'KdKatP'
    end
    object tblMDKdSPZ: TIntegerField
      FieldName = 'KdSPZ'
    end
    object tblMDSO: TIntegerField
      FieldName = 'SO'
    end
    object tblMDCmbOkl: TStringField
      FieldName = 'CmbOkl'
      Size = 1
    end
    object tblMDSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
    object tblMDOklTrf: TFloatField
      FieldName = 'OklTrf'
      DisplayFormat = '0.00'
    end
    object tblMDDayOklTrf: TFloatField
      FieldName = 'DayOklTrf'
      DisplayFormat = '0.00'
    end
    object tblMDPrcWrkTime: TFloatField
      FieldName = 'PrcWrkTime'
    end
    object tblMDCntWrkChs: TFloatField
      FieldName = 'CntWrkChs'
    end
    object tblMDPdNlg: TSmallintField
      FieldName = 'PdNlg'
    end
    object tblMDSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblMDPr_Pens: TSmallintField
      FieldName = 'Pr_Pens'
    end
    object tblMDPrfs: TSmallintField
      FieldName = 'Prfs'
    end
    object tblMDInv: TSmallintField
      FieldName = 'Inv'
    end
    object tblMDRang: TSmallintField
      FieldName = 'Rang'
    end
    object tblMDRazr: TSmallintField
      FieldName = 'Razr'
    end
    object tblMDProcLg: TFloatField
      FieldName = 'ProcLg'
    end
    object tblMDRabotalPrp: TBooleanField
      FieldName = 'RabotalPrp'
    end
    object tblMDRabotalSps: TBooleanField
      FieldName = 'RabotalSps'
    end
    object tblMDIsBdgZan: TBooleanField
      FieldName = 'IsBdgZan'
    end
    object tblMDIsInKmd: TBooleanField
      FieldName = 'IsInKmd'
    end
    object tblMDIsBln: TBooleanField
      FieldName = 'IsBln'
    end
    object tblMDIsneopl: TBooleanField
      DisplayLabel = 'IsNeopl'
      FieldName = 'Isneopl'
    end
    object tblMDSmMinZp: TFloatField
      FieldName = 'SmMinZp'
      DisplayFormat = '0.00'
    end
    object tblMDSmDoMZ: TFloatField
      FieldName = 'SmDoMZ'
      DisplayFormat = '0.00'
    end
    object tblMDSmNdb: TFloatField
      FieldName = 'SmNdb'
      DisplayFormat = '0.00'
    end
    object tblMDSmNdbSovm: TFloatField
      FieldName = 'SmNdbSovm'
      DisplayFormat = '0.00'
    end
    object tblMDIsOtp: TSmallintField
      FieldName = 'IsOtp'
    end
    object tblMDIsOtpSovm: TSmallintField
      FieldName = 'IsOtpSovm'
    end
    object tblMDLockBlnOsn: TIntegerField
      FieldName = 'LockBlnOsn'
    end
    object tblMDLockBlnSovm: TIntegerField
      FieldName = 'LockBlnSovm'
    end
    object tblMDBlnSovmSps6: TBooleanField
      FieldName = 'BlnSovmSps6'
    end
    object tblMDIsOtpSovmSps6: TSmallintField
      FieldName = 'IsOtpSovmSps6'
    end
    object tblMDNeoplSovmSps6: TBooleanField
      FieldName = 'NeoplSovmSps6'
    end
  end
  object qryOtkl: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select o.*, v.* '
      ' from z_otkl o, z_KdVidN v'
      ' where (o.TabN = 12394) and  ((o.DtProc = '#39'01/01/2006'#39') or '
      
        '                 ((o.ZaMesGod = '#39'01/01/2006'#39') and (o.DtProc <  '#39 +
        '01/01/2006'#39'))) and '
      '                       (v.VidN = o.VidN) '
      ' order by o.DtProc, o.ZaMesGod, o.VidN')
    Left = 200
    Top = 88
    object qryOtklNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklDTSTORN: TDateTimeField
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      DisplayWidth = 12
      FieldName = 'TABN'
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DT_BEG'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DT_END'
    end
    object qryOtklVIDN: TStringField
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklPDN: TSmallintField
      DisplayWidth = 12
      FieldName = 'PDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayWidth = 12
      FieldName = 'CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklKDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPZ'
    end
    object qryOtklKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_OTKL.KDTEMU'
    end
    object qryOtklNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRR'
    end
    object qryOtklPRPV: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRPV'
    end
    object qryOtklKTO: TSmallintField
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object qryOtklPRKR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      DisplayWidth = 12
      FieldName = 'NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPECPS'
    end
    object qryOtklNR_1: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR_1'
    end
    object qryOtklVIDN_1: TStringField
      DisplayWidth = 8
      FieldName = 'VIDN_1'
      FixedChar = True
      Size = 4
    end
    object qryOtklSHVIDN: TStringField
      DisplayWidth = 18
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryOtklNMVIDN: TStringField
      DisplayWidth = 77
      FieldName = 'NMVIDN'
      Size = 64
    end
    object qryOtklAINDX: TSmallintField
      DisplayWidth = 12
      FieldName = 'AINDX'
    end
    object qryOtklPINDX: TSmallintField
      DisplayWidth = 12
      FieldName = 'PINDX'
    end
    object qryOtklLVL: TSmallintField
      DisplayWidth = 12
      FieldName = 'LVL'
    end
    object qryOtklINDX: TSmallintField
      DisplayWidth = 12
      FieldName = 'INDX'
    end
    object qryOtklHSCH: TStringField
      DisplayWidth = 6
      FieldName = 'HSCH'
      Size = 1
    end
    object qryOtklOLDKDVIDN: TSmallintField
      DisplayWidth = 13
      FieldName = 'OLDKDVIDN'
    end
    object qryOtklNOSHOW: TStringField
      DisplayWidth = 10
      FieldName = 'NOSHOW'
      Size = 1
    end
    object qryOtklZP13: TStringField
      DisplayWidth = 5
      FieldName = 'ZP13'
      Size = 1
    end
    object qryOtklOTP: TStringField
      DisplayWidth = 5
      FieldName = 'OTP'
      Size = 1
    end
    object qryOtklBLN: TStringField
      DisplayWidth = 4
      FieldName = 'BLN'
      Size = 1
    end
    object qryOtklOTPUSKN: TStringField
      DisplayWidth = 11
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object qryOtklBOLNIC: TStringField
      DisplayWidth = 8
      FieldName = 'BOLNIC'
      Size = 1
    end
    object qryOtklSPRM: TStringField
      DisplayWidth = 6
      FieldName = 'SPRM'
      Size = 1
    end
    object qryOtklCPRM: TStringField
      DisplayWidth = 6
      FieldName = 'CPRM'
      Size = 1
    end
    object qryOtklDETI: TStringField
      DisplayWidth = 5
      FieldName = 'DETI'
      Size = 1
    end
    object qryOtklDETIM: TStringField
      DisplayWidth = 7
      FieldName = 'DETIM'
      Size = 1
    end
    object qryOtklDETIK: TStringField
      DisplayWidth = 7
      FieldName = 'DETIK'
      Size = 1
    end
    object qryOtklIND: TStringField
      DisplayWidth = 4
      FieldName = 'IND'
      Size = 1
    end
    object qryOtklDHD: TStringField
      DisplayWidth = 5
      FieldName = 'DHD'
      Size = 1
    end
    object qryOtklOKLFND: TStringField
      DisplayWidth = 9
      FieldName = 'OKLFND'
      Size = 1
    end
    object qryOtklCBUDG: TStringField
      DisplayWidth = 8
      FieldName = 'CBUDG'
      Size = 1
    end
    object qryOtklSNDB: TStringField
      DisplayWidth = 6
      FieldName = 'SNDB'
      Size = 1
    end
    object qryOtklSPDN: TStringField
      DisplayWidth = 6
      FieldName = 'SPDN'
      Size = 1
    end
    object qryOtklSWSB: TStringField
      FieldName = 'SWSB'
      Origin = 'DbMain.Z_KDVIDN.SWSB'
      Size = 1
    end
    object qryOtklSPRF: TStringField
      DisplayWidth = 6
      FieldName = 'SPRF'
      Size = 1
    end
    object qryOtklSPENS: TStringField
      DisplayWidth = 7
      FieldName = 'SPENS'
      Size = 1
    end
    object qryOtklSALIM: TStringField
      DisplayWidth = 7
      FieldName = 'SALIM'
      Size = 1
    end
    object qryOtklCNDB: TStringField
      DisplayWidth = 6
      FieldName = 'CNDB'
      Size = 1
    end
    object qryOtklSSOCSTRAH: TStringField
      DisplayWidth = 13
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object qryOtklSBZR: TStringField
      DisplayWidth = 6
      FieldName = 'SBZR'
      Size = 1
    end
    object qryOtklLITTLEHLP: TStringField
      DisplayWidth = 1
      FieldName = 'LITTLEHLP'
      Size = 255
    end
    object qryOtklDETIG: TStringField
      DisplayWidth = 7
      FieldName = 'DETIG'
      Size = 1
    end
    object qryOtklKDSPZ_1: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPZ_1'
    end
    object qryOtklOLDSZATR: TStringField
      DisplayWidth = 12
      FieldName = 'OLDSZATR'
      Size = 6
    end
    object qryOtklSP_PF: TStringField
      DisplayWidth = 7
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryOtklSP_FSTVP: TStringField
      DisplayWidth = 11
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryOtklSP_FSNV: TStringField
      DisplayWidth = 10
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryOtklSP_FZ: TStringField
      DisplayWidth = 7
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryOtklSOVM: TStringField
      DisplayWidth = 6
      FieldName = 'SOVM'
      Size = 1
    end
    object qryOtklSPOV: TStringField
      DisplayWidth = 6
      FieldName = 'SPOV'
      Size = 1
    end
    object qryOtklKEKV: TStringField
      DisplayWidth = 6
      FieldName = 'KEKV'
      FixedChar = True
      Size = 4
    end
    object qryOtklOLDKDOBJ: TSmallintField
      DisplayWidth = 12
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object qryOtklOLDKDVIDN_1: TSmallintField
      DisplayWidth = 15
      FieldName = 'OLDKDVIDN_1'
      Origin = 'DbMain.Z_KDVIDN.OLDKDVIDN'
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
    object qryOtklKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_OTKL.KDBNK'
    end
    object qryOtklNDBE: TStringField
      FieldName = 'NDBE'
      Origin = 'DbMain.Z_KDVIDN.NDBE'
      FixedChar = True
      Size = 1
    end
    object qryOtklDKR: TStringField
      FieldName = 'DKR'
      Origin = 'DbMain.Z_KDVIDN.DKR'
      Size = 1
    end
    object qryOtklSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.Z_KDVIDN.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryOtklKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHDT'
    end
    object qryOtklKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.Z_KDVIDN.KDSCHKT'
    end
    object qryOtklOtkl_Sovm: TStringField
      FieldName = 'Otkl_Sovm'
      Size = 1
    end
  end
  object qryPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select p.*, wp.NrDoc, wp.DtBegDoc, wp.DtEndDoc from z_Pere p'
      'Left outer Join z_GetWrkPereOnDate(p.TabN, p.Dt_Beg) wp on 1=1'
      'where p.TabN = :nTabN'
      'order by p.Dt_Beg desc, p.NR desc')
    Left = 64
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nTabN'
        ParamType = ptUnknown
      end>
  end
  object qryNadb: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      '')
    Left = 128
    Top = 88
  end
  object qryUdrg: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_Uderg'
      'where TabN = :nTabN')
    Left = 160
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'nTabN'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select VidN, ShVidN, DtProc, ZaMesGod, PRR, KdKatP, PSch, KdSpZ,' +
        ' SchBU, '
      ' Round(Sum(Summa),2) as SMM from ViNuMain '
      ' where TabN = 18425 and DtProc <= '#39'10/01/2010'#39' and '
      
        ' ZaMesGod = '#39'10/01/2010'#39' and ((VidN >= "6001" and VidN <= "6502"' +
        ') or '
      '                       (VidN > "8000" and VidN < "8700"))'
      
        ' group by VidN, ShVidN, DtProc, ZaMesGod, PRR, KdKatP, PSch, KdS' +
        'pZ, SchBU')
    Left = 416
    Top = 104
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 208
    Top = 104
  end
  object dsrcMD: TDataSource
    DataSet = tblMD
    Left = 88
    Top = 257
  end
  object qryPrmUv: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_PrmUv'
      '    where (tabN = :nTabN)  and (KdSps = 0)'
      '  order by Dt_Priem desc')
    Left = 24
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nTabN'
        ParamType = ptUnknown
      end>
  end
  object qryCmbOkl: TQuery
    Left = 96
    Top = 88
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 32
    Top = 104
  end
  object tblNu: TTable
    AutoCalcFields = False
    BeforePost = tblNuBeforePost
    OnCalcFields = tblNuCalcFields
    DatabaseName = 'C_T_E_M_P'
    Filter = 'VidN < '#39'8000'#39
    StoreDefs = True
    TableName = 'x_Nu750.DB'
    Left = 248
    Top = 225
    object tblNuNR: TIntegerField
      FieldName = 'NR'
    end
    object tblNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object tblNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
    end
    object tblNuTABN: TIntegerField
      FieldName = 'TABN'
    end
    object tblNuVIDN: TStringField
      FieldName = 'VIDN'
      Size = 4
    end
    object tblNuGRP: TSmallintField
      FieldName = 'GRP'
    end
    object tblNuOLDCH: TFloatField
      FieldName = 'OLDCH'
    end
    object tblNuOLDSM: TFloatField
      FieldName = 'OLDSM'
    end
    object tblNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object tblNuD__Smm: TFloatField
      FieldKind = fkCalculated
      FieldName = 'D__Smm'
      Calculated = True
    end
    object tblNuDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object tblNuKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object tblNuKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
    end
    object tblNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object tblNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object tblNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object tblNuSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 15
    end
    object tblNuPSCH: TStringField
      FieldName = 'PSCH'
      Size = 15
    end
    object tblNuPDN: TSmallintField
      FieldName = 'PDN'
    end
    object tblNuNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object tblNuPRR: TSmallintField
      FieldName = 'PRR'
    end
    object tblNuPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object tblNuKTO: TSmallintField
      FieldName = 'KTO'
    end
    object tblNuPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object tblNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object tblNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object tblNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object tblNuCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object tblNuSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object tblNuDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object tblNuNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object tblNuD__Chs: TFloatField
      FieldKind = fkCalculated
      FieldName = 'D__Chs'
      Calculated = True
    end
    object tblNuD_CH: TFloatField
      FieldName = 'D_CH'
    end
    object tblNuD_SM: TFloatField
      FieldName = 'D_SM'
    end
    object tblNuOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      Size = 10
    end
    object tblNuKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object tblNuNR_1: TIntegerField
      FieldName = 'NR_1'
    end
    object tblNuVIDN_1: TStringField
      FieldName = 'VIDN_1'
      Size = 4
    end
    object tblNuOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object tblNuSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object tblNuNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Size = 64
    end
    object tblNuAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object tblNuPINDX: TSmallintField
      FieldName = 'PINDX'
    end
    object tblNuLVL: TSmallintField
      FieldName = 'LVL'
    end
    object tblNuINDX: TSmallintField
      FieldName = 'INDX'
    end
    object tblNuHSCH: TStringField
      FieldName = 'HSCH'
      Size = 1
    end
    object tblNuNDBE: TStringField
      FieldName = 'NDBE'
      Size = 1
    end
    object tblNuNOSHOW: TStringField
      FieldName = 'NOSHOW'
      Size = 1
    end
    object tblNuZP13: TStringField
      FieldName = 'ZP13'
      Size = 1
    end
    object tblNuOTP: TStringField
      FieldName = 'OTP'
      Size = 1
    end
    object tblNuBLN: TStringField
      FieldName = 'BLN'
      Size = 1
    end
    object tblNuDKR: TStringField
      FieldName = 'DKR'
      Size = 1
    end
    object tblNuOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object tblNuBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Size = 1
    end
    object tblNuSPRM: TStringField
      FieldName = 'SPRM'
      Size = 1
    end
    object tblNuCPRM: TStringField
      FieldName = 'CPRM'
      Size = 1
    end
    object tblNuSSRK: TStringField
      FieldName = 'SSRK'
      Size = 1
    end
    object tblNuDETI: TStringField
      FieldName = 'DETI'
      Size = 1
    end
    object tblNuDETIM: TStringField
      FieldName = 'DETIM'
      Size = 1
    end
    object tblNuDETIK: TStringField
      FieldName = 'DETIK'
      Size = 1
    end
    object tblNuDETIG: TStringField
      FieldName = 'DETIG'
      Size = 1
    end
    object tblNuIND: TStringField
      FieldName = 'IND'
      Size = 1
    end
    object tblNuDHD: TStringField
      FieldName = 'DHD'
      Size = 1
    end
    object tblNuOKLFND: TStringField
      FieldName = 'OKLFND'
      Size = 1
    end
    object tblNuCBUDG: TStringField
      FieldName = 'CBUDG'
      Size = 1
    end
    object tblNuSNDB: TStringField
      FieldName = 'SNDB'
      Size = 1
    end
    object tblNuSPDN: TStringField
      FieldName = 'SPDN'
      Size = 1
    end
    object tblNuSWSB: TStringField
      FieldName = 'SWSB'
      Size = 1
    end
    object tblNuSPRF: TStringField
      FieldName = 'SPRF'
      Size = 1
    end
    object tblNuSPENS: TStringField
      FieldName = 'SPENS'
      Size = 1
    end
    object tblNuSALIM: TStringField
      FieldName = 'SALIM'
      Size = 1
    end
    object tblNuCNDB: TStringField
      FieldName = 'CNDB'
      Size = 1
    end
    object tblNuSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object tblNuSBZR: TStringField
      FieldName = 'SBZR'
      Size = 1
    end
    object tblNuLITTLEHLP: TStringField
      FieldName = 'LITTLEHLP'
      Size = 255
    end
    object tblNuKDSPZ_1: TSmallintField
      FieldName = 'KDSPZ_1'
    end
    object tblNuOLDSZATR: TStringField
      FieldName = 'OLDSZATR'
      Size = 6
    end
    object tblNuSP_PF: TStringField
      FieldName = 'SP_PF'
      Size = 1
    end
    object tblNuSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Size = 1
    end
    object tblNuSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Size = 1
    end
    object tblNuSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Size = 1
    end
    object tblNuSOVM: TStringField
      FieldName = 'SOVM'
      Size = 1
    end
    object tblNuSPOV: TStringField
      FieldName = 'SPOV'
      Size = 1
    end
    object tblNuKEKV: TStringField
      FieldName = 'KEKV'
      Size = 4
    end
    object tblNuKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
    end
    object tblNuKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
    end
    object tblNuPrc_WT: TFloatField
      FieldName = 'Prc_WT'
    end
    object tblNUStorn: TStringField
      FieldName = 'Storn'
      Size = 1
    end
    object tblNuNuSovm: TStringField
      FieldName = 'NuSovm'
      Size = 1
    end
  end
  object tblPeriodu: TTable
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'AllBM'
        DataType = ftBoolean
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'nSpecPS'
        DataType = ftInteger
      end
      item
        Name = 'NuCntFakt'
        DataType = ftFloat
      end
      item
        Name = 'NuCntInPS'
        DataType = ftFloat
      end
      item
        Name = 'NuAvgSpecPS'
        DataType = ftFloat
      end
      item
        Name = 'OtklCntFakt'
        DataType = ftFloat
      end
      item
        Name = 'OtklCntInPS'
        DataType = ftFloat
      end
      item
        Name = 'OtklAvgSpecPS'
        DataType = ftFloat
      end
      item
        Name = 'RequiredPS'
        DataType = ftBoolean
      end
      item
        Name = 'Obrab'
        DataType = ftBoolean
      end
      item
        Name = 'Note'
        DataType = ftString
        Size = 30
      end>
    StoreDefs = True
    Left = 32
    Top = 241
    object tblPerioduNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPerioduDtProc: TDateField
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object tblPerioduAllBM: TBooleanField
      FieldName = 'AllBM'
    end
    object tblPerioduZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object tblPeriodunSpecPS: TIntegerField
      FieldName = 'nSpecPS'
    end
    object tblPerioduNuCntFakt: TFloatField
      FieldName = 'NuCntFakt'
    end
    object tblPerioduNuCntInPS: TFloatField
      FieldName = 'NuCntInPS'
    end
    object tblPerioduNuAvgSpecPS: TFloatField
      FieldName = 'NuAvgSpecPS'
    end
    object tblPerioduOtklCntFakt: TFloatField
      FieldName = 'OtklCntFakt'
    end
    object tblPerioduOtklCntInPS: TFloatField
      FieldName = 'OtklCntInPS'
    end
    object tblPerioduOtklAvgSpecPS: TFloatField
      FieldName = 'OtklAvgSpecPS'
    end
    object tblPerioduRequiredPS: TBooleanField
      FieldName = 'RequiredPS'
    end
    object tblPerioduObrab: TBooleanField
      FieldName = 'Obrab'
    end
    object tblPerioduNote: TStringField
      FieldName = 'Note'
      Size = 30
    end
  end
  object dsrcPeriodu: TDataSource
    DataSet = tblPeriodu
    Left = 40
    Top = 257
  end
  object dsrcNU: TDataSource
    DataSet = tblNu
    Left = 272
    Top = 241
  end
  object cdsAlim: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'NomDoc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SmAlim'
        DataType = ftFloat
      end
      item
        Name = 'SmPsb'
        DataType = ftFloat
      end
      item
        Name = 'KdPst'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 152
  end
  object qryTmp2: TQuery
    Left = 456
    Top = 104
  end
  object qryZNu: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Nu where NR = -1')
    UpdateObject = updZNu
    Left = 440
    Top = 225
    object qryZNuNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NU.NR'
    end
    object qryZNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_NU.DTPROC'
    end
    object qryZNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_NU.ZAMESGOD'
    end
    object qryZNuTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NU.TABN'
    end
    object qryZNuVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NU.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryZNuCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_NU.CHAS'
    end
    object qryZNuSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_NU.SUMMA'
    end
    object qryZNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NU.DT_BEG'
    end
    object qryZNuDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NU.DT_END'
    end
    object qryZNuKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NU.KDSPS'
    end
    object qryZNuKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_NU.KDTEMU'
    end
    object qryZNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NU.KDOBJ'
    end
    object qryZNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NU.KDKATP'
    end
    object qryZNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NU.KDSPZ'
    end
    object qryZNuPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_NU.PDN'
    end
    object qryZNuOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      Origin = 'DbMain.Z_NU.OZN_PILG'
      FixedChar = True
      Size = 10
    end
    object qryZNuNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NU.NOTES'
      Size = 25
    end
    object qryZNuPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_NU.PRR'
    end
    object qryZNuPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_NU.PRPV'
    end
    object qryZNuKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_NU.KTO'
    end
    object qryZNuPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_NU.PRKR'
    end
    object qryZNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_NU.MYNOTES'
      Size = 25
    end
    object qryZNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_NU.SPECPS'
    end
    object qryZNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NU.SPEC_NR'
    end
    object qryZNuOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_NU.OLDKDOBJ'
    end
    object qryZNuOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_NU.OLDKDVIDN'
    end
    object qryZNuDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_NU.DTVDPV'
    end
    object qryZNuNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_NU.NRVDPV'
    end
    object qryZNuKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_NU.KDBNK'
    end
    object qryZNuSovm: TStringField
      FieldName = 'Sovm'
      Size = 1
    end
    object qryZNuStorn: TStringField
      FieldName = 'Storn'
      Size = 1
    end
  end
  object updZNu: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nu'
      'set'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  OZN_PILG = :OZN_PILG,'
      '  PDN = :PDN,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  KDBNK = :KDBNK,'
      '  KDTEMU = :KDTEMU,'
      '  SOVM=:SOVM,'
      '  STORN=:STORN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nu'
      '  (DTPROC, ZAMESGOD, TABN, VIDN, CHAS, SUMMA, DT_BEG, DT_END, '
      'KDSPS, KDOBJ, '
      '   KDKATP, KDSPZ, OZN_PILG, PDN, NOTES, PRR, PRPV, KTO, PRKR, '
      'MYNOTES, '
      '   SPECPS, SPEC_NR, OLDKDOBJ, OLDKDVIDN, DTVDPV, NRVDPV, KDBNK, '
      'KDTEMU, SOVM, STORN)'
      'values'
      
        '  (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :CHAS, :SUMMA, :DT_BEG, :DT' +
        '_END, '
      ':KDSPS, '
      
        '   :KDOBJ, :KDKATP, :KDSPZ, :OZN_PILG, :PDN, :NOTES, :PRR, :PRPV' +
        ', :KTO, '
      
        '   :PRKR, :MYNOTES, :SPECPS, :SPEC_NR, :OLDKDOBJ, :OLDKDVIDN, :D' +
        'TVDPV, '
      '   :NRVDPV, :KDBNK, :KDTEMU, :SOVM, :STORN)')
    DeleteSQL.Strings = (
      'delete from z_Nu'
      'where'
      '  NR = :OLD_NR')
    Left = 456
    Top = 241
  end
  object qryTblPrp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_TblPrp'
      'order by DtBeg desc')
    Left = 296
    Top = 88
  end
  object qryTPdn: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_TPdn'
      'order by DtBeg desc')
    Left = 264
    Top = 88
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'SmmFor'
        DataType = ftFloat
      end
      item
        Name = 'UdVes'
        DataType = ftFloat
      end
      item
        Name = 'UdVesSvP'
        DataType = ftFloat
      end
      item
        Name = 'SmmXX'
        DataType = ftFloat
      end
      item
        Name = 'SmmSvPorog'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsTmpIndex'
        Fields = 'DtProc;KdSps;KdObj;KdKatP;KdSpZ;PRR'
      end>
    IndexName = 'cdsTmpIndex'
    Params = <>
    StoreDefs = True
    Left = 644
    Top = 218
  end
  object cdsOKS: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Step'
        DataType = ftSmallint
      end
      item
        Name = 'Metka'
        DataType = ftBoolean
      end
      item
        Name = 'DtPrc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'sForCmn'
        DataType = ftFloat
      end
      item
        Name = 'sNwCmn'
        DataType = ftFloat
      end
      item
        Name = 'sSgmCmn'
        DataType = ftFloat
      end
      item
        Name = 'svPrgCmn'
        DataType = ftFloat
      end
      item
        Name = 'sForPps'
        DataType = ftFloat
      end
      item
        Name = 'sNwPps'
        DataType = ftFloat
      end
      item
        Name = 'sSgmPps'
        DataType = ftFloat
      end
      item
        Name = 'svPrgPps'
        DataType = ftFloat
      end
      item
        Name = 'sForBln'
        DataType = ftFloat
      end
      item
        Name = 'sNwBln'
        DataType = ftFloat
      end
      item
        Name = 'sSgmBln'
        DataType = ftFloat
      end
      item
        Name = 'svPrgBln'
        DataType = ftFloat
      end
      item
        Name = 'sForDkr'
        DataType = ftFloat
      end
      item
        Name = 'sNwDkr'
        DataType = ftFloat
      end
      item
        Name = 'sSgmDkr'
        DataType = ftFloat
      end
      item
        Name = 'svPrgDkr'
        DataType = ftFloat
      end
      item
        Name = 'sForDgv'
        DataType = ftFloat
      end
      item
        Name = 'sNwDgv'
        DataType = ftFloat
      end
      item
        Name = 'sSgmDgv'
        DataType = ftFloat
      end
      item
        Name = 'svPrgDgv'
        DataType = ftFloat
      end
      item
        Name = 'sForPrf'
        DataType = ftFloat
      end
      item
        Name = 'sNwPrf'
        DataType = ftFloat
      end
      item
        Name = 'sForWSb'
        DataType = ftFloat
      end
      item
        Name = 'sNwWSb'
        DataType = ftFloat
      end
      item
        Name = 'sForPdnC'
        DataType = ftFloat
      end
      item
        Name = 'sNwPdnC'
        DataType = ftFloat
      end
      item
        Name = 'sForPdnD'
        DataType = ftFloat
      end
      item
        Name = 'sNwPdnD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OksIndex'
        Fields = 'DtPrc;ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;Prr'
      end>
    IndexName = 'OksIndex'
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsOKSCalcFields
    Left = 52
    Top = 384
    object cdsOKSNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsOKSStep: TSmallintField
      FieldName = 'Step'
    end
    object cdsOKSMetka: TBooleanField
      FieldName = 'Metka'
    end
    object cdsOKSDtPrc: TDateField
      FieldName = 'DtPrc'
      DisplayFormat = 'mm/yy'
    end
    object cdsOKSZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yy'
    end
    object cdsOKSKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsOKSKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsOKSKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsOKSKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsOKSKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsOKSSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsOKSPRR: TSmallintField
      DisplayLabel = 'Prr'
      FieldName = 'PRR'
    end
    object cdsOKSsForCmn: TFloatField
      FieldName = 'sForCmn'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwCmn: TFloatField
      FieldName = 'sNwCmn'
      DisplayFormat = '#.00'
    end
    object cdsOKSsSgmCmn: TFloatField
      FieldName = 'sSgmCmn'
      DisplayFormat = '#.00'
    end
    object cdsOKSsvPrgCmn: TFloatField
      FieldName = 'svPrgCmn'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForPps: TFloatField
      FieldName = 'sForPps'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwPps: TFloatField
      FieldName = 'sNwPps'
      DisplayFormat = '#.00'
    end
    object cdsOKSsSgmPps: TFloatField
      FieldName = 'sSgmPps'
      DisplayFormat = '#.00'
    end
    object cdsOKSsvPrgPps: TFloatField
      FieldName = 'svPrgPps'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForBln: TFloatField
      FieldName = 'sForBln'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwBln: TFloatField
      FieldName = 'sNwBln'
      DisplayFormat = '#.00'
    end
    object cdsOKSsSgmBln: TFloatField
      FieldName = 'sSgmBln'
      DisplayFormat = '#.00'
    end
    object cdsOKSsvPrgBln: TFloatField
      FieldName = 'svPrgBln'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForDkr: TFloatField
      FieldName = 'sForDkr'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwDkr: TFloatField
      FieldName = 'sNwDkr'
      DisplayFormat = '#.00'
    end
    object cdsOKSsSgmDkr: TFloatField
      FieldName = 'sSgmDkr'
      DisplayFormat = '#.00'
    end
    object cdsOKSsvPrgDkr: TFloatField
      FieldName = 'svPrgDkr'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForDgv: TFloatField
      FieldName = 'sForDgv'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwDgv: TFloatField
      FieldName = 'sNwDgv'
      DisplayFormat = '#.00'
    end
    object cdsOKSsSgmDgv: TFloatField
      FieldName = 'sSgmDgv'
      DisplayFormat = '#.00'
    end
    object cdsOKSsvPrgDgv: TFloatField
      FieldName = 'svPrgDgv'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForPrf: TFloatField
      FieldName = 'sForPrf'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwPrf: TFloatField
      FieldName = 'sNwPrf'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForWSb: TFloatField
      FieldName = 'sForWSb'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwWSb: TFloatField
      FieldName = 'sNwWSb'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForPdnC: TFloatField
      FieldName = 'sForPdnC'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwPdnC: TFloatField
      FieldName = 'sNwPdnC'
      DisplayFormat = '#.00'
    end
    object cdsOKSsForPdnD: TFloatField
      FieldName = 'sForPdnD'
      DisplayFormat = '#.00'
    end
    object cdsOKSsNwPdnD: TFloatField
      FieldName = 'sNwPdnD'
      DisplayFormat = '#.00'
    end
  end
  object dsrcOKS: TDataSource
    DataSet = cdsOKS
    Left = 67
    Top = 400
  end
  object cdsPrp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'SSm'
        DataType = ftFloat
      end
      item
        Name = 'SSmOldVzn'
        DataType = ftFloat
      end
      item
        Name = 'NwSmVzn'
        DataType = ftFloat
      end
      item
        Name = 'SSmOldSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'NwSmSvPrg'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsPrpIndex'
        Fields = 'KdSps;KdObj;KdKatP;KdSpZ;PRR'
      end>
    Params = <>
    StoreDefs = True
    Left = 676
    Top = 218
  end
  object cdsCmbOkl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
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
        Name = 'Chas'
        DataType = ftFloat
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 148
    Top = 241
  end
  object tblSvRes: TTable
    OnCalcFields = tblSvResCalcFields
    DatabaseName = '_Temp_C'
    Filter = 'VidN < '#39'8000'#39
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Step'
        DataType = ftSmallint
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
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
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
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PdN'
        DataType = ftSmallint
      end
      item
        Name = 'Ozn_Pilg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'PrPV'
        DataType = ftSmallint
      end
      item
        Name = 'Kto'
        DataType = ftSmallint
      end
      item
        Name = 'PrKr'
        DataType = ftSmallint
      end
      item
        Name = 'MyNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'SpecPS'
        DataType = ftInteger
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'DtVdPV'
        DataType = ftDate
      end
      item
        Name = 'NrVdPV'
        DataType = ftInteger
      end
      item
        Name = 'Storn'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SAlim'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CBudg'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'Sovm'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'tblSvRes'
    Left = 312
    Top = 225
    object tblSvResNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblSvResStep: TSmallintField
      FieldName = 'Step'
    end
    object tblSvResDtProc: TDateField
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object tblSvResZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object tblSvResTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblSvResVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object tblSvResChas: TFloatField
      FieldName = 'Chas'
    end
    object tblSvResSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '#.00'
    end
    object tblSvResDt_Beg: TDateField
      FieldName = 'Dt_Beg'
      DisplayFormat = 'dd/mm/yy'
    end
    object tblSvResDt_End: TDateField
      FieldName = 'Dt_End'
      DisplayFormat = 'dd/mm/yy'
    end
    object tblSvResKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object tblSvResKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object tblSvResKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object tblSvResKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object tblSvResKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object tblSvResPdN: TSmallintField
      FieldName = 'PdN'
    end
    object tblSvResNotes: TStringField
      FieldName = 'Notes'
      Size = 25
    end
    object tblSvResPRR: TSmallintField
      FieldName = 'PRR'
    end
    object tblSvResPrPV: TSmallintField
      FieldName = 'PrPV'
    end
    object tblSvResKto: TSmallintField
      FieldName = 'Kto'
    end
    object tblSvResPrKr: TSmallintField
      FieldName = 'PrKr'
    end
    object tblSvResMyNotes: TStringField
      FieldName = 'MyNotes'
      Size = 25
    end
    object tblSvResSpecPS: TIntegerField
      FieldName = 'SpecPS'
    end
    object tblSvResSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
    object tblSvResDtVdPV: TDateField
      FieldName = 'DtVdPV'
    end
    object tblSvResNrVdPV: TIntegerField
      FieldName = 'NrVdPV'
    end
    object tblSvResStorn: TStringField
      FieldName = 'Storn'
      Size = 1
    end
    object tblSvResShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object tblSvResSAlim: TStringField
      FieldName = 'SAlim'
      Size = 1
    end
    object tblSvResCBudg: TStringField
      FieldName = 'CBudg'
      Size = 1
    end
    object tblSvResKdBnk: TSmallintField
      FieldName = 'KdBnk'
    end
    object tblSvResOzn_Pilg: TStringField
      FieldName = 'Ozn_Pilg'
      Size = 10
    end
    object tblSvResSovm: TStringField
      FieldName = 'Sovm'
      Size = 1
    end
  end
  object dsrcSvRes: TDataSource
    DataSet = tblSvRes
    Left = 336
    Top = 241
  end
  object qryPrcEsv: TQuery
    Left = 364
    Top = 138
  end
  object qryPrcEsvPrp: TQuery
    Left = 396
    Top = 138
  end
  object cdsSmPdn: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
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
        Name = 'SmPdn'
        DataType = ftFloat
      end
      item
        Name = 'Ozn_Pilg'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 708
    Top = 218
  end
  object qryInv: TQuery
    SQL.Strings = (
      
        'Select First 1 p.*, wp.NrDoc, wp.DtBegDoc, wp.DtEndDoc from z_Pe' +
        're p'
      
        'Left outer Join z_GetWrkPereOnDate(p.TabN, '#39'01/01/2013'#39') wp on 1' +
        '=1'
      'where p.TabN = 6569 and p.Dt_beg <= '#39'01/01/2013'#39
      'order by p.Dt_Beg desc, p.NR desc')
    Left = 64
    Top = 128
  end
  object qryNdbOtkl: TQuery
    Left = 348
    Top = 90
  end
  object cdsNwSm: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtPrc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'OldSm'
        DataType = ftFloat
      end
      item
        Name = 'NewSm'
        DataType = ftFloat
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsOKSCalcFields
    Left = 196
    Top = 237
    Data = {
      ED0000009619E0BD01000000180000000C000000000003000000ED00024E5204
      0001000200010007535542545950450200490008004175746F696E6300054474
      5072630400060000000000085A614D6573476F640400060000000000054B6453
      70730200010000000000064B6454656D750200010000000000054B644F626A02
      00010000000000064B644B6174500200010000000000054B6453705A02000100
      00000000035052520200010000000000054F6C64536D0800040000000000054E
      6577536D080004000000000005536D466F72080004000000000001000C415554
      4F494E4356414C55450400010001000000}
    object cdsNwSmNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsNwSmDtPrc: TDateField
      FieldName = 'DtPrc'
    end
    object cdsNwSmZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object cdsNwSmKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsNwSmKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsNwSmKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsNwSmKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsNwSmKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsNwSmPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsNwSmOldSm: TFloatField
      FieldName = 'OldSm'
    end
    object cdsNwSmNewSm: TFloatField
      FieldName = 'NewSm'
    end
    object cdsNwSmSmFor: TFloatField
      FieldName = 'SmFor'
    end
  end
  object qryNeoplVids: TQuery
    Left = 508
    Top = 90
  end
  object qryDbg: TQuery
    DatabaseName = 'DbMain'
    Left = 732
    Top = 426
  end
  object dspDbg: TDataSetProvider
    DataSet = qryDbg
    Left = 772
    Top = 426
  end
  object cdsDbg: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
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
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Prr'
        DataType = ftSmallint
      end
      item
        Name = 'sOldCmn'
        DataType = ftFloat
      end
      item
        Name = 'cNewCmn'
        DataType = ftFloat
      end
      item
        Name = 'sSgmCmn'
        DataType = ftFloat
      end
      item
        Name = 'svPrgCmn'
        DataType = ftFloat
      end
      item
        Name = 'sOldPps'
        DataType = ftFloat
      end
      item
        Name = 'sNewPPs'
        DataType = ftFloat
      end
      item
        Name = 'sSgmPps'
        DataType = ftFloat
      end
      item
        Name = 'svPrgPps'
        DataType = ftFloat
      end
      item
        Name = 'sOldBln'
        DataType = ftFloat
      end
      item
        Name = 'sNewBln'
        DataType = ftFloat
      end
      item
        Name = 'sSgmBln'
        DataType = ftFloat
      end
      item
        Name = 'svPrgBln'
        DataType = ftFloat
      end
      item
        Name = 'sOldDkr'
        DataType = ftFloat
      end
      item
        Name = 'sNewDkr'
        DataType = ftFloat
      end
      item
        Name = 'sSgmDkr'
        DataType = ftFloat
      end
      item
        Name = 'svPrgDkr'
        DataType = ftFloat
      end
      item
        Name = 'sOldDgv'
        DataType = ftFloat
      end
      item
        Name = 'sNewDgv'
        DataType = ftFloat
      end
      item
        Name = 'sSgmDgv'
        DataType = ftFloat
      end
      item
        Name = 'svPrgDgv'
        DataType = ftFloat
      end
      item
        Name = 'sOldWSb'
        DataType = ftFloat
      end
      item
        Name = 'sNewWSb'
        DataType = ftFloat
      end
      item
        Name = 'sSgmWSb'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DbgIndex'
        Fields = 'DtProc;ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;Prr'
      end>
    IndexName = 'DbgIndex'
    Params = <>
    StoreDefs = True
    Left = 732
    Top = 464
    Data = {
      440200009619E0BD0100000018000000200000000000030000004402024E5204
      0001000200010007535542545950450200490008004175746F696E6300064474
      50726F630400060000000000085A614D6573476F640400060000000000054B64
      5370730200010000000000054B644F626A0200010000000000064B644B617450
      0200010000000000054B6453705A020001000000000005536368425501004900
      00000100055749445448020002000A0003507272020001000000000007734F6C
      64436D6E080004000000000007634E6577436D6E080004000000000007735367
      6D436D6E0800040000000000087376507267436D6E080004000000000007734F
      6C64507073080004000000000007734E65775050730800040000000000077353
      676D507073080004000000000008737650726750707308000400000000000773
      4F6C64426C6E080004000000000007734E6577426C6E08000400000000000773
      53676D426C6E0800040000000000087376507267426C6E080004000000000007
      734F6C64446B72080004000000000007734E6577446B72080004000000000007
      7353676D446B720800040000000000087376507267446B720800040000000000
      07734F6C64446776080004000000000007734E65774467760800040000000000
      077353676D446776080004000000000008737650726744677608000400000000
      0007734F6C64575362080004000000000007734E657757536208000400000000
      00077353676D575362080004000000000001000C4155544F494E4356414C5545
      0400010001000000}
    object cdsDbgNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDbgDtProc: TDateField
      FieldName = 'DtProc'
    end
    object cdsDbgZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object cdsDbgKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsDbgKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsDbgKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsDbgKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsDbgSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsDbgPrr: TSmallintField
      FieldName = 'Prr'
    end
    object cdsDbgsOldCmn: TFloatField
      FieldName = 'sOldCmn'
    end
    object cdsDbgcNewCmn: TFloatField
      FieldName = 'cNewCmn'
    end
    object cdsDbgsSgmCmn: TFloatField
      FieldName = 'sSgmCmn'
    end
    object cdsDbgsvPrgCmn: TFloatField
      FieldName = 'svPrgCmn'
    end
    object cdsDbgsOldPps: TFloatField
      FieldName = 'sOldPps'
    end
    object cdsDbgsNewPPs: TFloatField
      FieldName = 'sNewPPs'
    end
    object cdsDbgsSgmPps: TFloatField
      FieldName = 'sSgmPps'
    end
    object cdsDbgsvPrgPps: TFloatField
      FieldName = 'svPrgPps'
    end
    object cdsDbgsOldBln: TFloatField
      FieldName = 'sOldBln'
    end
    object cdsDbgsNewBln: TFloatField
      FieldName = 'sNewBln'
    end
    object cdsDbgsSgmBln: TFloatField
      FieldName = 'sSgmBln'
    end
    object cdsDbgsvPrgBln: TFloatField
      FieldName = 'svPrgBln'
    end
    object cdsDbgsOldDkr: TFloatField
      FieldName = 'sOldDkr'
    end
    object cdsDbgsNewDkr: TFloatField
      FieldName = 'sNewDkr'
    end
    object cdsDbgsSgmDkr: TFloatField
      FieldName = 'sSgmDkr'
    end
    object cdsDbgsvPrgDkr: TFloatField
      FieldName = 'svPrgDkr'
    end
    object cdsDbgsOldDgv: TFloatField
      FieldName = 'sOldDgv'
    end
    object cdsDbgsNewDgv: TFloatField
      FieldName = 'sNewDgv'
    end
    object cdsDbgsSgmDgv: TFloatField
      FieldName = 'sSgmDgv'
    end
    object cdsDbgsvPrgDgv: TFloatField
      FieldName = 'svPrgDgv'
    end
    object cdsDbgsOldWSb: TFloatField
      FieldName = 'sOldWSb'
    end
    object cdsDbgsNewWSb: TFloatField
      FieldName = 'sNewWSb'
    end
    object cdsDbgsSgmWSb: TFloatField
      FieldName = 'sSgmWSb'
    end
  end
  object dsrcDbg: TDataSource
    DataSet = cdsDbg
    Left = 744
    Top = 472
  end
  object popNu: TPopupMenu
    OnPopup = popNuPopup
    Left = 148
    Top = 162
    object popF8: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100'/'#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091
      ShortCut = 119
      OnClick = sBtnF8Click
    end
    object popUnSelAll: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
      ShortCut = 46
      OnClick = popUnSelAllClick
    end
    object popShwTts: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1091#1084#1084#1099' '#1089#1091#1084#1084' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1084' '#1079#1072#1087#1080#1089#1103#1084
      ShortCut = 116
      OnClick = popShwTtsClick
    end
    object popNuSep1: TMenuItem
      Caption = '-'
    end
    object popNuPrtTable: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' tbl_NU'
      OnClick = popNuPrtTableClick
    end
    object popPrtCdsZNU: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' cdsZ_NU'
      OnClick = popPrtCdsZNUClick
    end
  end
  object cdsOks2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'RepMes'
        DataType = ftDate
      end
      item
        Name = 'RMes'
        DataType = ftDate
      end
      item
        Name = 'ZaMG'
        DataType = ftDate
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Prr'
        DataType = ftSmallint
      end
      item
        Name = 'Sp_PF'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPdn'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SPrf'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SWSb'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MyNotes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'SmOld'
        DataType = ftFloat
      end
      item
        Name = 'SmNew'
        DataType = ftFloat
      end
      item
        Name = 'SmDelta'
        DataType = ftFloat
      end
      item
        Name = 'PrcECmn'
        DataType = ftFloat
      end
      item
        Name = 'PrcEPps'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBln'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkr'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDgv'
        DataType = ftFloat
      end
      item
        Name = 'PrcECmnPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBlnPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBlnInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkrPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkrInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDgvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcPdnCmn'
        DataType = ftFloat
      end
      item
        Name = 'PrcPdnDgv'
        DataType = ftFloat
      end
      item
        Name = 'PrcPrfs'
        DataType = ftFloat
      end
      item
        Name = 'PrcWSb'
        DataType = ftFloat
      end
      item
        Name = 'SmMinZp'
        DataType = ftFloat
      end
      item
        Name = 'SmProgMin'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 488
    object cdsOks2NR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsOks2RMes: TDateField
      FieldName = 'RMes'
      DisplayFormat = 'mm/yy'
    end
    object cdsOks2ZaMG: TDateField
      FieldName = 'ZaMG'
      DisplayFormat = 'mm/yy'
    end
    object cdsOks2RepMes: TDateField
      FieldName = 'RepMes'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsOks2VidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsOks2ShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsOks2KdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsOks2KdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsOks2KdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsOks2KdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsOks2KdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsOks2SchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsOks2Prr: TSmallintField
      FieldName = 'Prr'
    end
    object cdsOks2Sp_PF: TStringField
      FieldName = 'Sp_PF'
      Size = 1
    end
    object cdsOks2SPdn: TStringField
      FieldName = 'SPdn'
      Size = 1
    end
    object cdsOks2SPrf: TStringField
      FieldName = 'SPrf'
      Size = 1
    end
    object cdsOks2SWSb: TStringField
      FieldName = 'SWSb'
      Size = 1
    end
    object cdsOks2MyNotes: TStringField
      FieldName = 'MyNotes'
      Size = 35
    end
    object cdsOks2SmOld: TFloatField
      FieldName = 'SmOld'
      DisplayFormat = '0.00'
    end
    object cdsOks2SmNew: TFloatField
      FieldName = 'SmNew'
      DisplayFormat = '0.00'
    end
    object cdsOks2SmDelta: TFloatField
      FieldName = 'SmDelta'
      DisplayFormat = '0.00'
    end
    object cdsOks2PrcECmn: TFloatField
      FieldName = 'PrcECmn'
    end
    object cdsOks2PrcEPps: TFloatField
      FieldName = 'PrcEPps'
    end
    object cdsOks2PrcEBln: TFloatField
      FieldName = 'PrcEBln'
    end
    object cdsOks2PrcEDkr: TFloatField
      FieldName = 'PrcEDkr'
    end
    object cdsOks2PrcEDgv: TFloatField
      FieldName = 'PrcEDgv'
    end
    object cdsOks2PrcECmnPrp: TFloatField
      FieldName = 'PrcECmnPrp'
    end
    object cdsOks2PrcEInvPrp: TFloatField
      FieldName = 'PrcEInvPrp'
    end
    object cdsOks2PrcEBlnPrp: TFloatField
      FieldName = 'PrcEBlnPrp'
    end
    object cdsOks2PrcEBlnInvPrp: TFloatField
      FieldName = 'PrcEBlnInvPrp'
    end
    object cdsOks2PrcEDkrPrp: TFloatField
      FieldName = 'PrcEDkrPrp'
    end
    object cdsOks2PrcEDkrInvPrp: TFloatField
      FieldName = 'PrcEDkrInvPrp'
    end
    object cdsOks2PrcEDgvPrp: TFloatField
      FieldName = 'PrcEDgvPrp'
    end
    object cdsOks2PrcPdnCmn: TFloatField
      FieldName = 'PrcPdnCmn'
    end
    object cdsOks2PrcPdnDgv: TFloatField
      FieldName = 'PrcPdnDgv'
    end
    object cdsOks2PrcPrfs: TFloatField
      FieldName = 'PrcPrfs'
    end
    object cdsOks2PrcWSb: TFloatField
      FieldName = 'PrcWSb'
    end
    object cdsOks2SmMinZp: TFloatField
      FieldName = 'SmMinZp'
      DisplayFormat = '0.00'
    end
    object cdsOks2SmProgMin: TFloatField
      FieldName = 'SmProgMin'
      DisplayFormat = '0.00'
    end
  end
  object dsrcOks2: TDataSource
    DataSet = cdsOks2
    Left = 208
    Top = 504
  end
  object qryOks2: TQuery
    Left = 160
    Top = 488
  end
  object cdsZ_NU: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
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
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
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
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PdN'
        DataType = ftSmallint
      end
      item
        Name = 'Ozn_Pilg'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Prr'
        DataType = ftSmallint
      end
      item
        Name = 'PrPV'
        DataType = ftSmallint
      end
      item
        Name = 'Kto'
        DataType = ftSmallint
      end
      item
        Name = 'PrKr'
        DataType = ftSmallint
      end
      item
        Name = 'MyNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'SpecPS'
        DataType = ftInteger
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'OldKdObj'
        DataType = ftSmallint
      end
      item
        Name = 'OldKdVidN'
        DataType = ftSmallint
      end
      item
        Name = 'DtVdPv'
        DataType = ftDate
      end
      item
        Name = 'NrVdPv'
        DataType = ftInteger
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'Grp'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsZ_NUCalcFields
    Left = 384
    Top = 232
    object cdsZ_NUNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsZ_NUDtProc: TDateField
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yy'
    end
    object cdsZ_NUZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yy'
    end
    object cdsZ_NUTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsZ_NUVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsZ_NUShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object cdsZ_NUChas: TFloatField
      FieldName = 'Chas'
    end
    object cdsZ_NUSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object cdsZ_NUDt_Beg: TDateField
      FieldName = 'Dt_Beg'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsZ_NUDt_End: TDateField
      FieldName = 'Dt_End'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsZ_NUKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsZ_NUKdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsZ_NUKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsZ_NUKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsZ_NUKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsZ_NUPdN: TSmallintField
      FieldName = 'PdN'
    end
    object cdsZ_NUOzn_Pilg: TStringField
      FieldName = 'Ozn_Pilg'
      Size = 10
    end
    object cdsZ_NUNotes: TStringField
      FieldName = 'Notes'
      Size = 25
    end
    object cdsZ_NUPrr: TSmallintField
      FieldName = 'Prr'
    end
    object cdsZ_NUPrPV: TSmallintField
      FieldName = 'PrPV'
    end
    object cdsZ_NUKto: TSmallintField
      FieldName = 'Kto'
    end
    object cdsZ_NUPrKr: TSmallintField
      FieldName = 'PrKr'
    end
    object cdsZ_NUMyNotes: TStringField
      FieldName = 'MyNotes'
      Size = 25
    end
    object cdsZ_NUSpecPS: TIntegerField
      FieldName = 'SpecPS'
    end
    object cdsZ_NUSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
    object cdsZ_NUOldKdObj: TSmallintField
      FieldName = 'OldKdObj'
    end
    object cdsZ_NUOldKdVidN: TSmallintField
      FieldName = 'OldKdVidN'
    end
    object cdsZ_NUDtVdPv: TDateField
      FieldName = 'DtVdPv'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsZ_NUNrVdPv: TIntegerField
      FieldName = 'NrVdPv'
    end
    object cdsZ_NUKdBnk: TSmallintField
      FieldName = 'KdBnk'
    end
    object cdsZ_NUGrp: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Grp'
      Calculated = True
    end
  end
  object dsrcZ_NU: TDataSource
    DataSet = cdsZ_NU
    Left = 400
    Top = 241
  end
  object cdsOks3: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'RMes'
        DataType = ftDate
      end
      item
        Name = 'ZaMG'
        DataType = ftDate
      end
      item
        Name = 'RepMes'
        DataType = ftDate
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Prr'
        DataType = ftSmallint
      end
      item
        Name = 'PrcECmn'
        DataType = ftFloat
      end
      item
        Name = 'PrcEPps'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBln'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkr'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDgv'
        DataType = ftFloat
      end
      item
        Name = 'PrcECmnPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBlnPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEBlnInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkrPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDkrInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'PrcEDgvPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwCmn'
        DataType = ftFloat
      end
      item
        Name = 'sNwPps'
        DataType = ftFloat
      end
      item
        Name = 'sNwBln'
        DataType = ftFloat
      end
      item
        Name = 'sNwDkr'
        DataType = ftFloat
      end
      item
        Name = 'sNwDgv'
        DataType = ftFloat
      end
      item
        Name = 'sNwCmnPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwBlnPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwBlnInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwDkrPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwDkrInvPrp'
        DataType = ftFloat
      end
      item
        Name = 'sNwDgvPrp'
        DataType = ftFloat
      end
      item
        Name = 'svPrgCmn'
        DataType = ftFloat
      end
      item
        Name = 'svPrgPps'
        DataType = ftFloat
      end
      item
        Name = 'svPrgBln'
        DataType = ftFloat
      end
      item
        Name = 'svPrgDgv'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsOks3Index'
        Fields = 'RMes;RepMes;KdSps;KdObj;KdKatP;KdSpZ'
      end>
    IndexName = 'cdsOks3Index'
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 488
    object cdsOks3RMes: TDateField
      FieldName = 'RMes'
      DisplayFormat = 'mm/yy'
    end
    object cdsOks3ZaMG: TDateField
      FieldName = 'ZaMG'
      DisplayFormat = 'mm/yy'
    end
    object cdsOks3RepMes: TDateField
      FieldName = 'RepMes'
      DisplayFormat = 'mm/yy'
    end
    object cdsOks3KdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsOks3KdTemu: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
    end
    object cdsOks3KdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsOks3KdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsOks3KdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsOks3SchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsOks3Prr: TSmallintField
      FieldName = 'Prr'
    end
    object cdsOks3PrcECmn: TFloatField
      FieldName = 'PrcECmn'
    end
    object cdsOks3PrcEPps: TFloatField
      FieldName = 'PrcEPps'
    end
    object cdsOks3PrcEBln: TFloatField
      FieldName = 'PrcEBln'
    end
    object cdsOks3PrcEDkr: TFloatField
      FieldName = 'PrcEDkr'
    end
    object cdsOks3PrcEDgv: TFloatField
      FieldName = 'PrcEDgv'
    end
    object cdsOks3PrcECmnPrp: TFloatField
      FieldName = 'PrcECmnPrp'
    end
    object cdsOks3PrcEInvPrp: TFloatField
      FieldName = 'PrcEInvPrp'
    end
    object cdsOks3PrcEBlnPrp: TFloatField
      FieldName = 'PrcEBlnPrp'
    end
    object cdsOks3PrcEBlnInvPrp: TFloatField
      FieldName = 'PrcEBlnInvPrp'
    end
    object cdsOks3PrcEDkrPrp: TFloatField
      FieldName = 'PrcEDkrPrp'
    end
    object cdsOks3PrcEDkrInvPrp: TFloatField
      FieldName = 'PrcEDkrInvPrp'
    end
    object cdsOks3PrcEDgvPrp: TFloatField
      FieldName = 'PrcEDgvPrp'
    end
    object cdsOks3sNwCmn: TFloatField
      FieldName = 'sNwCmn'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwPps: TFloatField
      FieldName = 'sNwPps'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwBln: TFloatField
      FieldName = 'sNwBln'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwDkr: TFloatField
      FieldName = 'sNwDkr'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwDgv: TFloatField
      FieldName = 'sNwDgv'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwCmnPrp: TFloatField
      FieldName = 'sNwCmnPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwInvPrp: TFloatField
      FieldName = 'sNwInvPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwBlnPrp: TFloatField
      FieldName = 'sNwBlnPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwBlnInvPrp: TFloatField
      FieldName = 'sNwBlnInvPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwDkrPrp: TFloatField
      FieldName = 'sNwDkrPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwDkrInvPrp: TFloatField
      FieldName = 'sNwDkrInvPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3sNwDgvPrp: TFloatField
      FieldName = 'sNwDgvPrp'
      DisplayFormat = '0.00'
    end
    object cdsOks3svPrgCmn: TFloatField
      FieldName = 'svPrgCmn'
      DisplayFormat = '0.00'
    end
    object cdsOks3svPrgPps: TFloatField
      FieldName = 'svPrgPps'
      DisplayFormat = '0.00'
    end
    object cdsOks3svPrgBln: TFloatField
      FieldName = 'svPrgBln'
      DisplayFormat = '0.00'
    end
    object cdsOks3svPrgDgv: TFloatField
      FieldName = 'svPrgDgv'
      DisplayFormat = '0.00'
    end
  end
  object dsrcOks3: TDataSource
    DataSet = cdsOks3
    Left = 432
    Top = 488
  end
  object qryIsPolnMesByPrmUv: TQuery
    Left = 564
    Top = 92
  end
  object cdsDoMZ: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'SmBySovm'
        DataType = ftFloat
      end
      item
        Name = 'SmDelta'
        DataType = ftFloat
      end
      item
        Name = 'VIDN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'KdSps'
        DataType = ftSmallint
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'KdTemu'
        DataType = ftSmallint
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSPZ'
        DataType = ftSmallint
      end
      item
        Name = 'MyNotes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Grp'
        DataType = ftSmallint
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 340
    object cdsDoMZNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDoMZSmBySovm: TFloatField
      FieldName = 'SmBySovm'
    end
    object cdsDoMZSmDelta: TFloatField
      FieldName = 'SmDelta'
    end
    object cdsDoMZVIDN: TStringField
      FieldName = 'VIDN'
      Size = 4
    end
    object cdsDoMZSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object cdsDoMZKdSps: TSmallintField
      FieldName = 'KdSps'
    end
    object cdsDoMZKdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cdsDoMZKdTemu: TSmallintField
      FieldName = 'KdTemu'
    end
    object cdsDoMZKdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cdsDoMZKdSPZ: TSmallintField
      FieldName = 'KdSPZ'
    end
    object cdsDoMZMyNotes: TStringField
      FieldName = 'MyNotes'
      Size = 35
    end
    object cdsDoMZGrp: TSmallintField
      FieldName = 'Grp'
    end
    object cdsDoMZSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
  end
  object qrySovm: TQuery
    Left = 228
    Top = 340
  end
  object cdsSovm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSovm'
    Left = 292
    Top = 364
  end
  object dspSovm: TDataSetProvider
    DataSet = qrySovm
    Left = 268
    Top = 316
  end
  object qryNdbInf: TQuery
    Left = 428
    Top = 340
  end
  object cdsPerePrd: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'SpecNR'
        DataType = ftInteger
      end
      item
        Name = 'PrcWrkTime'
        DataType = ftFloat
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'isInKmd'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsOtp'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsOtpSovm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsBln'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 308
    object cdsPerePrdNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsPerePrdDtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cdsPerePrdSpecNR: TIntegerField
      FieldName = 'SpecNR'
    end
    object cdsPerePrdPrcWrkTime: TFloatField
      FieldName = 'PrcWrkTime'
    end
    object cdsPerePrdOklTrf: TFloatField
      FieldName = 'OklTrf'
    end
    object cdsPerePrdisInKmd: TStringField
      FieldName = 'isInKmd'
      Size = 1
    end
    object cdsPerePrdIsOtp: TStringField
      FieldName = 'IsOtp'
      Size = 1
    end
    object cdsPerePrdIsOtpSovm: TStringField
      FieldName = 'IsOtpSovm'
      Size = 1
    end
    object cdsPerePrdIsBln: TStringField
      FieldName = 'IsBln'
      Size = 1
    end
  end
  object cdsMD: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end
      item
        Name = 'dtmes'
        DataType = ftDate
      end
      item
        Name = 'PrcWrkTime'
        DataType = ftFloat
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'isInKmd'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtp'
        DataType = ftSmallint
      end
      item
        Name = 'IsOtpSovm'
        DataType = ftSmallint
      end
      item
        Name = 'IsBln'
        DataType = ftBoolean
      end
      item
        Name = 'COUNT OF NR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspMd'
    StoreDefs = True
    Left = 60
    Top = 308
  end
  object qryMD: TQuery
    DatabaseName = 'C_T_E_M_P'
    SQL.Strings = (
      'Select Spec_NR, dtmes, PrcWrkTime, OklTrf, '
      '  isInKmd, IsOtp, IsOtpSovm, IsBln, Count(NR) from bor1'
      
        'group by Spec_NR, dtmes, PrcWrkTime, OklTrf, isInKmd, IsOtp, IsO' +
        'tpSovm, IsBln')
    Left = 36
    Top = 340
  end
  object dspMd: TDataSetProvider
    DataSet = qryMD
    Left = 52
    Top = 324
  end
  object qryPrN: TQuery
    Left = 132
    Top = 340
  end
end
