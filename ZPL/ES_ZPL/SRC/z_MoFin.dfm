object FormMoFin: TFormMoFin
  Left = 266
  Top = 221
  Width = 860
  Height = 665
  BorderIcons = [biSystemMenu]
  Caption = 'FormMoFin'
  Color = clBtnFace
  Constraints.MaxWidth = 1100
  Constraints.MinHeight = 500
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 852
    Height = 638
    ActivePage = ts2
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Bevel1: TBevel
        Tag = 300
        Left = 0
        Top = 578
        Width = 844
        Height = 2
        Align = alBottom
      end
      object Panel4: TPanel
        Left = 0
        Top = 580
        Width = 844
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          844
          27)
        object sBtnGo: TSpeedButton
          Left = 605
          Top = 2
          Width = 71
          Height = 25
          Hint = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
          Anchors = [akTop, akRight]
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
          ParentShowHint = False
          ShowHint = True
          Spacing = 1
          OnClick = sBtnGoClick
        end
        object LabelCntSelSch: TLabel
          Left = 2
          Top = 8
          Width = 104
          Height = 13
          Caption = #1055#1086#1084#1077#1095#1077#1085#1086' '#1089#1095#1077#1090#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sBtnExpand: TSpeedButton
          Left = 172
          Top = 2
          Width = 116
          Height = 25
          Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1089#1095#1077#1090#1072
          Caption = #1042#1089#1077' '#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100
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
          Spacing = 2
          OnClick = sBtnExpandClick
        end
        object sBtnCollapse: TSpeedButton
          Left = 291
          Top = 2
          Width = 101
          Height = 25
          Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1089#1095#1077#1090#1072
          Caption = #1042#1089#1077' '#1089#1074#1077#1088#1085#1091#1090#1100
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
            0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
            555555777777777755555550FBFB0555555555575FFF75555555555700007555
            5555555577775555555555555555555555555555555555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          Spacing = 2
          OnClick = sBtnCollapseClick
        end
        object BitBtn4: TBitBtn
          Left = 749
          Top = 2
          Width = 71
          Height = 25
          Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkCancel
          Spacing = 1
        end
      end
      object Panel2: TPanel
        Left = 653
        Top = 0
        Width = 191
        Height = 578
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        DesignSize = (
          191
          578)
        object PanelRight2: TPanel
          Left = 7
          Top = 113
          Width = 182
          Height = 282
          Anchors = [akRight]
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = 6
            Width = 162
            Height = 73
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1057#1083#1077#1074#1072' '#1089#1095#1077#1090#1072' ('#1080#1089#1090#1086#1095#1085#1080#1082#1080' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103'), '#1074#1089#1090#1088#1077#1090#1080#1074#1096#1080#1077#1089#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1077' ' +
              #1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'-'#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1079#1072' xxxxxxxxxx YYYY '#1075'.'
            WordWrap = True
          end
          object Label2: TLabel
            Left = 10
            Top = 118
            Width = 162
            Height = 50
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1042#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1089#1095#1105#1090' ('#1084#1086#1078#1085#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086') '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085 +
              #1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'" '
            WordWrap = True
          end
          object LabelSelMsg2: TLabel
            Left = 10
            Top = 166
            Width = 162
            Height = 44
            Alignment = taCenter
            AutoSize = False
            Caption = 
              #1045#1089#1083#1080' '#1085#1077#1090' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' - '#1076#1086#1082#1091#1084#1077#1085#1090' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089 +
              #1095#1105#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object sBtnSel: TSpeedButton
            Left = 19
            Top = 83
            Width = 27
            Height = 27
            Hint = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1086#1074'-'#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' ('#1090#1086' '#1078#1077' '#1082#1083#1072#1074#1080#1096#1072' <F8>)'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnSelClick
          end
          object sBtnSelAll: TSpeedButton
            Left = 76
            Top = 83
            Width = 27
            Height = 27
            Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
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
            Visible = False
            OnClick = sBtnSelAllClick
          end
          object sBtnUnSelAll: TSpeedButton
            Left = 134
            Top = 83
            Width = 27
            Height = 27
            Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
            Enabled = False
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
            OnClick = sBtnUnSelAllClick
          end
          object GroupBox2: TGroupBox
            Left = 17
            Top = 209
            Width = 150
            Height = 66
            Caption = ' '#1057#1087#1086#1089#1086#1073' '#1074#1099#1074#1086#1076#1072' '
            TabOrder = 0
            Visible = False
            object rBtnTtsAllAndCmn: TRadioButton
              Left = 11
              Top = 14
              Width = 125
              Height = 27
              Hint = 
                #1042' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074#1099#1074#1086#1076#1080#1090#1089#1103' '#1082#1072#1078#1076#1086#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1080' '#1080#1090#1086#1075' '#1087#1086' '#1074#1099 +
                #1073#1088#1072#1085#1085#1099#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
              Caption = '- '#1087#1086' '#1082#1072#1078#1076#1086#1084#1091' '#1089#1095#1077#1090#1091' '#1080' '#1086#1073#1097#1080#1077
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              WordWrap = True
            end
            object rBtnTtsOnlyCmn: TRadioButton
              Left = 11
              Top = 43
              Width = 125
              Height = 17
              Hint = #1042' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1074#1099#1074#1086#1076#1080#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1080#1090#1086#1075' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1099#1084' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103#1084
              Caption = '- '#1090#1086#1083#1100#1082#1086' '#1086#1073#1097#1080#1077
              Checked = True
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = True
            end
          end
        end
      end
      object TV: TTreeView
        Left = 0
        Top = 0
        Width = 653
        Height = 578
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HideSelection = False
        Indent = 19
        ParentFont = False
        PopupMenu = pop2
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        OnCustomDrawItem = TVCustomDrawItem
        OnKeyDown = TVKeyDown
      end
      object LbxSelSchBU: TListBox
        Left = 18
        Top = 214
        Width = 37
        Height = 37
        BorderStyle = bsNone
        Color = clBtnFace
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object SplitterTs2: TSplitter
        Left = 0
        Top = 280
        Width = 844
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        Color = clTeal
        MinSize = 150
        ParentColor = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 577
        Width = 844
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          844
          30)
        object sBtnBack2: TSpeedButton
          Left = 469
          Top = 5
          Width = 75
          Height = 25
          Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1082' '#1074#1099#1073#1086#1088#1091' '#1089#1095#1105#1090#1072' ('#1089#1095#1077#1090#1086#1074')'
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
          OnClick = sBtnBack2Click
        end
        object LabelMsgTs2: TLabel
          Left = 0
          Top = 3
          Width = 187
          Height = 29
          AutoSize = False
          Caption = #1041#1102#1076#1078#1077#1090' '#1080' '#1057#1087#1077#1094#1057#1088#1077#1076#1089#1090#1074#1072'. '#1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          WordWrap = True
        end
        object sBtnPrt: TSpeedButton
          Left = 568
          Top = 5
          Width = 80
          Height = 25
          Hint = #1042#1099#1074#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1074' Excel-'#1092#1072#1081#1083
          Anchors = [akTop, akRight]
          Caption = #1052#1054
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
          Spacing = 3
          OnClick = sBtnPrtClick
        end
        object sBtnProverki: TSpeedButton
          Left = 369
          Top = 5
          Width = 75
          Height = 25
          Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1080#1090#1086#1075#1086#1074#1099#1093' '#1094#1080#1092#1088
          Anchors = [akTop, akRight]
          Caption = #1055#1088#1086#1074#1077#1088#1082#1080
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = sBtnProverkiClick
        end
        object btnPrintTable: TSpeedButton
          Left = 651
          Top = 5
          Width = 78
          Height = 25
          Hint = #1042#1099#1074#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1074' Excel-'#1092#1072#1081#1083
          Anchors = [akTop, akRight]
          Caption = #1053#1072#1073#1086#1088
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
          Spacing = 3
          OnClick = btnPrintTableClick
        end
        object BitBtn1: TBitBtn
          Left = 752
          Top = 5
          Width = 75
          Height = 25
          Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object dbgrSPZ: TDBGrid
        Left = 0
        Top = 0
        Width = 844
        Height = 280
        Hint = #1057#1074#1086#1076#1085#1072#1103' '#1090#1072#1073#1083#1080#1094#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
        Align = alTop
        Color = clCream
        Constraints.MaxHeight = 440
        Constraints.MinHeight = 150
        DataSource = dsrcSPZ
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pop2
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrSPZDrawColumnCell
        OnDblClick = pop2detailsClick
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            Expanded = False
            FieldName = 'MY_NR'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VNU'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Title.Caption = 'ZaMG'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_PF'
            Title.Caption = 'SP_PF'
            Width = 36
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
            FieldName = 'KDSPZ'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vid_SpZ'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_KEKV'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNT'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KRSCH'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FSTVP'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FSNV'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FZ'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NmVidN'
            Width = 48
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
            Visible = True
          end>
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 283
        Width = 844
        Height = 294
        ActivePage = ts_21
        Align = alClient
        Constraints.MaxHeight = 850
        Constraints.MinHeight = 200
        Style = tsButtons
        TabOrder = 2
        object ts_21: TTabSheet
          Caption = 'ts_21'
          object PanelTs2: TPanel
            Left = 0
            Top = 0
            Width = 836
            Height = 263
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PanelTs2'
            TabOrder = 0
            DesignSize = (
              836
              263)
            object Label3: TLabel
              Left = 667
              Top = 133
              Width = 167
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 0 '#1080#1083#1080' '#1087#1091#1089#1090#1086' - '#1054#1073#1097'.'#1042#1080#1076#1099' '#1085#1077' '#1048#1085#1074'.'
            end
            object Label4: TLabel
              Left = 667
              Top = 85
              Width = 74
              Height = 13
              Hint = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' PRR '#1074' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077
              Anchors = [akTop, akRight]
              Caption = #1047#1085#1072#1095#1077#1085#1080#1103' PRR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label5: TLabel
              Left = 667
              Top = 100
              Width = 147
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 1  -  '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1057#1057' '#1085#1077' '#1048#1085#1074'.'
            end
            object Label7: TLabel
              Left = 667
              Top = 116
              Width = 146
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 2  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1085#1077' '#1048#1085#1074'.'
            end
            object Label8: TLabel
              Left = 667
              Top = 148
              Width = 174
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 3  -  '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1057#1057' '#1089' '#1048#1085#1074#1072#1083#1080#1076#1086#1074
            end
            object Label9: TLabel
              Left = 667
              Top = 164
              Width = 173
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 4  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1089' '#1048#1085#1074#1072#1083#1080#1076#1086#1074
            end
            object Label10: TLabel
              Left = 667
              Top = 180
              Width = 159
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 7  -  '#1054#1073#1097#1080#1077' '#1074#1080#1076#1099' '#1089' '#1048#1085#1074#1072#1083#1080#1076#1086#1074
            end
            object LabelCntSchRec: TLabel
              Left = 672
              Top = 8
              Width = 165
              Height = 13
              Hint = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093
              Alignment = taCenter
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'LabelCntSchRec'
              ParentShowHint = False
              ShowHint = True
            end
            object LabelCntRecDbg2_1: TLabel
              Left = 672
              Top = 281
              Width = 165
              Height = 13
              Hint = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1045#1057#1042'-'#1076#1077#1083#1072#1093
              Alignment = taCenter
              Anchors = [akRight, akBottom]
              AutoSize = False
              Caption = 'LabelCntRecDbg2_1'
              ParentShowHint = False
              ShowHint = True
            end
            object dbgrPrp: TDBGrid
              Left = 0
              Top = 0
              Width = 655
              Height = 263
              Hint = 'dbgrPrp ('#1056#1072#1089#1095#1105#1090#1099' '#1074#1079#1085#1086#1089#1086#1074' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103')'
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clInfoBk
              DataSource = dsrcPrp
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
                  FieldName = 'Grp'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PSch'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchBU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VidN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VidNotes'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmFor'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmSvPrg'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmTo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchDt'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KEKV'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchKt'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HasChild'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ShVidN'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NmVidN'
                  Width = 3
                  Visible = True
                end>
            end
            object DBNavigator2: TDBNavigator
              Left = 715
              Top = 299
              Width = 80
              Height = 25
              DataSource = dsrcPrp
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Anchors = [akRight, akBottom]
              TabOrder = 1
            end
            object DBNavigator3: TDBNavigator
              Left = 715
              Top = 24
              Width = 80
              Height = 25
              DataSource = dsrcSPZ
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Anchors = [akTop, akRight]
              TabOrder = 2
            end
          end
        end
        object ts_22: TTabSheet
          Caption = 'ts_22'
          ImageIndex = 1
          object PanelTts2: TPanel
            Left = 0
            Top = 0
            Width = 836
            Height = 263
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              836
              263)
            object Label6: TLabel
              Left = 678
              Top = 58
              Width = 167
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 0 '#1080#1083#1080' '#1087#1091#1089#1090#1086' - '#1054#1073#1097'.'#1042#1080#1076#1099' '#1085#1077' '#1048#1085#1074'.'
            end
            object Label11: TLabel
              Left = 683
              Top = 6
              Width = 104
              Height = 13
              Anchors = [akTop, akRight]
              Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' PRR:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 678
              Top = 25
              Width = 147
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 1  -  '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1057#1057' '#1085#1077' '#1048#1085#1074'.'
            end
            object Label14: TLabel
              Left = 678
              Top = 73
              Width = 130
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 3  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. '#1057#1057' '#1089' '#1048#1085#1074'.'
            end
            object Label15: TLabel
              Left = 678
              Top = 89
              Width = 140
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 4  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1089' '#1048#1085#1074'.'
            end
            object Label16: TLabel
              Left = 678
              Top = 105
              Width = 126
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 7  -  '#1054#1073#1097#1080#1077' '#1074#1080#1076#1099' '#1089' '#1048#1085#1074'.'
            end
            object Label1CntRec2: TLabel
              Left = 684
              Top = 140
              Width = 155
              Height = 13
              Alignment = taCenter
              Anchors = [akTop, akRight]
              AutoSize = False
              Caption = 'LabelCntSchRec2'
              Visible = False
            end
            object Label13: TLabel
              Left = 678
              Top = 41
              Width = 146
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '- 2  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1085#1077' '#1048#1085#1074'.'
            end
            object dbgrPrp2: TDBGrid
              Left = 0
              Top = 0
              Width = 233
              Height = 113
              Color = clMoneyGreen
              DataSource = dsrcPrp2
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Visible = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NR'
                  Width = 26
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Grp'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Prd'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VidN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VidNotes'
                  Width = 94
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmFor'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmSvPrg'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmTo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PSch'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchBU'
                  Width = 53
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DtEndP'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmForP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrcEsvP'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmToP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchDt'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KEKV'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchKt'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ShVidN'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NmVidN'
                  Width = 3
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HasChild'
                  Width = 3
                  Visible = True
                end>
            end
            object dbgrDbg: TDBGrid
              Left = 0
              Top = 0
              Width = 673
              Height = 263
              Align = alLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = 9818610
              DataSource = dsrcDbg
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
                  Width = 42
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PSch'
                  Width = 49
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SchBU'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ForVid'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VidNotes'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ZaMesGod'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmFor'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmSvPrg'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrcVzn'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmVznR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SmVznF'
                  Visible = True
                end>
            end
          end
        end
        object ts_23: TTabSheet
          Caption = 'ts_23'
          ImageIndex = 2
          DesignSize = (
            836
            263)
          object Label17: TLabel
            Left = 671
            Top = 120
            Width = 167
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 0 '#1080#1083#1080' '#1087#1091#1089#1090#1086' - '#1054#1073#1097'.'#1042#1080#1076#1099' '#1085#1077' '#1048#1085#1074'.'
          end
          object Label18: TLabel
            Left = 677
            Top = 68
            Width = 104
            Height = 13
            Hint = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' PRR '#1074' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1077
            Anchors = [akTop, akRight]
            Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' PRR:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object Label19: TLabel
            Left = 672
            Top = 87
            Width = 147
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 1  -  '#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077' '#1057#1057' '#1085#1077' '#1048#1085#1074'.'
          end
          object Label20: TLabel
            Left = 672
            Top = 135
            Width = 130
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 3  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. '#1057#1057' '#1089' '#1048#1085#1074'.'
          end
          object Label21: TLabel
            Left = 672
            Top = 151
            Width = 140
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 4  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1089' '#1048#1085#1074'.'
          end
          object Label22: TLabel
            Left = 672
            Top = 167
            Width = 126
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 7  -  '#1054#1073#1097#1080#1077' '#1074#1080#1076#1099' '#1089' '#1048#1085#1074'.'
          end
          object Label23: TLabel
            Left = 672
            Top = 103
            Width = 146
            Height = 13
            Anchors = [akTop, akRight]
            Caption = '- 2  -  '#1041#1086#1083#1100#1085#1080#1095#1085'. 5 '#1076#1085'. '#1085#1077' '#1048#1085#1074'.'
          end
          object LabelCntRecSpZ: TLabel
            Left = 691
            Top = 8
            Width = 129
            Height = 13
            Hint = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103#1093
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Caption = 'LabelCntRecSpZ'
            ParentShowHint = False
            ShowHint = True
          end
          object LabelCntRecDbg2: TLabel
            Left = 691
            Top = 262
            Width = 129
            Height = 13
            Hint = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1045#1057#1042'-'#1076#1077#1083#1072#1093
            Alignment = taCenter
            Anchors = [akRight, akBottom]
            AutoSize = False
            Caption = 'LabelCntRecDbg2'
            ParentShowHint = False
            ShowHint = True
          end
          object dbgrDbg2: TDBGrid
            Left = 0
            Top = 0
            Width = 666
            Height = 263
            Hint = 'cdsDbg2 ('#1056#1072#1089#1095#1105#1090#1099' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1080' '#1074#1079#1085#1086#1089#1086#1074' '#1089' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1074' '#1045#1057#1042')'
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clMoneyGreen
            DataSource = dsrcDbg2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrDbg2DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'NR'
                Width = 28
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PSch'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SchBU'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ForVid'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VidNotes'
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DtEndP'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmFor'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmSvPrg'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PrcVzn'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmVznR'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SmVznF'
                Width = 79
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'SmRazn'
                Title.Color = clWindow
                Width = 83
                Visible = True
              end>
          end
          object DBNavigator1: TDBNavigator
            Left = 716
            Top = 280
            Width = 80
            Height = 25
            DataSource = dsrcDbg2
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Anchors = [akRight, akBottom]
            TabOrder = 1
          end
          object DBNavigator4: TDBNavigator
            Left = 716
            Top = 24
            Width = 80
            Height = 25
            DataSource = dsrcSPZ
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Anchors = [akTop, akRight]
            TabOrder = 2
          end
        end
      end
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select Gen_Id(My_Gen_ID, 1) My_NR, Cast(1 as SmallInt) as VNU,  ' +
        'Cast(32765 as SmallInt) as KdObj, '
      
        '       PSch, VidN, ShVidn, ZaMesGod,  KdSpZ, KdKatP, PRR, SchBU,' +
        ' Vid_KdSpZ,  '
      '       Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ,  '
      
        '       Round(Sum(Summa), 2) as SMM,  Count(NR) as CNT, Cast(null' +
        ' as Char(10)) as KrSch  '
      ' from ViNuMain '
      ' where DtProc = '#39'10/01/2013'#39' and  PSCH = "801" and '
      '       (not KdObj in (1056))  '
      
        ' group by PSch, VidN, ShVidn, ZaMesGod, KdSpZ, SchBU, KdKatP, PR' +
        'R, '
      '          Vid_KdSpZ, Vid_KEKV, SP_PF, SP_FSTVP, SP_FSNV, SP_FZ  '
      ' having Round(Sum(Summa), 2) <> 0')
    Left = 28
    Top = 145
  end
  object cdsSPZ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    OnCalcFields = cdsSPZCalcFields
    Left = 28
    Top = 195
    object cdsSPZMY_NR: TIntegerField
      FieldName = 'MY_NR'
    end
    object cdsSPZVNU: TSmallintField
      FieldName = 'VNU'
    end
    object cdsSPZKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object cdsSPZPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsSPZZaMesGod: TDateTimeField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yy'
    end
    object cdsSPZKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsSPZKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object cdsSPZPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsSPZSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsSPZVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsSPZSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsSPZNmVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmVidN'
      Size = 65
      Calculated = True
    end
    object cdsSPZSMM: TFloatField
      FieldName = 'SMM'
      DisplayFormat = '#.00'
    end
    object cdsSPZVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object cdsSPZVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object cdsSPZVid_SpZ: TStringField
      FieldName = 'Vid_SpZ'
      Size = 10
    end
    object cdsSPZSP_PF: TStringField
      DisplayLabel = 'PF'
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object cdsSPZSP_FSTVP: TStringField
      DisplayLabel = 'TVP'
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object cdsSPZSP_FSNV: TStringField
      DisplayLabel = 'NV'
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object cdsSPZSP_FZ: TStringField
      DisplayLabel = 'FZ'
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object cdsSPZCNT: TIntegerField
      FieldName = 'CNT'
    end
    object cdsSPZKRSCH: TStringField
      FieldName = 'KRSCH'
      FixedChar = True
      Size = 10
    end
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 44
    Top = 163
  end
  object dsrcSPZ: TDataSource
    DataSet = cdsSPZ
    Left = 48
    Top = 208
  end
  object QryTvNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select PSch, KdSpZ, SchBU, NmSch, sum(summa)'
      'from vinu4'
      'where dtProc = '#39'01/01/2006'#39
      'group by PSch, KdSpZ, SchBU, NmSch')
    Left = 28
    Top = 75
  end
  object cdsPrp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Grp'
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
        Size = 15
      end
      item
        Name = 'HasChild'
        DataType = ftBoolean
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'SmTo'
        DataType = ftFloat
      end
      item
        Name = 'SchDt'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KEKV'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SchKt'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VidNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmVidN'
        DataType = ftString
        Size = 65
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 108
    Top = 347
    object cdsPrpNR: TAutoIncField
      DisplayWidth = 5
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsPrpGrp: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'Grp'
    end
    object cdsPrpPSch: TStringField
      DisplayWidth = 7
      FieldName = 'PSch'
      Size = 10
    end
    object cdsPrpSchBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      DisplayWidth = 9
      FieldName = 'SchBU'
      Size = 15
    end
    object cdsPrpHasChild: TBooleanField
      DisplayLabel = 'HsChild'
      DisplayWidth = 4
      FieldName = 'HasChild'
    end
    object cdsPrpVidN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VidN'
      Size = 4
    end
    object cdsPrpSmFor: TFloatField
      DisplayWidth = 17
      FieldName = 'SmFor'
      DisplayFormat = '#.00'
    end
    object cdsPrpSmSvPrg: TFloatField
      DisplayWidth = 16
      FieldName = 'SmSvPrg'
      DisplayFormat = '#.00'
    end
    object cdsPrpSmTo: TFloatField
      DisplayWidth = 14
      FieldName = 'SmTo'
      DisplayFormat = '#.00'
    end
    object cdsPrpSchDt: TStringField
      DisplayWidth = 14
      FieldName = 'SchDt'
      Size = 15
    end
    object cdsPrpKEKV: TStringField
      DisplayWidth = 6
      FieldName = 'KEKV'
      Size = 4
    end
    object cdsPrpSchKt: TStringField
      DisplayWidth = 13
      FieldName = 'SchKt'
      Size = 15
    end
    object cdsPrpVidNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'. '#1082' '#1074#1080#1076#1091
      DisplayWidth = 20
      FieldName = 'VidNotes'
      Size = 25
    end
    object cdsPrpShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 18
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsPrpNmVidN: TStringField
      DisplayWidth = 78
      FieldName = 'NmVidN'
      Size = 65
    end
  end
  object dsrcPrp: TDataSource
    DataSet = cdsPrp
    Left = 120
    Top = 360
  end
  object pop2: TPopupMenu
    OnPopup = pop2Popup
    Left = 116
    Top = 75
    object pop2details: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086' '#1087#1086' '#1089#1090#1088#1086#1082#1077
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1092#1072#1081#1083#1072' '#1053#1059
      Visible = False
      OnClick = pop2detailsClick
    end
    object NAccMapping: TMenuItem
      Caption = #1057#1086#1087#1086#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1086#1074
      OnClick = NAccMappingClick
    end
  end
  object qryTmp2: TQuery
    Left = 188
    Top = 155
  end
  object cdsPdnFin: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 188
    Top = 203
    object cdsPdnFinVNU: TSmallintField
      FieldName = 'VNU'
    end
    object cdsPdnFinKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object cdsPdnFinPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsPdnFinZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
    end
    object cdsPdnFinKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsPdnFinKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object cdsPdnFinPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsPdnFinSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsPdnFinVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsPdnFinSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsPdnFinVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object cdsPdnFinVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object cdsPdnFinSP_PF: TStringField
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object cdsPdnFinSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object cdsPdnFinSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object cdsPdnFinSP_FZ: TStringField
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object cdsPdnFinSMM: TFloatField
      FieldName = 'SMM'
    end
    object cdsPdnFinCNT: TIntegerField
      FieldName = 'CNT'
    end
    object cdsPdnFinKRSCH: TStringField
      FieldName = 'KRSCH'
      FixedChar = True
      Size = 10
    end
  end
  object cdsPrp2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Grp'
        DataType = ftSmallint
      end
      item
        Name = 'Prd'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DtEndP'
        DataType = ftDate
      end
      item
        Name = 'PrcEsvP'
        DataType = ftFloat
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'HasChild'
        DataType = ftBoolean
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'SmTo'
        DataType = ftFloat
      end
      item
        Name = 'SchDt'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'KEKV'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'SchKt'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VidNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NmVidN'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'SmForP'
        DataType = ftFloat
      end
      item
        Name = 'SmToP'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 188
    Top = 347
    object cdsPrp2NR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsPrp2Grp: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'Grp'
    end
    object cdsPrp2Prd: TStringField
      DisplayLabel = #1055#1088#1076
      FieldName = 'Prd'
      Size = 3
    end
    object cdsPrp2DtEndP: TDateField
      DisplayLabel = #1044#1090#1050#1085#1094#1055
      FieldName = 'DtEndP'
      DisplayFormat = 'mm/yy'
    end
    object cdsPrp2PrcEsvP: TFloatField
      DisplayLabel = #1055#1088#1094#1042#1079#1085#1055#1088#1087
      FieldName = 'PrcEsvP'
    end
    object cdsPrp2PSch: TStringField
      DisplayLabel = #1055#1057#1095
      FieldName = 'PSch'
      Size = 10
    end
    object cdsPrp2SchBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SchBU'
      Size = 15
    end
    object cdsPrp2HasChild: TBooleanField
      FieldName = 'HasChild'
    end
    object cdsPrp2VidN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VidN'
      Size = 4
    end
    object cdsPrp2SmFor: TFloatField
      DisplayLabel = #1057#1084#1044#1083#1103
      FieldName = 'SmFor'
    end
    object cdsPrp2SmSvPrg: TFloatField
      DisplayLabel = #1057#1084#1057#1074#1055#1088#1075
      FieldName = 'SmSvPrg'
    end
    object cdsPrp2SmTo: TFloatField
      DisplayLabel = #1057#1084#1042#1045#1089#1074
      FieldName = 'SmTo'
    end
    object cdsPrp2SchDt: TStringField
      FieldName = 'SchDt'
      Size = 15
    end
    object cdsPrp2KEKV: TStringField
      FieldName = 'KEKV'
      Size = 4
    end
    object cdsPrp2SchKt: TStringField
      FieldName = 'SchKt'
      Size = 15
    end
    object cdsPrp2VidNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'. '#1082' '#1074#1080#1076#1091
      FieldName = 'VidNotes'
      Size = 25
    end
    object cdsPrp2ShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsPrp2NmVidN: TStringField
      FieldName = 'NmVidN'
      Size = 65
    end
    object cdsPrp2SmForP: TFloatField
      FieldName = 'SmForP'
    end
    object cdsPrp2SmToP: TFloatField
      FieldName = 'SmToP'
    end
  end
  object dsrcPrp2: TDataSource
    DataSet = cdsPrp2
    Left = 200
    Top = 360
  end
  object cdsDbg2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
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
      end
      item
        Name = 'ForVid'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VidNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DtEndP'
        DataType = ftDate
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'PrcVzn'
        DataType = ftFloat
      end
      item
        Name = 'SmVznR'
        DataType = ftFloat
      end
      item
        Name = 'SmVznF'
        DataType = ftFloat
      end
      item
        Name = 'SmRazn'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 668
    Top = 539
    object cdsDbg2NR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDbg2PSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsDbg2SchBU: TStringField
      DisplayLabel = #1057#1095#1105#1090#1041#1059
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsDbg2ForVid: TStringField
      DisplayLabel = #1044#1083#1103#1042#1080#1076#1072
      FieldName = 'ForVid'
      Size = 4
    end
    object cdsDbg2VidNotes: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'VidNotes'
      Size = 25
    end
    object cdsDbg2DtEndP: TDateField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095#1055#1077#1088
      FieldName = 'DtEndP'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsDbg2SmFor: TFloatField
      DisplayLabel = #1057#1084#1044#1083#1103#1056#1072#1089#1095#1105#1090#1072
      FieldName = 'SmFor'
      DisplayFormat = '0.00'
    end
    object cdsDbg2SmSvPrg: TFloatField
      DisplayLabel = #1057#1084#1057#1074#1055#1088#1075
      FieldName = 'SmSvPrg'
      DisplayFormat = '0.00'
    end
    object cdsDbg2PrcVzn: TFloatField
      DisplayLabel = #1055#1088#1094#1042#1079#1085
      FieldName = 'PrcVzn'
    end
    object cdsDbg2SmVznR: TFloatField
      DisplayLabel = #1057#1084#1042#1079#1085#1056#1089#1095
      FieldName = 'SmVznR'
      DisplayFormat = '0.00'
    end
    object cdsDbg2SmVznF: TFloatField
      DisplayLabel = #1057#1084#1042#1079#1085#1060#1082#1090
      FieldName = 'SmVznF'
      DisplayFormat = '0.00'
    end
    object cdsDbg2SmRazn: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1073#1086#1088
      FieldName = 'SmRazn'
      DisplayFormat = '0.00'
    end
  end
  object qryPrds: TQuery
    Left = 604
    Top = 475
  end
  object qryTmp3: TQuery
    Left = 636
    Top = 475
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
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ForVid'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VidNotes'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmFor'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrg'
        DataType = ftFloat
      end
      item
        Name = 'PrcVzn'
        DataType = ftFloat
      end
      item
        Name = 'SmVznR'
        DataType = ftFloat
      end
      item
        Name = 'SmVznF'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'PSchSchForVidZaMG'
        CaseInsFields = 'PSch;SchBU'
        Fields = 'PSch;SchBU;ForVid;ZaMesGod'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'PSchSchForVidZaMG'
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 478
    object cdsDbgNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsDbgPSch: TStringField
      FieldName = 'PSch'
      Size = 10
    end
    object cdsDbgSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object cdsDbgForVid: TStringField
      FieldName = 'ForVid'
      Size = 4
    end
    object cdsDbgVidNotes: TStringField
      FieldName = 'VidNotes'
      Size = 25
    end
    object cdsDbgZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsDbgSmFor: TFloatField
      FieldName = 'SmFor'
      DisplayFormat = '0.00'
    end
    object cdsDbgSmSvPrg: TFloatField
      FieldName = 'SmSvPrg'
      DisplayFormat = '0.00'
    end
    object cdsDbgPrcVzn: TFloatField
      FieldName = 'PrcVzn'
    end
    object cdsDbgSmVznR: TFloatField
      FieldName = 'SmVznR'
      DisplayFormat = '0.00'
    end
    object cdsDbgSmVznF: TFloatField
      FieldName = 'SmVznF'
      DisplayFormat = '0.00'
    end
  end
  object dsrcDbg: TDataSource
    DataSet = cdsDbg
    Left = 688
    Top = 496
  end
  object dsrcDbg2: TDataSource
    DataSet = cdsDbg2
    Left = 680
    Top = 552
  end
  object qryNU: TQuery
    Left = 452
    Top = 163
  end
  object qryVidN: TQuery
    Left = 420
    Top = 163
  end
  object cdsEmployeeDeductions: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Sum'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 516
    Top = 203
  end
  object cdsDeductionTotals: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Sum'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 564
    Top = 211
  end
end
