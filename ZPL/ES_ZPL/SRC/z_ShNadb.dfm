object FormShwNadb: TFormShwNadb
  Left = 290
  Top = 151
  Width = 761
  Height = 496
  ActiveControl = dbgr1601
  BorderIcons = []
  Caption = 'FormShwNadb'
  Color = clBtnFace
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 745
    Height = 457
    ActivePage = ts1601
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Splitter2: TSplitter
        Left = 233
        Top = 31
        Height = 407
        Beveled = True
        Color = clTeal
        ParentColor = False
        OnMoved = Splitter2Moved
      end
      object dbgrPktNdb: TDBGrid
        Left = 0
        Top = 31
        Width = 233
        Height = 407
        Align = alLeft
        Color = 13429757
        DataSource = dsrcPktNdb
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
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'NRPKT'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTVPKT'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDUSR'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmUsr'
            Width = 75
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          737
          31)
        object sBtnAddPkt: TSpeedButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1072#1082#1077#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
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
          OnClick = sBtnAddPktClick
        end
        object sBtnDelPkt: TSpeedButton
          Left = 80
          Top = 3
          Width = 75
          Height = 25
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1072#1082#1077#1090
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333FF33337F3333F73993777337777993377FFFF77FFFF773339900000000
            9933337777777777773333399FFFFFF997333337F33333337F33333099FFFF99
            07333337F3FF3FFF7F333330F99F099F07333337F77377737F333330FF9999FF
            07333FF7F3FFFF3F7FFF3330F0F99F0F03337777F7777373777F3330FF999FFF
            03333777F3FF3FFF77773330F99F990003333337F77377777333333099FF0990
            33333337F3FF7F37F3333339908F0F9933333337F7737F77FF333399FFFF0039
            93333337FFFF77377FF33990000003339933337777777F3377FF993333333333
            3993377333377333377333333333333333337333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnDelPktClick
        end
        object LabelSortShwNdb: TLabel
          Left = 328
          Top = 8
          Width = 86
          Height = 13
          Caption = 'LabelSortShwNdb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object bBtnClose: TBitBtn
          Left = 658
          Top = 3
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1088#1099#1090#1100
          TabOrder = 0
          TabStop = False
          Kind = bkClose
          Spacing = 0
        end
        object dbNavShwNdb: TDBNavigator
          Left = 240
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrcShwNdb
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 1
        end
      end
      object PanelTs1Right: TPanel
        Left = 236
        Top = 31
        Width = 501
        Height = 395
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelTs1Right'
        TabOrder = 2
        object dbgrShwNdb: TDBGrid
          Left = 0
          Top = 0
          Width = 509
          Height = 407
          Align = alClient
          Color = 13041131
          DataSource = dsrcShwNdb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = popShwNdb
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
              FieldName = 'FamIO'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SPSRSCH'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TABN'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIDN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMPROC'
              Width = 50
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
              Width = 61
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
              FieldName = 'KDOBJ'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDKATP'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDSPZ'
              Width = 34
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
              FieldName = 'NRPRBEG'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPRBEG'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPREND'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPREND'
              Width = 51
              Visible = True
            end>
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 242
        Top = 31
        Height = 407
        Beveled = True
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          737
          31)
        object DBText1: TDBText
          Left = 368
          Top = 9
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'FamIO'
          DataSource = dsrcTabs
          Transparent = True
        end
        object sBtnActNdb: TSpeedButton
          Left = 582
          Top = 3
          Width = 77
          Height = 25
          Hint = #1042#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' "'#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077'" '#1085#1072#1076#1073#1072#1074#1082#1080
          Anchors = [akTop, akRight]
          GroupIndex = 7
          Caption = #1040#1082#1090#1091#1072#1083#1100#1085#1099#1077
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnActNdbClick
        end
        object sBtnGoBack: TSpeedButton
          Left = 665
          Top = 3
          Width = 70
          Height = 25
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
          OnClick = sBtnGoBackClick
        end
        object sBtnCreSps: TSpeedButton
          Left = 3
          Top = 3
          Width = 67
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Caption = #1057#1087#1080#1089#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnCreSpsClick
        end
        object LabelTabsCntRec: TLabel
          Left = 74
          Top = 8
          Width = 82
          Height = 13
          Caption = #1047#1072#1087#1080#1089#1077#1081' 999999'
        end
        object LabelTabsSort: TLabel
          Left = 165
          Top = 8
          Width = 190
          Height = 13
          Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072': '#1055#1086#1076#1088#1072#1079#1076'; '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sBtnAllNdb: TSpeedButton
          Left = 545
          Top = 3
          Width = 34
          Height = 25
          Hint = #1042#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1074#1089#1077' '#1085#1072#1076#1073#1072#1074#1082#1080
          Anchors = [akTop, akRight]
          GroupIndex = 7
          Down = True
          Caption = #1042#1089#1077
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sBtnAllNdbClick
        end
      end
      object dbgrTabs: TDBGrid
        Left = 0
        Top = 31
        Width = 242
        Height = 395
        Align = alLeft
        Color = clCream
        DataSource = dsrcTabs
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = popTabs
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbGridEnter
        OnExit = dbGridEnter
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            Width = 33
            Visible = True
          end>
      end
      object LbxObj: TListBox
        Left = 26
        Top = 352
        Width = 25
        Height = 25
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        Visible = False
      end
      object LbxKatP: TListBox
        Left = 66
        Top = 352
        Width = 25
        Height = 25
        Color = clBtnFace
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object Panel3: TPanel
        Left = 245
        Top = 31
        Width = 492
        Height = 395
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 4
        object dbgrNdb: TDBGrid
          Left = 0
          Top = 168
          Width = 500
          Height = 239
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          DataSource = dsrcNdb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = popNdb
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrNdbDrawColumnCell
          OnDblClick = dbgrNdbDblClick
          OnEnter = dbGridEnter
          OnExit = dbGridExit
          Columns = <
            item
              Expanded = False
              FieldName = 'VIDN'
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
              FieldName = 'SUMPROC'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SP'
              Width = 17
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_BEG'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_END'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KDOBJ'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NmKatP'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SpZ'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPRBEG'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPRBEG'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTPREND'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NRPREND'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTES'
              Width = 25
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 64
          Top = 8
          Width = 311
          Height = 153
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object Label1: TLabel
            Left = 20
            Top = 7
            Width = 189
            Height = 13
            Caption = #1057#1090#1072#1088#1072#1103' '#1085#1072#1076#1073#1072#1074#1082#1072' '#1079#1072#1082#1088#1099#1074#1072#1077#1090#1089#1103' '#1076#1072#1090#1086#1081
            FocusControl = dbeDtEndOld
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 10
            Top = 44
            Width = 66
            Height = 13
            Caption = #1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072':'
            FocusControl = dbeDtBegNew
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 175
            Top = 44
            Width = 32
            Height = 13
            Caption = #1086#1082#1086#1085#1095':'
            FocusControl = dbeDtEndNew
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 64
            Top = 24
            Width = 164
            Height = 13
            Caption = #1042#1084#1077#1089#1090#1086' '#1085#1077#1077' '#1086#1090#1082#1088#1099#1074#1072#1077#1090#1089#1103' '#1085#1086#1074#1072#1103':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 10
            Top = 65
            Width = 52
            Height = 13
            Caption = #1055#1088#1080#1082#1072#1079' '#8470
            FocusControl = dbeNrPrikaza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 194
            Top = 65
            Width = 11
            Height = 13
            Caption = #1086#1090
            FocusControl = dbeDtPrikaza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 204
            Top = 88
            Width = 71
            Height = 13
            Caption = #1087#1088#1080#1079#1085#1072#1082' ('#1056'/%)'
            FocusControl = dbeSpNew
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 10
            Top = 88
            Width = 99
            Height = 13
            Caption = #1057#1091#1084#1084#1072' '#1080#1083#1080' '#1087#1088#1086#1094#1077#1085#1090
            FocusControl = dbeSmPrcNew
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 23
            Top = 108
            Width = 265
            Height = 41
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042#1085#1080#1084#1072#1085#1080#1077'! '#1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1088#1072#1079#1091' '#1079#1072#1087#1080#1089#1099#1074#1072#1102#1090#1089#1103' '#1074' '#1041#1044'. '#1042' '#1089#1083#1091#1095#1072#1077' '#1086#1096#1080#1073#1082#1080' '#1080#1089#1087 +
              #1088#1072#1074#1083#1077#1085#1080#1103' '#1076#1077#1083#1072#1090#1100' '#1087#1086#1090#1086#1084' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1086' '#1087#1086' '#1082#1072#1078#1076#1086#1084#1091' '#1058#1072#1073'.'#1085'-'#1088#1091' !'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object dbeDtEndOld: TDBEdit
            Left = 214
            Top = 4
            Width = 85
            Height = 21
            Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086
            DataField = 'DtEndOld'
            DataSource = dsrcTmp
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeDtBegNew: TDBEdit
            Left = 83
            Top = 41
            Width = 85
            Height = 21
            DataField = 'DtBegNew'
            DataSource = dsrcTmp
            TabOrder = 1
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeDtEndNew: TDBEdit
            Left = 214
            Top = 41
            Width = 85
            Height = 21
            DataField = 'DtEndNew'
            DataSource = dsrcTmp
            TabOrder = 2
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeNrPrikaza: TDBEdit
            Left = 83
            Top = 62
            Width = 85
            Height = 21
            DataField = 'NrPrikaza'
            DataSource = dsrcTmp
            TabOrder = 3
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeDtPrikaza: TDBEdit
            Left = 214
            Top = 62
            Width = 85
            Height = 21
            DataField = 'DtPrikaza'
            DataSource = dsrcTmp
            TabOrder = 4
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSpNew: TDBEdit
            Left = 282
            Top = 84
            Width = 17
            Height = 21
            DataField = 'SpNew'
            DataSource = dsrcTmp
            TabOrder = 6
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
          object dbeSmPrcNew: TDBEdit
            Left = 114
            Top = 84
            Width = 85
            Height = 21
            DataField = 'SmPrcNew'
            DataSource = dsrcTmp
            TabOrder = 5
            OnEnter = dbeEnter
            OnExit = dbeExit
          end
        end
      end
    end
    object ts1601: TTabSheet
      Caption = 'ts1601'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 31
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          737
          31)
        object sBtnCreSps1601: TSpeedButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
          Caption = #1057#1087#1080#1089#1086#1082
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
            0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
            0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
            0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
            5555557FFFFF7755555555500000005555555577777775555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sBtnCreNewPkt1601Click
        end
        object sBtnZadanie1601: TSpeedButton
          Left = 82
          Top = 3
          Width = 75
          Height = 25
          Hint = 
            #1042#1074#1077#1089#1090#1080' '#1079#1072#1076#1072#1085#1080#1077' '#1076#1083#1103' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1072#1082#1077#1090#1072' '#1085#1086#1074#1099#1093' '#1085#1072#1076#1073#1072#1074#1086#1082' '#1087#1086' '#1089#1086#1079#1076#1072#1085#1085 +
            #1086#1084#1091' '#1089#1087#1080#1089#1082#1091
          Caption = #1047#1072#1076#1072#1085#1080#1077
          Enabled = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          Visible = False
          OnClick = sBtnZadanie1601Click
        end
        object sBtnSaveNdb1601: TSpeedButton
          Left = 159
          Top = 3
          Width = 81
          Height = 25
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1086#1074#1099#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1074' '#1041#1044
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Enabled = False
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
          Spacing = 1
          OnClick = sBtnSaveNdb1601Click
        end
        object LabelCntRec: TLabel
          Left = 243
          Top = 9
          Width = 62
          Height = 13
          Caption = 'LabelCntRec'
        end
        object LabelSort: TLabel
          Left = 352
          Top = 9
          Width = 45
          Height = 13
          Caption = 'LabelSort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object SpeedButton2: TSpeedButton
          Left = 664
          Top = 3
          Width = 75
          Height = 25
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
          OnClick = sBtnGoBackClick
        end
        object LabelSmMinZp: TLabel
          Left = 464
          Top = 9
          Width = 95
          Height = 14
          Align = alCustom
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'LabelSmMinZp'
        end
        object dbNav1601: TDBNavigator
          Left = 579
          Top = 3
          Width = 80
          Height = 25
          DataSource = dsrc1601
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
      end
      object dbgr1601: TDBGrid
        Left = 0
        Top = 31
        Width = 737
        Height = 395
        Align = alClient
        DataSource = dsrc1601
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = dbgr1601Enter
        OnExit = dbgr1601Exit
        Columns = <
          item
            Expanded = False
            FieldName = 'TabN'
            ReadOnly = True
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            ReadOnly = True
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdObj'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdKatP'
            ReadOnly = True
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KdSpZ'
            ReadOnly = True
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VidN'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OklTrf'
            ReadOnly = True
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Color = clMoneyGreen
            Expanded = False
            FieldName = 'SumProc'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtBeg'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtEnd'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'spsbRasch'
            ReadOnly = True
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Notes'
            ReadOnly = True
            Width = 44
            Visible = True
          end>
      end
    end
  end
  object qryNdb: TQuery
    CachedUpdates = True
    OnCalcFields = qryNdbCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_NADB'
      'where tabN = 23838')
    UpdateObject = updNdb
    Left = 280
    Top = 280
    object qryNdbNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NADB.NR'
    end
    object qryNdbKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NADB.KDSPS'
    end
    object qryNdbSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_NADB.SPSRSCH'
    end
    object qryNdbTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NADB.TABN'
    end
    object qryNdbFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qryNdbVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NADB.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNdbShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object qryNdbOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_NADB.OLDKDVIDN'
    end
    object qryNdbSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_NADB.SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNdbSP: TStringField
      DisplayLabel = '%/'#1057#1084
      FieldName = 'SP'
      Origin = 'DbMain.Z_NADB.SP'
      Size = 1
    end
    object qryNdbPRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_NADB.PRCSOVM'
    end
    object qryNdbDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NADB.DT_BEG'
      DisplayFormat = 'dd/mm//yyyy'
    end
    object qryNdbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NADB.DT_END'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryNdbOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_NADB.OLDKDOBJ'
    end
    object qryNdbKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NADB.KDOBJ'
    end
    object qryNdbShObj: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 15
      Calculated = True
    end
    object qryNdbKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1055#1077#1088#1089
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NADB.KDKATP'
    end
    object qryNdbNmKatP: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldKind = fkCalculated
      FieldName = 'NmKatP'
      Size = 10
      Calculated = True
    end
    object qryNdbPRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_NADB.PRCHS'
      Size = 1
    end
    object qryNdbPRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_NADB.PRSMM'
      Size = 1
    end
    object qryNdbKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1091#1073#1057#1095
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NADB.KDSPZ'
    end
    object qryNdbSpZ: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldKind = fkCalculated
      FieldName = 'SpZ'
      Size = 15
      Calculated = True
    end
    object qryNdbSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NADB.SPEC_NR'
    end
    object qryNdbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_NADB.NOTES'
      Size = 25
    end
    object qryNdbNRPRBEG: TStringField
      DisplayLabel = #1053#1088#1055#1088#1053#1072#1095
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_NADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_NADB.DTPRBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPREND: TStringField
      DisplayLabel = #1053#1088#1055#1088#1050#1085#1094
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_NADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNdbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1050#1085#1094
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_NADB.DTPREND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryNdbNRPKT: TIntegerField
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_NADB.NRPKT'
    end
    object qryNdbDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_NADB.DTVPKT'
    end
    object qryNdbPRC_WT: TFloatField
      FieldName = 'PRC_WT'
      Origin = 'DbMain.Z_NADB.PRC_WT'
    end
    object qryNdbSPOV_MERGE: TStringField
      FieldName = 'SPOV_MERGE'
      Size = 1
    end
  end
  object dsrcNdb: TDataSource
    DataSet = qryNdb
    Left = 296
    Top = 296
  end
  object updNdb: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_NADB'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  PRCSOVM = :PRCSOVM,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCHS = :PRCHS,'
      '  PRSMM = :PRSMM,'
      '  KDSPZ = :KDSPZ,'
      '  SPEC_NR = :SPEC_NR,'
      '  NOTES = :NOTES,'
      '  NRPRBEG = :NRPRBEG,'
      '  DTPRBEG = :DTPRBEG,'
      '  NRPREND = :NRPREND,'
      '  DTPREND = :DTPREND,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  PRC_WT = :PRC_WT,'
      '  SPOV_MERGE = :SPOV_MERGE'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_NADB ('
        'KDSPS, SPSRSCH, TABN, VIDN, OLDKDVIDN, SUMPROC, SP, PRCSOVM, '
        'DT_BEG, DT_END, OLDKDOBJ, KDOBJ, KDKATP, PRCHS, PRSMM, KDSPZ, SPEC_NR, '
        'NOTES, NRPRBEG, DTPRBEG, NRPREND, DTPREND, NRPKT, DTVPKT, PRC_WT, '
        'SPOV_MERGE)'
      'values ('
        ':KDSPS, :SPSRSCH, :TABN, :VIDN, :OLDKDVIDN, :SUMPROC, :SP, '
        ':PRCSOVM, '
        ':DT_BEG, :DT_END, :OLDKDOBJ, :KDOBJ, :KDKATP, :PRCHS, :PRSMM, '
        ':KDSPZ, '
        ':SPEC_NR, :NOTES, :NRPRBEG, :DTPRBEG, :NRPREND, :DTPREND, ' +
        ':NRPKT, :DTVPKT, '
        ':PRC_WT, :SPOV_MERGE)')
    DeleteSQL.Strings = (
      'delete from Z_NADB'
      'where'
      '  NR = :OLD_NR')
    Left = 304
    Top = 312
  end
  object popNdb: TPopupMenu
    Left = 208
    Top = 280
    object popNdbHead: TMenuItem
      Caption = '==  '#1053#1072#1076#1073#1072#1074#1082#1080'  =='
      Enabled = False
    end
    object popNdbCloseAndNew: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1085#1072#1076#1073#1072#1074#1082#1091' '#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1085#1086#1074#1091' '#1085#1072' '#1077#1077' '#1086#1089#1085#1086#1074#1077
      ShortCut = 116
      OnClick = popNdbCloseAndNewClick
    end
  end
  object cdsTabs: TClientDataSet
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
        Name = 'KdObj'
        DataType = ftSmallint
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'KdKatP'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = cdsTabsAfterPost
    AfterDelete = cdsTabsAfterDelete
    OnCalcFields = cdsTabsCalcFields
    Left = 192
    Top = 152
    object cdsTabsNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsTabsTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
      OnValidate = cdsTabsTabNValidate
    end
    object cdsTabsKdObj: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KdObj'
    end
    object cdsTabsFam: TStringField
      FieldName = 'Fam'
      Size = 35
    end
    object cdsTabsIma: TStringField
      FieldName = 'Ima'
    end
    object cdsTabsOtch: TStringField
      FieldName = 'Otch'
      Size = 35
    end
    object cdsTabsFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object cdsTabsKdKatP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'KdKatP'
    end
  end
  object dsrcTabs: TDataSource
    DataSet = cdsTabs
    Left = 208
    Top = 168
  end
  object popTabs: TPopupMenu
    OnPopup = popTabsPopup
    Left = 192
    Top = 112
    object popTabsSort: TMenuItem
      Caption = '==  '#1057#1086#1088#1090#1080#1088#1086#1074#1082#1072'  =='
      Enabled = False
    end
    object popTabsSortTabN: TMenuItem
      Caption = '- '#1087#1086' '#1058#1072#1073#1077#1083#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      OnClick = popTabsSortTabNClick
    end
    object popTabsSortFIO: TMenuItem
      Caption = '- '#1087#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      OnClick = popTabsSortFIOClick
    end
    object popTabsSortObjTabN: TMenuItem
      Caption = '- '#1087#1086#1076#1088#1072#1079#1076'.; '#1058#1072#1073'.'#1085#1086#1084#1077#1088
      Checked = True
      OnClick = popTabsSortObjTabNClick
    end
    object popTabsSortObjFIO: TMenuItem
      Caption = '- '#1087#1086#1076#1088#1072#1079#1076'.; '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      OnClick = popTabsSortObjFIOClick
    end
  end
  object qryPktNdb: TQuery
    CachedUpdates = True
    OnCalcFields = qryPktNdbCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from ZZ_NdbPkt'
      '')
    UpdateObject = updPktNdb
    Left = 36
    Top = 211
    object qryPktNdbNR: TIntegerField
      DisplayWidth = 6
      FieldName = 'NR'
      Origin = 'DbMain.ZZ_PEREPKT.NR'
    end
    object qryPktNdbNRPKT: TIntegerField
      DisplayLabel = #8470#1087#1082#1090
      DisplayWidth = 12
      FieldName = 'NRPKT'
      Origin = 'DbMain.ZZ_PEREPKT.NRPKT'
    end
    object qryPktNdbDTVPKT: TDateTimeField
      DisplayLabel = #1044#1090#1055#1082#1090
      DisplayWidth = 22
      FieldName = 'DTVPKT'
      Origin = 'DbMain.ZZ_PEREPKT.DTVPKT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPktNdbKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1055#1086#1083#1100#1079'.'
      DisplayWidth = 12
      FieldName = 'KDUSR'
      Origin = 'DbMain.ZZ_PEREPKT.KDUSR'
    end
    object qryPktNdbMYNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 78
      FieldName = 'MYNOTES'
      Origin = 'DbMain.ZZ_PEREPKT.MYNOTES'
      Size = 65
    end
    object qryPktNdbNmUsr: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldKind = fkCalculated
      FieldName = 'NmUsr'
      Size = 25
      Calculated = True
    end
  end
  object dsrcPktNdb: TDataSource
    DataSet = qryPktNdb
    Left = 48
    Top = 224
  end
  object updPktNdb: TUpdateSQL
    ModifySQL.Strings = (
      'update ZZ_NdbPkt'
      'set'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  KDUSR = :KDUSR,'
      '  MYNOTES = :MYNOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ZZ_NdbPkt'
      '  (NRPKT, DTVPKT, KDUSR, MYNOTES)'
      'values'
      '  (:NRPKT, :DTVPKT, :KDUSR, :MYNOTES)')
    DeleteSQL.Strings = (
      'delete from ZZ_NdbPkt'
      'where'
      '  NR = :OLD_NR')
    Left = 64
    Top = 240
  end
  object qryTmp: TQuery
    Left = 132
    Top = 291
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtEndOld'
        DataType = ftDate
      end
      item
        Name = 'DtBegNew'
        DataType = ftDate
      end
      item
        Name = 'DtEndNew'
        DataType = ftDate
      end
      item
        Name = 'NrPrikaza'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtPrikaza'
        DataType = ftDate
      end
      item
        Name = 'SpNew'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SmPrcNew'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 265
    Top = 154
    object cdsTmpDtEndOld: TDateField
      FieldName = 'DtEndOld'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtBegNew: TDateField
      FieldName = 'DtBegNew'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtEndNew: TDateField
      FieldName = 'DtEndNew'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpNrPrikaza: TStringField
      FieldName = 'NrPrikaza'
      Size = 10
    end
    object cdsTmpDtPrikaza: TDateField
      FieldName = 'DtPrikaza'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpSpNew: TStringField
      FieldName = 'SpNew'
      Size = 1
    end
    object cdsTmpSmPrcNew: TFloatField
      FieldName = 'SmPrcNew'
    end
    object cdsTmpNotes: TStringField
      FieldName = 'Notes'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 352
    Top = 296
  end
  object qryShwNdb: TQuery
    OnCalcFields = qryShwNdbCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, n.* '
      'from z_Nadb n'
      '  Left outer join z_upi u on u.TabN = n.TabN '
      'where n.nrPkt > 0'
      'order by n.NrPkt')
    Left = 264
    Top = 82
    object qryShwNdbFAM: TStringField
      DisplayWidth = 15
      FieldName = 'FAM'
    end
    object qryShwNdbIMA: TStringField
      DisplayWidth = 15
      FieldName = 'IMA'
      Size = 15
    end
    object qryShwNdbOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object qryShwNdbFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryShwNdbNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object qryShwNdbKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object qryShwNdbSPSRSCH: TSmallintField
      DisplayLabel = #1057#1087#1089#1073
      DisplayWidth = 12
      FieldName = 'SPSRSCH'
    end
    object qryShwNdbTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 12
      FieldName = 'TABN'
    end
    object qryShwNdbVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryShwNdbOLDKDVIDN: TSmallintField
      DisplayWidth = 13
      FieldName = 'OLDKDVIDN'
    end
    object qryShwNdbSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      DisplayWidth = 12
      FieldName = 'SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryShwNdbSP: TStringField
      DisplayLabel = #1088'%'
      DisplayWidth = 3
      FieldName = 'SP'
      Size = 1
    end
    object qryShwNdbPRCSOVM: TFloatField
      DisplayLabel = '%'#1089#1086#1074#1084
      DisplayWidth = 12
      FieldName = 'PRCSOVM'
    end
    object qryShwNdbDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryShwNdbDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      DisplayWidth = 22
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryShwNdbOLDKDOBJ: TSmallintField
      DisplayWidth = 12
      FieldName = 'OLDKDOBJ'
    end
    object qryShwNdbKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      DisplayWidth = 12
      FieldName = 'KDOBJ'
    end
    object qryShwNdbKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055#1077#1088#1089
      DisplayWidth = 12
      FieldName = 'KDKATP'
    end
    object qryShwNdbPRCHS: TStringField
      DisplayWidth = 8
      FieldName = 'PRCHS'
      Size = 1
    end
    object qryShwNdbPRSMM: TStringField
      DisplayWidth = 8
      FieldName = 'PRSMM'
      Size = 1
    end
    object qryShwNdbKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      DisplayWidth = 12
      FieldName = 'KDSPZ'
    end
    object qryShwNdbSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
    end
    object qryShwNdbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 30
      FieldName = 'NOTES'
      Size = 25
    end
    object qryShwNdbNRPRBEG: TStringField
      DisplayLabel = #8470#1087#1088#1053#1072#1095
      DisplayWidth = 12
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryShwNdbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      DisplayWidth = 22
      FieldName = 'DTPRBEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryShwNdbNRPREND: TStringField
      DisplayLabel = #8470#1087#1088#1054#1082#1086#1085#1095
      DisplayWidth = 12
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryShwNdbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1054#1082#1086#1085#1095
      DisplayWidth = 22
      FieldName = 'DTPREND'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryShwNdbNRPKT: TIntegerField
      DisplayWidth = 12
      FieldName = 'NRPKT'
    end
    object qryShwNdbDTVPKT: TDateTimeField
      DisplayWidth = 22
      FieldName = 'DTVPKT'
    end
  end
  object dsrcShwNdb: TDataSource
    DataSet = qryShwNdb
    Left = 280
    Top = 96
  end
  object popNewPkt: TPopupMenu
    Left = 28
    Top = 107
    object popNewPkt01: TMenuItem
      Caption = '- '#1053#1072#1076#1073#1072#1074#1082#1080' '#1087#1086' "'#1076#1086#1075#1086#1074#1086#1088#1085#1099#1084'" '#1074#1080#1076#1072#1084
      Hint = #1053#1072#1076#1073#1072#1074#1082#1080' '#1087#1086' "'#1076#1086#1075#1086#1074#1086#1088#1085#1099#1084'" '#1074#1080#1076#1072#1084' '#1079#1072' 2013 '#1075#1086#1076
      OnClick = popNewPkt01Click
    end
    object popNewPkt1601: TMenuItem
      Caption = '- "'#1085#1072#1076#1073#1072#1074#1082#1072'" '#1087#1086' '#1074#1080#1076#1091' 1601 ('#1044#1086#1052#1080#1085#1047#1055')'
      OnClick = popNewPkt1601Click
    end
    object popNewPkt02: TMenuItem
      Caption = '- '#1053#1086#1074#1099#1077' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1087#1086' '#1089#1087#1080#1089#1082#1072#1084
      Enabled = False
      OnClick = popNewPkt02Click
    end
    object popNewPkt03: TMenuItem
      Caption = '- '#1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1085#1072#1076#1073#1072#1074#1086#1082
      Enabled = False
      OnClick = popNewPkt03Click
    end
  end
  object popShwNdb: TPopupMenu
    Left = 392
    Top = 122
    object popShwNdbSort: TMenuItem
      Caption = '= = '#1057' '#1086' '#1088' '#1090' '#1080' '#1088' '#1086' '#1074' '#1082' '#1072' = ='
      Enabled = False
    end
    object popShwNdbSortObjFIO: TMenuItem
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      Checked = True
      OnClick = popShwNdbSortObjFIOClick
    end
    object popShwNdbSortFIO: TMenuItem
      Caption = #1055#1086' '#1060#1072#1084#1080#1083#1080#1080' '#1048'.'#1054'.'
      OnClick = popShwNdbSortFIOClick
    end
    object popShwNdbSortTabN: TMenuItem
      Caption = #1055#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      OnClick = popShwNdbSortTabNClick
    end
  end
  object cds1601: TClientDataSet
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
        Size = 45
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
        Name = 'VidN'
        DataType = ftString
        Size = 4
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
        Name = 'spsbRasch'
        DataType = ftSmallint
      end
      item
        Name = 'SP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OklTrf'
        DataType = ftFloat
      end
      item
        Name = 'SumProc'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 468
    Top = 283
    object cds1601NR: TAutoIncField
      FieldName = 'NR'
    end
    object cds1601TabN: TIntegerField
      FieldName = 'TabN'
    end
    object cds1601FamIO: TStringField
      FieldName = 'FamIO'
      Size = 45
    end
    object cds1601KdObj: TSmallintField
      FieldName = 'KdObj'
    end
    object cds1601KdKatP: TSmallintField
      FieldName = 'KdKatP'
    end
    object cds1601KdSpZ: TSmallintField
      FieldName = 'KdSpZ'
    end
    object cds1601VidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cds1601DtBeg: TDateField
      FieldName = 'DtBeg'
    end
    object cds1601DtEnd: TDateField
      FieldName = 'DtEnd'
    end
    object cds1601OklTrf: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OklTrf'
      DisplayFormat = '#.00'
    end
    object cds1601SumProc: TFloatField
      DisplayLabel = #1057#1084#1053#1072#1076#1073
      FieldName = 'SumProc'
      DisplayFormat = '#.00'
    end
    object cds1601spsbRasch: TSmallintField
      FieldName = 'spsbRasch'
    end
    object cds1601SP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object cds1601Notes: TStringField
      FieldName = 'Notes'
    end
  end
  object dsrc1601: TDataSource
    DataSet = cds1601
    Left = 488
    Top = 304
  end
  object qryIns1601: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 0 * from z_Nadb')
    UpdateObject = updIns1601
    Left = 540
    Top = 296
    object qryIns1601NR: TIntegerField
      FieldName = 'NR'
    end
    object qryIns1601KDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryIns1601SPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object qryIns1601TABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryIns1601VIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryIns1601OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryIns1601SUMPROC: TFloatField
      FieldName = 'SUMPROC'
    end
    object qryIns1601SP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object qryIns1601PRCSOVM: TFloatField
      FieldName = 'PRCSOVM'
    end
    object qryIns1601DT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryIns1601DT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryIns1601OLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
    end
    object qryIns1601KDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object qryIns1601KDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qryIns1601PRCHS: TStringField
      FieldName = 'PRCHS'
      Size = 1
    end
    object qryIns1601PRSMM: TStringField
      FieldName = 'PRSMM'
      Size = 1
    end
    object qryIns1601KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryIns1601SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryIns1601NOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryIns1601NRPRBEG: TStringField
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryIns1601DTPRBEG: TDateTimeField
      FieldName = 'DTPRBEG'
    end
    object qryIns1601NRPREND: TStringField
      FieldName = 'NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryIns1601DTPREND: TDateTimeField
      FieldName = 'DTPREND'
    end
    object qryIns1601NRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object qryIns1601DTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
    end
    object qryIns1601PRC_WT: TFloatField
      FieldName = 'PRC_WT'
    end
  end
  object updIns1601: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nadb'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  PRCSOVM = :PRCSOVM,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCHS = :PRCHS,'
      '  PRSMM = :PRSMM,'
      '  KDSPZ = :KDSPZ,'
      '  SPEC_NR = :SPEC_NR,'
      '  NOTES = :NOTES,'
      '  NRPRBEG = :NRPRBEG,'
      '  DTPRBEG = :DTPRBEG,'
      '  NRPREND = :NRPREND,'
      '  DTPREND = :DTPREND,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  PRC_WT = :PRC_WT'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nadb'
      '  (KDSPS, SPSRSCH, TABN, VIDN, OLDKDVIDN, SUMPROC, SP, PRCSOVM, '
      'DT_BEG, '
      
        '   DT_END, OLDKDOBJ, KDOBJ, KDKATP, PRCHS, PRSMM, KDSPZ, SPEC_NR' +
        ', '
      'NOTES, '
      '   NRPRBEG, DTPRBEG, NRPREND, DTPREND, NRPKT, DTVPKT, PRC_WT)'
      'values'
      
        '  (:KDSPS, :SPSRSCH, :TABN, :VIDN, :OLDKDVIDN, :SUMPROC, :SP, :P' +
        'RCSOVM, '
      
        '   :DT_BEG, :DT_END, :OLDKDOBJ, :KDOBJ, :KDKATP, :PRCHS, :PRSMM,' +
        ' '
      ':KDSPZ, '
      
        '   :SPEC_NR, :NOTES, :NRPRBEG, :DTPRBEG, :NRPREND, :DTPREND, :NR' +
        'PKT, '
      ':DTVPKT, '
      '   :PRC_WT)')
    DeleteSQL.Strings = (
      'delete from z_Nadb'
      'where'
      '  NR = :OLD_NR')
    Left = 560
    Top = 304
  end
end
