object FormVdIndD: TFormVdIndD
  Left = 191
  Top = 64
  Width = 1008
  Height = 594
  ActiveControl = dbgrHIndx
  BorderIcons = [biSystemMenu]
  Caption = 'FormVdIndD'
  Color = clBtnFace
  Constraints.MinHeight = 492
  Constraints.MinWidth = 652
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
  object Splitter1: TSplitter
    Left = 265
    Top = 31
    Height = 524
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      992
      31)
    object sBtnAdd: TSpeedButton
      Left = 109
      Top = 3
      Width = 71
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' "'#1090#1077#1082#1091#1097#1077#1081'" '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
      Caption = #1053#1086#1074#1099#1081
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
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnAddClick
    end
    object sBtnGoBack: TSpeedButton
      Left = 688
      Top = 3
      Width = 75
      Height = 25
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
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
      Visible = False
      OnClick = sBtnGoBackClick
    end
    object sBtnSave: TSpeedButton
      Left = 844
      Top = 3
      Width = 75
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1086#1079#1074#1088#1072#1090#1080#1090#1100#1089#1103
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1080#1089#1100
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
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sBtnSaveClick
    end
    object sBtnGo: TSpeedButton
      Left = 183
      Top = 3
      Width = 88
      Height = 25
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1102' '#1076#1086#1093#1086#1076#1086#1074
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      Enabled = False
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
      Spacing = 0
      OnClick = sBtnGoClick
    end
    object sBtnPrt: TSpeedButton
      Left = 766
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1072#1082#1077#1090#1072' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
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
      Visible = False
      OnClick = sBtnPrtClick
    end
    object LabelCntRec: TLabel
      Left = 282
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object sBtnTots: TSpeedButton
      Left = 610
      Top = 3
      Width = 75
      Height = 25
      Hint = #1055#1086#1076#1073#1080#1090#1100' '#1080' '#1087#1086#1082#1072#1079#1072#1090#1100' '#1080#1090#1086#1075#1080
      Anchors = [akTop, akRight]
      Caption = #1048#1090#1086#1075#1080
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnTotsClick
    end
    object LabelCountPkt: TLabel
      Left = 16
      Top = 8
      Width = 70
      Height = 13
      Caption = 'LabelCountPkt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bBtnClose: TBitBtn
      Left = 922
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkClose
      Spacing = 0
    end
  end
  object dbgrHIndx: TDBGrid
    Left = 0
    Top = 31
    Width = 265
    Height = 524
    Hint = 
      #1055#1072#1082#1077#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080'. '#1043#1086#1083#1091#1073#1099#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1087#1077#1088#1077#1089#1095#1105#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1081' ('#1077#1089#1083#1080' '#1077 +
      #1089#1090#1100') '
    Align = alLeft
    Color = clMoneyGreen
    DataSource = dsrcHIndx
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pop
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrHIndxDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NRVDPV'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTVDPV'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 30
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
        FieldName = 'UsrNotes'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMPROGMIN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INCLSOVM'
        Width = 20
        Visible = True
      end>
  end
  object PageControl: TPageControl
    Left = 268
    Top = 31
    Width = 724
    Height = 524
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 2
    OnResize = PageControlResize
    object ts1: TTabSheet
      Caption = 'ts1'
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 716
        Height = 493
        Hint = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072#1084' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        Align = alClient
        Color = clCream
        DataSource = dsrcOtkl
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrOtklDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDSPS'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 104
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 2
      object dbgrTmp: TDBGrid
        Left = 0
        Top = 0
        Width = 153
        Height = 493
        Hint = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1091#1084#1084' '#1076#1086#1093#1086#1076#1086#1074' '#1076#1083#1103' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        Align = alLeft
        DataSource = dsrcTmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Title.Caption = #1058#1072#1073#1053#1088
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Title.Caption = #1057#1084#1044#1086#1093#1086#1076#1072
            Width = 76
            Visible = True
          end>
      end
      object dbgrP: TDBGrid
        Left = 153
        Top = 0
        Width = 563
        Height = 493
        Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1072#1089#1095#1077#1090#1072' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcP
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPDrawColumnCell
        OnDblClick = dbgrPDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            ReadOnly = True
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsMin'
            ReadOnly = True
            Width = 19
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastDtPrm'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastDtUv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNach'
            ReadOnly = True
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcWT'
            Title.Caption = '%_WT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToIndx'
            ReadOnly = True
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BazMes'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcInd'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmIndx'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmInOtkl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmInNU'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DeltaSM'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SumFact'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            ReadOnly = True
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            ReadOnly = True
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsSovm'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InSps'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            ReadOnly = True
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsCmbOkl'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            ReadOnly = True
            Width = 24
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object dbgrPRs: TDBGrid
        Left = 0
        Top = 0
        Width = 716
        Height = 493
        Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
        Align = alClient
        Color = 8250615
        DataSource = dsrcPRs
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = pop
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPRsDrawColumnCell
        OnDblClick = dbgrPRsDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            ReadOnly = True
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsMin'
            ReadOnly = True
            Width = 19
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastDtPrm'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNach'
            ReadOnly = True
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToIndx'
            ReadOnly = True
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BazMes'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PrcInd'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmIndx'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OldSmIndx'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmRazn'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            ReadOnly = True
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            ReadOnly = True
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsSovm'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'InSps'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            ReadOnly = True
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IsCmbOkl'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSps'
            ReadOnly = True
            Width = 23
            Visible = True
          end>
      end
    end
  end
  object PanelTots: TPanel
    Left = 491
    Top = 203
    Width = 225
    Height = 58
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clMoneyGreen
    TabOrder = 3
    Visible = False
    DesignSize = (
      225
      58)
    object sBtnPanelPTtHide: TSpeedButton
      Left = 193
      Top = 29
      Width = 28
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100
      Anchors = [akRight, akBottom]
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
      Spacing = 0
      OnClick = sBtnPanelPTtHideClick
    end
    object LabelSmTots: TLabel
      Left = 5
      Top = 10
      Width = 217
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1086#1075#1086': 12360.99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelCntTots: TLabel
      Left = 20
      Top = 33
      Width = 113
      Height = 13
      Alignment = taCenter
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074': 1234'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PanelTotsRPs: TPanel
    Left = 563
    Top = 363
    Width = 225
    Height = 75
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clMoneyGreen
    TabOrder = 4
    Visible = False
    DesignSize = (
      225
      75)
    object sBtnTotsRPs: TSpeedButton
      Left = 193
      Top = 46
      Width = 28
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100
      Anchors = [akRight, akBottom]
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
      Spacing = 0
      OnClick = sBtnTotsRPsClick
    end
    object LabelSmDoplat: TLabel
      Left = 5
      Top = 10
      Width = 217
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1076#1086#1087#1083#1072#1090': 12360.99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelCntRPs: TLabel
      Left = 20
      Top = 48
      Width = 113
      Height = 13
      Alignment = taCenter
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074': 1234'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSmUderg: TLabel
      Left = 5
      Top = 28
      Width = 217
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1091#1084#1084#1072' '#1091#1076#1077#1088#1078#1072#1085#1080#1081': 12360.99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qryHIndx: TQuery
    CachedUpdates = True
    AfterScroll = qryHIndxAfterScroll
    OnCalcFields = qryHIndxCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_HIndx')
    UpdateObject = updHIndx
    Left = 40
    Top = 144
    object qryHIndxNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_HINDX.NR'
    end
    object qryHIndxTIPPKT: TStringField
      FieldName = 'TIPPKT'
      Origin = 'DbMain.Z_HINDX.DTPROC'
      FixedChar = True
      Size = 5
    end
    object qryHIndxDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_HINDX.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryHIndxZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_HINDX.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryHIndxSMPROGMIN: TFloatField
      DisplayLabel = #1057#1084#1055#1088#1052#1080#1085
      FieldName = 'SMPROGMIN'
      Origin = 'DbMain.Z_HINDX.SMPROGMIN'
      DisplayFormat = '#.00'
    end
    object qryHIndxPRCINDX: TFloatField
      DisplayLabel = '% '#1080#1085#1076#1082#1089
      FieldName = 'PRCINDX'
      Origin = 'DbMain.Z_HINDX.PRCINDX'
    end
    object qryHIndxDTRPRMIN: TDateTimeField
      DisplayLabel = #1056#1077#1087#1077#1088#1044#1072#1090#1072#1044#1083#1103#1052#1080#1085#1080#1084#1072#1083#1100#1097#1080#1082#1086#1074
      FieldName = 'DTRPRMIN'
      Origin = 'DbMain.Z_HINDX.DTRPRMIN'
    end
    object qryHIndxINCLSOVM: TStringField
      DisplayLabel = #1057#1074#1084
      FieldName = 'INCLSOVM'
      Origin = 'DbMain.Z_HINDX.INCLSOVM'
      FixedChar = True
      Size = 1
    end
    object qryHIndxNRVDPV: TIntegerField
      DisplayLabel = #8470#1087#1082#1090
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_HINDX.NRVDPV'
    end
    object qryHIndxDTVDPV: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_HINDX.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryHIndxKDUSR: TSmallintField
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_HINDX.KDUSR'
    end
    object qryHIndxUsrNotes: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldKind = fkCalculated
      FieldName = 'UsrNotes'
      Size = 65
      Calculated = True
    end
  end
  object dsrcHIndx: TDataSource
    DataSet = qryHIndx
    OnDataChange = dsrcHIndxDataChange
    Left = 48
    Top = 152
  end
  object updHIndx: TUpdateSQL
    ModifySQL.Strings = (
      'update z_HIndx'
      'set'
      '  TIPPKT = :TIPPKT,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  SMPROGMIN = :SMPROGMIN,'
      '  PRCINDX = :PRCINDX,'
      '  DTRPRMIN = :DTRPRMIN,'
      '  INCLSOVM = :INCLSOVM,'
      '  NRVDPV = :NRVDPV,'
      '  DTVDPV = :DTVDPV,'
      '  KDUSR = :KDUSR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_HIndx'
      '  (TIPPKT, DTPROC, ZAMESGOD, SMPROGMIN, PRCINDX, DTRPRMIN, '
      'INCLSOVM, NRVDPV, '
      '   DTVDPV, KDUSR)'
      'values'
      
        '  (:TIPPKT, :DTPROC, :ZAMESGOD, :SMPROGMIN, :PRCINDX, :DTRPRMIN,' +
        ' '
      ':INCLSOVM, '
      '   :NRVDPV, :DTVDPV, :KDUSR)')
    DeleteSQL.Strings = (
      'delete from z_HIndx'
      'where'
      '  NR = :OLD_NR')
    Left = 56
    Top = 160
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 328
    Top = 280
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select TabN, Sum(Summa) as SMM from vinuMain'
      'where DtProc >= '#39'05/01/2005'#39' and ZaMesGod = '#39'05/01/2006'#39' and '
      '           VidN < '#39'6000'#39' and Ind = '#39'1'#39
      'group by TabN')
    Left = 296
    Top = 98
    object qryTmpTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryTmpSMM: TFloatField
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = qryTmp
    Left = 312
    Top = 112
  end
  object qryPere: TQuery
    Left = 504
    Top = 130
  end
  object cdsP: TClientDataSet
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
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'SmNach'
        DataType = ftFloat
      end
      item
        Name = 'SmBM'
        DataType = ftFloat
      end
      item
        Name = 'DeltaSM'
        DataType = ftFloat
      end
      item
        Name = 'SmToIndx'
        DataType = ftFloat
      end
      item
        Name = 'BazMes'
        DataType = ftDate
      end
      item
        Name = 'PrcInd'
        DataType = ftFloat
      end
      item
        Name = 'PrSmInd'
        DataType = ftFloat
      end
      item
        Name = 'SmIndx'
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
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'LastDtPrm'
        DataType = ftDate
      end
      item
        Name = 'IsCmbOkl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InSps'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsSovm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsMin'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SumFact'
        DataType = ftFloat
      end
      item
        Name = 'LastDtUv'
        DataType = ftDate
      end
      item
        Name = 'SmInOtkl'
        DataType = ftFloat
      end
      item
        Name = 'SmInNU'
        DataType = ftFloat
      end
      item
        Name = 'PrcWT'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 880
    Top = 240
    object cdsPNR: TAutoIncField
      DisplayLabel = #8470
      FieldName = 'NR'
    end
    object cdsPTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TabN'
    end
    object cdsPPrcWT: TFloatField
      FieldName = 'PrcWT'
    end
    object cdsPBazMes: TDateField
      DisplayLabel = #1041#1072#1079#1052#1077#1089
      FieldName = 'BazMes'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsPFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsPKdSps: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KdSps'
    end
    object cdsPKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsPKdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KdKatP'
    end
    object cdsPSmBM: TFloatField
      DisplayLabel = #1057#1084#1041#1052
      FieldName = 'SmBM'
      DisplayFormat = '#.00'
    end
    object cdsPSmNach: TFloatField
      DisplayLabel = #1057#1084#1044#1093#1076
      FieldName = 'SmNach'
      DisplayFormat = '#.00'
    end
    object cdsPSmToIndx: TFloatField
      DisplayLabel = #1057#1084#1050#1048#1085#1076
      FieldName = 'SmToIndx'
      DisplayFormat = '#.00'
    end
    object cdsPPrSmInd: TFloatField
      DisplayLabel = #1055#1088#1057#1084#1048#1085#1076#1082#1089
      FieldName = 'PrSmInd'
    end
    object cdsPDeltaSM: TFloatField
      DisplayLabel = #1044'_'#1057#1084
      FieldName = 'DeltaSM'
      DisplayFormat = '#.00'
    end
    object cdsPPrcInd: TFloatField
      DisplayLabel = '%'#1080#1085#1076#1082#1089
      FieldName = 'PrcInd'
    end
    object cdsPSmIndx: TFloatField
      DisplayLabel = #1057#1084#1048#1085#1076
      FieldName = 'SmIndx'
      DisplayFormat = '#.00'
    end
    object cdsPLastDtPrm: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'LastDtPrm'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPLastDtUv: TDateField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1085
      FieldName = 'LastDtUv'
    end
    object cdsPIsSovm: TStringField
      DisplayLabel = #1057#1074#1084
      FieldName = 'IsSovm'
      Size = 1
    end
    object cdsPInSps: TStringField
      DisplayLabel = #1042#1057#1087#1080#1089#1082#1077
      FieldName = 'InSps'
      Size = 1
    end
    object cdsPIsCmbOkl: TStringField
      DisplayLabel = #1050#1084#1073#1054#1082#1083
      FieldName = 'IsCmbOkl'
      Size = 1
    end
    object cdsPIsMin: TStringField
      FieldName = 'IsMin'
      Size = 1
    end
    object cdsPKdSpZ: TSmallintField
      DisplayLabel = #1050#1076#1064#1087#1047
      FieldName = 'KdSpZ'
    end
    object cdsPSumFact: TFloatField
      FieldName = 'SumFact'
    end
    object cdsPSmInOtkl: TFloatField
      DisplayLabel = #1042#1054#1090#1082#1083#1057#1084
      FieldName = 'SmInOtkl'
      DisplayFormat = '0.00'
    end
    object cdsPSmInNU: TFloatField
      DisplayLabel = #1042'NU_'#1057#1084
      FieldName = 'SmInNU'
      DisplayFormat = '0.00'
    end
  end
  object dsrcP: TDataSource
    DataSet = cdsP
    Left = 896
    Top = 256
  end
  object qryUpi: TQuery
    Left = 440
    Top = 130
  end
  object qrySps: TQuery
    Left = 584
    Top = 130
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 176
    Top = 114
    object popTotals: TMenuItem
      Caption = #1048#1090#1086#1075#1080
      OnClick = popTotalsClick
    end
    object popSortOtkl: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortOtklObjFIO: TMenuItem
        Caption = '- '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        Checked = True
        OnClick = popSortOtklObjFIOClick
      end
      object popSortOtklFIO: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSortOtklFIOClick
      end
      object popSortOtklTabN: TMenuItem
        Caption = '- '#1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
        OnClick = popSortOtklTabNClick
      end
      object popSortOtklSmIndx: TMenuItem
        Caption = '- '#1053#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
        OnClick = popSortOtklSmIndxClick
      end
    end
    object popSortP: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popSortPObjFIO: TMenuItem
        Caption = '- '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        Checked = True
        OnClick = popSortPObjFIOClick
      end
      object popSortPFIO: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSortPFIOClick
      end
      object popSortPTabN: TMenuItem
        Caption = '- '#1058#1072#1073#1077#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
        OnClick = popSortPTabNClick
      end
      object popSortPSmIndx: TMenuItem
        Caption = '- '#1053#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
        OnClick = popSortPSmIndxClick
      end
    end
    object popNewPaket: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
      OnClick = sBtnAddClick
    end
    object popDelPaket: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnClick = popDelPaketClick
    end
    object popCheckPaket: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1072#1082#1077#1090#1072
      Hint = 
        #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1072#1082#1077#1090#1072' '#1087#1086' '#1085#1086#1074#1086#1084#1091' '#1072#1083#1075#1086#1088#1080#1090#1084#1091' (07-2012) '#1089' '#1074#1099#1076#1072#1095 +
        #1077#1081' '#1088#1072#1079#1085#1080#1094#1099
      OnClick = popCheckPaketClick
    end
    object popDopVi: TMenuItem
      Caption = ' '#1055#1086#1076#1075#1083#1103#1076#1077#1090#1100' '#1074' ...'
      Visible = False
      object popDopViPere: TMenuItem
        Caption = '- '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        OnClick = popDopViPereClick
      end
      object popDopViNadb: TMenuItem
        Caption = '- '#1085#1072#1076#1073#1072#1074#1082#1080
        OnClick = popDopViNadbClick
      end
      object popDopViNU: TMenuItem
        Caption = '- '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        OnClick = popDopViNUClick
      end
    end
    object TMenuItem
    end
  end
  object qryOtkl: TQuery
    OnCalcFields = cdsOtklCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select u.Fam, u.Ima, u.Otch, o.* '
      'from viOtkl o Left Outer Join z_Upi u on u.TabN = o.TabN'
      ' where o.DtProc = '#39'02/01/2008'#39' and o.VidN in ('#39'2406'#39','#39'2411'#39')')
    Left = 312
    Top = 266
    object qryOtklFAM: TStringField
      FieldName = 'FAM'
    end
    object qryOtklIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtklOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryOtklFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryOtklSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryOtklCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryOtklDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
    end
  end
  object qryPrmUv: TQuery
    Left = 472
    Top = 130
  end
  object qryNadb: TQuery
    Left = 624
    Top = 130
  end
  object qryDPere: TQuery
    Left = 536
    Top = 130
  end
  object qryCmbOkl: TQuery
    Left = 664
    Top = 130
  end
  object qry1: TQuery
    Left = 24
    Top = 376
  end
  object qry2: TQuery
    Left = 56
    Top = 376
  end
  object qryMyTmp: TQuery
    Left = 168
    Top = 200
  end
  object cdsDbg: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'LastPrm'
        DataType = ftDate
      end
      item
        Name = 'Da'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'SmOklNdbIndM'
        DataType = ftFloat
      end
      item
        Name = 'SmToIndx'
        DataType = ftFloat
      end
      item
        Name = 'DtBM'
        DataType = ftDate
      end
      item
        Name = 'DtRprMin'
        DataType = ftDate
      end
      item
        Name = 'SmOklNdbBM'
        DataType = ftFloat
      end
      item
        Name = 'SmProgMin'
        DataType = ftFloat
      end
      item
        Name = 'SmMinZpBM'
        DataType = ftFloat
      end
      item
        Name = 'PrcIndBM'
        DataType = ftFloat
      end
      item
        Name = 'PredpSmInd'
        DataType = ftFloat
      end
      item
        Name = 'SmDelta'
        DataType = ftFloat
      end
      item
        Name = 'SmIndx'
        DataType = ftFloat
      end
      item
        Name = 'IsMin'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 712
    Top = 298
    object cdsDbgNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDbgLastPrm: TDateField
      FieldName = 'LastPrm'
    end
    object cdsDbgDa: TStringField
      FieldName = 'Da'
      Size = 3
    end
    object cdsDbgTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsDbgSmOklNdbIndM: TFloatField
      FieldName = 'SmOklNdbIndM'
    end
    object cdsDbgSmToIndx: TFloatField
      FieldName = 'SmToIndx'
    end
    object cdsDbgDtBM: TDateField
      FieldName = 'DtBM'
    end
    object cdsDbgDtRprMin: TDateField
      FieldName = 'DtRprMin'
    end
    object cdsDbgSmOklNdbBM: TFloatField
      FieldName = 'SmOklNdbBM'
    end
    object cdsDbgSmProgMin: TFloatField
      FieldName = 'SmProgMin'
    end
    object cdsDbgSmMinZpBM: TFloatField
      FieldName = 'SmMinZpBM'
    end
    object cdsDbgPrcIndBM: TFloatField
      FieldName = 'PrcIndBM'
    end
    object cdsDbgPredpSmInd: TFloatField
      FieldName = 'PredpSmInd'
    end
    object cdsDbgSmDelta: TFloatField
      FieldName = 'SmDelta'
    end
    object cdsDbgSmIndx: TFloatField
      FieldName = 'SmIndx'
    end
    object cdsDbgIsMin: TStringField
      FieldName = 'IsMin'
      Size = 1
    end
  end
  object qryBM: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrcIndx where IndMes = '#39'03/01/2012'#39
      'order by BazMes')
    Left = 496
    Top = 266
    object qryBMNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRCINDX.NR'
    end
    object qryBMINDMES: TDateTimeField
      FieldName = 'INDMES'
      Origin = 'DbMain.Z_PRCINDX.INDMES'
    end
    object qryBMBAZMES: TDateTimeField
      FieldName = 'BAZMES'
      Origin = 'DbMain.Z_PRCINDX.BAZMES'
    end
    object qryBMPRCIND: TFloatField
      FieldName = 'PRCIND'
      Origin = 'DbMain.Z_PRCINDX.PRCIND'
    end
    object qryBMLASTDTBM: TDateTimeField
      FieldName = 'LASTDTBM'
      Origin = 'DbMain.Z_PRCINDX.LASTDTBM'
    end
  end
  object qryProgMin: TQuery
    Left = 152
    Top = 376
  end
  object qryPrcInd: TQuery
    Left = 184
    Top = 376
  end
  object cdsBM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    Left = 544
    Top = 266
    object cdsBMNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRCINDX.NR'
    end
    object cdsBMINDMES: TDateTimeField
      FieldName = 'INDMES'
      Origin = 'DbMain.Z_PRCINDX.INDMES'
    end
    object cdsBMBAZMES: TDateTimeField
      FieldName = 'BAZMES'
      Origin = 'DbMain.Z_PRCINDX.BAZMES'
    end
    object cdsBMPRCIND: TFloatField
      FieldName = 'PRCIND'
      Origin = 'DbMain.Z_PRCINDX.PRCIND'
    end
    object cdsBMLASTDTBM: TDateTimeField
      FieldName = 'LASTDTBM'
      Origin = 'DbMain.Z_PRCINDX.LASTDTBM'
    end
  end
  object dspTmp: TDataSetProvider
    DataSet = qryBM
    Left = 504
    Top = 274
  end
  object cdsPRs: TClientDataSet
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
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'SmNach'
        DataType = ftFloat
      end
      item
        Name = 'SmBM'
        DataType = ftFloat
      end
      item
        Name = 'DeltaSM'
        DataType = ftFloat
      end
      item
        Name = 'SmToIndx'
        DataType = ftFloat
      end
      item
        Name = 'BazMes'
        DataType = ftDate
      end
      item
        Name = 'PrcInd'
        DataType = ftFloat
      end
      item
        Name = 'PrSmInd'
        DataType = ftFloat
      end
      item
        Name = 'SmIndx'
        DataType = ftFloat
      end
      item
        Name = 'OldSmIndx'
        DataType = ftFloat
      end
      item
        Name = 'SmRazn'
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
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'LastDtPrm'
        DataType = ftDate
      end
      item
        Name = 'IsCmbOkl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'InSps'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsSovm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IsMin'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 344
    object cdsPRsNR: TAutoIncField
      DisplayLabel = #8470
      FieldName = 'NR'
    end
    object cdsPRsTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TabN'
    end
    object cdsPRsBazMes: TDateField
      DisplayLabel = #1041#1072#1079#1052#1077#1089
      FieldName = 'BazMes'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsPRsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsPRsKdSps: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KdSps'
    end
    object cdsPRsKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsPRsKdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KdKatP'
    end
    object cdsPRsSmBM: TFloatField
      DisplayLabel = #1057#1084#1041#1052
      FieldName = 'SmBM'
      DisplayFormat = '#.00'
    end
    object cdsPRsSmNach: TFloatField
      DisplayLabel = #1057#1084#1044#1093#1076
      FieldName = 'SmNach'
      DisplayFormat = '#.00'
    end
    object cdsPRsSmToIndx: TFloatField
      DisplayLabel = #1057#1084#1050#1048#1085#1076
      FieldName = 'SmToIndx'
      DisplayFormat = '#.00'
    end
    object cdsPRsPrSmInd: TFloatField
      DisplayLabel = #1055#1088#1057#1084#1048#1085#1076#1082#1089
      FieldName = 'PrSmInd'
    end
    object cdsPRsDeltaSm: TFloatField
      DisplayLabel = #1044'_'#1057#1084
      FieldName = 'DeltaSM'
      DisplayFormat = '#.00'
    end
    object cdsPRsPrcInd: TFloatField
      DisplayLabel = '%'#1080#1085#1076#1082#1089
      FieldName = 'PrcInd'
    end
    object cdsPRsSmIndx: TFloatField
      DisplayLabel = #1057#1084#1048#1085#1076
      FieldName = 'SmIndx'
      DisplayFormat = '#.00'
    end
    object cdsPRsOldSmIndx: TFloatField
      DisplayLabel = #1057#1090#1072#1088#1072#1103#1057#1084#1048#1085#1076#1082#1089
      FieldName = 'OldSmIndx'
      DisplayFormat = '#.00'
    end
    object cdsPRsSmRazn: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072
      FieldName = 'SmRazn'
      DisplayFormat = '#.00'
    end
    object cdsPRsLastDtPrm: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'LastDtPrm'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPRsIsSovm: TStringField
      DisplayLabel = #1057#1074#1084
      FieldName = 'IsSovm'
      Size = 1
    end
    object cdsPRsInSps: TStringField
      DisplayLabel = #1042#1057#1087#1080#1089#1082#1077
      FieldName = 'InSps'
      Size = 1
    end
    object cdsPRsIsCmbOkl: TStringField
      DisplayLabel = #1050#1084#1073#1054#1082#1083
      FieldName = 'IsCmbOkl'
      Size = 1
    end
    object cdsPRsIsMin: TStringField
      DisplayLabel = #1052#1084
      FieldName = 'IsMin'
      Size = 1
    end
    object cdsPRsKdSpZ: TSmallintField
      DisplayLabel = #1050#1076#1064#1087#1047
      FieldName = 'KdSpZ'
    end
  end
  object dsrcPRs: TDataSource
    DataSet = cdsPRs
    Left = 456
    Top = 360
  end
  object qryOldNU: TQuery
    Left = 504
    Top = 346
  end
  object qryNoIndx: TQuery
    Left = 88
    Top = 376
  end
  object qryInSps: TQuery
    Left = 24
    Top = 416
  end
  object qryGetBM: TQuery
    Left = 488
    Top = 458
  end
  object qryPredMes: TQuery
    Left = 712
    Top = 130
  end
  object qryInOtkl: TQuery
    Left = 80
    Top = 416
  end
  object qryInNU: TQuery
    Left = 112
    Top = 416
  end
  object qryWTB: TQuery
    Left = 848
    Top = 386
  end
  object qryPWT: TQuery
    Left = 944
    Top = 242
  end
end
