object FormZpMain: TFormZpMain
  Left = 156
  Top = 138
  Width = 937
  Height = 609
  HelpContext = 30
  ActiveControl = TvObj
  Caption = 'FormZpMain'
  Color = clBtnFace
  Constraints.MinHeight = 492
  Constraints.MinWidth = 652
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Menu = mMnuZp
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 15
  object splitLeftRight: TSplitter
    Left = 166
    Top = 31
    Height = 513
    Beveled = True
    Color = clBtnFace
    ParentColor = False
  end
  object PanelTools: TPanel
    Left = 0
    Top = 0
    Width = 929
    Height = 31
    Hint = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072#1083#1100#1085#1072#1103' '#1087#1072#1085#1077#1083#1100' ('#1087#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074')'
    Align = alTop
    BevelOuter = bvLowered
    Color = clMoneyGreen
    ParentShowHint = False
    PopupMenu = PopupEmplInfo
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      929
      31)
    object sBtnCalendar: TSpeedButton
      Left = 260
      Top = 2
      Width = 25
      Height = 25
      Hint = #1042#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1082#1072#1083#1077#1085#1076#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCalendarClick
    end
    object sBtnUchKart: TSpeedButton
      Left = 232
      Top = 2
      Width = 25
      Height = 25
      Hint = #1050#1072#1088#1090#1086#1090#1077#1082#1072'|'#1042#1082#1102#1095#1080#1090#1100' / '#1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1089#1080#1085#1093#1088#1086#1085#1085#1099#1081' '#1087#1086#1082#1072#1079' "'#1082#1072#1088#1090#1086#1090#1077#1082#1080'"'
      AllowAllUp = True
      GroupIndex = 8
      Down = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = sBtnUchKartClick
    end
    object LblEmplInfo: TLabel
      Left = 312
      Top = 8
      Width = 66
      Height = 15
      Hint = #1058#1072#1073#1053#1088', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'., '#1054#1082#1083#1072#1076
      Caption = 'LblEmplInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
    end
    object sBtnMyDbg: TSpeedButton
      Left = 590
      Top = 2
      Width = 33
      Height = 25
      Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1073#1086#1090#1099' '#1092#1091#1085#1082#1094#1080#1081' SumPropis '#1080' UkrSumPropis'
      Anchors = [akTop, akRight]
      Caption = 'Dbg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = sBtnMyDbgClick
    end
    object SpeedButton1: TSpeedButton
      Left = 496
      Top = 2
      Width = 73
      Height = 25
      Hint = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1060#1080#1082#1089#1048#1085#1076#1082#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = mmMyCreFixIndx2Click
    end
    object PanelMY: TPanel
      Left = 3
      Top = 3
      Width = 223
      Height = 23
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 0
      object sBtnYMinus: TSpeedButton
        Left = 2
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1075#1086#1076
        Caption = #1043'-'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnYMinusClick
      end
      object sBtnMMinus: TSpeedButton
        Left = 24
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1084#1077#1089#1103#1094
        Caption = #1052'-'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnMMinusClick
      end
      object sBtnMPlus: TSpeedButton
        Left = 176
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1077#1089#1103#1094
        Caption = #1052'+'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnMPlusClick
      end
      object sBtnYPlus: TSpeedButton
        Left = 198
        Top = 2
        Width = 22
        Height = 19
        Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1075#1086#1076
        Caption = #1043'+'
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnYPlusClick
      end
      object StaticMnthYear: TStaticText
        Left = 48
        Top = 2
        Width = 126
        Height = 17
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081' => '#1074' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Caption = #1057#1077#1085#1090#1103#1073#1088#1100' 2008'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = popMY
        ShowHint = True
        TabOrder = 0
        OnDblClick = StaticMnthYearDblClick
      end
    end
    object ChBoxDbg: TCheckBox
      Left = 450
      Top = 6
      Width = 37
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Dbg'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      Visible = False
      OnClick = ChBoxDbgClick
    end
    object rBtnIsOsn: TRadioButton
      Left = 288
      Top = 7
      Width = 16
      Height = 17
      Hint = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1086#1087#1077#1088#1072#1090#1086#1088#1072' ('#1082#1085#1086#1087#1082#1072' '#1074#1082#1083#1102#1095#1077#1085#1072')'
      Caption = #1054#1089#1085
      Checked = True
      Enabled = False
      TabOrder = 2
      TabStop = True
      OnClick = rBtnIsOsnClick
    end
    object PanelTools2: TPanel
      Left = 655
      Top = 1
      Width = 273
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      Color = clMoneyGreen
      TabOrder = 3
      DesignSize = (
        273
        29)
      object LabelBegDMZ: TLabel
        Left = -26
        Top = 8
        Width = 78
        Height = 15
        Hint = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1085#1072#1099#1083#1074#1072#1077#1090#1089#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090#1086#1084' '#1074' '#1090#1077#1082#1089#1090#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'LabelBegDMZ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnDblClick = LabelBegDMZDblClick
      end
      object LblIndxExclState: TLabel
        Left = 88
        Top = 8
        Width = 96
        Height = 15
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #1041#1077#1079' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnExit: TSpeedButton
        Left = 194
        Top = 3
        Width = 74
        Height = 25
        Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Anchors = [akTop, akRight]
        Caption = #1042#1099#1093#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333000088888888888888833338000088888888888888F3F38800008888
          888888888F3F38880000444444088888FFF44443000033333450888F3FF43333
          00003333345508FFFFF4333300003333345550FFFFF4333300003330045550FF
          FFF4333300003330A05550FFFFF4333300000000EA0550FFFEF4333300000EAE
          AEA050FFFFF4333300000AEAEAEA00FEFEF4333300000EAEAEA050FFFFF43333
          00000000EA0550FEFEF4333300003330A05550EFEFE4333300003330045550FE
          FEF4333300003333345550EFEFE4333300003333344444444444333300003333
          33333333333333330000}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 2
        OnClick = sBtnCloseClick
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 544
    Width = 929
    Height = 19
    Hint = #1057#1090#1072#1090#1091#1089#1085#1072#1103' '#1087#1072#1085#1077#1083#1100
    Panels = <
      item
        Width = 110
      end
      item
        Width = 567
      end
      item
        Width = 100
      end>
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object PanelRight: TPanel
    Left = 169
    Top = 31
    Width = 760
    Height = 513
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinWidth = 450
    TabOrder = 2
    OnResize = PanelRightResize
    DesignSize = (
      760
      513)
    object splitNu: TSplitter
      Left = 0
      Top = 198
      Width = 760
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clBtnFace
      MinSize = 55
      ParentColor = False
    end
    object LabelCurMes: TLabel
      Left = 0
      Top = 0
      Width = 760
      Height = 15
      Hint = 
        #1048#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1082#1072' '#1085#1077#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093' '#1076#1085#1077#1081'|'#1050'-'#1074#1086' '#1088#1072#1073#1086#1095#1080#1093' '#1076#1085#1077#1081' '#1080' '#1073#1102#1076#1078#1077#1090' '#1088 +
        #1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' ('#1092#1086#1088#1084#1080#1088#1091#1102#1090#1089#1103' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1085#1077#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093 +
        ' '#1076#1085#1077#1081')'
      Align = alTop
      Alignment = taCenter
      Caption = 'LabelCurMes'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object PageControl: TPageControl
      Left = 0
      Top = 15
      Width = 760
      Height = 183
      ActivePage = tsUderg
      Align = alTop
      ParentShowHint = False
      ShowHint = False
      Style = tsButtons
      TabOrder = 0
      OnResize = PageControlResize
      object tsPrUv: TTabSheet
        Caption = #1055#1088#1080#1077#1084'/'#1059#1074#1086#1083#1100#1085#1077#1085#1080#1077
        ImageIndex = 5
        object dbgrPrmUv: TZpDbGrid
          Left = 0
          Top = 0
          Width = 874
          Height = 150
          Hint = #1055#1088#1080#1077#1084' / '#1059#1074#1086#1083#1100#1085#1077#1085#1080#1077' '#1085#1072' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
          Align = alClient
          Color = clInfoBk
          DataSource = DmMain.dsrcPrmUv
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popMnu
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = dbgrPrmUvDblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_PRIEM'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_UVOLN'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_PRIKAZA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PRIKAZA'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_PRUVOLN'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PRUVOLN'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDPIDZV'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PidZviln'
              Width = 89
              Visible = True
            end>
        end
      end
      object tsPere: TTabSheet
        Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        object LabelPereSort: TLabel
          Left = 0
          Top = 135
          Width = 376
          Height = 15
          Hint = #1057#1087#1086#1089#1086#1073' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080' '#1090#1072#1073#1083#1080#1094#1099' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
          Align = alBottom
          Alignment = taCenter
          Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1099' '#1087#1086' '#1076#1072#1090#1077' '#1085#1072#1095#1072#1083#1072' '#1074' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object dbgrPere: TZpDbGrid
          Left = 0
          Top = 0
          Width = 744
          Height = 135
          Hint = 
            #1058#1072#1073#1083#1080#1094#1072' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081'| '#1058#1072#1073#1083#1080#1094#1072' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' ('#1089#1080#1085#1080#1084' '#1094#1074#1077#1090#1086#1084' '#1074#1099#1076#1077#1083#1103#1102#1090#1089 +
            #1103' '#1079#1072#1087#1080#1089#1080' '#1089' '#1086#1082#1083#1072#1076#1086#1084' '#1080#1079' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1095#1072#1089#1090#1077#1081')'
          Align = alClient
          Color = clInfoBk
          DataSource = DmMain.dsrcPere
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popMnu
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrPereDrawColumnCell
          OnDblClick = dbgrPereDblClick
          OnEditButtonClick = dbgrPereEditButtonClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          OnKeyDown = dbgrPereKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'BM'
              Width = 21
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTBM'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPS'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IS_PERE'
              Title.Caption = #1058#1088#1091#1076'.'#1082#1085'.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRCWRKTIME'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDTEMU'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NmTemu'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShObj'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OLDKDOK'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OldDolgnOK'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NEWKDOK'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NewDolgnOK'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NPD'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOLGNOST'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SmCmbOkl'
              Width = 53
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShSO'
              Width = 53
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShPdNlg'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROCLG'
              Width = 41
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShKatP'
              Width = 44
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'Spz'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZR'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RANG'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PR_PENS'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShSovm'
              Title.Caption = #1057#1086#1074#1084#1077#1089#1090'.'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INV'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRFS'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRDEKR'
              Width = 17
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_PRIKAZA'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PRIKAZA'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPEC_NR'
              Width = 53
              Visible = True
            end>
        end
      end
      object tsNadb: TTabSheet
        Caption = #1053#1072#1076#1073#1072#1074#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        object dbgrNadb: TZpDbGrid
          Left = 0
          Top = 0
          Width = 752
          Height = 150
          Hint = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1076#1073#1072#1074#1086#1082
          Align = alClient
          Color = clInfoBk
          DataSource = DmMain.dsrcNadb
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popMnu
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrNadbDrawColumnCell
          OnDblClick = dbgrNadbDblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'KDSPS'
              ReadOnly = True
              Width = 20
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
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SHVIDN'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IS_PERE'
              Title.Caption = #1058#1088'.'#1082#1085'.'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KD_DLZHN'
              Title.Caption = #1050#1086#1076'.'#1054#1050
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KD_PROF'
              Title.Caption = #1050#1086#1076'.'#1050#1055
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DLZHN'
              Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KD_SOVM'
              Title.Caption = #1050#1076'.'#1089#1086#1074#1084'.'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHSOVM'
              Title.Caption = #1057#1086#1074#1084#1077#1089#1090'.'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRP'
              Width = 27
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMPROC'
              ReadOnly = True
              Width = 59
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
              FieldName = 'DT_BEG'
              ReadOnly = True
              Title.Caption = 'DT'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPSRSCH'
              ReadOnly = True
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPRBEG'
              ReadOnly = True
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPRBEG'
              ReadOnly = True
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPREND'
              ReadOnly = True
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPREND'
              ReadOnly = True
              Width = 59
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SCHBU'
              ReadOnly = True
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDTEMU'
              ReadOnly = True
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              ReadOnly = True
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHOBJ'
              ReadOnly = True
              Title.Caption = #1055#1076#1088
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDKATP'
              ReadOnly = True
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRCSOVM'
              ReadOnly = True
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SOVM'
              ReadOnly = True
              Title.Caption = #1042#1080#1076'.'#1057#1086#1074#1084
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPEC_NR'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              ReadOnly = True
              Title.Caption = #1055#1088#1080#1084#1077#1095'.'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRC_WT'
              ReadOnly = True
              Width = 51
              Visible = True
            end>
        end
      end
      object tsUderg: TTabSheet
        Caption = #1059#1076#1077#1088#1078#1072#1085#1080#1103
        ImageIndex = 2
        object dbgrUdrg: TZpDbGrid
          Left = 0
          Top = 0
          Width = 752
          Height = 150
          Hint = #1058#1072#1073#1083#1080#1094#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
          Align = alClient
          Color = clInfoBk
          DataSource = DmMain.dsrcUdrg
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popMnu
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrUdrgDrawColumnCell
          OnDblClick = dbgrUdrgDblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'KDSPS'
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSLG'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'ShVidN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMDOLG'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMVZN'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_P'
              Width = 18
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 52
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SpZ'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMDOK'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOMU'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShPst'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPEC_NR'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPOST'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPOST'
              Width = 92
              Visible = True
            end>
        end
      end
      object tsOtkl: TTabSheet
        Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103
        ImageIndex = 6
        object dbgrOtkl: TZpDbGrid
          Left = 0
          Top = 0
          Width = 752
          Height = 150
          Hint = #1058#1072#1073#1083#1080#1094#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Align = alClient
          DataSource = DmMain.dsrcOtkl
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popOtkl
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrOtklDrawColumnCell
          OnDblClick = popOtklEdtClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'KDSPS'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPROC'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTSTORN'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAMESGOD'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SHVIDN'
              Width = 45
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
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAS'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDN'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDTEMU'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMTEMU'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHOBJ'
              Width = 16
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SHKATP'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPZ'
              Width = 33
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'SCHBU'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MYNOTES'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDBNK'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVDPV'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRVDPV'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPEC_NR'
              Width = 35
              Visible = True
            end>
        end
      end
    end
    object dbgrNU: TZpDbGrid
      Left = 0
      Top = 201
      Width = 411
      Height = 264
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081'@'#1087#1086#1076#1088#1086#1073#1085#1086' ('#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1083#1080#1089#1090#1086#1082')'
      Align = alLeft
      DataSource = DmMain.DsrcPmnts
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = popNu
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrNUDrawColumnCell
      OnDblClick = dbgrNUDblClick
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      OnKeyDown = dbgrNUKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 18
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
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShVidN'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRP'
          Width = 26
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
          FieldName = 'NmTemu'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAS'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SmN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = 0
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SmU'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = 0
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PDN'
          Width = 24
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCHBU'
          Title.Caption = #1057#1091#1073#1057#1095#1048#1060
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PSCH'
          Title.Caption = #1057#1095#1077#1090#1048#1060
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShObj'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDKATP'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShKatP'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MYNOTES'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 2
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
          FieldName = 'PRR'
          Width = 2
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPROC'
          Width = 2
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDBNK'
          Width = 2
          Visible = True
        end>
    end
    object dbgrNu2: TZpDbGrid
      Left = 411
      Top = 201
      Width = 349
      Height = 264
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080'@'#1091#1076#1077#1088#1078#1072#1085#1080#1081' ('#1089#1074#1077#1088#1085#1091#1090#1086')'
      Align = alClient
      DataSource = dsrcNu2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popNu2
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrNu2DrawColumnCell
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZAMESGOD'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VIDN'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHVIDN'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_BEG'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_END'
          Width = 67
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
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PDN'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SmN'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SmU'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SCHBU'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PSCH'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNT'
          Width = 24
          Visible = True
        end>
    end
    object PanelMinutku: TPanel
      Left = 192
      Top = 237
      Width = 162
      Height = 74
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderWidth = 1
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Label4: TLabel
        Left = 25
        Top = 21
        Width = 116
        Height = 31
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1080#1085#1091#1090#1082#1091' !'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LabelMinutkuMG: TLabel
        Left = 19
        Top = 42
        Width = 122
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = #1103#1085#1074#1072#1088#1100' 2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LabelMinutkuFIO: TLabel
        Left = 19
        Top = 17
        Width = 122
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1048#1074#1072#1085#1086#1074' '#1048'.'#1048'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    object Panel1: TPanel
      Left = 184
      Top = 312
      Width = 137
      Height = 28
      BevelOuter = bvNone
      Caption = #1046#1076#1080#1090#1077'... '#1048#1076#1077#1090' '#1088#1072#1089#1095#1077#1090
      TabOrder = 4
      Visible = False
    end
    object Panel2: TPanel
      Left = 112
      Top = 352
      Width = 137
      Height = 28
      BevelOuter = bvNone
      Caption = #1046#1076#1080#1090#1077'... '#1048#1076#1077#1090' '#1088#1072#1089#1095#1077#1090
      TabOrder = 5
      Visible = False
    end
    object PanelTotals: TPanel
      Left = 0
      Top = 490
      Width = 760
      Height = 23
      Hint = 
        #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1084#1086#1078#1085#1086' '#1074#1082#1102#1095#1080#1090#1100' / '#1086#1090#1082#1083#1102#1095#1080#1090#1100' '#1089#1080#1085#1093#1088#1086#1085#1085#1099#1081' '#1087#1086#1082#1072#1079 +
        ' "'#1082#1072#1088#1090#1086#1090#1077#1082#1080'"'
      Align = alBottom
      BevelOuter = bvLowered
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnDblClick = PanelTotalsDblClick
      DesignSize = (
        760
        23)
      object BtnNuDetail: TSpeedButton
        Left = 27
        Top = 3
        Width = 23
        Height = 18
        Hint = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1086#1076#1088#1086#1073#1085#1086
        GroupIndex = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307FBFBF7033333337F333F337F3333377FBFBFBF773
          333337333333373F333307BFBFBFB70333337F3333F3337F333307FBFBFBF703
          33337F3333F3337F333307BFBFBFB703333373F333F33373333377FBFBFBF773
          333337F3333337F33333307FBFBF70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = ChngNuModeClick
      end
      object BtnNuCondens: TSpeedButton
        Left = 51
        Top = 3
        Width = 23
        Height = 18
        Hint = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1089#1074#1086#1076#1085#1086
        GroupIndex = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307AFAFA7033333337F333F337F3333377AFAFAFA773
          333337333333373F333307FAFAFAF70333337F3333F3337F333307AFAFAFA703
          33337F3333F3337F333307FAFAFAF703333373F333F333733333778FAFAFA773
          333337F3333337F333333078FAFA70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = ChngNuModeClick
      end
      object sBtnSortByVidN: TSpeedButton
        Left = 712
        Top = 3
        Width = 23
        Height = 17
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'"'
        Anchors = [akTop, akRight]
        GroupIndex = 5
        Caption = #1042#1053
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = ChangePmntsSort
      end
      object sBtnSortByZaMG: TSpeedButton
        Left = 735
        Top = 3
        Width = 23
        Height = 17
        Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
        Anchors = [akTop, akRight]
        GroupIndex = 5
        Down = True
        Caption = #1052#1043
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = ChangePmntsSort
      end
      object BtnNuShort: TSpeedButton
        Left = 0
        Top = 3
        Width = 23
        Height = 18
        GroupIndex = 3
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = ChngNuModeClick
      end
      object sBtnShowSpecVids: TSpeedButton
        Left = 78
        Top = 3
        Width = 23
        Height = 18
        Hint = #1042#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' ('#1074#1082#1083' / '#1086#1090#1082#1083')'
        AllowAllUp = True
        GroupIndex = 4
        Down = True
        Caption = '.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
          77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
          07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = popNuShwSpecVidsClick
      end
      object sBtnF8: TSpeedButton
        Left = 120
        Top = 3
        Width = 23
        Height = 18
        Caption = 'F8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnClick = sBtnF8Click
      end
    end
    object PanelDbg: TPanel
      Left = 473
      Top = 18
      Width = 285
      Height = 18
      Hint = #1056#1072#1073#1086#1095#1072#1103' '#1041#1044
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Caption = 'DbgMsg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object LbxF8: TListBox
      Left = 96
      Top = 413
      Width = 65
      Height = 67
      Anchors = [akLeft, akBottom]
      Color = clBtnFace
      ItemHeight = 15
      TabOrder = 8
      Visible = False
    end
    object PanelSelectedTotals: TPanel
      Left = 0
      Top = 465
      Width = 760
      Height = 25
      Align = alBottom
      BevelInner = bvLowered
      Caption = 'PanelSelectedTotals'
      Color = 15921597
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      DesignSize = (
        760
        25)
      object sBtnPanelNuTotals: TSpeedButton
        Left = 749
        Top = -3
        Width = 12
        Height = 15
        Anchors = [akRight]
        Caption = 'X'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sBtnPanelNuTotalsClick
      end
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 31
    Width = 166
    Height = 513
    Align = alLeft
    Constraints.MaxWidth = 300
    Constraints.MinWidth = 165
    TabOrder = 3
    DesignSize = (
      166
      513)
    object splitObjSps: TSplitter
      Left = 1
      Top = 201
      Width = 164
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clBtnFace
      ParentColor = False
    end
    object PanelTvObj: TPanel
      Left = 1
      Top = 1
      Width = 164
      Height = 200
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelTvObj'
      TabOrder = 0
      DesignSize = (
        164
        200)
      object LblLockedEmployee: TLabel
        Left = 0
        Top = 185
        Width = 164
        Height = 15
        Hint = 
          #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081' - '#1088#1077#1078#1080#1084' '#1089#1084#1077#1085#1099' '#1084#1077#1089#1103#1094#1072'|'#1050#1088#1072#1089#1085#1099#1081' '#1094#1074#1077#1090' - '#1087#1088#1080' '#1089#1084 +
          #1077#1085#1077' '#1084#1077#1089#1103#1094#1072' '#1087#1099#1090#1072#1077#1090#1089#1103' '#1085#1072#1081#1090#1080' '#1058#1072#1073#1053#1088', '#1076#1072#1078#1077' '#1077#1089#1083#1080' '#1086#1085' '#1074' '#1076#1088#1091#1075#1086#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083 +
          #1077#1085#1080#1080
        Align = alBottom
        AutoSize = False
        Caption = 'LblLockedEmployee'
        ParentShowHint = False
        ShowHint = True
        OnDblClick = LblLockedEmployeeDblClick
      end
      object BtnLockEmpl: TSpeedButton
        Left = 149
        Top = 184
        Width = 15
        Height = 16
        Hint = 
          #1056#1077#1078#1080#1084' '#1089#1084#1077#1085#1099' '#1084#1077#1089#1103#1094#1072'|'#1053#1072#1078#1072#1090#1086' - '#1087#1088#1080' '#1089#1084#1077#1085#1077' '#1084#1077#1089#1103#1094#1072' '#1087#1099#1090#1072#1077#1090#1089#1103' '#1085#1072#1081#1090#1080' '#1058#1072#1073#1053 +
          #1088', '#1076#1072#1078#1077' '#1077#1089#1083#1080' '#1086#1085' '#1074' '#1076#1088#1091#1075#1086#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1080
        AllowAllUp = True
        Anchors = [akRight, akBottom]
        GroupIndex = 9
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnLockEmplClick
      end
      object LabelTvObj: TLabel
        Left = 0
        Top = 0
        Width = 164
        Height = 15
        Hint = 
          #1057#1076#1077#1083#1072#1081#1090#1077' '#1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081', '#1095#1090#1086#1073#1099' '#1073#1099#1089#1090#1088#1086' '#1087#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1086#1077 +
          ' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Align = alTop
        Alignment = taCenter
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnDblClick = LabelTvObjDblClick
      end
      object TvObj: TTreeView
        Left = 0
        Top = 15
        Width = 164
        Height = 170
        Hint = #1044#1077#1088#1077#1074#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        Align = alClient
        Color = clMoneyGreen
        Ctl3D = True
        Constraints.MinHeight = 150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        HideSelection = False
        HotTrack = True
        Indent = 17
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        PopupMenu = popTvObj
        ReadOnly = True
        RightClickSelect = True
        RowSelect = True
        ShowHint = True
        TabOrder = 0
        OnChange = TvObjChange
        OnEnter = TvObjEnter
        OnExit = TvObjExit
      end
    end
    object dbgrSps: TZpDbGrid
      Left = 1
      Top = 204
      Width = 164
      Height = 308
      Hint = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074'@'#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Align = alClient
      Color = clMoneyGreen
      DataSource = DsrcSps
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      PopupMenu = popSps
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrSpsDrawColumnCell
      OnDblClick = LblLockedEmployeeDblClick
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'TabN'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FamIO'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDSPS'
          Width = 26
          Visible = True
        end>
    end
    object lbxAllowSps: TListBox
      Left = 16
      Top = 104
      Width = 27
      Height = 27
      Anchors = [akLeft, akBottom]
      BorderStyle = bsNone
      Color = clAqua
      ItemHeight = 15
      TabOrder = 2
      Visible = False
    end
  end
  object popSps: TPopupMenu
    Alignment = paCenter
    OnPopup = popSpsPopup
    Left = 104
    Top = 280
    object popSpsHead: TMenuItem
      Caption = '== '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' =='
      Enabled = False
    end
    object popSpsRaschetCurrent: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ShortCut = 120
      OnClick = popMnuRaschetCurrentClick
    end
    object popSpsRaschetPotokom: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1090#1086#1082#1086#1084' ...'
      object popSpsRaschetPotokomCurObj: TMenuItem
        Caption = '- '#1090#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        OnClick = popSpsRaschetPotokomCurObjClick
      end
      object popSpsRaschetPotokomAllSps: TMenuItem
        Caption = '- '#1074#1077#1089#1100' '#1089#1087#1080#1089#1086#1082
        OnClick = popSpsRaschetPotokomAllSpsClick
      end
      object popSpsAllSpsFromCurrentObj: TMenuItem
        Caption = '- '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076'. '#1076#1086' '#1082#1086#1085#1094#1072' '#1089#1087#1080#1089#1082#1072
        Hint = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1076#1086' '#1082#1086#1085#1094#1072' '#1089#1087#1080#1089#1082#1072
        OnClick = popSpsAllSpslFromCurrentObjClick
      end
    end
    object popSpsBlockSchetCurrent: TMenuItem
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1088#1072#1089#1095#1077#1090#1072
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1079#1072#1087#1088#1077#1090' '#1085#1072' '#1088#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      OnClick = popSpsBlockSchetCurrentClick
    end
    object popSpsAddInUpiAndSps: TMenuItem
      AutoHotkeys = maManual
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1074' '#1089#1087#1088'-'#1082' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'" '#1080' '#1074' '#1089#1087#1080#1089#1086#1082
      Hint = 
        #1042#1074#1077#1089#1090#1080' '#1085#1086#1074#1086#1075#1086' '#1089#1086#1090#1088#1091#1090#1085#1080#1082#1072' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'" '#1080' '#1074' '#1089#1087#1080#1089#1086#1082' '#1090#1077 +
        #1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = popSpsAddInUpiAndSpsClick
    end
    object popSpsAddFromUpi: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082', '#1074#1099#1073#1088#1072#1074' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
      OnClick = popSpsAddFromUpiClick
    end
    object popSpsMov: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1086#1082' '#1076#1088#1091#1075#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnClick = popSpsMovClick
    end
    object popSpsDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      Hint = 
        #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1080#1079' '#1089#1087#1088'-'#1082#1072' "'#1057#1086#1090 +
        #1088#1091#1076#1085#1080#1082#1080'" '#1085#1077' '#1091#1076#1072#1083#1103#1077#1090#1089#1103')'
      OnClick = popSpsDelClick
    end
    object popSpsInclInKdSps: TMenuItem
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1057#1055#1048#1057#1054#1050
      OnClick = popSpsInclInKdSpsClick
    end
    object nSpsRepair: TMenuItem
      Caption = '"'#1056#1077#1084#1086#1085#1090'" '#1089#1087#1080#1089#1082#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = nSpsRepairClick
    end
    object popSpsSep1: TMenuItem
      Caption = '-'
    end
    object popSpsSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSpsSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        Checked = True
        OnClick = popSpsSortByFIOClick
      end
      object popSpsSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popSpsSortByTabNClick
      end
    end
    object popSpsVid: TMenuItem
      Caption = #1042#1080#1076' '#1089#1087#1080#1089#1082#1072' . . . '
      Visible = False
      object popSpsVidAll: TMenuItem
        Caption = '- '#1074#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080
        Checked = True
        OnClick = popSpsVidAllClick
      end
      object popSpsVidActive: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' "'#1073#1086#1077#1074#1099#1077'"'
        OnClick = popSpsVidActiveClick
      end
    end
    object popSpsPoisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077
      ShortCut = 114
      OnClick = popSpsPoisk2Click
    end
    object popSpsGoToObj: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' ...'
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      ShortCut = 16464
      OnClick = LabelTvObjDblClick
    end
    object popSpsSep2: TMenuItem
      Caption = '-'
    end
    object popSpsHistory: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103'...'
      Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103'; '#1086#1090#1087#1091#1089#1082#1085#1099#1077'; '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
      object popSpsHiNU: TMenuItem
        Caption = '- '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
        OnClick = popSpsHiNUClick
      end
      object popSpsHiOtp: TMenuItem
        Caption = '- '#1086#1090#1087#1091#1089#1082#1085#1099#1093
        OnClick = popSpsHiOtpClick
      end
      object popSpsHiBln: TMenuItem
        Caption = '- '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093
        OnClick = popSpsHiBlnClick
      end
    end
    object popSpsMyCheckNu: TMenuItem
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      Hint = 
        #1055#1088#1086#1074#1077#1088#1082#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080' '#1074#1079#1085#1086#1089#1086#1074' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099 +
        #1081' '#1084#1077#1089#1103#1094
      OnClick = mmMyCheckNUClick
    end
    object popSpsBLS: TMenuItem
      Caption = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' '#1074' '#1073#1072#1085#1082#1072#1093
      OnClick = popSpsBLSClick
    end
    object popSpsSep3: TMenuItem
      Caption = '-'
    end
    object popSpsFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popSpsFonClick
    end
  end
  object popNu: TPopupMenu
    Alignment = paCenter
    OnPopup = popNuPopup
    Left = 224
    Top = 272
    object popOtklNuHead: TMenuItem
      Caption = '== '#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1083#1080#1089#1090#1086#1082' =='
      Enabled = False
      ShortCut = 49227
    end
    object popNuRs2Dbg: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089' DBG ( z_Rs5 )'
      Visible = False
      OnClick = RaschDbgClick
    end
    object popNuRaschet: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ShortCut = 120
      OnClick = popOtklNewRaschetClick
    end
    object pSep0: TMenuItem
      Caption = '-'
    end
    object PopNuPrintEmplCalc: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      GroupIndex = 1
      ShortCut = 16502
      OnClick = PrintEmplCalc
    end
    object popNuPastMonths: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      GroupIndex = 1
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1076#1088#1091#1075#1080#1093' '#1084#1077#1089#1103#1094#1077#1074
      OnClick = popSpsHiNUClick
    end
    object popNuMyCheckNU: TMenuItem
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      GroupIndex = 2
      Hint = 
        #1055#1088#1086#1074#1077#1088#1082#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080' '#1074#1079#1085#1086#1089#1086#1074' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099 +
        #1081' '#1084#1077#1089#1103#1094
      Visible = False
      OnClick = mmMyCheckNUClick
    end
    object popNuForMO: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072
      GroupIndex = 2
      Hint = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      OnClick = popNuForMOClick
    end
    object popNuSep1: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNuShw: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' ...'
      GroupIndex = 2
      object NShwNuDetail: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1086#1073#1085#1086
        Checked = True
        OnClick = ChngNuModeClick
      end
      object NShwNuCondens: TMenuItem
        Caption = '- '#1089#1074#1077#1088#1085#1091#1090#1086
        OnClick = ChngNuModeClick
      end
    end
    object popNuVidSumm: TMenuItem
      Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1084#1084' ...'
      GroupIndex = 2
      Hint = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1084#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      object popNuVidSummOne: TMenuItem
        Caption = '- '#1074' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077
        Checked = True
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1084#1080#1085#1091#1089#1086#1084')'
        OnClick = popNuVidSummOneClick
      end
      object popNuVidSummTwo: TMenuItem
        Caption = '- '#1074' '#1076#1074#1091#1093' '#1082#1086#1083#1086#1085#1082#1072#1093
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1088#1072#1079#1085#1099#1093' '#1082#1086#1083#1086#1085#1082#1072#1093
        OnClick = popNuVidSummTwoClick
      end
    end
    object popNuSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      GroupIndex = 2
      object popNuSortByVid: TMenuItem
        AutoCheck = True
        Caption = #1055#1086' '#1087#1086#1083#1102' "'#1042#1080#1076'"'
        Checked = True
        GroupIndex = 7
        OnClick = ChangePmntsSort
      end
      object popNuSortByMes: TMenuItem
        AutoCheck = True
        Caption = #1055#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094'"'
        GroupIndex = 7
        OnClick = ChangePmntsSort
      end
    end
    object popNuSumBrush: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1074#1077#1090#1083#1099#1084' '#1092#1086#1085#1086#1084
      Checked = True
      GroupIndex = 2
      OnClick = popNuSumBrushClick
    end
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNuAddDelMetka: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091
      GroupIndex = 2
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1084#1077#1090#1082#1091' '#1085#1072' '#1079#1072#1087#1080#1089#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091' '#1089' '#1079#1072#1087#1080#1089#1080
      ShortCut = 119
      OnClick = sBtnF8Click
    end
    object popNuClearMetki: TMenuItem
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
      GroupIndex = 2
      ShortCut = 46
      OnClick = popNuClearMetkiClick
    end
    object popNuSumByMetki: TMenuItem
      Caption = #1048#1090#1086#1075' '#1087#1086' '#1089#1091#1084#1084#1077' '#1084#1077#1095#1077#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      GroupIndex = 2
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1090#1086#1075' '#1087#1086' '#1089#1091#1084#1084#1077' '#1084#1077#1095#1077#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      ShortCut = 118
      OnClick = popNuSumByMetkiClick
    end
    object popNuSep2: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNuVidInfo: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074
      GroupIndex = 2
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1085#1072' '#1090#1077#1082#1091#1097#1077#1084' '#1074#1080#1076#1077
      ShortCut = 16470
      OnClick = popNuVidInfoClick
    end
    object popNuShwSpecVids: TMenuItem
      Caption = #1042#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      GroupIndex = 2
      Hint = #1055#1086#1082#1072#1079#1099#1074#1090#1100' '#1074#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      RadioItem = True
      OnClick = popNuShwSpecVidsClick
    end
    object popNuPoisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' (not visible)'
      GroupIndex = 2
      ShortCut = 16454
      Visible = False
      OnClick = popSpsPoisk2Click
    end
    object notvisible3: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' (not visible)'
      GroupIndex = 2
      ShortCut = 16464
      Visible = False
      OnClick = LabelTvObjDblClick
    end
    object popNuSep3: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNuFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      GroupIndex = 2
      OnClick = popNuFonClick
    end
  end
  object qryTmp: TQuery
    Left = 176
    Top = 352
  end
  object popMnu: TPopupMenu
    Alignment = paCenter
    OnPopup = popMnuPopup
    Left = 240
    Top = 128
    object popMnuHead: TMenuItem
      Caption = '== '#1059#1076#1077#1088#1078#1072#1085#1080#1103' =='
      Enabled = False
    end
    object popMnuEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popMnuEdtClick
    end
    object popMnuAddPrmPere: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1080#1105#1084'-'#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      OnClick = popMnuAddPrmPereClick
    end
    object popMnuAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popMnuAddClick
    end
    object popMnuDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuDelClick
    end
    object popMnuSep1: TMenuItem
      Caption = '-'
    end
    object popMnuSetNdbView: TMenuItem
      Caption = #1057#1087#1086#1089#1086#1073' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1085#1072#1076#1073#1072#1074#1086#1082
      object PopShowNdbAll: TMenuItem
        Caption = '- '#1074#1089#1077
        Checked = True
        Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074#1089#1077' '#1085#1072#1076#1073#1072#1074#1082#1080' ('#1074' '#1090'.'#1095'. '#1087#1088#1086#1096#1077#1076#1096#1080#1077' '#1080', '#1077#1089#1083#1080' '#1077#1089#1090#1100', '#1073#1091#1076#1091#1097#1080#1077')'
        OnClick = PopNdbShowModeClick
      end
      object PopShowNdbActual: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
        Hint = #1042#1099#1074#1086#1076#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072#1076#1073#1072#1074#1082#1080', '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
        OnClick = PopNdbShowModeClick
      end
    end
    object popMnuSortPere: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
      object PopSortPereAscend: TMenuItem
        Caption = '- '#1087#1086' '#1076#1072#1090#1077' '#1074' '#1087#1088#1103#1084#1086#1084' '#1087#1086#1088#1103#1076#1082#1077' ('#1074#1089#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103')'
        Checked = True
        Hint = #1042#1099#1074#1086#1076#1103#1090#1089#1103' '#1042#1057#1045' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        OnClick = PopSortPereClick
      end
      object PopSortPereDescend: TMenuItem
        Caption = '- '#1087#1086' '#1076#1072#1090#1077' '#1074' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077' ('#1090#1086#1083#1100#1082#1086' 5 '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1079#1072#1087#1080#1089#1077#1081')'
        Hint = 
          #1042#1099#1074#1086#1076#1103#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' 5 ('#1087#1103#1090#1100') '#1087#1086#1089#1083#1077#1076#1085#1080#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1093#1088#1086#1085#1086#1083#1086#1075#1080 +
          #1080
        OnClick = PopSortPereClick
      end
    end
    object popMnuSep2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object NPereIndxExcl: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103' '#1080#1079' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1081
      OnClick = NUpdIndxExclClick
    end
    object PopMnuSep3: TMenuItem
      Caption = '-'
    end
    object popMnuVidInfo: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1074#1080#1076#1077
      Visible = False
      OnClick = popMnuVidInfoClick
    end
    object popPoisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' (not visible)'
      ShortCut = 114
      Visible = False
      OnClick = popSpsPoisk2Click
    end
    object notvisible1: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' (not visible)'
      ShortCut = 16464
      Visible = False
      OnClick = LabelTvObjDblClick
    end
    object popMnuFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popMnuFonClick
    end
    object popMnuRaschetCurrent: TMenuItem
      Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' (NoVisible)'
      ShortCut = 120
      Visible = False
      OnClick = popMnuRaschetCurrentClick
    end
  end
  object mMnuZp: TMainMenu
    Left = 16
    Top = 56
    object mMnuZpFile: TMenuItem
      Caption = ' '#1060#1072#1081#1083' '
      object mMnuRaznoe: TMenuItem
        Caption = #1056#1072#1079#1085#1086#1077
        object mmRemPere: TMenuItem
          Caption = '"'#1056#1077#1084#1086#1085#1090'" '#1084#1072#1089#1089#1086#1074#1099#1093' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' 2019'
          Visible = False
          OnClick = mmRemPereClick
        end
        object o_Dolgn: TMenuItem
          Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081' '#1080#1079' '#1054#1090#1076#1077#1083#1072' '#1082#1072#1076#1088#1086#1074
          OnClick = o_DolgnClick
        end
        object mmTreeViev: TMenuItem
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' TreeViev'
          OnClick = mmTreeVievClick
        end
        object mMnuHostCS: TMenuItem
          Caption = 'Host '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' "Client/Server"'
          OnClick = mMnuHostCSClick
        end
        object mmTemplates: TMenuItem
          Caption = #1058#1072#1073#1083#1080#1094#1072' "'#1064#1072#1073#1083#1086#1085#1099'"'
          OnClick = mmTemplatesClick
        end
        object mMnuPathToZpl: TMenuItem
          Caption = #1055#1091#1090#1100' '#1082' '#1041#1076' es_Zpl'
          OnClick = mMnuPathToZplClick
        end
        object mMnuPodklOtkl: TMenuItem
          Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1080#1079' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1092#1072#1081#1083#1072
          Visible = False
          OnClick = mMnuPodklOtklClick
        end
        object mMnuAdd8801: TMenuItem
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1055#1077#1088#1077#1089#1095#1105#1090#1085#1099#1081' '#1042#1080#1076
          OnClick = mMnuAdd8801Click
        end
        object mmMyNewUkr: TMenuItem
          Caption = 'MyNewUkr ('#1048#1089#1087#1088#1072#1074#1080#1090#1100' Z_UPI)'
          OnClick = mmMyNewUkrClick
        end
        object mmMyOznPilg042011: TMenuItem
          Caption = #1055#1088#1080#1079#1085#1072#1082' '#1083#1100#1075#1086#1090#1099' '#1074' '#1055#1076#1053#1083#1075' '#1079#1072' 04-2011'
          Enabled = False
          OnClick = mmMyOznPilg042011Click
        end
        object mmMyFillFixIndx: TMenuItem
          Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' Z_FixIndx'
          Enabled = False
          Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' Z_FixIndx '#1076#1072#1085#1085#1099#1084#1080' '#1080#1079' Z_Otkl '#1079#1072' 10-2012'
          OnClick = mmMyFillFixIndxClick
        end
        object mmMyCreFixIndx2: TMenuItem
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1060#1080#1093#1048#1085#1076#1082#1089'_2'
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091' '#1060#1080#1093#1048#1085#1076#1082#1089'_2'
          OnClick = mmMyCreFixIndx2Click
        end
        object mmNewShTem: TMenuItem
          Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1084#1077#1089#1103#1094' 07-2017 '#1085#1072' '#1085#1086#1074#1091#1102' '#1089#1093#1077#1084#1091' '#1090#1077#1084
          Enabled = False
          OnClick = mmNewShTemClick
        end
      end
      object mMnuZpRkvzt: TMenuItem
        Caption = #1055#1077#1088#1074#1080#1095#1085#1099#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        OnClick = mMnuZpRkvztClick
      end
      object mMnuOldZpK: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' OldZpK'
        object mMnuOldZpK_UPI: TMenuItem
          Caption = '- UPI_NICH'
          OnClick = mMnuOldZpK_UPIClick
        end
        object mMnuOldZpK_NU: TMenuItem
          Caption = '- NU_NICH'
          OnClick = mMnuOldZpK_NUClick
        end
        object mMnuOldZpK_Otkl: TMenuItem
          Caption = '- Otkl_'#1053#1048#1063
          OnClick = mMnuOldZpK_OtklClick
        end
        object mMnuOldZpK_Pere: TMenuItem
          Caption = 'Off (- '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103')'
          Visible = False
          OnClick = mMnuOldZpK_PereClick
        end
        object NmMnuOldZpK_Sps: TMenuItem
          Caption = 'Off (- '#1074' '#1089#1087#1080#1089#1082#1080')'
          Visible = False
          OnClick = NmMnuOldZpK_SpsClick
        end
        object mMnuOldZpK_Nadb: TMenuItem
          Caption = '- '#1085#1072#1076#1073#1072#1074#1082#1080'_106'
          OnClick = mMnuOldZpK_NadbClick
        end
      end
      object mmAddOtkl: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
        Visible = False
        OnClick = mmAddOtklClick
      end
      object mMnuZpSep1: TMenuItem
        Caption = '-'
      end
      object NAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = NAboutClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mMnuZpExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mMnuZpExitClick
      end
    end
    object mMnuZpSets: TMenuItem
      Caption = ' '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '
      object MnuSetCalcMnth: TMenuItem
        Action = ActSetCalcMnth
      end
      object mMnuZpChangeMY: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
        OnClick = popMyChangeMYClick
      end
      object mMnuZpHints: TMenuItem
        Caption = #1052#1080#1085#1080#1087#1086#1076#1089#1082#1072#1079#1082#1080
        Checked = True
        OnClick = mMnuZpHintsClick
      end
      object mMnuZpToolPanel: TMenuItem
        Caption = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072#1083#1100#1085#1072#1103' '#1087#1072#1085#1077#1083#1100
        Checked = True
        OnClick = mMnuZpToolPanelClick
      end
      object mMnuStatBar: TMenuItem
        Caption = #1057#1090#1072#1090#1091#1089#1085#1072#1103' '#1087#1072#1085#1077#1083#1100
        Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1089#1090#1072#1090#1091#1089#1085#1091#1102' '#1087#1072#1085#1077#1083#1100
        OnClick = mMnuStatBarClick
      end
      object mMnuFontOsnTables: TMenuItem
        Caption = #1064#1088#1080#1092#1090' '#1086#1089#1085#1086#1074#1085#1099#1093' '#1090#1072#1073#1083#1080#1094
        Visible = False
        object mMnuFontNormal: TMenuItem
          Caption = '- '#1085#1086#1088#1084#1072#1083#1100#1085#1099#1081
          Checked = True
          RadioItem = True
          OnClick = mMnuFontNormalClick
        end
        object mMnuFontBold: TMenuItem
          Caption = '- '#1087#1086#1082#1088#1091#1087#1085#1077#1077
          RadioItem = True
          OnClick = mMnuFontBoldClick
        end
      end
      object mMnuFontTables: TMenuItem
        Caption = #1064#1088#1080#1092#1090' '#1086#1089#1085#1086#1074#1085#1086#1075#1086' '#1101#1082#1088#1072#1085#1072
        OnClick = mMnuFontTablesClick
      end
      object mmSetsToBD: TMenuItem
        Caption = #1061#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1074' '#1041#1044
        Checked = True
        Hint = 
          #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1080#1084#1077#1090#1100' '#1077#1076#1080#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1085#1072' '#1083#1102#1073#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1084 +
          #1077#1089#1090#1077' ('#1047#1072#1084#1077#1076#1083#1103#1077#1090' '#1074#1093#1086#1076' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1080' '#1074#1099#1093#1086#1076' '#1080#1079' '#1085#1077#1077')'
        OnClick = mmSetsToBDClick
      end
      object mMnuZpView: TMenuItem
        Caption = #1042#1099#1074#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        object mMnuZpViewExcel: TMenuItem
          Caption = #1074' '#1092#1072#1081#1083#1099' MS Excel'
          Checked = True
          OnClick = mMnuZpViewExcelClick
        end
        object mMnuZpViewF6: TMenuItem
          Caption = #1074#1086' '#1074#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088#1097#1080#1082
          OnClick = mMnuZpViewF6Click
        end
      end
      object mMnuZpMyDbgDelTmpFiles: TMenuItem
        Caption = #1059#1076#1072#1083#1103#1090#1100' '#1074#1088#1077#1084#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
        Checked = True
        Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1074#1089#1077#1093' '#1092#1072#1081#1083#1086#1074' '#1080#1079' ...\IND\TEMP\ '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
        OnClick = mMnuZpMyDbgDelTmpFilesClick
      end
      object mMnuRestSpsTabN: TMenuItem
        Caption = '"'#1055#1086#1084#1085#1080#1090#1100'" '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1080
        Checked = True
        Hint = 
          #1047#1072#1087#1086#1084#1080#1085#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1087#1088#1080' '#1089#1084#1077#1085#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080' '#1089#1090#1072#1085#1086#1074#1080#1090#1100#1089#1103' '#1085#1072' '#1085 +
          #1077#1075#1086' '#1087#1088#1080' '#1087#1086#1074#1090#1086#1088#1085#1086#1084' '#1074#1093#1086#1076#1077' '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        OnClick = mMnuRestSpsTabNClick
      end
      object mMnuZpNapominalka: TMenuItem
        Caption = '"'#1053#1072#1087#1086#1084#1080#1085#1072#1083#1082#1072'" '#1086' '#1088#1072#1073#1086#1095#1077#1084' '#1087#1077#1088#1080#1086#1076#1077
        Checked = True
        Hint = 
          #1057#1090#1088#1086#1082#1080' '#1086' '#1089#1080#1089#1090#1077#1084#1085#1086#1081' '#1076#1072#1090#1077' '#1080' '#1088#1072#1073#1086#1095#1077#1084' '#1087#1077#1088#1080#1086#1076#1077' ('#1089#1087#1088#1072#1074#1072' '#1086#1090' '#1082#1085#1086#1087#1082#1080' "'#1043'+"' +
          ')'
        Visible = False
        OnClick = mMnuZpNapominalkaClick
      end
      object mMnuZpCloseMonth: TMenuItem
        Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1088#1072#1089#1095#1077#1090#1086#1074' '#1084#1077#1089#1103#1094#1072
        Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1079#1072#1087#1088#1077#1090' '#1085#1072' '#1088#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        OnClick = mMnuZpCloseMonthClick
      end
      object mMnuOthers: TMenuItem
        Caption = #1055#1088#1086#1095#1080#1077
        OnClick = mMnuOthersClick
      end
    end
    object mMnuZpDics: TMenuItem
      Caption = ' '#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080' '
      object mMnuZpTreeVids: TMenuItem
        Caption = #1042#1080#1076#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' / '#1091#1076#1077#1088#1078#1072#1085#1080#1081
        OnClick = mMnuZpTreeVidsClick
      end
      object mmZpTreeObj: TMenuItem
        Caption = #1055' '#1086' '#1076' '#1088' '#1072' '#1079' '#1076' '#1077' '#1083' '#1077' '#1085' '#1080' '#1103
        OnClick = mmZpTreeObjClick
      end
      object mMnuZpUPI: TMenuItem
        Caption = #1057' '#1086' '#1090' '#1088' '#1091' '#1076' '#1085' '#1080' '#1082' '#1080
        OnClick = mMnuZpUPIClick
      end
      object mMnuZpKatPers: TMenuItem
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
        OnClick = mMnuZpKatPersClick
      end
      object mMnuZpSysOpl: TMenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1099' '#1086#1087#1083#1072#1090#1099
        OnClick = mMnuZpSysOplClick
      end
      object mMnuZpShPdN: TMenuItem
        Caption = #1057#1093#1077#1084#1099' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1085#1072#1083#1086#1075#1072
        OnClick = mMnuZpShPdnClick
      end
      object mMnuZpSBU: TMenuItem
        Caption = #1055#1083#1072#1085' '#1089#1095#1077#1090#1086#1074' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1091#1095#1077#1090#1072' ('#1057#1041#1059')'
        Default = True
        OnClick = mMnuZpSBUClick
      end
      object N2: TMenuItem
        Caption = #1058' '#1077' '#1084' '#1099'   '#1053' '#1048' '#1063
        Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1058#1077#1084#1099' '#1053#1048#1063'"'
        OnClick = N2Click
      end
      object mMnuZpKdLgt: TMenuItem
        Caption = #1050#1086#1076#1099' '#1083#1100#1075#1086#1090' '#1087#1086' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1084#1091' '#1085#1072#1083#1086#1075#1091
        OnClick = mMnuZpKdLgtClick
      end
      object mMnuZpEDays: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1085#1077#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1093' '#1076#1085#1077#1081
        OnClick = mMnuZpEDaysClick
      end
      object mMnuZpKoefOtp: TMenuItem
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
        Hint = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1087#1077#1088#1077#1089#1095#1077#1090#1072' '#1076#1083#1103' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
        Visible = False
        OnClick = mMnuZpKoefOtpClick
      end
      object mMnuZpBanki: TMenuItem
        Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1102#1097#1080#1077' '#1073#1072#1085#1082#1080
        OnClick = mMnuZpBankiClick
      end
      object mMnuZpBankiLS: TMenuItem
        Caption = #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' '#1074' '#1073#1072#1085#1082#1072#1093
        OnClick = mMnuZpBankiLSClick
      end
      object mMnuZpDolgnosti: TMenuItem
        Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081
        OnClick = mMnuZpDolgnostiClick
      end
      object mMnuZpPrBln: TMenuItem
        Caption = #1055#1088#1080#1095#1080#1085#1099' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
        OnClick = mMnuZpPrBlnClick
      end
      object mMnuZpSovm: TMenuItem
        Caption = #1042#1080#1076#1099' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1072
        OnClick = mMnuZpSovmClick
      end
      object mMnuZpTbUd2011: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1099' '#1088#1072#1079#1085#1099#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' ('#1089' 2011 '#1075'.)'
        Hint = #1058#1072#1073#1083#1080#1094#1099' '#1088#1072#1079#1085#1099#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' ('#1089' 2011 '#1075'.)'
        OnClick = mMnuZpTbUd2011Click
      end
      object mMnuZpTbUdrg: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1099' '#1088#1072#1079#1085#1099#1093' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' ('#1076#1086' 2011 '#1075'.)'
        Hint = #1058#1072#1073#1083#1080#1094#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1080' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1076#1086' 2011 '#1075'.'
        OnClick = mMnuZpTbUdrgClick
      end
      object mMnuZpTbPrcIndx: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1099' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        OnClick = mMnuZpTbPrcIndxClick
      end
      object mMnuZpPstPsb: TMenuItem
        Caption = #1055#1086#1095#1090#1099' '#1080' '#1087#1086#1095#1090#1086#1074#1099#1077' '#1089#1073#1086#1088#1099
        OnClick = mMnuZpPstPsbClick
      end
      object mMnuZpUsersNew: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1080' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099
        OnClick = mMnuZpUsersNewClick
      end
      object mMnuZpKdSps: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1087#1080#1089#1082#1086#1074
        OnClick = mMnuZpKdSpsClick
      end
      object mMnuZpPidZviln: TMenuItem
        Caption = #1055'i'#1076#1089#1090#1072#1074#1080' '#1079#1074'i'#1083#1100#1085#1077#1085#1085#1103
        OnClick = mMnuZpPidZvilnClick
      end
      object mMnuZpFixIndx: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1072' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1089#1091#1084#1084' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        OnClick = mMnuZpFixIndxClick
      end
      object mMnuDk2010: TMenuItem
        Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1087#1088#1086#1092#1077#1089#1089#1080#1081' '#1044#1050' 003:2010'
        OnClick = mMnuDk2010Click
      end
      object mMnuIspSlg: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093'  '#1089#1083#1091#1078#1073
        OnClick = mMnuIspSlgClick
      end
    end
    object mMnuMassa: TMenuItem
      Caption = ' '#1052#1072#1089#1089#1086#1074#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080' '
      OnClick = mMnuMassaClick
      object mMnuMassVedOtkl: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084#1080
        Hint = 
          #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1074#1074#1086#1076' '#1087#1072#1082#1077#1090#1086#1074' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081', '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081 +
          '  '#1084#1077#1078#1074#1099#1087#1083#1072#1090' '#1085#1072' '#1082#1072#1089#1089#1091
        OnClick = mMnuMassVedOtklClick
      end
      object mMnuZpOtpuska: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1086#1090#1087#1091#1089#1082#1072#1084#1080
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        OnClick = mMnuZpOtpuskaClick
      end
      object mMnuZpBolnichnue: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1084#1080
        Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        OnClick = mMnuZpBolnichnueClick
      end
      object mMnuMassPere: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103#1084#1080
        Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103#1084#1080' '#1087#1072#1082#1077#1090#1072#1084#1080
        OnClick = mMnuMassPereClick
      end
      object mMnuZpActNdb: TMenuItem
        Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1099#1077' '#1076#1086#1087#1083#1072#1090#1099' '#1080' '#1085#1072#1076#1073#1072#1074#1082#1080
        Hint = #1040#1082#1090#1091#1072#1083#1100#1085#1099#1077' '#1076#1086#1087#1083#1072#1090#1099' '#1080' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
        OnClick = mMnuZpActNdbClick
      end
      object mMnuZp1005: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' '#1089#1087#1080#1089#1082#1072#1084#1080' '#1076#1083#1103' '#1090#1088#1091#1076#1086#1074#1099#1093' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
        Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1084#1080' '#1089#1087#1080#1089#1082#1072#1084#1080' '#1076#1083#1103' '#1090#1088#1091#1076#1086#1074#1099#1093' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
        Visible = False
        OnClick = mMnuZp1005Click
      end
      object mMnuZp1006: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086' "'#1089#1087#1077#1094#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080'"'
        Hint = '"'#1057#1087#1077#1094#1085#1072#1076#1073#1072#1074#1082#1080'" - '#1079#1072#1087#1080#1089#1080' '#1086' '#1085#1072#1076#1073#1072#1074#1082#1072#1093'  '#1089' '#1085#1091#1083#1077#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080
        OnClick = mMnuZp1006Click
      end
      object mMnuMassNadb: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080
        Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1085#1072#1076#1073#1072#1074#1082#1072#1084#1080' '#1087#1072#1082#1077#1090#1072#1084#1080
        OnClick = mMnuMassNadbClick
      end
      object mMnuPrikPrem: TMenuItem
        Caption = #1055#1088#1080#1082#1072#1079#1099' '#1085#1072' '#1087#1088#1077#1084#1080#1088#1086#1074#1072#1085#1080#1077
        Hint = 
          #1042#1074#1086#1076' '#1087#1086#1090#1086#1082#1086#1084' '#1087#1088#1080#1082#1072#1079#1086#1074' '#1085#1072' '#1087#1088#1077#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100#1102' '#1087#1077#1095#1072#1090#1080' '#1074#1077#1076#1086 +
          #1084#1086#1089#1090#1080' '#1074#1099#1087#1083#1072#1090
        Visible = False
      end
      object mMnuIndxNachOld: TMenuItem
        Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1076#1086#1093#1086#1076#1086#1074' '#1090#1077#1082#1091#1097#1072#1103
        Hint = #1057#1090#1072#1088#1072#1103' ('#1076#1086' 07-2012) '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1103
        OnClick = mMnuIndxNachOldClick
      end
      object mMnuIndxNach: TMenuItem
        Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1076#1086#1093#1086#1076#1086#1074' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103
        Enabled = False
        Hint = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1087#1088#1086#1096#1083#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
        OnClick = mMnuIndxNachClick
      end
      object mMnuAddKomand: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1072#1084#1080
        Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1082
        OnClick = mMnuAddKomandClick
      end
      object mMnuZpOtpNextMes: TMenuItem
        Caption = #1054#1090#1087#1091#1089#1082#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        Hint = #1056#1072#1089#1095#1077#1090' '#1086#1090#1087#1091#1089#1082#1085#1099#1093', '#1087#1086#1076#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1084#1077#1089#1103#1094#1091
        OnClick = mMnuZpOtpNextMesClick
      end
      object mMnuZpAddBLS: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1072#1082#1077#1090#1086#1074' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
        Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1072#1082#1077#1090#1086#1074' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1093' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
        OnClick = mMnuZpAddBLSClick
      end
      object mMnuZpPrikazuOK: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1082#1072#1079#1072#1084#1080' '#1054#1050
        Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1080#1082#1072#1079#1072#1084#1080' '#1054#1090#1076#1077#1083#1072' '#1050#1072#1076#1088#1086#1074
        OnClick = mMnuZpPrikazuOKClick
      end
    end
    object mMnuZpPrt: TMenuItem
      Caption = ' '#1055#1077#1095#1072#1090#1100' '
      Hint = #1055#1077#1095#1072#1090#1100' '#1074#1099#1093#1086#1076#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      OnClick = mMnuZpPrtClick
      object mMnuZpPrtRLst: TMenuItem
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1082#1080' '#1074' Excel-'#1092#1072#1081#1083
        Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1099#1093' '#1083#1080#1089#1090#1082#1086#1074'  '#1074' Excel-'#1092#1072#1081#1083
        OnMeasureItem = mMnuZpPrtRLstMeasureItem
        object MnuPrtEmplCalcExcl: TMenuItem
          Caption = '- '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          OnClick = PrintEmplCalc
        end
        object MnuPrtDeptCalcExcl: TMenuItem
          Caption = '- '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1086#1084
          Hint = 
            #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086 +
            #1082#1086#1084
          OnClick = PrintDeptCalc
        end
        object MnuPrtEntprCalcExcl: TMenuItem
          Caption = '- '#1074#1089#1077#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1087#1086#1090#1086#1082#1086#1084
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1087#1086#1090#1086#1082#1086#1084
          OnClick = PrintEntprCalc
        end
      end
      object mMnuRLstTxt: TMenuItem
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1082#1080' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        object NPrtCalcEmplTxt: TMenuItem
          Caption = #1058#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          OnClick = PrintEmplCalc
        end
        object NPrtCalcDeptTxt: TMenuItem
          Caption = #1058#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          OnClick = PrintDeptCalc
        end
        object NPrtCalcEntprTxt: TMenuItem
          Caption = #1042#1089#1077#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          OnClick = PrintEntprCalc
        end
      end
      object mMnuTwoRLstTxt: TMenuItem
        Caption = #1056#1072#1089#1095'. '#1083#1080#1089#1090#1082#1080' '#1074' '#1090#1077#1082#1089#1090'. '#1092#1072#1081#1083' (2 '#1101#1082#1079'.)'
        object NPrtCalcDept2Copies: TMenuItem
          Caption = #1058#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          OnClick = PrintDeptCalc
        end
        object NPrtCalcEntpr2Copies: TMenuItem
          Caption = #1042#1089#1077#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
          Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095'.'#1083#1080#1089#1090#1082#1086#1074' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          OnClick = PrintEntprCalc
        end
      end
      object mMnuArhivkiExcel: TMenuItem
        Caption = '"'#1040#1088#1093#1080#1074#1082#1080'" '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1075#1086#1076' '#1074' MS Excel'
        object mMnuArhivkiExcelObj: TMenuItem
          Caption = '- '#1090#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1086#1084
          OnClick = mMnuArhivkiExcelObjClick
        end
        object mMnuArhivkiExcelAll: TMenuItem
          Caption = '- '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1086#1084
          OnClick = mMnuArhivkiExcelAllClick
        end
      end
      object mMnuArhivkiTxt: TMenuItem
        Caption = '"'#1040#1088#1093#1080#1074#1082#1080'" '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1075#1086#1076' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        object mMnuArhivkiTxtObj: TMenuItem
          Caption = '- '#1090#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1087#1086#1090#1086#1082#1086#1084
          OnClick = mMnuArhivkiTxtObjClick
        end
        object mMnuArhivkiTxtAll: TMenuItem
          Caption = '- '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1087#1086#1090#1086#1082#1086#1084
          OnClick = mMnuArhivkiTxtAllClick
        end
      end
      object mMnuZpVedV: TMenuItem
        Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1074#1099#1087#1083#1072#1090
        Hint = #1055#1088#1086#1084#1086#1090#1088' '#1080' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' '#1074#1099#1087#1083#1072#1090
        OnClick = mMnuZpVedVClick
      end
      object NSepPrint1: TMenuItem
        Caption = '-'
      end
      object mMnuZpPrtMo: TMenuItem
        Caption = #1052#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088
        object mMnuZpPrtSvdMo2011: TMenuItem
          Caption = '- '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088
          Hint = #1057' 01-01-2011'
          OnClick = mMnuZpPrtSvdMo2011Click
        end
        object mMnuZpPrtSvdMoFin: TMenuItem
          Caption = '- '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088' '#1092#1080#1085#1072#1083#1100#1085#1099#1081
          Hint = #1055#1088#1072#1074#1080#1083#1100#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1089#1080#1085#1090#1077#1090#1080#1095#1077#1089#1082#1080#1093' '#1089#1095#1077#1090#1086#1074' ('#1089' "'#1093#1080#1084#1080#1077#1081'" '#1074' '#1057#1072#1083#1100#1076#1086')'
          OnClick = mMnuZpPrtSvdMoFinClick
        end
        object mMnuZpPrtMoGK: TMenuItem
          Caption = '- '#1076#1083#1103' '#1075#1083#1072#1074#1085#1086#1081' '#1082#1085#1080#1075#1080' ('#1092#1080#1085#1072#1083#1100#1085#1099#1081')'
          OnClick = mMnuZpPrtMoGKClick
        end
      end
      object mMnuZpPrtSvd: TMenuItem
        Caption = #1057#1074#1086#1076#1099
        object mMnuZpPrtSvdMO: TMenuItem
          Caption = '- (not visible) '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088
          Hint = #1044#1086' 01-01-2011'
          Visible = False
          OnClick = mMnuZpPrtSvdMOClick
        end
        object mMnuZpPrtSvdByVidN: TMenuItem
          Caption = '- '#1087#1086' '#1074#1080#1076#1072#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          OnClick = mMnuZpPrtSvdByVidNClick
        end
        object mMnuZpPrtSvdByKatPers: TMenuItem
          Caption = '- '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          OnClick = mMnuZpPrtSvdByKatPersClick
        end
      end
      object mMnuZpPrtSpr: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1080
        object mMnuZpPrtSprSpov_2: TMenuItem
          Caption = '- '#1076#1083#1103' '#1057#1055#1054#1042' ('#1048#1053#1044#1040#1053#1048')'
          Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "ZaMesGod"'
          OnClick = mMnuZpPrtSprSpov_2Click
        end
        object mMnuZpPrtSprKred: TMenuItem
          Caption = '- '#1076#1083#1103' '#1082#1088#1077#1076#1080#1090#1086#1074
          Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "ZaMesGod"'
          OnClick = mMnuZpPrtSprKredClick
        end
        object mMnuZpPrtSprSubs: TMenuItem
          Caption = '- '#1076#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1081', '#1082#1072#1082' '#1087#1086' 1'#1044#1060
          Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
          OnClick = mMnuZpPrtSprSubsClick
        end
        object MiPrintSubsAbroad: TMenuItem
          Caption = '- '#1086' '#1076#1086#1093#1086#1076#1072#1093' ('#1076#1083#1103' '#1079#1072#1088#1091#1073#1077#1078'.)'
          OnClick = MiPrintSubsAbroadClick
        end
        object mMnuZpPrtSprSubs3: TMenuItem
          Caption = '- '#1076#1083#1103' '#1089#1091#1073#1089#1080#1076#1080#1081' '#1085#1086#1074#1072#1103
          OnClick = mMnuZpPrtSprSubs3Click
        end
        object mMnuZpPrtSprDohod: TMenuItem
          Caption = '- '#1086' '#1076#1086#1093#1086#1076#1072#1093', '#1082#1072#1082' '#1087#1086' 1'#1044#1060' ('#1089' '#1087#1086#1076#1086#1093#1086#1076#1085#1099#1084')'
          Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
          OnClick = mMnuZpPrtSprDohodClick
        end
        object mMnuZpPrtSprNlg: TMenuItem
          Caption = '- '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102' '#1080#1085#1089#1087'. '#1092'.'#8470'2, '#1082#1072#1082' '#1087#1086' 1'#1044#1060
          Hint = #1057#1091#1084#1084#1099' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1087#1086#1083#1102' "DtProc"'
          OnClick = mMnuZpPrtSprNlgClick
        end
      end
      object mmPrtNich: TMenuItem
        Caption = #1053#1048#1063' '#1054#1090#1095#1105#1090' '#1087#1086' '#1090#1077#1084#1072#1084' '
        OnClick = mMnuZpPrtNichTm_1Click
      end
      object mMnuZpPrtOther: TMenuItem
        Caption = #1056#1072#1079#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
        object mMnuZpPrtFssTvp: TMenuItem
          Caption = #1047#1072#1103#1074#1082#1072'-'#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1074' '#1060#1057#1057' '#1079' '#1058#1042#1055
          Visible = False
          OnClick = mMnuZpPrtFssTvpClick
        end
        object mMnuZpPrtOtherVedProf: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1088#1086#1092#1089#1086#1102#1079#1085#1099#1079' '#1074#1079#1085#1086#1089#1086#1074
          OnClick = mMnuZpPrtOtherVedProfClick
        end
        object mMnuZpPrtOtherSpsCurObj: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          OnClick = popTvObjPrtSpsCurObjClick
        end
        object mMnuZpPrtOtherSpsCurMes: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
          OnClick = mMnuZpPrtOtherSpsCurMesClick
        end
        object mMnuZpPrtCmbOklCurMes: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1089' "'#1089#1086#1089#1090#1072#1074#1085#1099#1084#1080'" '#1086#1082#1083#1072#1076#1072#1084#1080
          OnClick = mMnuZpPrtCmbOklCurMesClick
        end
        object mMnuZpPrtInvCurMes: TMenuItem
          Caption = #1048#1085#1074#1072#1083#1080#1076#1099' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
          Hint = #1048#1085#1074#1072#1083#1080#1076#1099' '#1074' '#1089#1087#1080#1089#1082#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
          OnClick = mMnuZpPrtInvCurMesClick
        end
        object mMnuZpPrtLgtCurMes: TMenuItem
          Caption = #1051#1100#1075#1086#1090#1085#1080#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
          OnClick = mMnuZpPrtLgtCurMesClick
        end
        object mMnuZpPrtOtp3_6: TMenuItem
          Caption = #1053#1072#1093#1086#1076#1103#1097#1080#1077#1089#1103' '#1074' '#1086#1090#1087#1091#1089#1082#1072#1093' '#1076#1086' 3-'#1093' '#1080' 6-'#1090#1080' '#1083#1077#1090
          Hint = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1085#1072#1093#1086#1076#1103#1097#1080#1093#1089#1103' '#1074' '#1086#1090#1087#1091#1089#1082#1072#1093' '#1076#1086' 3-'#1093' '#1080' 6-'#1090#1080' '#1083#1077#1090
          OnClick = mMnuZpPrtOtp3_6Click
        end
      end
      object mMnuZpPrtArhivki: TMenuItem
        Caption = '"'#1040#1088#1093#1080#1074#1082#1080'"'
        object NArhivkiYear: TMenuItem
          Caption = #1047#1072' '#1075#1086#1076
          OnClick = mMnuZpPrtArhivkiClick
        end
        object NArhivkiSpan: TMenuItem
          Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076
          OnClick = NArhivkiSpanClick
        end
        object NArhivkiInvalid: TMenuItem
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1089' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1100#1102
          OnClick = NArhivkiInvalidClick
        end
      end
      object mMnuAlim: TMenuItem
        Caption = '&'#1040#1083#1080#1084#1077#1085#1090#1099
        object mMnuAllAlim: TMenuItem
          Caption = '&'#1055#1083#1072#1090#1077#1083#1100#1097#1080#1082#1080' '#1072#1083#1080#1084#1077#1085#1090#1086#1074
          object mMnuAllAlimBoevue: TMenuItem
            Caption = '&'#1044#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077
            Hint = #1048#1084#1077#1102#1097#1080#1077' '#1085#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1086#1073' '#1072#1083#1080#1084#1077#1085#1090#1072#1093
            OnClick = mMnuAllAlimBoevueClick
          end
          object mMnuAllAlimAll: TMenuItem
            Caption = '&'#1042#1089#1077
            Hint = #1042#1089#1077', '#1091' '#1082#1086#1090#1086#1088#1099#1093' '#1077#1089#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1086#1073' '#1072#1083#1080#1084#1077#1085#1090#1072#1093
            OnClick = mMnuAllAlimClick
          end
        end
        object mMnuVedAlim: TMenuItem
          Caption = '&'#1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1072#1083#1080#1084#1077#1085#1090#1086#1074
          OnClick = mMnuVedAlimClick
        end
        object mMnuVedIspL: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' &'#1080#1089#1087'. '#1083#1080#1089#1090#1086#1074
          OnClick = mMnuVedIspLClick
        end
        object mMnuVedIspL2: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1080#1089#1087'. &'#1083#1080#1089#1090#1086#1074' ('#1085#1086#1074#1072#1103')'
          OnClick = mMnuVedIspL2Click
        end
      end
      object mMnuPostPvd: TMenuItem
        Caption = #1055#1086#1095#1090#1086#1074#1099#1077' '#1087#1077#1088#1077#1074#1086#1076#1099
        object mMnuPostPvdSps: TMenuItem
          Caption = #1057#1087#1080#1089#1086#1082' "'#1087#1077#1088#1077#1074#1086#1076#1095#1080#1082#1086#1074'"'
          OnClick = mMnuPostPvdSpsClick
        end
        object mMnuPostPvdVedom: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1086#1095#1090#1086#1074#1099#1093' '#1087#1077#1088#1077#1074#1086#1076#1086#1074
          OnClick = mMnuPostPvdVedomClick
        end
      end
      object mMnuOtkl_NuToExcel: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' Z_Otkl '#1080' Z_NU  '#1074' Excel-'#1092#1072#1081#1083
        Hint = #1090#1086#1083#1100#1082#1086' '#1087#1086' dbg '#1055#1077#1095#1072#1090#1100' Z_Otkl '#1080' Z_NU  '#1074' Excel-'#1092#1072#1081#1083
        Visible = False
        OnClick = mMnuOtkl_NuToExcelClick
      end
      object NSepPrint2: TMenuItem
        Caption = '-'
      end
      object NPrintIndxExcl: TMenuItem
        Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103' '#1080#1079' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1047#1055
        OnClick = NPrintIndxExclClick
      end
    end
    object mMnuZpDop: TMenuItem
      Caption = ' '#1044#1086#1087#1086#1083#1085#1077#1085#1080#1103' '
      Hint = #1055#1088#1077#1076#1088#1072#1089#1095#1077#1090#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
      OnClick = mMnuZpDopClick
      object mMnu1df: TMenuItem
        Caption = #1060#1086#1088#1084#1072' 1'#1044#1060' ('#1082#1074#1072#1088#1090'. '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102')'
        Hint = #1056#1072#1073#1086#1090#1072' '#1089' '#1092#1086#1088#1084#1086#1081' 1'#1044#1060' ('#1082#1074#1072#1088#1090#1072#1083#1100#1085#1072#1103' '#1074' '#1085#1072#1083#1086#1075#1086#1074#1091#1102')'
        Visible = False
        OnClick = mMnu1dfClick
      end
      object mmPereraschetPdn: TMenuItem
        Caption = #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1087#1086#1076#1086#1093#1086#1076#1085#1086#1075#1086' '#1079#1072' '#1075#1086#1076
        OnClick = mmPereraschetPdnClick
      end
      object mMnuSpovNew: TMenuItem
        Caption = #1054' '#1090' '#1095' '#1077' '#1090' '#1099'   '#1074'   '#1057' '#1055' '#1054' '#1042
        Hint = #1057#1086#1079#1076#1072#1085#1080#1077' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1093' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' M.E.Doc'
        OnClick = mMnuSpovNewClick
      end
      object mMnuPlOtd: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1076#1083#1103' '#1055#1083#1072#1085#1086#1074#1086#1075#1086' '#1054#1090#1076#1077#1083#1072
        OnClick = mMnuPlOtdClick
      end
      object mMnuStatPlOtd: TMenuItem
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1083#1072#1085#1086#1074#1086#1075#1086' '#1086#1090#1076#1077#1083#1072
        OnClick = mMnuStatPlOtdClick
      end
      object mMnuZpPrtQry: TMenuItem
        Caption = #1047#1072#1087#1088#1086#1089#1099
        object mMnuZpPrtSvdByKatP: TMenuItem
          Caption = #1057#1074#1086#1076#1082#1072' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
          Hint = #1057#1074#1086#1076#1082#1072' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '#1074' '#1079#1072#1076#1072#1085#1085#1086#1084' '#1084#1077#1089#1103#1094#1077
          OnClick = mMnuZpPrtSvdByKatPClick
        end
        object mMnuZpPrtQryByVidN: TMenuItem
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
          Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
          OnClick = mMnuZpPrtQryByVidNClick
        end
        object mMnuZpOtklByVidN: TMenuItem
          Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
          Hint = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1086#1084#1091' '#1074#1080#1076#1091
          OnClick = mMnuZpOtklByVidNClick
        end
        object mMnuInvNoPens: TMenuItem
          Caption = #1048#1085#1074#1072#1083#1080#1076#1099', '#1085#1077' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1099
          Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080#1085#1074#1072#1083#1080#1076#1072#1084' ('#1074' '#1090'.'#1095'. '#1085#1077' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1072#1084') '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
          OnClick = mMnuInvNoPensClick
        end
        object mMnuPensCM: TMenuItem
          Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088#1099' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
          Hint = #1057#1087#1080#1089#1086#1082' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1074' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' ('#1074' '#1090'.'#1095'. '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080')'
          OnClick = mMnuPensCMClick
        end
        object NuByYears: TMenuItem
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1074' '#1079#1072#1076#1072#1085#1085#1086#1084' '#1075#1086#1076#1091' '#1087#1086' '#1075#1086#1076#1072#1084
          OnClick = NuByYearsClick
        end
        object MnuDismisThisMnth: TMenuItem
          Caption = #1059#1074#1086#1083#1077#1085#1085#1099#1077' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1084#1077#1089#1103#1094#1077
          OnClick = MnuDismisThisMnthClick
        end
      end
      object mMnuZpCheckMO: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1084'/'#1086#1088#1076#1077#1088#1072
        Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1084#1077#1084#1086#1088#1080#1072#1083#1100#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
        OnClick = mMnuZpCheckMOClick
      end
      object mMnuShwLog: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072' '#1089#1086#1073#1099#1090#1080#1081
        object mMnuShwLogTabN: TMenuItem
          Caption = '- '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
          OnClick = mMnuShwLogTabNClick
        end
        object mMnuShwLogAll: TMenuItem
          Caption = '- '#1074#1077#1089#1100' '#1078#1091#1088#1085#1072#1083' '
          OnClick = mMnuShwLogClick
        end
      end
      object mMnuCheckVupl: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1082#1086#1085#1095#1072#1090#1077#1083#1100#1085#1099#1093' '#1074#1099#1087#1083#1072#1090
        Hint = 
          #1044#1086#1083#1075#1086' !!! '#1048#1084#1077#1077#1090' '#1089#1084#1099#1089#1083' '#1079#1072#1087#1091#1089#1082#1072#1090#1100' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' '#1086#1082#1085#1085#1095#1072 +
          #1090#1077#1083#1100#1085#1099#1093' '#1074#1099#1087#1083#1072#1090
        OnClick = mMnuCheckVuplClick
      end
      object mMnuActiveUsers: TMenuItem
        Caption = #1040#1082#1090#1080#1074#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        OnClick = mMnuActiveUsersClick
      end
      object mmMyCheckResults: TMenuItem
        Caption = #1052#1086#1080' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1099#1077' '#1076#1077#1083#1072
        object mmMyCheckSvPorogi: TMenuItem
          Caption = #1057#1074#1077#1088#1093#1055#1086#1088#1086#1075#1080' '#1087#1086' Z_NU'
          OnClick = mmMyCheckSvPorogiClick
        end
        object mmMyCheckNU: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1053#1059' '#1079#1072' '#1101#1072#1076#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094
          OnClick = mmMyCheckNUClick
        end
      end
      object mmSpsDela: TMenuItem
        Caption = '"'#1057#1087#1080#1089#1086#1095#1085#1099#1077'" '#1076#1077#1083#1072
        object mmSpsTabs: TMenuItem
          Caption = '- "'#1042#1072#1096#1080' '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
          OnClick = mmSpsTabsClick
        end
        object mmSpsDelaByOtkl: TMenuItem
          Caption = '- '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1089#1087#1080#1089#1082#1091
          OnClick = mmSpsDelaByOtklClick
        end
        object mmSpsDelaByNadb: TMenuItem
          Caption = '- '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1087#1080#1089#1082#1072
          OnClick = mmSpsDelaByNadbClick
        end
        object mmSpsDelaByVids: TMenuItem
          Caption = '- '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1089#1087#1080#1089#1082#1091
          OnClick = mmSpsDelaByVidsClick
        end
        object mmDoubleSpsTabN: TMenuItem
          Caption = '- '#1085#1077#1090' '#1083#1080' "'#1089#1076#1074#1086#1077#1085#1085#1099#1093'" '#1058#1072#1073#1053#1088
          Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100', '#1085#1077#1090' '#1083#1080'  '#1074' '#1089#1087#1080#1089#1082#1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072' "'#1089#1076#1074#1086#1077#1085#1085#1099#1093'" '#1058#1072#1073#1053#1088
          OnClick = mmDoubleSpsTabNClick
        end
        object mmChSps: TMenuItem
          Caption = '- '#1085#1077' '#1080#1084#1077#1102#1097#1080#1077' "'#1088#1086#1076#1085#1099#1093'" '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
          OnClick = mmChSpsClick
        end
        object mmChOtklNU: TMenuItem
          Caption = '- '#1085#1077' '#1080#1084#1077#1102#1097#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100', '#1077#1089#1090#1100' '#1083#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080', '#1085#1077' '#1080#1084#1077#1102#1097#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          OnClick = mmChOtklNUClick
        end
      end
      object mmEABnkLS: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1041#1072#1085#1082#1072
        Hint = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1073#1072#1085#1082#1072' ('#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1048#1084#1077#1082#1089#1041#1072#1085#1082#1072')'
        Visible = False
        OnClick = mmEABnkLSClick
      end
      object mmChngBnk: TMenuItem
        Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074' '#1076#1088#1091#1075#1086#1081' '#1073#1072#1085#1082' (dbg)'
        OnClick = mmChngBnkClick
      end
      object mmFzDela: TMenuItem
        Caption = #1042#1086#1079#1085#1103' '#1089' '#1060#1086#1085#1076#1086#1084' '#1047#1072#1085#1103#1090#1086#1089#1090#1080
        Visible = False
      end
      object mmCheckInvState: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' "'#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080'"'
        Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' "'#1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080'"'
        OnClick = mmCheckInvStateClick
      end
      object NSep: TMenuItem
        Caption = '-'
      end
      object NRptGrpVidNDeptId: TMenuItem
        Caption = #1063#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1080' '#1092#1086#1085#1076' '#1086#1087#1083#1072#1090#1099' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076'.'
        OnClick = NRptGrpVidNDeptIdClick
      end
    end
  end
  object QrySps: TQuery
    CachedUpdates = True
    BeforeScroll = QrySpsBeforeScroll
    OnCalcFields = QrySpsCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcObj
    SQL.Strings = (
      'Select sps.*, ip.*, upi.Fam, upi.Ima, upi.Otch,'
      '       upi.ID, upi.Pol, upi.LastDtPrm, upi.LastDtUvl'
      ' from Z_Sps sps'
      
        '       Left outer join z_IsPrmUvEvent(sps.TabN, sps.DtProc, "12/' +
        '31/2006") ip on 1 = 1'
      '       Left outer join Z_Upi upi on upi.TabN = sps.TabN'
      ' where (sps.DtProc = "12/01/2006") and (sps.KdObj = 1313)'
      '       and (sps.KdSps = 1)')
    UpdateObject = updSps
    Left = 24
    Top = 282
    object QrySpsNR: TIntegerField
      FieldName = 'NR'
    end
    object QrySpsKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object QrySpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object QrySpsTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object QrySpsKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object QrySpsKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object QrySpsNOTES: TStringField
      FieldName = 'NOTES'
      Size = 35
    end
    object QrySpsFam: TStringField
      FieldName = 'Fam'
    end
    object QrySpsIma: TStringField
      FieldName = 'Ima'
      Size = 15
    end
    object QrySpsOtch: TStringField
      FieldName = 'Otch'
    end
    object QrySpsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object QrySpsId: TStringField
      FieldName = 'Id'
      Size = 10
    end
    object QrySpsPOL: TStringField
      FieldName = 'POL'
      Size = 1
    end
    object QrySpsShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'ShKatP'
      Size = 10
      Calculated = True
    end
    object QrySpsNCH: TStringField
      FieldName = 'NCH'
      Size = 1
    end
    object QrySpsLASTDTPRM: TDateTimeField
      FieldName = 'LASTDTPRM'
    end
    object QrySpsLASTDTUVL: TDateTimeField
      FieldName = 'LASTDTUVL'
    end
    object QrySpsISEVENT: TStringField
      FieldName = 'ISEVENT'
      FixedChar = True
      Size = 1
    end
    object QrySpsISWORKDAYS: TStringField
      FieldName = 'ISWORKDAYS'
      FixedChar = True
      Size = 1
    end
    object QrySpsDT_PRIEM: TDateTimeField
      FieldName = 'DT_PRIEM'
    end
    object QrySpsDT_UVOLN: TDateTimeField
      FieldName = 'DT_UVOLN'
    end
    object QrySpsOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
  end
  object DsrcSps: TDataSource
    DataSet = QrySps
    OnDataChange = DsrcSpsDataChange
    Left = 40
    Top = 296
  end
  object popOtkl: TPopupMenu
    Alignment = paRight
    OnPopup = popOtklPopup
    Left = 320
    Top = 128
    object popOtklHead: TMenuItem
      Caption = '==    '#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'     =='
      Enabled = False
    end
    object popOtklAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object popOtklAddCmn: TMenuItem
        Caption = '- '#1086#1073#1097#1080#1077' '#1074#1080#1076#1099
        ShortCut = 16462
        OnClick = popOtklAddCmnClick
      end
      object popOtklAddOtp: TMenuItem
        Caption = '- '#1086#1090#1087#1091#1089#1082#1085#1099#1077
        ShortCut = 16463
        OnClick = popOtklAddOtpClick
      end
      object popOtklAddDekr: TMenuItem
        Caption = '- '#1076#1077#1082#1088#1077#1090#1085#1099#1077
        OnClick = popOtklAddDekrClick
      end
      object popOtklAddBln: TMenuItem
        Caption = '- '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1077
        Hint = #1073#1086#1083#1100#1085#1080#1095#1085#1099#1077' ('#1082#1088#1086#1084#1077' '#1076#1077#1082#1088#1077#1090#1085#1099#1093')'
        ShortCut = 16450
        OnClick = popOtklAddBlnClick
      end
    end
    object popOtklEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      OnClick = popOtklEdtClick
    end
    object popOtklView: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      Hint = 
        #1055#1088#1086#1089#1084#1086#1090#1088' '#1088#1072#1089#1095#1077#1090#1086#1074' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1080' '#1073#1086#1083#1100#1085#1080#1095#1085#1099#1093', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1074' '#1087#1088#1086#1096#1083#1099#1077' ' +
        #1084#1077#1089#1103#1094#1099
      Visible = False
      OnClick = popOtklViewClick
    end
    object popOtklDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16469
      OnClick = popOtklDelClick
    end
    object popOtklStornOtp_2: TMenuItem
      Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
      Hint = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' ('#1085#1086#1074#1099#1081' '#1074#1072#1088#1080#1072#1085#1090')'
      OnClick = popOtklStornOtp_2Click
    end
    object popOtklStornNeopl: TMenuItem
      Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1077#1086#1087#1083'.'#1074#1080#1076#1086#1074' (5002, 5005, 5008)'
      Hint = 
        #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072' 5002 ('#1085#1077#1074#1099#1103#1089#1085#1077#1085#1085#1099#1077' '#1087#1088#1080#1095#1080#1085#1099'), '#1077#1089#1083#1080' '#1090#1072#1082#1086#1074#1099#1077' '#1073#1099#1083 +
        #1080' '#1074' '#1090#1077#1095#1077#1085#1080#1077' '#1087#1086#1089#1083#1077#1076#1085#1080#1093' 12 '#1084#1077#1089#1103#1094#1077#1074
      OnClick = popOtklStornNeoplClick
    end
    object opOtklSep0: TMenuItem
      Caption = '-'
    end
    object popOtklNewRaschet: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ShortCut = 120
      OnClick = popOtklNewRaschetClick
    end
    object popOtklSep1: TMenuItem
      Caption = '-'
    end
    object popOtklPrtRList: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      OnClick = PrintEmplCalc
    end
    object popOtklSep2: TMenuItem
      Caption = '-'
    end
    object popOtklSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      Hint = #1057#1087#1086#1089#1086#1073' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080' '#1090#1072#1073#1083#1080#1094#1099' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'"'
      object popOtklSortByVidN: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' "'#1042#1080#1076'"'
        Hint = #1042' '#1087#1086#1088#1103#1076#1082#1077' "'#1042#1080#1076#1053'; '#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
        OnClick = popOtklSortByVidNClick
      end
      object popOtklSortByZaMesGod: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1043#1086#1076'"'
        Checked = True
        Hint = #1042' '#1087#1086#1088#1103#1076#1082#1077' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'; '#1042#1080#1076#1053'"'
        OnClick = popOtklSortByZaMesGodClick
      end
    end
    object popOtklVidInfo: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1085#1072' '#1090#1077#1082#1091#1097#1077#1084' '#1074#1080#1076#1077
      ShortCut = 16470
      OnClick = popOtklVidInfoClick
    end
    object popOtklPoisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' (not visible)'
      ShortCut = 114
      Visible = False
      OnClick = popSpsPoisk2Click
    end
    object notVisible2: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' (not Visible)'
      ShortCut = 16464
      Visible = False
      OnClick = LabelTvObjDblClick
    end
    object NSepIndxExcl: TMenuItem
      Caption = '-'
    end
    object NOtklIndxExcl: TMenuItem
      Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103' '#1080#1079' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1081
      OnClick = NUpdIndxExclClick
    end
    object popOtklSep3: TMenuItem
      Caption = '-'
    end
    object popOtklFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popOtklFonClick
    end
  end
  object tblSvSpsPlace: TTable
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'KdObj'
        DataType = ftInteger
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'tblSvSpsPlaceIndex1'
        Fields = 'KdObj'
        Options = [ixPrimary]
      end>
    StoreDefs = True
    TableName = 'SpsPlace'
    Left = 24
    Top = 352
  end
  object popMY: TPopupMenu
    Alignment = paCenter
    OnPopup = popMYPopup
    Left = 88
    Top = 24
    object popMyWorkMY: TMenuItem
      Caption = #1042' '#1088#1072#1073#1086#1095#1080#1081' '#1084#1077#1089#1103#1094
      OnClick = popMyWorkMYClick
    end
    object popMyChangeMY: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
      OnClick = popMyChangeMYClick
    end
  end
  object qryObj: TQuery
    CachedUpdates = True
    BeforeScroll = qryObjBeforeScroll
    AfterScroll = qryObjAfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select ko.NR, ko.KDOBJ, ko.SHOBJ, ko.NMOBJ, ko.AINDX, ko.PINDX, '
      
        '          ko.LVL, ko.INDX, ko.HSCH, ko.SZATR, ko.SBU, ko.KDUPOS,' +
        ' '
      '          ko.KASSA, ko.FIOUPOLN, Count(sps.NR) '
      'from z_KdObj ko, z_Sps sps'
      'where (sps.KdObj = ko.KdObj) and (sps.DtProc = '#39'05/01/2004'#39')'
      
        'group by ko.NR, ko.KDOBJ, ko.SHOBJ, ko.NMOBJ, ko.AINDX, ko.PINDX' +
        ', '
      
        '               ko.LVL, ko.INDX, ko.HSCH, ko.SZATR, ko.SBU, ko.KD' +
        'UPOS, '
      '               ko.KASSA, ko.FIOUPOLN'
      'order by ko.Aindx')
    UpdateObject = updObj
    Left = 94
    Top = 114
    object qryObjNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDOBJ.NR'
    end
    object qryObjKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_KDOBJ.KDOBJ'
    end
    object qryObjKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryObjSHOBJ: TStringField
      FieldName = 'SHOBJ'
      Origin = 'DbMain.Z_KDOBJ.SHOBJ'
      Size = 15
    end
    object qryObjNMOBJ: TStringField
      FieldName = 'NMOBJ'
      Origin = 'DbMain.Z_KDOBJ.NMOBJ'
      Size = 65
    end
    object qryObjAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.Z_KDOBJ.AINDX'
    end
    object qryObjPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.Z_KDOBJ.PINDX'
    end
    object qryObjLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.Z_KDOBJ.LVL'
    end
    object qryObjINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.Z_KDOBJ.INDX'
    end
    object qryObjHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.Z_KDOBJ.HSCH'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    OnDataChange = dsrcObjDataChange
    Left = 102
    Top = 122
  end
  object updObj: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KdObj'
      'set'
      '  KDOBJ = :KDOBJ,'
      '  SHOBJ = :SHOBJ,'
      '  NMOBJ = :NMOBJ,'
      '  AINDX = :AINDX,'
      '  PINDX = :PINDX,'
      '  LVL = :LVL,'
      '  INDX = :INDX,'
      '  HSCH = :HSCH,'
      '  SZATR = :SZATR,'
      '  SBU = :SBU,'
      '  KDUPOS = :KDUPOS,'
      '  KASSA = :KASSA,'
      '  FIOUPOLN = :FIOUPOLN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KdObj'
      
        '  (KDOBJ, SHOBJ, NMOBJ, AINDX, PINDX, LVL, INDX, HSCH, SZATR, SB' +
        'U, '
      'KDUPOS, '
      '   KASSA, FIOUPOLN)'
      'values'
      
        '  (:KDOBJ, :SHOBJ, :NMOBJ, :AINDX, :PINDX, :LVL, :INDX, :HSCH, :' +
        'SZATR, '
      '   :SBU, :KDUPOS, :KASSA, :FIOUPOLN)')
    DeleteSQL.Strings = (
      'delete from Z_KdObj'
      'where'
      '  NR = :OLD_NR')
    Left = 110
    Top = 130
  end
  object popTvObj: TPopupMenu
    Alignment = paCenter
    OnPopup = popTvObjPopup
    Left = 56
    Top = 56
    object popTvObjSchetCurrent: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1090#1086#1082#1086#1084' '#1090#1077#1082#1091#1097#1077#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      OnClick = popSpsRaschetPotokomCurObjClick
    end
    object popTvObjSchetAll: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1074#1089#1077#1093' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1087#1086#1090#1086#1082#1086#1084' '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnClick = popSpsRaschetPotokomAllSpsClick
    end
    object popTvObjSchetAllFromCurrent: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1090#1077#1082#1091#1097#1077#1075#1086
      Hint = #1056#1072#1089#1095#1077#1090' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1076#1086' '#1082#1086#1085#1094#1072' '#1089#1087#1080#1089#1082#1072
      OnClick = popSpsAllSpslFromCurrentObjClick
    end
    object popTvObjSep1: TMenuItem
      Caption = '-'
    end
    object popTvObjFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvObjFullExpandClick
    end
    object popTvObjFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTvObjFullCollapseClick
    end
    object popTvObjVidTV: TMenuItem
      Caption = #1042#1080#1076' '#1076#1077#1088#1077#1074#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Visible = False
      object popTvObjVidAll: TMenuItem
        Caption = '- '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Checked = True
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        OnClick = popTvObjVidAllClick
      end
      object popTvObjVidOnly: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1080#1084#1077#1102#1097#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074' '#1089#1087#1080#1089#1082#1077
        Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1080#1084#1077#1102#1097#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074' '#1089#1087#1080#1089#1082#1077
        OnClick = popTvObjVidOnlyClick
      end
    end
    object popTvYourPeoples: TMenuItem
      Caption = #1042#1072#1096#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080
      Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1077' '#1074' '#1076#1086#1089#1090#1091#1087#1085#1099#1077' '#1042#1072#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '
      OnClick = popTvYourPeoplesClick
    end
    object popObjPoisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077
      ShortCut = 114
      OnClick = popSpsPoisk2Click
    end
    object popObjGoToObj: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' ...'
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      ShortCut = 16464
      OnClick = LabelTvObjDblClick
    end
    object popTvObjSep2: TMenuItem
      Caption = '-'
    end
    object popObjFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popObjFonClick
    end
    object popTvObjSep3: TMenuItem
      Caption = '-'
    end
    object popTvObjPrt: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      object popTvObjPrtCntByObj: TMenuItem
        Caption = '- '#1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1100' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
        Hint = #1055#1077#1095#1072#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1086' '#1095#1080#1089#1083#1077#1085#1085#1086#1089#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
        OnClick = popTvObjPrtCntByObjClick
      end
      object popTvObjPrtSpsCurObj: TMenuItem
        Caption = '- '#1089#1087#1080#1089#1086#1082' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        OnClick = popTvObjPrtSpsCurObjClick
      end
    end
    object popTvObjF9: TMenuItem
      Caption = #1056#1072#1072#1089#1095#1105#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' (no Visible)'
      ShortCut = 120
      Visible = False
      OnClick = popTvObjF9Click
    end
  end
  object tblTmp: TTable
    Left = 528
    Top = 272
  end
  object SaveDialog: TSaveDialog
    Left = 56
    Top = 176
  end
  object qryNu2: TQuery
    OnCalcFields = qryNu2CalcFields
    DatabaseName = 'DbMain'
    DataSource = DsrcSps
    SQL.Strings = (
      'Select KdSps, ZaMesGod, VidN, ShVidN, PSch, SchBU, PdN,'
      '  Min(Dt_Beg) as Dt_Beg, Max(Dt_End) as Dt_End,'
      '  Sum(Chas) as Chas, '
      '  Sum(Cast(Summa as Numeric (16,2))) as Summa,'
      '  Count(NR) as CNT'
      'from vinuMain'
      'where DtProc = '#39'12/01/2007'#39' and TabN = 1239 and (VidN < "8600")'
      'group by KdSps, ZaMesGod, VidN, ShVidN, PSch, SchBU, PdN'
      'having (Sum(Cast(Summa as Numeric (16,2))) > 0.001) or'
      '       (Sum(Cast(Summa as Numeric (16,2))) < -0.001)')
    Left = 497
    Top = 309
    object qryNu2KDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object qryNu2ZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm-yy'
    end
    object qryNu2VIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 3
    end
    object qryNu2SHVIDN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNu2SCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryNu2PSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object qryNu2DT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
    end
    object qryNu2DT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object qryNu2CHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object qryNu2SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '# ###.00'
    end
    object qryNu2PDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryNu2SmN: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmN'
      DisplayFormat = '# ###.00'
      Calculated = True
    end
    object qryNu2SmU: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmU'
      DisplayFormat = '# ###.00'
      Calculated = True
    end
    object qryNu2CNT: TIntegerField
      DisplayLabel = #1050'.'#1074#1086#1047#1072#1087
      FieldName = 'CNT'
    end
  end
  object dsrcNu2: TDataSource
    DataSet = qryNu2
    Left = 512
    Top = 328
  end
  object popNu2: TPopupMenu
    Alignment = paCenter
    OnPopup = popNu2Popup
    Left = 624
    Top = 272
    object popNu2Head: TMenuItem
      Caption = '== '#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1083#1080#1089#1090#1086#1082' =='
      Enabled = False
      OnClick = popSpsHiNUClick
    end
    object popNu2RschNewWithDbg: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089' DBG ('#1085#1086#1074#1072#1103' '#1089#1093#1077#1084#1072')'
    end
    object popNu2Raschet: TMenuItem
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ShortCut = 120
      OnClick = popOtklNewRaschetClick
    end
    object PopNu2PrintEmplCalc: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1083#1080#1089#1090#1082#1072
      GroupIndex = 1
      ShortCut = 16502
      OnClick = PrintEmplCalc
    end
    object popNu2PastMonths: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1084#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      GroupIndex = 1
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1079#1072' '#1076#1088#1091#1075#1080#1077' '#1084#1077#1089#1103#1094#1099
      OnClick = popSpsHiNUClick
    end
    object popNu2MyCheckNU: TMenuItem
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      GroupIndex = 2
      Hint = 
        #1055#1088#1086#1074#1077#1088#1082#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080' '#1074#1079#1085#1086#1089#1086#1074' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099 +
        #1081' '#1084#1077#1089#1103#1094
      OnClick = mmMyCheckNUClick
    end
    object popNu2Sep1: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNu2Shw: TMenuItem
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' ...'
      GroupIndex = 2
      object NShwNuDetail2: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1086#1073#1085#1086
        Checked = True
        OnClick = ChngNuModeClick
      end
      object NShwNuCondens2: TMenuItem
        Caption = '- '#1089#1074#1077#1088#1085#1091#1090#1086
        OnClick = ChngNuModeClick
      end
    end
    object popNu2VidSumm: TMenuItem
      Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1084#1084
      GroupIndex = 2
      Hint = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1091#1084#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      object popNu2VidSummOne: TMenuItem
        Caption = '- '#1074' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077
        Checked = True
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1086#1076#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' ('#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1084#1080#1085#1091#1089#1086#1084')'
        OnClick = popNu2VidSummOneClick
      end
      object popNu2VidSummTwo: TMenuItem
        Caption = '- '#1074' '#1076#1074#1091#1093' '#1082#1086#1083#1086#1085#1082#1072#1093
        Hint = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1074' '#1088#1072#1079#1085#1099#1093' '#1082#1086#1083#1086#1085#1082#1072#1093
        OnClick = popNu2VidSummTwoClick
      end
    end
    object popNu2Sort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      GroupIndex = 2
      object popNu2SortByVidN: TMenuItem
        AutoCheck = True
        Caption = #1055#1086' '#1087#1086#1083#1102' "'#1042#1080#1076'"'
        Checked = True
        GroupIndex = 7
        OnClick = ChangePmntsSort
      end
      object popNu2SortByZaMG: TMenuItem
        AutoCheck = True
        Caption = #1055#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094'"'
        GroupIndex = 7
        OnClick = ChangePmntsSort
      end
    end
    object popNu2SumBrush: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1091#1084#1084#1099' '#1089#1074#1077#1090#1083#1099#1084' '#1092#1086#1085#1086#1084
      Checked = True
      GroupIndex = 2
      OnClick = popNu2SumBrushClick
    end
    object popNu2Sep2: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNu2VidInfo: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074
      GroupIndex = 2
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1085#1072' '#1090#1077#1082#1091#1097#1077#1084' '#1074#1080#1076#1077
      ShortCut = 16470
      OnClick = popNu2VidInfoClick
    end
    object popNu2ShwSpecVids: TMenuItem
      Caption = #1042#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      Checked = True
      GroupIndex = 2
      Hint = #1055#1086#1082#1072#1079#1099#1074#1090#1100' '#1074#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      OnClick = popNuShwSpecVidsClick
    end
    object popNu2Poisk2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' (not visible)'
      GroupIndex = 2
      ShortCut = 16454
      Visible = False
      OnClick = popSpsPoisk2Click
    end
    object notvisible4: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' (not visible)'
      GroupIndex = 2
      ShortCut = 16464
      Visible = False
      OnClick = LabelTvObjDblClick
    end
    object popNu2Sep3: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object popNu2Fon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      GroupIndex = 2
      OnClick = popNu2FonClick
    end
  end
  object SocZp: TSocketConnection
    ServerGUID = '{775815FF-CE68-435D-9DA5-95ED7BD787DF}'
    ServerName = 'ezSrvZpl.srvZpl'
    Host = 's0b'
    Left = 465
    Top = 164
  end
  object cdsLogCS: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from DbLogCS '
    Params = <>
    ProviderName = 'dtsLogCS'
    RemoteServer = SocZp
    Left = 505
    Top = 164
  end
  object dsrcLogCS: TDataSource
    DataSet = cdsLogCS
    Left = 521
    Top = 180
  end
  object updSps: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Sps'
      'set'
      '  NCH = :NCH'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      '')
    Left = 56
    Top = 312
  end
  object qryTmp2: TQuery
    Left = 208
    Top = 352
  end
  object FontDialog1: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Accord SF'
    Font.Style = []
    MinFontSize = 8
    MaxFontSize = 12
    Options = [fdNoOEMFonts, fdNoVectorFonts, fdLimitSize, fdApplyButton]
    OnApply = FontDialog1Apply
    Left = 88
    Top = 176
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen, cdSolidColor]
    Left = 120
    Top = 176
  end
  object OpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' MS Excel|*.xls'
    Left = 24
    Top = 176
  end
  object ActionList: TActionList
    Left = 96
    Top = 56
    object ActSetCalcMnth: TAction
      Caption = '&'#1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1088#1072#1089#1095#1105#1090#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnExecute = ActSetCalcMnthExecute
      OnUpdate = ActSetCalcMnthUpdate
    end
  end
  object cdsKTn: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 311
    object cdsKTnNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsKTnTabN: TIntegerField
      FieldName = 'TabN'
    end
  end
  object PopupEmplInfo: TPopupMenu
    Left = 448
    object NEmplId: TMenuItem
      Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NEmplName: TMenuItem
      Caption = #1060'.'#1048'.'#1054
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NEmplSocial: TMenuItem
      Caption = #1048#1053#1053
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NSalary: TMenuItem
      Caption = #1054#1082#1083#1072#1076
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NBank: TMenuItem
      Caption = #1041#1072#1085#1082
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NBankAcc: TMenuItem
      Caption = #1057#1095#1105#1090
      Checked = True
      OnClick = NMnuEmpInfoClick
    end
    object NIndxExclState: TMenuItem
      Caption = #1048#1085#1076#1077#1082#1089#1072#1094#1080#1103' '#1047#1055
      OnClick = NIndxExclStateClick
    end
  end
end
