object FormVedV: TFormVedV
  Left = 207
  Top = 212
  Width = 1002
  Height = 619
  HelpContext = 2200
  ActiveControl = bBtnBack2
  BorderIcons = []
  Caption = 'FormVedV'
  Color = clBtnFace
  Constraints.MinHeight = 590
  Constraints.MinWidth = 795
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton
    Left = 80
    Top = 0
    Width = 23
    Height = 22
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 994
    Height = 592
    ActivePage = tsVedCmn
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    OnResize = PageControlResize
    object tsVeds: TTabSheet
      Caption = 'tsVeds'
      object Splitter1: TSplitter
        Left = 250
        Top = 57
        Height = 504
        Beveled = True
        Color = clTeal
        ParentColor = False
      end
      object LabelSortOtkl: TLabel
        Left = 0
        Top = 44
        Width = 64
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelSortOtkl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelFilterOtkl: TLabel
        Left = 0
        Top = 31
        Width = 83
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelFilterOtkl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object PanelLeft: TPanel
        Left = 0
        Top = 57
        Width = 250
        Height = 504
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'PanelLeft'
        Constraints.MaxWidth = 375
        Constraints.MinWidth = 250
        TabOrder = 0
        object LabelVedNr: TLabel
          Left = 0
          Top = 491
          Width = 56
          Height = 13
          Align = alBottom
          Alignment = taCenter
          Caption = 'LabelVedNr'
        end
        object LabelPSch: TLabel
          Left = 0
          Top = 0
          Width = 62
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'LabelPSch'
          Color = clCream
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbgrVed: TDBGrid
          Left = 0
          Top = 13
          Width = 250
          Height = 478
          Hint = #1042#1077#1076#1086#1084#1086#1089#1090#1080
          Align = alClient
          Color = clCream
          DataSource = dsrcVed
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          PopupMenu = popVed
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrVedDrawColumnCell
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'DTPROC'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NmUsr'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEDNR'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEDDATE'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPS'
              Width = 3
              Visible = True
            end>
        end
      end
      object PanelTools: TPanel
        Left = 0
        Top = 0
        Width = 986
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          986
          31)
        object sBtnAllMes: TSpeedButton
          Left = 3
          Top = 3
          Width = 96
          Height = 25
          Hint = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1079#1072' '#1074#1089#1077' '#1084#1077#1089#1103#1094#1099
          GroupIndex = 1
          Down = True
          Caption = #1042#1089#1077' '#1084#1077#1089#1103#1094#1099
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
            B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
            B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
            0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
            55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
            55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
            55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
            5555575FFF755555555557000075555555555577775555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnAllMesClick
        end
        object sBtnCurMes: TSpeedButton
          Left = 101
          Top = 3
          Width = 112
          Height = 25
          Hint = #1058#1086#1083#1100#1082#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
          GroupIndex = 1
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnCurMesClick
        end
        object sBtnPrt: TSpeedButton
          Left = 819
          Top = 3
          Width = 75
          Height = 25
          Hint = #1055#1077#1095#1072#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100
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
          OnClick = sBtnPrtClick
        end
        object sBtnApply: TSpeedButton
          Left = 541
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1085#1072' '#1076#1080#1089#1082
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1087#1080#1089#1100
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = sBtnApplyClick
        end
        object LabelCntOtklRec: TLabel
          Left = 334
          Top = 10
          Width = 81
          Height = 13
          Caption = 'LabelCntOtklRec'
        end
        object sBtnOtklTts: TSpeedButton
          Left = 660
          Top = 3
          Width = 70
          Height = 25
          Hint = #1057#1074#1086#1076#1082#1072' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Anchors = [akTop, akRight]
          Caption = #1057#1074#1086#1076#1082#1072
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = popOtklOtherClick
        end
        object sBtnCur_Pred: TSpeedButton
          Left = 215
          Top = 3
          Width = 112
          Height = 25
          Hint = #1058#1086#1083#1100#1082#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1080' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1077#1074
          GroupIndex = 1
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1080' '#1087#1088#1077#1076'.'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnCur_PredClick
        end
        object BitBtn1: TBitBtn
          Left = 901
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          OnClick = BitBtn1Click
          Kind = bkCancel
          Spacing = 0
        end
        object DBNavigator1: TDBNavigator
          Left = 732
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcOtkl
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
            'Insert record'
            'Delete record'
            'Edit record'
            'Post edit'
            'Cancel edit'
            'Refresh data')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object dbgrOtkl: TDBGrid
        Left = 253
        Top = 57
        Width = 733
        Height = 504
        Hint = #1047#1072#1087#1080#1089#1080' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
        Align = alClient
        Color = clCream
        DataSource = dsrcOtkl
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = popOtkl
        ShowHint = True
        TabOrder = 2
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
            Width = 15
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = 'TABN'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PDN'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDBNK'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LICSCH'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTBEG'
            Width = 60
            Visible = True
          end>
      end
    end
    object tsVedCmn: TTabSheet
      Caption = 'tsVedCmn'
      ImageIndex = 1
      object LabelDbg: TLabel
        Left = 0
        Top = 548
        Width = 986
        Height = 13
        Align = alBottom
        Caption = 'LabelDbg'
      end
      object LabelSortInfo: TLabel
        Left = 0
        Top = 31
        Width = 986
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelSortInfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object PanelTs2Tools: TPanel
        Left = 0
        Top = 0
        Width = 986
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          986
          31)
        object sBtnSaveVedCmn: TSpeedButton
          Left = 386
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072'  '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
          Caption = #1047#1072#1087#1080#1089#1100' ...'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 0
          OnClick = sBtnSaveVedCmnClick
        end
        object sBtnSpisok: TSpeedButton
          Left = 4
          Top = 3
          Width = 70
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1076#1083#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Caption = #1057#1087#1080#1089#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnSpisokClick
        end
        object sBtnSumKVupl: TSpeedButton
          Left = 76
          Top = 3
          Width = 85
          Height = 25
          Hint = 
            #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1091#1084#1084' '#1082' '#1074#1099#1087#1083#1072#1090#1077' '#1087#1086' '#1080#1084#1077#1102#1097#1080#1084#1089#1103' '#1079#1072#1087#1080#1089#1103#1084' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1085#1072#1095#1080#1089 +
            #1083#1077#1085#1080#1081
          Caption = #1050' '#1074#1099#1087#1083#1072#1090#1077
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
            000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
            99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
            0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
            FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
            0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
            000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
            00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
            00FF33337FFF7FF77733333300000000033F3333777777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnSumKVuplClick
        end
        object sBtnShwZadanie: TSpeedButton
          Left = 163
          Top = 3
          Width = 74
          Height = 25
          Hint = #1042#1074#1086#1076' '#1079#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1088#1072#1089#1095#1077#1090' '#1080' '#1088#1072#1089#1095#1077#1090' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1079#1072#1076#1072#1085#1080#1103
          Caption = #1047#1072#1076#1072#1085#1080#1077
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
            FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
            990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
            990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
            FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
            00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
            00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
            00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
            03FF33337FFF77777333333300000333333F3333777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnShwZadanieClick
        end
        object sBtnInfo: TSpeedButton
          Left = 313
          Top = 3
          Width = 70
          Height = 25
          Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Caption = #1057#1074#1086#1076#1082#1072
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnInfoClick
        end
        object LabelProcess: TLabel
          Left = 465
          Top = 10
          Width = 64
          Height = 13
          Caption = 'LabelProcess'
        end
        object LabelFilterBK: TLabel
          Left = 535
          Top = 10
          Width = 78
          Height = 13
          Caption = #1053#1086#1074#1072#1103' '#1089#1093#1077#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sBtnShwNU: TSpeedButton
          Left = 241
          Top = 3
          Width = 71
          Height = 25
          Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
          Caption = #1053#1095#1089#1083'/'#1059#1076
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
          Spacing = 0
          OnClick = popPvShwNUClick
        end
        object bBtnBack2: TBitBtn
          Left = 913
          Top = 3
          Width = 70
          Height = 25
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 0
          OnClick = bBtnBack2Click
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
          Spacing = 0
        end
        object DBNavigator3: TDBNavigator
          Left = 830
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcPV
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
            'Insert record'
            'Delete record'
            'Edit record'
            'Post edit'
            'Cancel edit'
            'Refresh data')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object dbgrPv: TDBGrid
        Left = 0
        Top = 44
        Width = 986
        Height = 504
        Align = alClient
        DataSource = dsrcPV
        PopupMenu = popPV
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPVDrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            ReadOnly = True
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NotInCurSps'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            ReadOnly = True
            Width = 34
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
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOsnV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmBoln'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmPrem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOtpTM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOtpBM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOtpNI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSocPsb'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNach'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmUdrg'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmVupl'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'K_t'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_OsnV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_Boln'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_Prem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_OtpTM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_OtpBM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_OtpNI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_SocPsb'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_Nach'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmRasch'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOper'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOst'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdBnk'
            ReadOnly = True
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS'
            ReadOnly = True
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmByTabN'
            Visible = True
          end>
      end
      object LbxObj: TListBox
        Left = 10
        Top = 330
        Width = 44
        Height = 50
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
      object LbxKatP: TListBox
        Left = 58
        Top = 330
        Width = 44
        Height = 50
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object PanelWait: TPanel
        Left = 248
        Top = 152
        Width = 185
        Height = 41
        Caption = #1046#1076#1080#1090#1077'...'
        Color = 11455158
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object PanelCustInput: TPanel
        Left = 544
        Top = 399
        Width = 223
        Height = 84
        BevelInner = bvLowered
        Color = clInfoBk
        TabOrder = 5
        Visible = False
        DesignSize = (
          223
          84)
        object Label1: TLabel
          Left = 10
          Top = 7
          Width = 208
          Height = 13
          Caption = #1042#1074#1086#1076' '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1086' '#1074' '#1090#1072#1073#1083#1080#1094#1091' !'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 143
          Top = 54
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          Spacing = 0
          OnClick = SpeedButton1Click
        end
        object Label2: TLabel
          Left = 6
          Top = 25
          Width = 212
          Height = 30
          Alignment = taCenter
          AutoSize = False
          Caption = #1042#1074#1086#1076#1080#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1090#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088'. '#1055#1086#1089#1083#1077' '#1074#1074#1086#1076#1072' '#1085#1072#1078#1080#1084#1072#1081#1090#1077' '#1082#1083#1072#1074#1080#1096#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label4: TLabel
          Left = 21
          Top = 51
          Width = 116
          Height = 29
          AutoSize = False
          Caption = '"'#1057#1090#1088#1077#1083#1086#1095#1082#1072' '#1074#1085#1080#1079'" '#1080#1083#1080' "'#1057#1090#1088#1077#1083#1086#1095#1082#1072' '#1074#1074#1077#1088#1093'".'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
      end
      object LbxIsTabN: TListBox
        Left = 10
        Top = 384
        Width = 44
        Height = 50
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        Sorted = True
        TabOrder = 6
        Visible = False
      end
      object LbxVids: TListBox
        Left = 58
        Top = 448
        Width = 44
        Height = 50
        Color = clAqua
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        Sorted = True
        TabOrder = 7
        Visible = False
      end
      object LbxNuObj: TListBox
        Left = 106
        Top = 448
        Width = 44
        Height = 50
        Color = clAqua
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        Sorted = True
        TabOrder = 8
        Visible = False
      end
      object LbxSchBU: TListBox
        Left = 10
        Top = 448
        Width = 44
        Height = 50
        Color = clAqua
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        Sorted = True
        TabOrder = 9
        Visible = False
      end
    end
    object tsVedDeti: TTabSheet
      Caption = 'tsVedDeti'
      ImageIndex = 2
      object LabelSortInfo3: TLabel
        Left = 0
        Top = 31
        Width = 63
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelSortInfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbgrDeti: TDBGrid
        Left = 0
        Top = 44
        Width = 986
        Height = 517
        Align = alClient
        DataSource = dsrcDeti
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 135
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
            FieldName = 'Sm1901'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm1909'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmNach'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmUdrg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmVupl'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_1901'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sm_1909'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmRasch'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOper'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmOst'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'K_t'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdBnk'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NotInCurSps'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmByTabN'
            Width = 48
            Visible = True
          end>
      end
      object PanelTsDetiTools: TPanel
        Left = 0
        Top = 0
        Width = 986
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          986
          31)
        object SpeedButton3: TSpeedButton
          Left = 152
          Top = 3
          Width = 70
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072't'
          Caption = #1047#1072#1087#1080#1089#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
        end
        object SpeedButton6: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1074#1086#1076' '#1079#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1088#1072#1089#1095#1077#1090' '#1080' '#1088#1072#1089#1095#1077#1090' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1079#1072#1076#1072#1085#1080#1103
          Caption = #1047#1072#1076#1072#1085#1080#1077
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
            FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
            990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
            990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
            FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
            00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
            00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
            00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
            03FF33337FFF77777333333300000333333F3333777773333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
        end
        object SpeedButton7: TSpeedButton
          Left = 81
          Top = 3
          Width = 70
          Height = 25
          Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Caption = #1057#1074#1086#1076#1082#1072
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
        end
        object LabelProcess3: TLabel
          Left = 230
          Top = 10
          Width = 64
          Height = 13
          Caption = 'LabelProcess'
        end
        object Label7: TLabel
          Left = 300
          Top = 10
          Width = 66
          Height = 13
          Caption = #1053#1086#1074#1072#1103' '#1089#1093#1077#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object bBtnBack3: TBitBtn
          Left = 1700
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 0
          OnClick = bBtnBack3Click
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
          Spacing = 0
        end
        object DBNavigator2: TDBNavigator
          Left = 1616
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcDeti
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
            'Insert record'
            'Delete record'
            'Edit record'
            'Post edit'
            'Cancel edit'
            'Refresh data')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
    object tsVedSpB: TTabSheet
      Caption = 'tsVedSpB'
      ImageIndex = 3
      object LabelSpbDbg: TLabel
        Left = 0
        Top = 548
        Width = 65
        Height = 13
        Align = alBottom
        Caption = 'LabelSpbDbg'
      end
      object dbgrSpB: TDBGrid
        Left = 0
        Top = 31
        Width = 986
        Height = 517
        Align = alClient
        Color = 11861218
        DataSource = dsrcSpB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = popSpB
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSpBDrawColumnCell
        OnDblClick = dbgrSpBDblClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtProc'
            Width = 52
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
            FieldName = 'FamIO'
            Width = 132
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
            FieldName = 'KdObj'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SpZ'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MaxSm'
            Width = 57
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SmToVed'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdBnk'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LS'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            Width = 62
            Visible = True
          end>
      end
      object PanelTsSpbTools: TPanel
        Left = 0
        Top = 0
        Width = 986
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          986
          31)
        object sBtnSpbSaveVed: TSpeedButton
          Left = 155
          Top = 3
          Width = 70
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1088#1072#1089#1095#1077#1090#1072't'
          Caption = #1047#1072#1087#1080#1089#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnSpbSaveVedClick
        end
        object sBtnSpbInfo: TSpeedButton
          Left = 84
          Top = 3
          Width = 70
          Height = 25
          Hint = #1055#1086#1083#1091#1095#1077#1085#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1081' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          Caption = #1057#1074#1086#1076#1082#1072
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
            33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
            FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
            FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
            FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
            FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
            FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
            3333333773FFFF77333333333FBFBF3333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnSpbInfoClick
        end
        object Label12: TLabel
          Left = 303
          Top = 10
          Width = 66
          Height = 13
          Caption = #1053#1086#1074#1072#1103' '#1089#1093#1077#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object bBtnSpbBack: TBitBtn
          Left = 1500
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 0
          OnClick = bBtnSpbBackClick
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
          Spacing = 0
        end
        object DBNavigator4: TDBNavigator
          Left = 2
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcSpB
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Hints.Strings = (
            #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
            'Insert record'
            'Delete record'
            'Edit record'
            'Post edit'
            'Cancel edit'
            'Refresh data')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object PanelInf2: TPanel
    Left = 472
    Top = 288
    Width = 284
    Height = 177
    BevelInner = bvLowered
    Color = clSkyBlue
    TabOrder = 1
    Visible = False
    DesignSize = (
      284
      177)
    object sBtnCloseInf2: TSpeedButton
      Left = 205
      Top = 149
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
      Spacing = 0
      OnClick = sBtnCloseInf2Click
    end
    object dbgrInf: TDBGrid
      Left = 2
      Top = 2
      Width = 280
      Height = 144
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clMoneyGreen
      DataSource = dsrcInf
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrInfDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NmBnk'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cnt'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Summa'
          Width = 91
          Visible = True
        end>
    end
  end
  object qryVed: TQuery
    CachedUpdates = True
    AfterPost = qryVedAfterPost
    AfterDelete = qryVedAfterDelete
    BeforeScroll = qryVedBeforeScroll
    AfterScroll = qryVedAfterScroll
    OnCalcFields = qryVedCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_VedNR'
      'order by DtProc, VedNR')
    UpdateObject = updVed
    Left = 32
    Top = 184
    object qryVedNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VEDNR.NR'
    end
    object qryVedDTPROC: TDateTimeField
      DisplayLabel = #1042' '#1084#1077#1089#1103#1094#1077
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VEDNR.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVedKDUSR: TSmallintField
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_VEDNR.KDUSR'
    end
    object qryVedNmUsr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldKind = fkCalculated
      FieldName = 'NmUsr'
      Calculated = True
    end
    object qryVedKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VEDNR.KDSPS'
    end
    object qryVedVEDNR: TIntegerField
      DisplayLabel = #1042#1077#1076#1053#1088
      FieldName = 'VEDNR'
      Origin = 'DbMain.Z_VEDNR.VEDNR'
    end
    object qryVedVEDDATE: TDateTimeField
      DisplayLabel = #1042#1077#1076#1044#1072#1090#1072
      FieldName = 'VEDDATE'
      Origin = 'DbMain.Z_VEDNR.VEDDATE'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVedTYPEVED: TStringField
      FieldName = 'TYPEVED'
      Origin = 'DbMain.Z_VEDNR.TYPEVED'
      FixedChar = True
      Size = 12
    end
    object qryVedNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VEDNR.NOTES'
      Size = 35
    end
    object qryVedPRPODKL: TSmallintField
      FieldName = 'PRPODKL'
      Origin = 'DbMain.Z_VEDNR.PRPODKL'
    end
    object qryVedBNKDTPRDF: TDateTimeField
      FieldName = 'BNKDTPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKDTPRDF'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVedBNKNRPRDF: TSmallintField
      FieldName = 'BNKNRPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNRPRDF'
    end
    object qryVedBNKNMPRDF: TStringField
      FieldName = 'BNKNMPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNMPRDF'
      Size = 65
    end
    object qryVedKSSVEDDT: TDateTimeField
      FieldName = 'KSSVEDDT'
      Origin = 'DbMain.Z_VEDNR.KSSVEDDT'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVedKSSVEDNR: TSmallintField
      FieldName = 'KSSVEDNR'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNR'
    end
    object qryVedKSSVEDNM: TStringField
      FieldName = 'KSSVEDNM'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNM'
      Size = 65
    end
  end
  object dsrcVed: TDataSource
    DataSet = qryVed
    OnDataChange = dsrcVedDataChange
    Left = 48
    Top = 200
  end
  object popVed: TPopupMenu
    OnPopup = popVedPopup
    Left = 32
    Top = 128
    object popHead: TMenuItem
      Caption = '==  '#1042' '#1077' '#1076' '#1086' '#1080' '#1086' '#1089' '#1090' '#1080'  =='
      Enabled = False
    end
    object popVedAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      Hint = #1053#1072#1095#1072#1090#1100' '#1087#1088#1086#1094#1077#1076#1091#1088#1091' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1085#1086#1074#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      OnClick = popVedAddClick
    end
    object popVedAddSpec: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1100'"'
      Hint = #1057#1086#1079#1076#1072#1090#1100' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1100'"'
      OnClick = popVedBnkAddSpecClick
    end
    object popVedAddTVP: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1074' '#1057#1057' '#1058#1042#1055
      Hint = #1053#1072' '#1074#1080#1076#1099' 2601, 2602, 2604'
      Visible = False
      OnClick = popVedAddTVPClick
    end
    object popVedAddNV: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1074' '#1057#1057' '#1053#1042
      Hint = #1053#1072' '#1074#1080#1076' 2605'
      Visible = False
      OnClick = popVedAddNVClick
    end
    object popVedDetiAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' "'#1076#1077#1090#1089#1082#1091#1102'"'
      Visible = False
      OnClick = popVedDetiAddClick
    end
    object popVedEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      OnClick = popVedEdtClick
    end
    object popVedDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' '#1080' '#1074#1089#1077' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      OnClick = popVedDelClick
    end
    object popVedSep1: TMenuItem
      Caption = '-'
    end
    object popVedFon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1094#1074#1077#1090#1072' '#1092#1086#1085#1072
      OnClick = popVedFonClick
    end
    object popVedFont: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1096#1088#1080#1092#1090#1072
      OnClick = popVedFontClick
    end
  end
  object qryOtkl: TQuery
    CachedUpdates = True
    AfterPost = qryOtklAfterPost
    AfterDelete = qryOtklAfterDelete
    OnCalcFields = qryOtklCalcFields
    OnNewRecord = qryOtklNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcVed
    SQL.Strings = (
      
        'Select bl.KdBnk, bl.LicSch, bl.SpB, bl.DtBeg, u.Fam, u.Ima, u.Ot' +
        'ch, u.ID, o.*'
      'from ViOtkl o Left outer join z_Upi u on u.TabN = o.TabN'
      
        '              Left outer join GETWRKBNKLS (o.TabN, o.DtProc) bl ' +
        'on 1 = 1 '
      'where o.DtProc = '#39'10/01/2006'#39' and'
      '  o.KdSps = 1 and o.NrVdPv = 227 and'
      '  o.VidN > "7500" and o.VidN < "7520" '
      'order by o.TabN ')
    UpdateObject = updOtkl
    Left = 104
    Top = 184
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIOTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIOTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.VIOTKL.DTPROC'
    end
    object qryOtklZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VIOTKL.ZAMESGOD'
    end
    object qryOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VIOTKL.TABN'
    end
    object qryOtklFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VIOTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.VIOTKL.CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VIOTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIOTKL.KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1072#1090#1055
      FieldName = 'KDKATP'
      Origin = 'DbMain.VIOTKL.KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VIOTKL.DT_BEG'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.VIOTKL.DT_END'
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.VIOTKL.PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1064#1055#1047
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIOTKL.KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      DisplayLabel = #1055#1057#1095
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.VIOTKL.NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VIOTKL.PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VIOTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VIOTKL.KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VIOTKL.PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VIOTKL.SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VIOTKL.DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VIOTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VIOTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VIOTKL.SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.VIOTKL.PBNK'
    end
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
    object qryOtklKDBNK: TSmallintField
      DisplayLabel = #1050#1076#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object qryOtklLICSCH: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1077#1090
      FieldName = 'LICSCH'
      Size = 29
    end
    object qryOtklDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1054#1090#1082#1088#1051#1057
      FieldName = 'DTBEG'
    end
    object qryOtklSPB: TStringField
      FieldName = 'SPB'
      Size = 1
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 120
    Top = 200
  end
  object updVed: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VedNR'
      'set'
      '  DTPROC = :DTPROC,'
      '  KDUSR = :KDUSR,'
      '  KDSPS = :KDSPS,'
      '  TYPEVED = :TYPEVED,'
      '  VEDNR = :VEDNR,'
      '  VEDDATE = :VEDDATE,'
      '  NOTES = :NOTES,'
      '  PRPODKL = :PRPODKL,'
      '  BNKNRPRDF = :BNKNRPRDF,'
      '  BNKDTPRDF = :BNKDTPRDF,'
      '  BNKNMPRDF = :BNKNMPRDF,'
      '  KSSVEDNR = :KSSVEDNR,'
      '  KSSVEDDT = :KSSVEDDT,'
      '  KSSVEDNM = :KSSVEDNM'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_VedNR'
      
        '  (DTPROC, KDUSR, KDSPS, TYPEVED, VEDNR, VEDDATE, NOTES, PRPODKL' +
        ', '
      'BNKNRPRDF, '
      '   BNKDTPRDF, BNKNMPRDF, KSSVEDNR, KSSVEDDT, KSSVEDNM)'
      'values'
      '  (:DTPROC, :KDUSR, :KDSPS, :TYPEVED, :VEDNR, :VEDDATE, :NOTES, '
      ':PRPODKL, '
      '   :BNKNRPRDF, :BNKDTPRDF, :BNKNMPRDF, :KSSVEDNR, :KSSVEDDT, '
      ':KSSVEDNM)')
    DeleteSQL.Strings = (
      'delete from z_VedNR'
      'where'
      '  NR = :OLD_NR')
    Left = 64
    Top = 216
  end
  object qryTmp: TQuery
    Left = 464
    Top = 120
  end
  object updOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Otkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  DTSTORN = :DTSTORN,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  PBNK = :PBNK,'
      '  STORN = :STORN,'
      '  KDBNK = :KDBNK'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Otkl'
      '  (KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, '
      'SUMMA, '
      
        '   OLDKDOBJ, KDOBJ, KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, P' +
        'RR, '
      'PRPV, '
      '   KTO, PRKR, SPEC_NR, DTVDPV, NRVDPV, MYNOTES, SPECPS, PBNK, '
      'STORN, KDBNK)'
      'values'
      '  (:KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, '
      
        '   :SUMMA, :OLDKDOBJ, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :' +
        'KDSPZ, '
      
        '   :NOTES, :PRR, :PRPV, :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV,' +
        ' '
      ':MYNOTES, '
      '   :SPECPS, :PBNK, :STORN, :KDBNK)')
    DeleteSQL.Strings = (
      'delete from Z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 136
    Top = 216
  end
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'select TabN, Cast('#39'OSNVID'#39' as char(6)) as TYPENU, Sum(Summa) as ' +
        'SMM'
      'from ViNu_Main where dtProc = '#39'04/01/2006'#39' and VidN < '#39'2200'#39
      'group by TabN'
      'UNION'
      
        'select TabN, Cast('#39'PREMII'#39' as char(6)) as TYPENU, Sum(Summa) as ' +
        'SMM'
      
        'from ViNu_Main where dtProc = '#39'04/01/2006'#39' and VidN > '#39'2200'#39' and' +
        ' VidN < '#39'2400'#39
      'group by TabN'
      'UNION'
      
        'select TabN, Cast('#39'OTPTMS'#39' as char(6)) as TYPENU, Sum(Summa) as ' +
        'SMM '
      
        'from ViNu_Main where dtProc = '#39'04/01/2006'#39' and VidN > '#39'2400'#39' and' +
        ' VidN < '#39'2600'#39
      'group by TabN'
      'UNION'
      
        'select TabN, Cast('#39'UDERG'#39' as char(6)) as TYPENU, Sum(Summa) as S' +
        'MM '
      
        'from ViNu_Main where dtProc = '#39'04/01/2006'#39' and VidN > '#39'6000'#39' and' +
        ' VidN < '#39'7500'#39
      'group by TabN'
      'UNION'
      
        'select TabN, Cast('#39'VUPL'#39' as char(6)) as TYPENU, Sum(Summa) as SM' +
        'M '
      
        'from ViNu_Main where dtProc = '#39'04/01/2006'#39' and VidN > '#39'7500'#39' and' +
        ' VidN < '#39'8000'#39
      'group by TabN')
    Left = 472
    Top = 224
  end
  object dsrcNU: TDataSource
    DataSet = qryNU
    Left = 480
    Top = 240
  end
  object qryRS: TQuery
    Left = 468
    Top = 168
  end
  object cdsPrt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrt'
    Left = 616
    Top = 176
  end
  object dspPrt: TDataSetProvider
    Left = 584
    Top = 176
  end
  object popPrt: TPopupMenu
    OnPopup = popPrtPopup
    Left = 848
    Top = 216
    object popPrtHeadKss: TMenuItem
      Caption = '= =  '#1042' '#1077' '#1076' '#1086' '#1084' '#1086' '#1089' '#1090' '#1080'   '#1074'    '#1082' '#1072' '#1089' '#1089' '#1091'  = ='
      Enabled = False
    end
    object popPrtKssOneVed: TMenuItem
      Caption = #1042' '#1082#1072#1089#1089#1091' '#1086#1076#1085#1086#1081' '#1086#1073#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
      OnClick = popPrtKssOneVedClick
    end
    object popPrtKss: TMenuItem
      Caption = #1042' '#1082#1072#1089#1089#1091' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
      Hint = 
        #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1074#1080#1076#1072' '#1089#1088#1077#1076#1089#1090#1074' ('#1089#1080#1085#1090#1077#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1095#1077 +
        #1090#1072')'
      object popPrtKssByObj: TMenuItem
        Caption = '- '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        OnClick = popPrtKssByObjClick
      end
      object popPrtKssByObjRee: TMenuItem
        Caption = '- '#1088#1077#1077#1089#1090#1088' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081
        OnClick = popPrtKssByObjReeClick
      end
      object popPrtKssByOtchet: TMenuItem
        Caption = '- '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
        OnClick = popPrtKssByOtchetClick
      end
    end
    object popPrtHeadBnk: TMenuItem
      Caption = '= = '#1042' '#1077' '#1076' '#1086' '#1084' '#1086' '#1089' '#1090' '#1080'   '#1074'   '#1073' '#1072' '#1085' '#1082' = ='
      Enabled = False
      Hint = #1054#1090#1076#1077#1083#1100#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    end
    object popPrtBnkOneVed: TMenuItem
      Caption = #1044#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1073#1072#1085#1082#1072' '#1086#1076#1085#1086#1081' '#1086#1073#1097#1077#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
      Hint = 
        #1044#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1073#1072#1085#1082#1072' '#1086#1076#1085#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1073#1077#1079' '#1076#1077#1083#1077#1085#1080#1103' '#1085#1072' '#1074#1080#1076#1099' '#1089#1088#1077#1076#1089#1090#1074' '#1080#1083#1080 +
        ' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'. '#1054#1076#1085#1086#1074#1088#1077#1084#1077#1085#1085#1086' '#1076#1077#1083#1072#1102#1090#1089#1103' '#1092#1072#1081#1083#1099' '#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1074' '#1073#1072#1085#1082#1080 +
        '.'
      OnClick = popPrtBnkOneVedClick
    end
    object popPrtBnkByObj: TMenuItem
      Caption = #1044#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1073#1072#1085#1082#1072' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
      Hint = 
        #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1089' '#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084'. '#1060#1072#1081#1083#1099' '#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1074' '#1073#1072#1085 +
        #1082#1080' '#1085#1077' '#1076#1077#1083#1072#1102#1090#1089#1103'.'
      OnClick = popPrtBnkByObjClick
    end
  end
  object cdsPV: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'SmOsnV'
        DataType = ftFloat
      end
      item
        Name = 'SmBoln'
        DataType = ftFloat
      end
      item
        Name = 'SmPrem'
        DataType = ftFloat
      end
      item
        Name = 'SmOtpTM'
        DataType = ftFloat
      end
      item
        Name = 'SmOtpBM'
        DataType = ftFloat
      end
      item
        Name = 'SmOtpNI'
        DataType = ftFloat
      end
      item
        Name = 'SmSocPsb'
        DataType = ftFloat
      end
      item
        Name = 'SmNach'
        DataType = ftFloat
      end
      item
        Name = 'SmUdrg'
        DataType = ftFloat
      end
      item
        Name = 'SmVupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_OsnV'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Boln'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Prem'
        DataType = ftFloat
      end
      item
        Name = 'Sm_OtpTM'
        DataType = ftFloat
      end
      item
        Name = 'Sm_OtpBM'
        DataType = ftFloat
      end
      item
        Name = 'Sm_OtpNI'
        DataType = ftFloat
      end
      item
        Name = 'Sm_SocPsb'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Nach'
        DataType = ftFloat
      end
      item
        Name = 'SmRasch'
        DataType = ftFloat
      end
      item
        Name = 'SmOper'
        DataType = ftFloat
      end
      item
        Name = 'SmOst'
        DataType = ftFloat
      end
      item
        Name = 'K_t'
        DataType = ftFloat
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'LS'
        DataType = ftString
        Size = 29
      end
      item
        Name = 'NotInCurSps'
        DataType = ftBoolean
      end
      item
        Name = 'SmByTabN'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsPvObjTabN'
        Fields = 'KdObj;TabN'
      end
      item
        Name = 'cdsPvObjFio'
        CaseInsFields = 'FamIO'
        Fields = 'KdObj;FamIO'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'cdsPvTabN'
        Fields = 'TabN'
      end
      item
        Name = 'cdsPvFio'
        CaseInsFields = 'FamIO'
        Fields = 'FamIO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    BeforeEdit = cdsPVBeforeEdit
    BeforePost = cdsPVBeforePost
    AfterPost = cdsPVAfterPost
    AfterDelete = cdsPVAfterDelete
    Left = 536
    Top = 224
    object cdsPVNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsPVTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
      OnSetText = cdsPVTabNSetText
    end
    object cdsPVKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cdsPVFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsPVKdKatP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      FieldName = 'KdKatP'
    end
    object cdsPVKdBnk: TSmallintField
      DisplayLabel = #1050#1076#1041#1085#1082
      FieldName = 'KdBnk'
    end
    object cdsPVLS: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1077#1090
      FieldName = 'LS'
      Size = 29
    end
    object cdsPVSmOsnV: TFloatField
      DisplayLabel = #1054#1089#1085#1042#1080#1076#1099#1053#1095
      FieldName = 'SmOsnV'
      DisplayFormat = '#.00'
    end
    object cdsPVSmBoln: TFloatField
      DisplayLabel = #1041#1086#1083#1100#1085#1080#1095#1085'.'
      FieldName = 'SmBoln'
      DisplayFormat = '#.00'
    end
    object cdsPVSmPrem: TFloatField
      DisplayLabel = #1055#1088#1077#1084#1080#1080#1053#1095
      FieldName = 'SmPrem'
      DisplayFormat = '#.00'
    end
    object cdsPVSmOtpTM: TFloatField
      DisplayLabel = #1054#1090#1087#1058#1052#1053#1095
      FieldName = 'SmOtpTM'
      DisplayFormat = '#.00'
    end
    object cdsPVSmOtpBM: TFloatField
      DisplayLabel = #1054#1090#1087#1041#1052#1053#1095
      FieldName = 'SmOtpBM'
      DisplayFormat = '#.00'
    end
    object cdsPVSmOtpNI: TFloatField
      DisplayLabel = #1054#1090#1087#1053#1048#1053#1095
      FieldName = 'SmOtpNI'
      DisplayFormat = '#.00'
    end
    object cdsPVSmSocPsb: TFloatField
      DisplayLabel = #1057#1086#1094#1055#1089#1073#1053#1095
      FieldName = 'SmSocPsb'
      DisplayFormat = '#.00'
    end
    object cdsPVSmNach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1042#1089#1077#1075#1086
      FieldName = 'SmNach'
      DisplayFormat = '#.00'
    end
    object cdsPVSmUdrg: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1042#1089#1077#1075#1086
      FieldName = 'SmUdrg'
      DisplayFormat = '#.00'
    end
    object cdsPVSmVupl: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1095#1077#1085#1086#1042#1089#1077#1075#1086
      FieldName = 'SmVupl'
      DisplayFormat = '#.00'
    end
    object cdsPVK_t: TFloatField
      DisplayLabel = #1050#1086#1101#1092'.'
      FieldName = 'K_t'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_OsnV: TFloatField
      DisplayLabel = #1054#1089#1085#1042#1080#1076#1099
      FieldName = 'Sm_OsnV'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_Boln: TFloatField
      DisplayLabel = #1041#1086#1083#1100#1085#1080#1095#1085'.'
      FieldName = 'Sm_Boln'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_Prem: TFloatField
      DisplayLabel = #1055#1088#1077#1084#1080#1080
      FieldName = 'Sm_Prem'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_OtpTM: TFloatField
      DisplayLabel = #1054#1090#1087#1058#1052
      FieldName = 'Sm_OtpTM'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_OtpBM: TFloatField
      DisplayLabel = #1054#1090#1087#1041#1052
      FieldName = 'Sm_OtpBM'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_OtpNI: TFloatField
      DisplayLabel = #1054#1090#1087#1053#1048
      FieldName = 'Sm_OtpNI'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_SocPsb: TFloatField
      DisplayLabel = #1057#1086#1094#1055#1089#1073
      FieldName = 'Sm_SocPsb'
      DisplayFormat = '#.00'
    end
    object cdsPVSm_Nach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Sm_Nach'
      DisplayFormat = '#.00'
    end
    object cdsPVSmRasch: TFloatField
      DisplayLabel = #1053#1072#1056#1091#1082#1080#1056#1072#1089#1095
      FieldName = 'SmRasch'
      DisplayFormat = '#.00'
    end
    object cdsPVSmOper: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083#1072#1090#1077
      FieldName = 'SmOper'
      DisplayFormat = '#.00'
    end
    object cdsPVSmOst: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'SmOst'
      DisplayFormat = '#.00'
    end
    object cdsPVNotInCurSps: TBooleanField
      FieldName = 'NotInCurSps'
    end
    object cdsPVSmByTabN: TFloatField
      DisplayLabel = #1053#1072#1056#1091#1082#1080#1055#1086#1042#1089#1077#1084#1055#1057#1095
      FieldName = 'SmByTabN'
      DisplayFormat = '#.00'
    end
  end
  object dsrcPV: TDataSource
    DataSet = cdsPV
    OnDataChange = dsrcPVDataChange
    Left = 544
    Top = 240
  end
  object popPV: TPopupMenu
    OnPopup = popPVPopup
    Left = 152
    Top = 128
    object N1: TMenuItem
      Caption = '== '#1057#1086#1079#1076#1072#1085#1080#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' =='
      Enabled = False
    end
    object popPvDelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16469
      OnClick = popPvDelRecClick
    end
    object popPvSep1: TMenuItem
      Caption = '-'
    end
    object popPvSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Enabled = False
      object popSortObjTabN: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1058#1072#1073'.'#1053#1086#1084#1077#1088
        Checked = True
        OnClick = popSortObjTabNClick
      end
      object popSortObjFio: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSortObjFioClick
      end
      object popSortTabN: TMenuItem
        Caption = '- '#1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1053#1086#1084#1077#1088
        OnClick = popSortTabNClick
      end
      object popSortFio: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popSortFioClick
      end
    end
    object popPvFilterBK: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' "'#1050#1072#1089#1089#1072'/'#1041#1072#1085#1082#1080'"'
      object popPvFilterKss: TMenuItem
        Caption = '- '#1082#1072#1089#1089#1072
        OnClick = popPvFilterKssClick
      end
      object popPvFilterBnk: TMenuItem
        Caption = '- '#1073#1072#1085#1082#1080
        OnClick = popPvFilterBnkClick
      end
      object popPvFilterBKOff: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        OnClick = popPvFilterBKOffClick
      end
    end
    object popPvShwNU: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnClick = popPvShwNUClick
    end
  end
  object qryTmp2: TQuery
    Left = 512
    Top = 120
  end
  object popOtkl: TPopupMenu
    Left = 104
    Top = 128
    object popOtklHead: TMenuItem
      Caption = '===  '#1043#1086#1090#1086#1074#1099#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'  ==='
      Enabled = False
    end
    object popOtklSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popOtklSortObjTabN: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1058#1072#1073'.'#1053#1086#1084#1077#1088
        Checked = True
        OnClick = popOtklSortObjTabNClick
      end
      object popOtklSortObjFio: TMenuItem
        Caption = '- '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popOtklSortObjFioClick
      end
      object popOtklSortTabN: TMenuItem
        Caption = '- '#1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1053#1086#1084#1077#1088
        OnClick = popOtklSortTabNClick
      end
      object popOtklSortFio: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = popOtklSortFioClick
      end
      object popOtklSortSumma: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1083#1102' "'#1057#1091#1084#1084#1072'"'
        OnClick = popOtklSortSummaClick
      end
    end
    object popOtklFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088
      object popOtklFilterKss: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1082#1072#1089#1089#1072
        OnClick = popOtklFilterKssClick
      end
      object popOtklFilterBnk: TMenuItem
        Caption = '- '#1090#1086#1083#1100#1082#1086' '#1073#1072#1085#1082#1080
        OnClick = popOtklFilterBnkClick
      end
      object popOtklFilterOff: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        OnClick = popOtklFilterOffClick
      end
    end
    object popOtklOther: TMenuItem
      Caption = #1048#1090#1086#1075#1080' '#1087#1086' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      OnClick = popOtklOtherClick
    end
  end
  object popCreSps: TPopupMenu
    Left = 72
    Top = 128
    object popCreSpsWithPom: TMenuItem
      Caption = #1042#1099#1079#1074#1072#1090#1100' '#1087#1086#1084#1086#1096#1085#1080#1082#1072
      Hint = 
        #1055#1086#1084#1086#1078#1077#1090' '#1074#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080'/'#1080#1083#1080' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '#1076#1083#1103' '#1089#1087#1080#1089 +
        #1082#1072
      OnClick = popCreSpsWithPomClick
    end
    object popCreSpsCustom: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
      Hint = #1057#1087#1080#1089#1086#1082' '#1089#1086#1079#1076#1072#1077#1090#1089#1103' '#1074#1074#1086#1076#1086#1084' '#1090#1072#1073#1077#1083#1100#1085#1099#1093' '#1085#1086#1084#1077#1088#1086#1074
      OnClick = popCreSpsCustomClick
    end
    object popCreSpsBez: TMenuItem
      Caption = #1055#1088#1086#1087#1091#1089#1090#1080#1090#1100' '#1087#1091#1085#1082#1090
      Hint = #1057#1087#1080#1089#1086#1082' '#1073#1091#1076#1077#1090' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1074' '#1087#1088#1086#1094#1077#1089#1089#1077' '#1074#1099#1073#1086#1088#1082#1080' '#1089#1091#1084#1084' ('#1089#1083#1077#1076'.'#1087#1091#1085#1082#1090')'
      OnClick = popCreSpsBezClick
    end
  end
  object cdsFilterBK: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'ShBnk'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NmBnk'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'OnKdBnk'
        Fields = 'KdBnk'
      end>
    Params = <>
    StoreDefs = True
    Left = 704
    Top = 224
    object cdsFilterBKNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsFilterBKKdBnk: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KdBnk'
    end
    object cdsFilterBKShBnk: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'ShBnk'
      Size = 12
    end
    object cdsFilterBKNmBnk: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NmBnk'
      Size = 40
    end
  end
  object cdsDeti: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end
      item
        Name = 'Sm1901'
        DataType = ftFloat
      end
      item
        Name = 'Sm1909'
        DataType = ftFloat
      end
      item
        Name = 'SmNach'
        DataType = ftFloat
      end
      item
        Name = 'SmUdrg'
        DataType = ftFloat
      end
      item
        Name = 'SmVupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_1901'
        DataType = ftFloat
      end
      item
        Name = 'Sm_1909'
        DataType = ftFloat
      end
      item
        Name = 'SmRasch'
        DataType = ftFloat
      end
      item
        Name = 'SmOper'
        DataType = ftFloat
      end
      item
        Name = 'SmOst'
        DataType = ftFloat
      end
      item
        Name = 'K_t'
        DataType = ftFloat
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'LS'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NotInCurSps'
        DataType = ftBoolean
      end
      item
        Name = 'SmByTabN'
        DataType = ftFloat
      end
      item
        Name = 'KdSpZ'
        DataType = ftSmallint
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsPvObjTabN'
        Fields = 'KdObj;TabN'
      end
      item
        Name = 'cdsPvObjFio'
        CaseInsFields = 'FamIO'
        Fields = 'KdObj;FamIO'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'cdsPvTabN'
        Fields = 'TabN'
      end
      item
        Name = 'cdsPvFio'
        CaseInsFields = 'FamIO'
        Fields = 'FamIO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 224
    object cdsDetiNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsDetiKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsDetiTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsDetiFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 45
    end
    object cdsDetiKdKatP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
    object cdsDetiSm1901: TFloatField
      DisplayLabel = #1057#1084'1901'
      FieldName = 'Sm1901'
      DisplayFormat = '#.00'
    end
    object cdsDetiSm1909: TFloatField
      DisplayLabel = #1057#1084'1909'
      FieldName = 'Sm1909'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmNach: TFloatField
      DisplayLabel = #1057#1084#1053#1072#1095#1080#1089#1083
      FieldName = 'SmNach'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmUdrg: TFloatField
      DisplayLabel = #1057#1084#1059#1076#1077#1088#1078
      FieldName = 'SmUdrg'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmVupl: TFloatField
      DisplayLabel = #1057#1084#1042#1099#1087#1083
      FieldName = 'SmVupl'
      DisplayFormat = '#.00'
    end
    object cdsDetiSm_1901: TFloatField
      DisplayLabel = #1057#1084'_1901'
      FieldName = 'Sm_1901'
      DisplayFormat = '#.00'
    end
    object cdsDetiSm_1909: TFloatField
      DisplayLabel = #1057#1084'_1909'
      FieldName = 'Sm_1909'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmRasch: TFloatField
      DisplayLabel = #1053#1072#1056#1091#1082#1080#1056#1072#1089#1095
      FieldName = 'SmRasch'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmOper: TFloatField
      DisplayLabel = #1050' '#1074#1099#1087#1083#1072#1090#1077
      FieldName = 'SmOper'
      DisplayFormat = '#.00'
    end
    object cdsDetiSmOst: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'SmOst'
      DisplayFormat = '#.00'
    end
    object cdsDetiK_t: TFloatField
      DisplayLabel = #1050'-'#1090
      FieldName = 'K_t'
    end
    object cdsDetiKdBnk: TSmallintField
      DisplayLabel = #1050#1076#1041#1072#1085#1082#1072
      FieldName = 'KdBnk'
    end
    object cdsDetiLS: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1077#1090
      FieldName = 'LS'
      Size = 25
    end
    object cdsDetiNotInCurSps: TBooleanField
      FieldName = 'NotInCurSps'
    end
    object cdsDetiSmByTabN: TFloatField
      DisplayLabel = #1053#1072#1056#1091#1082#1080#1055#1086#1042#1089#1077#1084#1055#1057#1095
      FieldName = 'SmByTabN'
      DisplayFormat = '#.00'
    end
    object cdsDetiKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cdsDetiPSch: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'PSch'
      Size = 10
    end
    object cdsDetiSchBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SchBU'
      Size = 10
    end
  end
  object dsrcDeti: TDataSource
    DataSet = cdsDeti
    OnDataChange = dsrcPVDataChange
    Left = 592
    Top = 240
  end
  object cdsSpB: TClientDataSet
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
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        DataType = ftString
        Size = 35
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
        Name = 'SpZ'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MaxSm'
        DataType = ftFloat
      end
      item
        Name = 'SmToVed'
        DataType = ftFloat
      end
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'NmBnk'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'LS'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'NrVed'
        DataType = ftInteger
      end
      item
        Name = 'DtVed'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = cdsSpBNewRecord
    Left = 636
    Top = 227
    Data = {
      830100009619E0BD0100000018000000120000000000030000008301024E5204
      0001000200010007535542545950450200490008004175746F696E6300064474
      50726F630400060000000000045461624E04000100000000000546616D494F01
      00490000000100055749445448020002002300054B6453707302000100000000
      00054B644F626A0200010000000000064B644B6174500200010000000000054B
      6453705A02000100000000000353705A01004900000001000557494454480200
      02000F0004505343480100490000000100055749445448020002000F00054D61
      78536D080004000000000007536D546F5665640800040000000000054B64426E
      6B0200010000000000054E6D426E6B0100490000000100055749445448020002
      002300024C530100490000000100055749445448020002001900054E6F746573
      0100490000000100055749445448020002002300054E72566564040001000000
      0000054474566564040006000000000001000C4155544F494E4356414C554504
      00010001000000}
    object cdsSpBNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsSpBDtProc: TDateField
      DisplayLabel = #1050#1052#1077#1089#1103#1094#1091
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsSpBTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
      OnValidate = cdsSpBTabNValidate
    end
    object cdsSpBFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldName = 'FamIO'
      Size = 35
    end
    object cdsSpBKdSps: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KdSps'
    end
    object cdsSpBKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KdObj'
    end
    object cdsSpBKdKatP: TSmallintField
      DisplayLabel = #1050#1072#1090#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
    object cdsSpBKdSpZ: TSmallintField
      DisplayLabel = #1050#1076#1064#1055#1047
      FieldName = 'KdSpZ'
    end
    object cdsSpBSpZ: TStringField
      DisplayLabel = #1064#1055#1047
      FieldName = 'SpZ'
      OnValidate = cdsSpBSpZValidate
      Size = 15
    end
    object cdsSpBPSCH: TStringField
      DisplayLabel = #1055#1057#1095
      FieldName = 'PSCH'
      Size = 15
    end
    object cdsSpBMaxSm: TFloatField
      DisplayLabel = #1052#1072#1082#1089#1057#1084
      FieldName = 'MaxSm'
      DisplayFormat = '0.00'
    end
    object cdsSpBSmToVed: TFloatField
      DisplayLabel = #1057#1084#1042#1042#1077#1076#1086#1084
      FieldName = 'SmToVed'
      DisplayFormat = '0.00'
    end
    object cdsSpBKdBnk: TSmallintField
      FieldName = 'KdBnk'
      OnValidate = cdsSpBKdBnkValidate
    end
    object cdsSpBNmBnk: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'NmBnk'
      Size = 35
    end
    object cdsSpBLS: TStringField
      FieldName = 'LS'
      Size = 25
    end
    object cdsSpBNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'Notes'
      Size = 35
    end
    object cdsSpBNrVed: TIntegerField
      DisplayLabel = #1053#1088#1042#1077#1076
      FieldName = 'NrVed'
    end
    object cdsSpBDtVed: TDateField
      DisplayLabel = #1044#1090#1042#1077#1076
      FieldName = 'DtVed'
      DisplayFormat = 'dd/mm/yy'
    end
  end
  object dsrcSpB: TDataSource
    DataSet = cdsSpB
    Left = 648
    Top = 240
  end
  object popSpB: TPopupMenu
    OnPopup = popSpBPopup
    Left = 184
    Top = 128
    object popSpbHead: TMenuItem
      Caption = '= '#1041#1072#1085#1082#1086#1074#1089#1082#1072#1103' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1100'" ='
      Enabled = False
    end
    object popSpbAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16462
      OnClick = popSpbAddClick
    end
    object popSpbEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16453
      OnClick = popSpbEdtClick
    end
    object popSpbDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16452
      OnClick = popSpbDelClick
    end
    object popSpbSep1: TMenuItem
      Caption = '-'
    end
    object popSpbCopySps: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1079' '#1079#1072#1076#1072#1085#1085#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080#1079' '#1079#1072#1076#1072#1085#1085#1086#1081' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1080'"'
      Visible = False
      OnClick = popSpbCopySpsClick
    end
  end
  object qryPere: TQuery
    Left = 560
    Top = 120
  end
  object qryMaxSm: TQuery
    Left = 608
    Top = 120
  end
  object cdsInf: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'NmBnk'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cnt'
        DataType = ftInteger
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnKdBnk'
        Fields = 'KdBnk'
      end>
    IndexName = 'OnKdBnk'
    Params = <>
    StoreDefs = True
    Left = 500
    Top = 331
    object cdsInfKdBnk: TSmallintField
      DisplayWidth = 5
      FieldName = 'KdBnk'
    end
    object cdsInfNmBnk: TStringField
      DisplayLabel = #1050#1091#1076#1072
      DisplayWidth = 24
      FieldName = 'NmBnk'
    end
    object cdsInfCnt: TIntegerField
      DisplayLabel = #1063#1080#1089#1083'.'
      DisplayWidth = 12
      FieldName = 'Cnt'
    end
    object cdsInfSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'Summa'
      DisplayFormat = '#0 000.00'
    end
  end
  object dsrcInf: TDataSource
    DataSet = cdsInf
    Left = 512
    Top = 344
  end
end
