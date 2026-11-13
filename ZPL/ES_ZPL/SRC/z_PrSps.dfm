object FormPredSps: TFormPredSps
  Left = 313
  Top = 303
  Width = 908
  Height = 624
  BorderIcons = [biSystemMenu]
  Caption = 'FormPredSps'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 870
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 900
    Height = 590
    ActivePage = ts0
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts0: TTabSheet
      Caption = 'ts0'
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 337
        Top = 31
        Height = 528
        Beveled = True
        Color = clTeal
        ParentColor = False
        OnMoved = Splitter1Moved
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          892
          31)
        object LabelCntPktRec: TLabel
          Left = 167
          Top = 8
          Width = 78
          Height = 13
          Caption = 'LabelCntPktRec'
        end
        object LabelCntOtklRec: TLabel
          Left = 431
          Top = 8
          Width = 81
          Height = 13
          Caption = 'LabelCntOtklRec'
        end
        object LabelSortOtkl: TLabel
          Left = 529
          Top = 1
          Width = 63
          Height = 13
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LabelSortOtklNdbMsg: TLabel
          Left = 529
          Top = 15
          Width = 124
          Height = 13
          Caption = 'LabelSortOtklNdbMsg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object sBtnSps: TSpeedButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1080#1089#1082#1072#1084
          Caption = #1057#1087#1080#1089#1082#1080
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
          Spacing = 2
          OnClick = sBtnSpsClick
        end
        object sBtnHlp00: TSpeedButton
          Left = 710
          Top = 3
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
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
          Visible = False
        end
        object sBtnPrt: TSpeedButton
          Left = 737
          Top = 3
          Width = 75
          Height = 25
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
          OnClick = sBtnPrtClick
        end
        object dbNavPkt: TDBNavigator
          Left = 80
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcPkt0
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
        object dbNavOtklNdb: TDBNavigator
          Left = 341
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcOtkl0
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 1
        end
        object bBtnCancel0: TBitBtn
          Left = 814
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 2
          Kind = bkCancel
          Spacing = 0
        end
      end
      object dbgrPkt0: TDBGrid
        Left = 0
        Top = 31
        Width = 337
        Height = 528
        Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1055#1072#1082#1077#1090#1099' '#1087#1086' '#1074#1080#1076#1091' 1005"'
        Align = alLeft
        Color = 11009242
        DataSource = dsrcPkt0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop00
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrPkt0DrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRPKT'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPKT'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WYEAR'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMGFKT'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPPKT'
            Visible = True
          end>
      end
      object Panel0Right: TPanel
        Left = 340
        Top = 31
        Width = 552
        Height = 528
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object PgCtrl_0: TPageControl
          Left = 0
          Top = 0
          Width = 552
          Height = 528
          ActivePage = ts0_Ndb
          Align = alClient
          Style = tsButtons
          TabOrder = 0
          object ts0_Otkl: TTabSheet
            Caption = 'ts0_Otkl'
            object dbgrOtkl0: TDBGrid
              Left = 0
              Top = 0
              Width = 544
              Height = 504
              Hint = #1047#1072#1087#1080#1089#1080' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'" '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1087#1072#1082#1077#1090#1091
              Align = alClient
              Color = 11009242
              DataSource = dsrcOtkl0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              PopupMenu = pop00
              ShowHint = True
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
                  FieldName = 'DTPROC'
                  Width = 44
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ZAMESGOD'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TABN'
                  Width = 42
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FamIO'
                  Width = 140
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VIDN'
                  Width = 34
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SHVIDN'
                  Width = 24
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'SUMMA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KDOBJ'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KDKATP'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SCHBU'
                  Width = 49
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NRVDPV'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTVDPV'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SPECPS'
                  Width = 45
                  Visible = True
                end>
            end
            object LbxTabN: TListBox
              Left = 248
              Top = 88
              Width = 81
              Height = 97
              ItemHeight = 13
              TabOrder = 1
              Visible = False
            end
          end
          object ts0_Ndb: TTabSheet
            Caption = 'ts0_Ndb'
            ImageIndex = 1
            object dbgrNdb0: TDBGrid
              Left = 0
              Top = 0
              Width = 544
              Height = 497
              Hint = '"'#1057#1087#1077#1094#1047#1072#1087#1080#1089#1080'", '#1087#1086#1076#1082#1083#1102#1095#1105#1085#1085#1099#1077' '#1074' '#1090#1072#1073#1083#1080#1094#1091' "'#1053#1072#1076#1073#1072#1074#1082#1080'"  '#1090#1077#1082#1091#1097#1080#1084' '#1087#1072#1082#1077#1090#1086#1084
              Align = alClient
              Color = clBtnFace
              DataSource = dsrcNdb0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              PopupMenu = pop00
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
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FamIO'
                  Width = 143
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KDOBJ'
                  Width = 33
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VIDN'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SPSRSCH'
                  Width = 25
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUMPROC'
                  Width = 36
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_BEG'
                  Width = 73
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_END'
                  Width = 71
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KDKATP'
                  Width = 24
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOTES'
                  Width = 56
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NRPKT'
                  Width = 34
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTVPKT'
                  Width = 72
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object ts1: TTabSheet
      Caption = 'ts1'
      object LabelFIO: TLabel
        Left = 0
        Top = 31
        Width = 47
        Height = 14
        Align = alTop
        Alignment = taCenter
        Caption = 'LabelFIO'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 391
        Width = 892
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
        Color = clTeal
        ParentColor = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          892
          31)
        object LabelCntRec: TLabel
          Left = 238
          Top = 9
          Width = 62
          Height = 13
          Caption = 'LabelCntRec'
        end
        object Label1: TLabel
          Left = 318
          Top = 1
          Width = 63
          Height = 13
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object LabelSortSps: TLabel
          Left = 318
          Top = 15
          Width = 76
          Height = 13
          Caption = 'LabelSortSps'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object sBtnWYear: TSpeedButton
          Left = 81
          Top = 3
          Width = 70
          Height = 25
          Hint = #1042#1099#1073#1086#1088' '#1075#1086#1076#1072
          Caption = '2014 '#1075'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnWYearClick
        end
        object sBtnPkt: TSpeedButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1087#1072#1082#1077#1090#1072#1084
          Caption = #1055#1072#1082#1077#1090#1099
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
          Spacing = 2
          OnClick = sBtnPktClick
        end
        object sBtnHlp01: TSpeedButton
          Left = 785
          Top = 3
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
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
          Visible = False
        end
        object Shape: TShape
          Left = 581
          Top = 8
          Width = 16
          Height = 16
          Hint = 
            #1042#1082#1083#1102#1095#1077#1085' '#1083#1086#1082#1072#1090#1086#1088#1085#1099#1081' '#1087#1086#1080#1089#1082' '#1074' '#1089#1087#1080#1089#1082#1077' - '#1074#1074#1086#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102' '#1080' '#1089#1083#1077#1076#1080#1090#1077' '#1079#1072 +
            ' '#1101#1082#1088#1072#1085#1086#1084
          Anchors = [akTop, akRight]
          Brush.Color = clYellow
          ParentShowHint = False
          Shape = stCircle
          ShowHint = True
        end
        object sBtnFindTabN: TSpeedButton
          Left = 755
          Top = 3
          Width = 25
          Height = 25
          Hint = #1055#1086#1080#1089#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' '#1089' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100#1102' '#1074#1074#1086#1076#1072' '#1074' '#1089#1087#1080#1089#1086#1082
          Anchors = [akTop, akRight]
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
          OnClick = sBtnFindTabNClick
        end
        object bBtnCancel1: TBitBtn
          Left = 814
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          Kind = bkCancel
          Spacing = 0
        end
        object dbNavSps: TDBNavigator
          Left = 154
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcSps1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 1
        end
        object edFamLoc: TEdit
          Left = 605
          Top = 5
          Width = 148
          Height = 21
          Hint = 
            #1042#1074#1086#1076' '#1080#1089#1082#1086#1084#1086#1081' '#1092#1072#1084#1080#1083#1080#1080' '#1076#1083#1103' '#1083#1086#1082#1072#1090#1086#1088#1085#1086#1075#1086' '#1087#1086#1080#1089#1082#1072' '#1080#1083#1080' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1074' '#1089#1087#1080 +
            #1089#1082#1072#1093' '#1087#1088#1086#1096#1083#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
          Anchors = [akTop, akRight]
          Color = 13696496
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'edFamLoc'
          OnChange = edFamLocChange
          OnDblClick = sBtnFindTabNClick
          OnEnter = edFamLocEnter
          OnExit = edFamLocExit
        end
      end
      object dbgrSps1: TDBGrid
        Left = 0
        Top = 45
        Width = 892
        Height = 339
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcSps1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pop01
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSps1DrawColumnCell
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 18
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'WYEAR'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_01'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_02'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_03'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_04'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_05'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_06'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_07'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_08'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_09'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_10'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_11'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SM_12'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_01'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_02'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_03'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_04'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_05'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_06'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_07'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_08'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_09'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_10'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_11'
            Width = 2
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES_12'
            Width = 2
            Visible = True
          end>
      end
      object dbgrNdb1: TDBGrid
        Left = 0
        Top = 387
        Width = 892
        Height = 172
        Align = alBottom
        Color = 13696496
        DataSource = dsrcNdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMPROC'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRPKT'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVPKT'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 54
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object dbgr_Pkt2: TDBGrid
        Left = 0
        Top = 31
        Width = 648
        Height = 535
        Align = alClient
        Color = 13696496
        DataSource = dsrc_Pkt2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgr_Pkt2DrawColumnCell
        OnDblClick = sBtnF8Click
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        OnKeyDown = dbgr_Pkt2KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WYEAR'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTES'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRPKT'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPECPS'
            Width = 48
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          892
          31)
        object LabelCntRec2: TLabel
          Left = 95
          Top = 2
          Width = 68
          Height = 13
          Caption = 'LabelCntRec2'
        end
        object Label3: TLabel
          Left = 376
          Top = 1
          Width = 63
          Height = 13
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label4: TLabel
          Left = 376
          Top = 15
          Width = 55
          Height = 13
          Caption = 'LabelSort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LabelCntSelRec: TLabel
          Left = 95
          Top = 17
          Width = 77
          Height = 13
          Caption = 'LabelCntSelRec'
        end
        object sBtnHlp02: TSpeedButton
          Left = 784
          Top = 3
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
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
          Visible = False
        end
        object dbNav_Pkt: TDBNavigator
          Left = 3
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrc_Pkt2
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object PanelRight: TPanel
        Left = 648
        Top = 31
        Width = 244
        Height = 528
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        OnResize = PanelRightResize
        object PanelMsg: TPanel
          Left = 20
          Top = 16
          Width = 211
          Height = 379
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            211
            379)
          object Label1_Msg: TLabel
            Left = 7
            Top = 10
            Width = 195
            Height = 55
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042#1099#1073#1088#1072#1085#1099' '#1076#1072#1085#1085#1099#1077' '#1089' '#1053#1077#1053#1091#1083#1077#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080' '#1079#1072' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1084#1077#1089#1103#1094' 2013 '#1075'. '#1076#1083 +
              #1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1087#1072#1082#1077#1090#1072' '#1082' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072'.'
            Transparent = True
            WordWrap = True
          end
          object Label2_Msg: TLabel
            Left = 7
            Top = 69
            Width = 195
            Height = 41
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042' '#1087#1086#1083#1077' "'#1047#1072#1052#1077#1089#1043#1086#1076'" '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1072#1082#1077#1090#1072' '#1073#1091#1076#1077#1090' '#1074#1074#1077#1076#1077#1085#1086' '#1079#1085#1072#1095#1077#1085#1080#1077 +
              ' "02-2014".'
            Transparent = True
            WordWrap = True
          end
          object Label5: TLabel
            Left = 7
            Top = 137
            Width = 195
            Height = 42
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1057#1077#1088#1099#1084' '#1094#1074#1077#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1076#1072#1085#1085#1099#1077', '#1091#1078#1077' '#1087#1086#1076#1082#1083#1102#1095#1105#1085#1085#1099#1077' '#1076#1088#1091#1075#1080#1084#1080' '#1087#1072#1082#1077#1090#1072#1084#1080' ' +
              '('#1077#1089#1083#1080' '#1090#1072#1082#1086#1074#1099#1077' '#1080#1084#1077#1102#1090#1089#1103').'
            Transparent = True
            WordWrap = True
          end
          object Label6: TLabel
            Left = 7
            Top = 176
            Width = 195
            Height = 82
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1082#1083#1072#1074#1080#1096#1077#1081' < F8> '#1074#1099#1076#1077#1083#1080#1090#1077' '#1079#1072#1087#1080#1089#1080', '#1082#1086#1090#1086#1088#1099 +
              #1077' '#1076#1086#1083#1078#1085#1099' '#1074#1086#1081#1090#1080' '#1074' '#1087#1072#1082#1077#1090'. '#1050#1085#1086#1087#1082#1072#1084#1080' "'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077'" '#1080' "'#1057#1085#1103#1090#1100' '#1074#1089#1077'" '#1084#1086 +
              #1078#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1083#1080' '#1089#1085#1103#1090#1100' '#1084#1077#1090#1082#1080' '#1076#1083#1103' '#1074#1089#1077#1093' '#1053#1077#1057#1077#1088#1099#1093' '#1079#1072#1087#1080#1089#1077#1081'.'
            Transparent = True
            WordWrap = True
          end
          object sBtnF8: TSpeedButton
            Left = 71
            Top = 187
            Width = 25
            Height = 19
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
            Caption = 'F8'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnF8Click
          end
          object sBtnSelAll: TSpeedButton
            Left = 8
            Top = 258
            Width = 103
            Height = 25
            Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
            Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sBtnSelAllClick
          end
          object sBtnUnSelAll: TSpeedButton
            Left = 117
            Top = 258
            Width = 85
            Height = 25
            Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
            Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C010000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334994333333333333338338F333333333
              0000333499994333333333333833338F33333333000033499999943333333333
              83333338F3333333000034999A99994333333338F33F33338F33333300003999
              A9A9994333333338F383F3338F33333300003A9A999A999433333338F8333F33
              38F33333000034A99999A99943333338833333F3338F333300004999A9999A99
              9433338F338F333F3338F3330000999A3A9994A99943338F3838F338F3338F33
              0000A9A333A9994A9994338F83338F338F3338F300003A33333A9994A9994338
              333338F338F3338F000033333333A9994A9943333333338F338F338F00003333
              33333A9994A9933333333338F338F83300003333333333A9994A333333333333
              8F338F33000033333333333A999433333333333338F338F30000333333333333
              A994333333333333338F38F300003333333333333A993333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnUnSelAllClick
          end
          object Label7: TLabel
            Left = 7
            Top = 288
            Width = 195
            Height = 29
            Alignment = taCenter
            AutoSize = False
            Caption = #1044#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1057#1086#1093#1088#1072#1085#1080#1090#1100'".'
            Transparent = True
            WordWrap = True
          end
          object sBtnSvPkt: TSpeedButton
            Left = 8
            Top = 318
            Width = 89
            Height = 25
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Enabled = False
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sBtnSvPktClick
          end
          object sBtnGoBack: TSpeedButton
            Left = 132
            Top = 318
            Width = 70
            Height = 25
            Hint = #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1087#1072#1082#1077#1090#1072
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1082#1072#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
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
            ParentShowHint = False
            ShowHint = True
            Spacing = 1
            OnClick = sBtnGoBackClick
          end
          object Label8: TLabel
            Left = 7
            Top = 347
            Width = 195
            Height = 27
            Alignment = taCenter
            AutoSize = False
            Caption = #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' - '#1082#1085#1086#1087#1082#1072' "'#1054#1090#1082#1072#1079'"'
            Transparent = True
            WordWrap = True
          end
          object Label3_Msg: TLabel
            Left = 11
            Top = 107
            Width = 187
            Height = 30
            Alignment = taCenter
            AutoSize = False
            Caption = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072' '#1073#1091#1076#1091#1090' '#1086#1090#1085#1077#1089#1077#1085#1099' '#1085#1072' '#1089#1095#1105#1090' 811/06'
            Transparent = True
            WordWrap = True
          end
        end
      end
      object LbxF8: TListBox
        Left = 16
        Top = 296
        Width = 49
        Height = 57
        BorderStyle = bsNone
        Color = clBtnFace
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          892
          31)
        object LabelCntRec3: TLabel
          Left = 95
          Top = 2
          Width = 68
          Height = 13
          Caption = 'LabelCntRec3'
        end
        object Label11: TLabel
          Left = 376
          Top = 1
          Width = 63
          Height = 13
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label12: TLabel
          Left = 376
          Top = 15
          Width = 55
          Height = 13
          Caption = 'LabelSort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object LabelCntSelRec3: TLabel
          Left = 95
          Top = 17
          Width = 83
          Height = 13
          Caption = 'LabelCntSelRec3'
        end
        object SpeedButton2: TSpeedButton
          Left = 784
          Top = 3
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
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
          Visible = False
        end
        object DBNavigator1: TDBNavigator
          Left = 3
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrc_Pkt3
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object Panel3Right: TPanel
        Left = 589
        Top = 31
        Width = 303
        Height = 528
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        OnResize = Panel3RightResize
        object PanelMsg_3: TPanel
          Left = 29
          Top = 16
          Width = 254
          Height = 305
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          DesignSize = (
            254
            305)
          object Label14: TLabel
            Left = 7
            Top = 10
            Width = 235
            Height = 43
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1048#1079' '#1089#1087#1080#1089#1082#1072' '#1074#1099#1073#1088#1072#1085#1099' '#1074#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1076#1083#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1087#1072#1082#1077#1090#1072' "'#1057#1087#1077#1094#1047#1072#1087 +
              #1080#1089#1077#1081'" '#1074' '#1090#1072#1073#1083#1080#1094#1091' "'#1053#1072#1076#1073#1072#1074#1082#1080'" '#1079#1072' 2014 '#1075#1086#1076
            Transparent = True
            WordWrap = True
          end
          object Label15: TLabel
            Left = 7
            Top = 52
            Width = 235
            Height = 32
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042' '#1087#1086#1083#1077' "'#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072'" '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1072#1082#1077#1090#1072' '#1073#1091#1076#1077#1090' '#1074#1074#1077#1076#1077#1085#1086' '#1079#1085#1072#1095#1077 +
              #1085#1080#1077' "01-02-2014".'
            Transparent = True
            WordWrap = True
          end
          object Label17: TLabel
            Left = 17
            Top = 115
            Width = 218
            Height = 70
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1044#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1080#1083#1080' '#1082#1083#1072#1074#1080#1096#1077#1081' < F8> '#1074#1099#1076#1077#1083#1080#1090#1077' '#1079#1072#1087#1080#1089#1080', '#1082#1086#1090#1086#1088#1099 +
              #1077' '#1076#1086#1083#1078#1085#1099' '#1074#1086#1081#1090#1080' '#1074' '#1087#1072#1082#1077#1090'. '#1050#1085#1086#1087#1082#1072#1084#1080' "'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077'" '#1080' "'#1057#1085#1103#1090#1100' '#1074#1089#1077'" '#1084#1086 +
              #1078#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1083#1080' '#1089#1085#1103#1090#1100' '#1084#1077#1090#1082#1080' '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081'.'
            Transparent = True
            WordWrap = True
          end
          object sBtnF8_3: TSpeedButton
            Left = 22
            Top = 127
            Width = 25
            Height = 17
            Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' / '#1057#1085#1103#1090#1100' '#1084#1077#1090#1082#1091' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
            Caption = 'F8'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnF8_3Click
          end
          object sBtnSelAll_3: TSpeedButton
            Left = 8
            Top = 186
            Width = 103
            Height = 25
            Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
            Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sBtnSelAll_3Click
          end
          object sBtnUnSelAll_3: TSpeedButton
            Left = 160
            Top = 186
            Width = 85
            Height = 25
            Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
            Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C010000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334994333333333333338338F333333333
              0000333499994333333333333833338F33333333000033499999943333333333
              83333338F3333333000034999A99994333333338F33F33338F33333300003999
              A9A9994333333338F383F3338F33333300003A9A999A999433333338F8333F33
              38F33333000034A99999A99943333338833333F3338F333300004999A9999A99
              9433338F338F333F3338F3330000999A3A9994A99943338F3838F338F3338F33
              0000A9A333A9994A9994338F83338F338F3338F300003A33333A9994A9994338
              333338F338F3338F000033333333A9994A9943333333338F338F338F00003333
              33333A9994A9933333333338F338F83300003333333333A9994A333333333333
              8F338F33000033333333333A999433333333333338F338F30000333333333333
              A994333333333333338F38F300003333333333333A993333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnUnSelAll_3Click
          end
          object Label18: TLabel
            Left = 7
            Top = 216
            Width = 235
            Height = 29
            Alignment = taCenter
            AutoSize = False
            Caption = #1044#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1057#1086#1093#1088#1072#1085#1080#1090#1100'".'
            Transparent = True
            WordWrap = True
          end
          object sBtnSvPkt_3: TSpeedButton
            Left = 8
            Top = 246
            Width = 89
            Height = 25
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1074' '#1041#1072#1079#1091' '#1044#1072#1085#1085#1099#1093
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            Enabled = False
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sBtnSvPkt_3Click
          end
          object sBtnGoBack_3: TSpeedButton
            Left = 175
            Top = 246
            Width = 70
            Height = 25
            Hint = #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1087#1072#1082#1077#1090#1072
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1082#1072#1079
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
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
            ParentShowHint = False
            ShowHint = True
            Spacing = 1
            OnClick = sBtnGoBack_3Click
          end
          object Label19: TLabel
            Left = 7
            Top = 278
            Width = 235
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' - '#1082#1085#1086#1087#1082#1072' "'#1054#1090#1082#1072#1079'"'
            Transparent = True
            WordWrap = True
          end
          object Label20: TLabel
            Left = 7
            Top = 83
            Width = 235
            Height = 30
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042' '#1087#1086#1083#1077' "'#1044#1072#1090#1072' '#1086#1082#1086#1085#1095'." '#1076#1083#1103' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1072#1082#1077#1090#1072' '#1073#1091#1076#1077#1090' '#1074#1074#1077#1076#1077#1085#1086' '#1079#1085#1072#1095#1077 +
              #1085#1080#1077' "01-02-2014".'
            Transparent = True
            WordWrap = True
          end
        end
      end
      object Panel3Left: TPanel
        Left = 0
        Top = 31
        Width = 589
        Height = 528
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Splitter3: TSplitter
          Left = 0
          Top = 412
          Width = 589
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          Color = clTeal
          ParentColor = False
        end
        object dbgr_Pkt3: TDBGrid
          Left = 0
          Top = 0
          Width = 589
          Height = 412
          Hint = '"'#1050#1072#1085#1076#1080#1076#1072#1090#1099'" '#1076#1083#1103' '#1087#1072#1082#1077#1090#1072
          Align = alClient
          Color = 15466208
          DataSource = dsrc_Pkt3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgr_Pkt3DrawColumnCell
          OnDblClick = sBtnF8_3Click
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          OnKeyDown = dbgr_Pkt3KeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'KDUSR'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WYEAR'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TABN'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FamIO'
              Width = 234
              Visible = True
            end>
        end
        object dbgr_Ndb3: TDBGrid
          Left = 0
          Top = 415
          Width = 589
          Height = 120
          Hint = #1059#1078#1077' '#1080#1084#1077#1102#1097#1080#1077#1089#1103' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' "'#1082#1072#1085#1076#1080#1076#1072#1090#1091'"'
          Align = alBottom
          Color = 15466208
          DataSource = dsrc_Ndb3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
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
              FieldName = 'VIDN'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMPROC'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDKATP'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPKT'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVPKT'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 111
              Visible = True
            end>
        end
        object LbxF8_3: TListBox
          Left = 112
          Top = 272
          Width = 49
          Height = 57
          BorderStyle = bsNone
          Color = clSilver
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
      end
    end
  end
  object PanelTts: TPanel
    Left = 480
    Top = 280
    Width = 217
    Height = 105
    BevelInner = bvLowered
    Color = 10414076
    TabOrder = 1
    Visible = False
    DesignSize = (
      217
      105)
    object LabelTtsCntRec: TLabel
      Left = 112
      Top = 17
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'LabelTtsCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelTtsCntSotr: TLabel
      Left = 112
      Top = 36
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'LabelTtsCntSotr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelTtsSmm: TLabel
      Left = 112
      Top = 55
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'LabelTtsSmm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 132
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 12
      Top = 17
      Width = 78
      Height = 13
      Caption = #1042#1089#1077#1075#1086' '#1079#1072#1087#1080#1089#1077#1081':'
    end
    object Label9: TLabel
      Left = 12
      Top = 36
      Width = 68
      Height = 13
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074':'
    end
    object Label10: TLabel
      Left = 12
      Top = 55
      Width = 74
      Height = 13
      Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072':'
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PredSps')
    Left = 56
    Top = 232
  end
  object pop01: TPopupMenu
    OnPopup = pop01Popup
    Left = 24
    Top = 144
    object pop01OpenSps: TMenuItem
      Caption = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082
      Hint = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
      OnClick = pop01OpenSpsClick
    end
    object pop01CreSps: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      Enabled = False
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1086' '#1076#1072#1085#1085#1099#1084' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
      OnClick = pop01CreSpsClick
    end
    object pop01CrePktNdb: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1072#1082#1077#1090' '#1074' '#1090#1072#1073#1083#1080#1094#1091' "'#1053#1072#1076#1073#1072#1074#1082#1080'" ...'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1072#1082#1077#1090' "'#1057#1087#1077#1094#1047#1072#1087#1080#1089#1077#1081'" '#1074' '#1090#1072#1073#1083#1080#1094#1091' "'#1053#1072#1076#1073#1072#1074#1082#1080'" '
      OnClick = pop01CrePktNdbClick
    end
    object pop01CrePktOtkl: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081' ...'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
      OnClick = pop01CrePktOtklClick
    end
    object pop01Sep0: TMenuItem
      Caption = '-'
    end
    object pop01DelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16469
      OnClick = pop01DelRecClick
    end
    object pop01Sep1: TMenuItem
      Caption = '-'
    end
    object pop01Sort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object pop01SortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = pop01SortByTabNClick
      end
      object pop01SortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = pop01SortByFIOClick
      end
      object pop01SortByObjTabN: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102', '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        OnClick = pop01SortByObjTabNClick
      end
      object pop01SortByObjFIO: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102', '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
        OnClick = pop01SortByObjFIOClick
      end
    end
    object pop01FindCase: TMenuItem
      Caption = #1057#1087#1086#1089#1086#1073' '#1087#1086#1080#1089#1082#1072' '#1092#1072#1084#1080#1083#1080#1080
      Hint = #1057#1087#1086#1089#1086#1073' '#1087#1086#1080#1089#1082#1072' '#1092#1072#1084#1080#1083#1080#1080' '#1087#1086' '#1076#1074#1086#1081#1085#1086#1084#1091' '#1097#1077#1083#1095#1082#1091' '#1084#1099#1096#1082#1080
      object pop01FindCaseByCont: TMenuItem
        Caption = '- '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077' '#1092#1072#1084#1080#1083#1080#1080
        Checked = True
        OnClick = pop01FindCaseByContClick
      end
      object pop01FindCaseByStart: TMenuItem
        Caption = '- '#1087#1086' '#1090#1086#1095#1085#1086#1084#1091' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102' '#1089' '#1085#1072#1095#1072#1083#1072' '#1092#1072#1084#1080#1083#1080#1080
        OnClick = pop01FindCaseByStartClick
      end
    end
    object pop01Sep2: TMenuItem
      Caption = '-'
    end
    object pop01Font: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1096#1088#1080#1092#1090#1072' '#1090#1072#1073#1083#1080#1094#1099
      OnClick = pop01FontClick
    end
    object pop01Fon: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1092#1086#1085#1072' '#1090#1072#1073#1083#1080#1094#1099
      OnClick = pop01FonClick
    end
  end
  object qrySps1: TQuery
    CachedUpdates = True
    BeforePost = qrySps1BeforePost
    AfterPost = qrySps1AfterPost
    OnCalcFields = qrySps1CalcFields
    OnNewRecord = qrySps1NewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, s.* '
      'from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN'
      'where s.KdUsr = 0')
    UpdateObject = updSps1
    Left = 280
    Top = 200
    object qrySps1NR: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR'
      Origin = 'DbMain.Z_PREDSPS.NR'
    end
    object qrySps1KDUSR: TSmallintField
      DisplayLabel = #1070#1079#1088
      DisplayWidth = 5
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_PREDSPS.KDUSR'
    end
    object qrySps1WYEAR: TSmallintField
      DisplayLabel = #1043#1086#1076
      DisplayWidth = 10
      FieldName = 'WYEAR'
      Origin = 'DbMain.Z_PREDSPS.WYEAR'
    end
    object qrySps1KDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      DisplayWidth = 10
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PREDSPS.KDOBJ'
    end
    object qrySps1TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 10
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PREDSPS.TABN'
      OnValidate = qrySps1TABNValidate
    end
    object qrySps1FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qrySps1SM_01: TFloatField
      DisplayLabel = #1071#1085#1074'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_01'
      Origin = 'DbMain.Z_PREDSPS.SM_01'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_01: TIntegerField
      DisplayWidth = 6
      FieldName = 'NRPKT_01'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_01'
    end
    object qrySps1NOTES_01: TStringField
      DisplayLabel = #1071#1085#1074'_'#1055#1088#1084#1095
      DisplayWidth = 10
      FieldName = 'NOTES_01'
      Origin = 'DbMain.Z_PREDSPS.NOTES_01'
      Size = 25
    end
    object qrySps1SM_02: TFloatField
      DisplayLabel = #1060#1077#1074'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_02'
      Origin = 'DbMain.Z_PREDSPS.SM_02'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_02: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_02'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_02'
    end
    object qrySps1NOTES_02: TStringField
      DisplayLabel = #1060#1077#1074'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_02'
      Origin = 'DbMain.Z_PREDSPS.NOTES_02'
      Size = 25
    end
    object qrySps1SM_03: TFloatField
      DisplayLabel = #1052#1072#1088'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_03'
      Origin = 'DbMain.Z_PREDSPS.SM_03'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_03: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_03'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_03'
    end
    object qrySps1NOTES_03: TStringField
      DisplayLabel = #1052#1072#1088'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_03'
      Origin = 'DbMain.Z_PREDSPS.NOTES_03'
      Size = 25
    end
    object qrySps1SM_04: TFloatField
      DisplayLabel = #1040#1087#1088'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_04'
      Origin = 'DbMain.Z_PREDSPS.SM_04'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_04: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_04'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_04'
    end
    object qrySps1NOTES_04: TStringField
      DisplayLabel = #1040#1087#1088'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_04'
      Origin = 'DbMain.Z_PREDSPS.NOTES_04'
      Size = 25
    end
    object qrySps1SM_05: TFloatField
      DisplayLabel = #1052#1072#1081'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_05'
      Origin = 'DbMain.Z_PREDSPS.SM_05'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_05: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_05'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_05'
    end
    object qrySps1NOTES_05: TStringField
      DisplayLabel = #1052#1072#1081'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_05'
      Origin = 'DbMain.Z_PREDSPS.NOTES_05'
      Size = 25
    end
    object qrySps1SM_06: TFloatField
      DisplayLabel = #1048#1102#1085'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_06'
      Origin = 'DbMain.Z_PREDSPS.SM_06'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_06: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_06'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_06'
    end
    object qrySps1NOTES_06: TStringField
      DisplayLabel = #1048#1102#1085'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_06'
      Origin = 'DbMain.Z_PREDSPS.NOTES_06'
      Size = 25
    end
    object qrySps1SM_07: TFloatField
      DisplayLabel = #1048#1102#1083'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_07'
      Origin = 'DbMain.Z_PREDSPS.SM_07'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_07: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_07'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_07'
    end
    object qrySps1NOTES_07: TStringField
      DisplayLabel = #1048#1102#1083'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_07'
      Origin = 'DbMain.Z_PREDSPS.NOTES_07'
      Size = 25
    end
    object qrySps1SM_08: TFloatField
      DisplayLabel = #1040#1074#1075'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_08'
      Origin = 'DbMain.Z_PREDSPS.SM_08'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_08: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_08'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_08'
    end
    object qrySps1NOTES_08: TStringField
      DisplayLabel = #1040#1074#1075'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_08'
      Origin = 'DbMain.Z_PREDSPS.NOTES_08'
      Size = 25
    end
    object qrySps1SM_09: TFloatField
      DisplayLabel = #1057#1077#1085'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_09'
      Origin = 'DbMain.Z_PREDSPS.SM_09'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_09: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_09'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_09'
    end
    object qrySps1NOTES_09: TStringField
      DisplayLabel = #1057#1077#1085'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_09'
      Origin = 'DbMain.Z_PREDSPS.NOTES_09'
      Size = 25
    end
    object qrySps1SM_10: TFloatField
      DisplayLabel = #1054#1082#1090'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_10'
      Origin = 'DbMain.Z_PREDSPS.SM_10'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_10: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_10'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_10'
    end
    object qrySps1NOTES_10: TStringField
      DisplayLabel = #1054#1082#1090'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_10'
      Origin = 'DbMain.Z_PREDSPS.NOTES_10'
      Size = 25
    end
    object qrySps1SM_11: TFloatField
      DisplayLabel = #1053#1086#1103'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_11'
      Origin = 'DbMain.Z_PREDSPS.SM_11'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_11: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_11'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_11'
    end
    object qrySps1NOTES_11: TStringField
      DisplayLabel = #1053#1086#1103'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_11'
      Origin = 'DbMain.Z_PREDSPS.NOTES_11'
      Size = 25
    end
    object qrySps1SM_12: TFloatField
      DisplayLabel = #1044#1077#1082'_'#1057#1084
      DisplayWidth = 10
      FieldName = 'SM_12'
      Origin = 'DbMain.Z_PREDSPS.SM_12'
      OnValidate = qrySps1FldSmValidate
      DisplayFormat = '0.00'
    end
    object qrySps1NRPKT_12: TIntegerField
      DisplayWidth = 10
      FieldName = 'NRPKT_12'
      Origin = 'DbMain.Z_PREDSPS.NRPKT_12'
    end
    object qrySps1NOTES_12: TStringField
      DisplayLabel = #1044#1077#1082'_'#1055#1088#1084#1095
      DisplayWidth = 25
      FieldName = 'NOTES_12'
      Origin = 'DbMain.Z_PREDSPS.NOTES_12'
      Size = 25
    end
    object qrySps1SPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qrySps1FAM: TStringField
      DisplayWidth = 20
      FieldName = 'FAM'
    end
    object qrySps1IMA: TStringField
      DisplayWidth = 15
      FieldName = 'IMA'
      Size = 15
    end
    object qrySps1OTCH: TStringField
      DisplayWidth = 20
      FieldName = 'OTCH'
    end
  end
  object dsrcSps1: TDataSource
    DataSet = qrySps1
    OnDataChange = dsrcSps1DataChange
    Left = 296
    Top = 216
  end
  object updSps1: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PredSps'
      'set'
      '  NR = :NR,'
      '  KDUSR = :KDUSR,'
      '  KDOBJ = :KDOBJ,'
      '  TABN = :TABN,'
      '  WYEAR = :WYEAR,'
      '  SM_01 = :SM_01,'
      '  NRPKT_01 = :NRPKT_01,'
      '  NOTES_01 = :NOTES_01,'
      '  SM_02 = :SM_02,'
      '  NRPKT_02 = :NRPKT_02,'
      '  NOTES_02 = :NOTES_02,'
      '  SM_03 = :SM_03,'
      '  NRPKT_03 = :NRPKT_03,'
      '  NOTES_03 = :NOTES_03,'
      '  SM_04 = :SM_04,'
      '  NRPKT_04 = :NRPKT_04,'
      '  NOTES_04 = :NOTES_04,'
      '  SM_05 = :SM_05,'
      '  NRPKT_05 = :NRPKT_05,'
      '  NOTES_05 = :NOTES_05,'
      '  SM_06 = :SM_06,'
      '  NRPKT_06 = :NRPKT_06,'
      '  NOTES_06 = :NOTES_06,'
      '  SM_07 = :SM_07,'
      '  NRPKT_07 = :NRPKT_07,'
      '  NOTES_07 = :NOTES_07,'
      '  SM_08 = :SM_08,'
      '  NRPKT_08 = :NRPKT_08,'
      '  NOTES_08 = :NOTES_08,'
      '  SM_09 = :SM_09,'
      '  NRPKT_09 = :NRPKT_09,'
      '  NOTES_09 = :NOTES_09,'
      '  SM_10 = :SM_10,'
      '  NRPKT_10 = :NRPKT_10,'
      '  NOTES_10 = :NOTES_10,'
      '  SM_11 = :SM_11,'
      '  NRPKT_11 = :NRPKT_11,'
      '  NOTES_11 = :NOTES_11,'
      '  SM_12 = :SM_12,'
      '  NRPKT_12 = :NRPKT_12,'
      '  NOTES_12 = :NOTES_12,'
      '  SPECPS = :SPECPS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_PredSps'
      
        '  (NR, KDUSR, KDOBJ, TABN, WYEAR, SM_01, NRPKT_01, NOTES_01, SM_' +
        '02, NRPKT_02, '
      
        '   NOTES_02, SM_03, NRPKT_03, NOTES_03, SM_04, NRPKT_04, NOTES_0' +
        '4, SM_05, '
      
        '   NRPKT_05, NOTES_05, SM_06, NRPKT_06, NOTES_06, SM_07, NRPKT_0' +
        '7, NOTES_07, '
      
        '   SM_08, NRPKT_08, NOTES_08, SM_09, NRPKT_09, NOTES_09, SM_10, ' +
        'NRPKT_10, '
      
        '   NOTES_10, SM_11, NRPKT_11, NOTES_11, SM_12, NRPKT_12, NOTES_1' +
        '2, SPECPS)'
      'values'
      
        '  (:NR, :KDUSR, :KDOBJ, :TABN, :WYEAR, :SM_01, :NRPKT_01, :NOTES' +
        '_01, :SM_02, '
      
        '   :NRPKT_02, :NOTES_02, :SM_03, :NRPKT_03, :NOTES_03, :SM_04, :' +
        'NRPKT_04, '
      
        '   :NOTES_04, :SM_05, :NRPKT_05, :NOTES_05, :SM_06, :NRPKT_06, :' +
        'NOTES_06, '
      
        '   :SM_07, :NRPKT_07, :NOTES_07, :SM_08, :NRPKT_08, :NOTES_08, :' +
        'SM_09, '
      
        '   :NRPKT_09, :NOTES_09, :SM_10, :NRPKT_10, :NOTES_10, :SM_11, :' +
        'NRPKT_11, '
      '   :NOTES_11, :SM_12, :NRPKT_12, :NOTES_12, :SPECPS)')
    DeleteSQL.Strings = (
      'delete from Z_PredSps'
      'where'
      '  NR = :OLD_NR')
    Left = 312
    Top = 232
  end
  object qryNR: TQuery
    Left = 88
    Top = 232
  end
  object qry_Pkt2: TQuery
    OnCalcFields = qry_Pkt2CalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select s.NR, s.KdUsr, s.WYear, s.KdObj, s.TabN, s.Sm_01 Smm, s.N' +
        'otes_01 Notes, s.NrPkt_01 NrPkt, '
      '              u.Fam, u.Ima, u.Otch, s.SpecPS '
      'from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN')
    Left = 280
    Top = 296
    object qry_Pkt2NR: TIntegerField
      FieldName = 'NR'
    end
    object qry_Pkt2KDUSR: TSmallintField
      DisplayLabel = #1070#1079#1088
      FieldName = 'KDUSR'
    end
    object qry_Pkt2WYEAR: TSmallintField
      DisplayLabel = #1043#1086#1076
      FieldName = 'WYEAR'
    end
    object qry_Pkt2KDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qry_Pkt2TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qry_Pkt2FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qry_Pkt2SMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '0.00'
    end
    object qry_Pkt2NOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 25
    end
    object qry_Pkt2NRPKT: TIntegerField
      DisplayLabel = #8470' '#1087#1082#1090
      FieldName = 'NRPKT'
    end
    object qry_Pkt2FAM: TStringField
      FieldName = 'FAM'
    end
    object qry_Pkt2IMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qry_Pkt2OTCH: TStringField
      FieldName = 'OTCH'
    end
    object qry_Pkt2SPECPS: TIntegerField
      DisplayLabel = #1057#1087#1077#1094#1055#1057
      FieldName = 'SPECPS'
    end
  end
  object dsrc_Pkt2: TDataSource
    DataSet = qry_Pkt2
    OnDataChange = dsrcSps1DataChange
    Left = 296
    Top = 312
  end
  object qryPkt0: TQuery
    AfterScroll = qryPkt0AfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PredPkt')
    Left = 280
    Top = 104
    object qryPkt0NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PREDPKT.NR'
    end
    object qryPkt0KDUSR: TSmallintField
      DisplayLabel = #1070#1079#1088
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_PREDPKT.KDUSR'
    end
    object qryPkt0NRPKT: TIntegerField
      DisplayLabel = #8470' '#1087#1082#1090
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_PREDPKT.NRPKT'
    end
    object qryPkt0DTPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTPKT'
      Origin = 'DbMain.Z_PREDPKT.DTPKT'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryPkt0WYEAR: TSmallintField
      DisplayLabel = #1047#1072#1043#1086#1076
      FieldName = 'WYEAR'
      Origin = 'DbMain.Z_PREDPKT.WYEAR'
    end
    object qryPkt0DTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_PREDPKT.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryPkt0ZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_PREDPKT.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryPkt0ZAMGFKT: TDateTimeField
      DisplayLabel = #1060#1082#1090#1047#1072#1052#1043
      FieldName = 'ZAMGFKT'
      Origin = 'DbMain.Z_PREDPKT.ZAMGFKT'
      DisplayFormat = 'mm/yy'
    end
    object qryPkt0NOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PREDPKT.NOTES'
      Size = 25
    end
    object qryPkt0TIPPKT: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TIPPKT'
      Origin = 'DbMain.Z_PREDPKT.TIPPKT'
      FixedChar = True
      Size = 5
    end
  end
  object dsrcPkt0: TDataSource
    DataSet = qryPkt0
    Left = 288
    Top = 120
  end
  object qryOtkl0: TQuery
    OnCalcFields = cdsOtkl0CalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcPkt0
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, o.* '
      'from ViOtkl  o Left Outer Join z_Upi u on u.TabN = o.TabN'
      'where o.DtProc >= "01/01/2013" and o.DtProc < "01/01/2014" and '
      '           o.VidN = "1005"')
    Left = 384
    Top = 104
    object qryOtkl0NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIOTKL.NR'
    end
    object qryOtkl0KDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIOTKL.KDSPS'
    end
    object qryOtkl0DTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VIOTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtkl0ZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VIOTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtkl0TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VIOTKL.TABN'
    end
    object qryOtkl0VIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.VIOTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtkl0SHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object qryOtkl0STORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VIOTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtkl0OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VIOTKL.OLDKDVIDN'
    end
    object qryOtkl0CHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.VIOTKL.CHAS'
    end
    object qryOtkl0SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VIOTKL.SUMMA'
      DisplayFormat = '0.00'
    end
    object qryOtkl0KDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIOTKL.KDOBJ'
    end
    object qryOtkl0KDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1072#1090#1055
      FieldName = 'KDKATP'
      Origin = 'DbMain.VIOTKL.KDKATP'
    end
    object qryOtkl0DT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VIOTKL.DT_BEG'
    end
    object qryOtkl0DT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VIOTKL.DT_END'
    end
    object qryOtkl0PDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.VIOTKL.PDN'
    end
    object qryOtkl0KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIOTKL.KDSPZ'
    end
    object qryOtkl0SCHBU: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object qryOtkl0PSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
    object qryOtkl0NOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.VIOTKL.NOTES'
      Size = 35
    end
    object qryOtkl0PRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VIOTKL.PRR'
    end
    object qryOtkl0PRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VIOTKL.PRPV'
    end
    object qryOtkl0KTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VIOTKL.KTO'
    end
    object qryOtkl0PRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VIOTKL.PRKR'
    end
    object qryOtkl0SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VIOTKL.SPEC_NR'
    end
    object qryOtkl0DTVDPV: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VIOTKL.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtkl0NRVDPV: TIntegerField
      DisplayLabel = #8470#1087#1082#1090
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VIOTKL.NRVDPV'
    end
    object qryOtkl0MYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VIOTKL.MYNOTES'
      Size = 25
    end
    object qryOtkl0SPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.VIOTKL.SPECPS'
    end
    object qryOtkl0PBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.VIOTKL.PBNK'
    end
    object qryOtkl0KDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.VIOTKL.KDBNK'
    end
    object qryOtkl0FAM: TStringField
      FieldName = 'FAM'
    end
    object qryOtkl0IMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtkl0OTCH: TStringField
      FieldName = 'OTCH'
    end
  end
  object pop00: TPopupMenu
    OnPopup = pop00Popup
    Left = 24
    Top = 112
    object pop00Sort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object pop00SortByTabN: TMenuItem
        Caption = '- '#1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
        Checked = True
        OnClick = pop00SortByTabNClick
      end
      object pop00SortByFIO: TMenuItem
        Caption = '- '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
        OnClick = pop00SortByFIOClick
      end
      object pop00SortByObjTabN: TMenuItem
        Caption = '- '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1090#1072#1073'.'#1085'-'#1088
        OnClick = pop00SortByObjTabNClick
      end
      object pop00SortByObjFIO: TMenuItem
        Caption = '- '#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1048#1054
        OnClick = pop00SortByObjFIOClick
      end
    end
    object pop00Tts: TMenuItem
      Caption = #1048#1090#1086#1075#1080' '#1087#1086' '#1087#1072#1082#1077#1090#1091
      OnClick = pop00TtsClick
    end
    object pop00Sep1: TMenuItem
      Caption = '-'
    end
    object pop00DelPkt: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      OnClick = pop00DelPktClick
    end
    object pop00DelRecInOtkl: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'"'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1077' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'"'
      OnClick = pop00DelRecInOtklClick
    end
  end
  object dspOtkl0: TDataSetProvider
    DataSet = qryOtkl0
    Left = 424
    Top = 104
  end
  object cdsOtkl0: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KDSPS'
        DataType = ftSmallint
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'ZAMESGOD'
        DataType = ftDateTime
      end
      item
        Name = 'TABN'
        DataType = ftInteger
      end
      item
        Name = 'FamIO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 45
      end
      item
        Name = 'VIDN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SHVIDN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STORN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OLDKDVIDN'
        DataType = ftSmallint
      end
      item
        Name = 'CHAS'
        DataType = ftFloat
      end
      item
        Name = 'SUMMA'
        DataType = ftFloat
      end
      item
        Name = 'KDOBJ'
        DataType = ftSmallint
      end
      item
        Name = 'KDKATP'
        DataType = ftSmallint
      end
      item
        Name = 'DT_BEG'
        DataType = ftDateTime
      end
      item
        Name = 'DT_END'
        DataType = ftDateTime
      end
      item
        Name = 'PDN'
        DataType = ftSmallint
      end
      item
        Name = 'KDSPZ'
        DataType = ftSmallint
      end
      item
        Name = 'SCHBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOTES'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'PRPV'
        DataType = ftSmallint
      end
      item
        Name = 'KTO'
        DataType = ftSmallint
      end
      item
        Name = 'PRKR'
        DataType = ftSmallint
      end
      item
        Name = 'SPEC_NR'
        DataType = ftInteger
      end
      item
        Name = 'DTVDPV'
        DataType = ftDateTime
      end
      item
        Name = 'NRVDPV'
        DataType = ftInteger
      end
      item
        Name = 'MYNOTES'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'SPECPS'
        DataType = ftInteger
      end
      item
        Name = 'PBNK'
        DataType = ftSmallint
      end
      item
        Name = 'KDBNK'
        DataType = ftSmallint
      end
      item
        Name = 'FAM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IMA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'OTCH'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'OtklFIO'
        CaseInsFields = 'Fam;Ima;Otch'
        Fields = 'Fam;Ima;Otch;KdObj'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'OtklTabN'
        Fields = 'TabN;KdObj'
      end
      item
        Name = 'OtklObjFIO'
        CaseInsFields = 'Fam;Ima;Otch'
        Fields = 'KdObj;Fam;Ima;Otch'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'OtklObjTabN'
        Fields = 'KdObj;TabN'
      end>
    IndexName = 'OtklFIO'
    Params = <>
    ProviderName = 'dspNdb'
    StoreDefs = True
    OnCalcFields = cdsOtkl0CalcFields
    Left = 472
    Top = 104
    object cdsOtkl0NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VIOTKL.NR'
    end
    object cdsOtkl0KDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.VIOTKL.KDSPS'
    end
    object cdsOtkl0DTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.VIOTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsOtkl0ZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.VIOTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsOtkl0TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.VIOTKL.TABN'
    end
    object cdsOtkl0FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      ReadOnly = True
      Size = 45
      Calculated = True
    end
    object cdsOtkl0VIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.VIOTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsOtkl0SHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Origin = 'DbMain.VIOTKL.SHVIDN'
      Size = 15
    end
    object cdsOtkl0STORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.VIOTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object cdsOtkl0OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.VIOTKL.OLDKDVIDN'
    end
    object cdsOtkl0CHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.VIOTKL.CHAS'
    end
    object cdsOtkl0SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.VIOTKL.SUMMA'
      DisplayFormat = '0.00'
    end
    object cdsOtkl0KDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.VIOTKL.KDOBJ'
    end
    object cdsOtkl0KDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
      Origin = 'DbMain.VIOTKL.KDKATP'
    end
    object cdsOtkl0DT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.VIOTKL.DT_BEG'
    end
    object cdsOtkl0DT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.VIOTKL.DT_END'
    end
    object cdsOtkl0PDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.VIOTKL.PDN'
    end
    object cdsOtkl0KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.VIOTKL.KDSPZ'
    end
    object cdsOtkl0SCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1105#1090
      FieldName = 'SCHBU'
      Origin = 'DbMain.VIOTKL.SCHBU'
      Size = 10
    end
    object cdsOtkl0PSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.VIOTKL.PSCH'
      Size = 10
    end
    object cdsOtkl0NOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.VIOTKL.NOTES'
      Size = 35
    end
    object cdsOtkl0PRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.VIOTKL.PRR'
    end
    object cdsOtkl0PRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.VIOTKL.PRPV'
    end
    object cdsOtkl0KTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.VIOTKL.KTO'
    end
    object cdsOtkl0PRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.VIOTKL.PRKR'
    end
    object cdsOtkl0SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.VIOTKL.SPEC_NR'
    end
    object cdsOtkl0DTVDPV: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVDPV'
      Origin = 'DbMain.VIOTKL.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsOtkl0NRVDPV: TIntegerField
      DisplayLabel = #8470' '#1087#1082#1090
      FieldName = 'NRVDPV'
      Origin = 'DbMain.VIOTKL.NRVDPV'
    end
    object cdsOtkl0MYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.VIOTKL.MYNOTES'
      Size = 25
    end
    object cdsOtkl0SPECPS: TIntegerField
      DisplayLabel = #1057#1087#1077#1094#1055#1057
      FieldName = 'SPECPS'
      Origin = 'DbMain.VIOTKL.SPECPS'
    end
    object cdsOtkl0PBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.VIOTKL.PBNK'
    end
    object cdsOtkl0KDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.VIOTKL.KDBNK'
    end
    object cdsOtkl0FAM: TStringField
      FieldName = 'FAM'
    end
    object cdsOtkl0IMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsOtkl0OTCH: TStringField
      FieldName = 'OTCH'
    end
  end
  object dsrcOtkl0: TDataSource
    DataSet = cdsOtkl0
    Left = 488
    Top = 120
  end
  object qrySpecNdb: TQuery
    Left = 120
    Top = 232
  end
  object cdsYear: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'YearInt'
        DataType = ftSmallint
      end
      item
        Name = 'YearStr'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CntRec'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 200
    object cdsYearYearInt: TSmallintField
      DisplayWidth = 8
      FieldName = 'YearInt'
    end
    object cdsYearYearStr: TStringField
      DisplayLabel = #1043#1086#1076
      DisplayWidth = 24
      FieldName = 'YearStr'
    end
    object cdsYearCntRec: TSmallintField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 12
      FieldName = 'CntRec'
    end
  end
  object qryNdb1: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Nadb where TabN = 1239 and VidN = "1005"')
    Left = 368
    Top = 200
    object qryNdb1NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NADB.NR'
    end
    object qryNdb1KDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NADB.KDSPS'
    end
    object qryNdb1SPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_NADB.SPSRSCH'
    end
    object qryNdb1TABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NADB.TABN'
    end
    object qryNdb1VIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NADB.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdb1OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_NADB.OLDKDVIDN'
    end
    object qryNdb1SUMPROC: TFloatField
      DisplayLabel = #1057#1084'_%'
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_NADB.SUMPROC'
    end
    object qryNdb1SP: TStringField
      DisplayLabel = #1088'%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_NADB.SP'
      Size = 1
    end
    object qryNdb1PRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_NADB.PRCSOVM'
    end
    object qryNdb1DT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NADB.DT_BEG'
    end
    object qryNdb1DT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NADB.DT_END'
    end
    object qryNdb1OLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_NADB.OLDKDOBJ'
    end
    object qryNdb1KDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NADB.KDOBJ'
    end
    object qryNdb1KDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NADB.KDKATP'
    end
    object qryNdb1PRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_NADB.PRCHS'
      Size = 1
    end
    object qryNdb1PRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_NADB.PRSMM'
      Size = 1
    end
    object qryNdb1KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NADB.KDSPZ'
    end
    object qryNdb1SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NADB.SPEC_NR'
    end
    object qryNdb1NOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NADB.NOTES'
      Size = 25
    end
    object qryNdb1NRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_NADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdb1DTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_NADB.DTPRBEG'
    end
    object qryNdb1NRPREND: TStringField
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_NADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdb1DTPREND: TDateTimeField
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_NADB.DTPREND'
    end
    object qryNdb1NRPKT: TIntegerField
      DisplayLabel = #8470#1055#1082#1090
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_NADB.NRPKT'
    end
    object qryNdb1DTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_NADB.DTVPKT'
    end
  end
  object dsrcNdb1: TDataSource
    DataSet = qryNdb1
    Left = 384
    Top = 216
  end
  object qry_Pkt3: TQuery
    OnCalcFields = qry_Pkt3CalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct s.KdUsr, s.WYear, s.TabN, u.Fam, u.Ima, u.Otch '
      'from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN'
      'where s.WYear = 2014 order by TabN')
    Left = 280
    Top = 392
    object qry_Pkt3KDUSR: TSmallintField
      DisplayLabel = #1070#1079#1088
      FieldName = 'KDUSR'
    end
    object qry_Pkt3WYEAR: TSmallintField
      DisplayLabel = #1043#1086#1076
      FieldName = 'WYEAR'
    end
    object qry_Pkt3FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qry_Pkt3TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qry_Pkt3FAM: TStringField
      FieldName = 'FAM'
    end
    object qry_Pkt3IMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qry_Pkt3OTCH: TStringField
      FieldName = 'OTCH'
    end
  end
  object dsrc_Pkt3: TDataSource
    DataSet = qry_Pkt3
    OnDataChange = dsrcSps1DataChange
    Left = 296
    Top = 408
  end
  object qry_Ndb3: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrc_Pkt3
    SQL.Strings = (
      'Select * from Z_Nadb where TabN = :TabN and VidN = "1005"')
    Left = 376
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_Ndb3NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NADB.NR'
    end
    object qry_Ndb3KDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NADB.KDSPS'
    end
    object qry_Ndb3SPSRSCH: TSmallintField
      DisplayLabel = #1057#1087#1089#1073#1056#1089#1095
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_NADB.SPSRSCH'
    end
    object qry_Ndb3TABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NADB.TABN'
    end
    object qry_Ndb3VIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NADB.VIDN'
      FixedChar = True
      Size = 4
    end
    object qry_Ndb3OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_NADB.OLDKDVIDN'
    end
    object qry_Ndb3SUMPROC: TFloatField
      DisplayLabel = #1057#1084'_%'
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_NADB.SUMPROC'
    end
    object qry_Ndb3SP: TStringField
      DisplayLabel = #1088'%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_NADB.SP'
      Size = 1
    end
    object qry_Ndb3PRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_NADB.PRCSOVM'
    end
    object qry_Ndb3DT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NADB.DT_BEG'
    end
    object qry_Ndb3DT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NADB.DT_END'
    end
    object qry_Ndb3OLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_NADB.OLDKDOBJ'
    end
    object qry_Ndb3KDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NADB.KDOBJ'
    end
    object qry_Ndb3KDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NADB.KDKATP'
    end
    object qry_Ndb3PRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_NADB.PRCHS'
      Size = 1
    end
    object qry_Ndb3PRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_NADB.PRSMM'
      Size = 1
    end
    object qry_Ndb3KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NADB.KDSPZ'
    end
    object qry_Ndb3SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NADB.SPEC_NR'
    end
    object qry_Ndb3NOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NADB.NOTES'
      Size = 25
    end
    object qry_Ndb3NRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_NADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qry_Ndb3DTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_NADB.DTPRBEG'
    end
    object qry_Ndb3NRPREND: TStringField
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_NADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qry_Ndb3DTPREND: TDateTimeField
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_NADB.DTPREND'
    end
    object qry_Ndb3NRPKT: TIntegerField
      DisplayLabel = #8470#1055#1082#1090
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_NADB.NRPKT'
    end
    object qry_Ndb3DTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_NADB.DTVPKT'
    end
  end
  object dsrc_Ndb3: TDataSource
    DataSet = qry_Ndb3
    Left = 392
    Top = 408
  end
  object qryPere: TQuery
    Left = 24
    Top = 232
  end
  object qryNdb0: TQuery
    OnCalcFields = qryNdb0CalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, n.* '
      'from Z_Nadb n Left Outer Join z_UPI u on u.TabN = n.TabN '
      'where NrPkt in (10,11,12,13) and VidN in ("1005","1006","1008")')
    Left = 472
    Top = 152
    object qryNdb0NR: TIntegerField
      FieldName = 'NR'
    end
    object qryNdb0KDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryNdb0SPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object qryNdb0TABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object qryNdb0FamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qryNdb0FAM: TStringField
      FieldName = 'FAM'
    end
    object qryNdb0IMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryNdb0OTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryNdb0VIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdb0OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryNdb0SUMPROC: TFloatField
      DisplayLabel = #1057#1084'_%'
      FieldName = 'SUMPROC'
    end
    object qryNdb0SP: TStringField
      DisplayLabel = #1088'%'
      FieldName = 'SP'
      Size = 1
    end
    object qryNdb0PRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object qryNdb0DT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
    end
    object qryNdb0DT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
    end
    object qryNdb0OLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryNdb0KDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryNdb0KDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object qryNdb0PRCHS: TStringField
      FieldName = 'PRCHS'
      Size = 1
    end
    object qryNdb0PRSMM: TStringField
      FieldName = 'PRSMM'
      Size = 1
    end
    object qryNdb0KDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      FieldName = 'KDSPZ'
    end
    object qryNdb0SPEC_NR: TIntegerField
      DisplayLabel = #1057#1087#1077#1094#1053#1088
      FieldName = 'SPEC_NR'
    end
    object qryNdb0NOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryNdb0NRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdb0DTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
    end
    object qryNdb0NRPREND: TStringField
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdb0DTPREND: TDateTimeField
      FieldName = 'DTPREND'
    end
    object qryNdb0NRPKT: TIntegerField
      DisplayLabel = #8470'_'#1055#1082#1090
      FieldName = 'NRPKT'
    end
    object qryNdb0DTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      FieldName = 'DTVPKT'
    end
  end
  object dsrcNdb0: TDataSource
    DataSet = qryNdb0
    Left = 488
    Top = 168
  end
end
