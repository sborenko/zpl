object FormMo5nw: TFormMo5nw
  Left = 284
  Top = 183
  Width = 900
  Height = 500
  ActiveControl = dbgrPrp
  BorderIcons = [biSystemMenu]
  Caption = 'FormMo5nw'
  Color = clBtnFace
  Constraints.MaxWidth = 900
  Constraints.MinHeight = 500
  Constraints.MinWidth = 485
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
    Width = 892
    Height = 473
    ActivePage = ts3
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Bevel1: TBevel
        Tag = 300
        Left = 0
        Top = 413
        Width = 884
        Height = 2
        Align = alBottom
      end
      object Panel4: TPanel
        Left = 0
        Top = 415
        Width = 884
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          884
          27)
        object sBtnGo: TSpeedButton
          Left = 740
          Top = 2
          Width = 71
          Height = 25
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
          Spacing = 1
          OnClick = sBtnGoClick
        end
        object LabelCntSelSch: TLabel
          Left = 3
          Top = 8
          Width = 88
          Height = 13
          Caption = #1042#1099#1076#1077#1083#1077#1085#1086' '#1089#1095#1077#1090#1086#1074
        end
        object BitBtn4: TBitBtn
          Left = 813
          Top = 2
          Width = 71
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
          Spacing = 1
        end
      end
      object Panel2: TPanel
        Left = 693
        Top = 0
        Width = 191
        Height = 413
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        DesignSize = (
          191
          413)
        object PanelRight2: TPanel
          Left = 7
          Top = 29
          Width = 182
          Height = 288
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
              #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1057#1063#1045#1058' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1044#1072#1083#1077#1077'" ('#1057#1091#1073#1057#1095#1077#1090#1072' '#1087#1086#1082 +
              #1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1099')'
            WordWrap = True
          end
          object LabelSelMsg2: TLabel
            Left = 10
            Top = 166
            Width = 162
            Height = 44
            Alignment = taCenter
            AutoSize = False
            Caption = #1045#1089#1083#1080' '#1085#1077#1090' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' - '#1076#1086#1082#1091#1084#1077#1085#1090' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
            WordWrap = True
          end
          object sBtnSel: TSpeedButton
            Left = 19
            Top = 83
            Width = 27
            Height = 27
            Hint = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
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
            Visible = False
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
            Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
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
            Visible = False
            OnClick = sBtnUnSelAllClick
          end
          object GroupBox2: TGroupBox
            Left = 17
            Top = 213
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
        Width = 693
        Height = 413
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HideSelection = False
        Indent = 19
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        OnCustomDrawItem = TVCustomDrawItem
        OnKeyDown = TVKeyDown
      end
      object LbxSchBU: TListBox
        Left = 10
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
      object Panel1: TPanel
        Left = 0
        Top = 412
        Width = 884
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          884
          30)
        object sBtnBack2: TSpeedButton
          Left = 658
          Top = 5
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
          OnClick = sBtnBack2Click
        end
        object LabelMsgTs2: TLabel
          Left = 0
          Top = 3
          Width = 225
          Height = 29
          AutoSize = False
          Caption = #1041#1102#1076#1078#1077#1090' '#1080' '#1057#1087#1077#1094#1057#1088#1077#1076#1089#1090#1074#1072'. '#1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Visible = False
          WordWrap = True
        end
        object sBtnPrt: TSpeedButton
          Left = 736
          Top = 5
          Width = 69
          Height = 25
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
          Spacing = 3
          OnClick = sBtnPrtClick
        end
        object sBtnProverki: TSpeedButton
          Left = 580
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
        object BitBtn1: TBitBtn
          Left = 808
          Top = 5
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
        end
        object chBoxDetails: TCheckBox
          Left = 8
          Top = 10
          Width = 153
          Height = 17
          Hint = #1042#1087#1077#1095#1072#1090#1099#1074#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1089#1091#1084#1084#1099' '#1080' '#1089#1077#1088#1093#1055#1086#1088#1086#1075#1080
          Caption = #1055#1077#1095#1072#1090#1100' '#1089' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1086#1081
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
        end
      end
      object dbgrSpZ: TDBGrid
        Left = 0
        Top = 0
        Width = 884
        Height = 412
        Align = alClient
        DataSource = dsrcSPZ
        PopupMenu = pop2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'VNU'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSCH'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SCHBU'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_SCHDT'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_SCHKT'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_KEKV'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SMM'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNT'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTSCH'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KTSCH'
            Width = 47
            Visible = True
          end>
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 0
        Top = 305
        Width = 884
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object dbgrPrp: TDBGrid
        Left = 0
        Top = 0
        Width = 884
        Height = 305
        Align = alTop
        DataSource = dsrcPrp
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dbgrPrp2: TDBGrid
        Left = 0
        Top = 308
        Width = 884
        Height = 134
        Align = alClient
        DataSource = dsrcPrp2
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
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZaMesGod'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmForPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToPFCmn'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToPFInv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSvPrgPf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmForSsTvp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToSsTvp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSvPrgTvp'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmForSsNv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToSsNv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSvPrgNv'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmForFz'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmToFz'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SmSvPrgFz'
            Visible = True
          end>
      end
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select Cast(1 as SmallInt) as VNU, PSCH, SchBU,'
      '           Vid_SchDt, Vid_SchKt, Vid_Kekv, VidN, ShVidN, PRR,'
      
        '          Sum(Cast(Summa as numeric(18,2))) as SMM, Count(*) as ' +
        'CNT,'
      
        '      Cast(null as Char(10)) as DtSch, Cast(null as Char(10)) as' +
        ' KtSch'
      ' from VINU_ForMo5 where dtProc = "10/01/2006" and VidN < "8600"'
      ' group by PSCH, SchBU, Vid_SchDt, Vid_SchKt, Vid_Kekv, VidN,'
      '                ShVidN, PRR')
    Left = 28
    Top = 145
  end
  object cdsSPZ: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VNU'
        DataType = ftSmallint
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SCHBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VID_SCHDT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VID_SCHKT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VID_KEKV'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
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
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'SMM'
        DataType = ftBCD
        Precision = 15
        Size = 2
      end
      item
        Name = 'CNT'
        DataType = ftInteger
      end
      item
        Name = 'DTSCH'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KTSCH'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsSPZCalcFields
    Left = 108
    Top = 251
    object cdsSPZVNU: TSmallintField
      FieldName = 'VNU'
    end
    object cdsSPZPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsSPZSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsSPZVID_SCHDT: TStringField
      DisplayLabel = #1057#1095#1044#1090#1042#1080#1076#1072
      FieldName = 'VID_SCHDT'
      Size = 10
    end
    object cdsSPZVID_SCHKT: TStringField
      DisplayLabel = #1057#1095#1050#1090#1042#1080#1076#1072
      FieldName = 'VID_SCHKT'
      Size = 10
    end
    object cdsSPZVID_KEKV: TStringField
      DisplayLabel = #1050#1077#1082#1074#1042#1080#1076#1072
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object cdsSPZVIDN: TStringField
      DisplayLabel = #1042#1080#1076#1053
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsSPZSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsSPZPRR: TSmallintField
      DisplayLabel = #1041#1083#1085
      FieldName = 'PRR'
    end
    object cdsSPZSMM: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '#.00'
      Precision = 15
      Size = 2
    end
    object cdsSPZCNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      FieldName = 'CNT'
    end
    object cdsSPZDTSCH: TStringField
      DisplayLabel = #1044#1090'_'#1052#1086
      FieldName = 'DTSCH'
      FixedChar = True
      Size = 10
    end
    object cdsSPZKTSCH: TStringField
      DisplayLabel = #1050#1090'_'#1052#1086
      FieldName = 'KTSCH'
      FixedChar = True
      Size = 10
    end
  end
  object dspTmp: TDataSetProvider
    Left = 44
    Top = 163
  end
  object dsrcSPZ: TDataSource
    DataSet = cdsSPZ
    Left = 120
    Top = 264
  end
  object qryTvNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select PSch, KdSpZ, SchBU, NmSch, sum(summa)'
      'from vinu4'
      'where dtProc = '#39'01/01/2006'#39
      'group by PSch, KdSpZ, SchBU, NmSch')
    Left = 28
    Top = 75
  end
  object cdsTmp: TClientDataSet
    Active = True
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
        Name = 'HasChild'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 188
    Top = 75
    Data = {
      940000009619E0BD0100000018000000040000000000030000009400024E5204
      0001000200010007535542545950450200490008004175746F696E6300045053
      63680100490000000100055749445448020002000A0005536368425501004900
      00000100055749445448020002000A00084861734368696C6402000300000000
      0001000C4155544F494E4356414C55450400010001000000}
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 200
    Top = 88
  end
  object pop2: TPopupMenu
    Left = 116
    Top = 75
    object pop2details: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086' '#1087#1086' '#1089#1090#1088#1086#1082#1077
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1092#1072#1081#1083#1072' '#1053#1059
      OnClick = pop2detailsClick
    end
  end
  object tblSpZ: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VNU'
        DataType = ftSmallint
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Vid_SchDt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Vid_SchKt'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Vid_Kekv'
        DataType = ftString
        Size = 4
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
        Name = 'PRR'
        DataType = ftSmallint
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end
      item
        Name = 'CNT'
        DataType = ftInteger
      end
      item
        Name = 'DtSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KtSch'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'Prim'
        Fields = 'NR'
        Options = [ixPrimary]
      end
      item
        Name = 'Indx01'
        Fields = 'PSCH;VNU;VidN;SchBU'
      end>
    StoreDefs = True
    TableName = 'qqq'
    Left = 36
    Top = 203
    object tblSpZNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblSpZVNU: TSmallintField
      FieldName = 'VNU'
    end
    object tblSpZPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object tblSpZSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
    object tblSpZVid_SchDt: TStringField
      FieldName = 'Vid_SchDt'
      Size = 10
    end
    object tblSpZVid_SchKt: TStringField
      FieldName = 'Vid_SchKt'
      Size = 10
    end
    object tblSpZVid_Kekv: TStringField
      FieldName = 'Vid_Kekv'
      Size = 4
    end
    object tblSpZVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object tblSpZShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object tblSpZPRR: TSmallintField
      FieldName = 'PRR'
    end
    object tblSpZSMM: TFloatField
      FieldName = 'SMM'
    end
    object tblSpZCNT: TIntegerField
      FieldName = 'CNT'
    end
    object tblSpZDtSch: TStringField
      FieldName = 'DtSch'
      Size = 10
    end
    object tblSpZKtSch: TStringField
      FieldName = 'KtSch'
      Size = 10
    end
  end
  object tblPrp: TTable
    DatabaseName = 'c:\Temp'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmForPF'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmToPFInv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgPf'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgTvp'
        DataType = ftFloat
      end
      item
        Name = 'SmForSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmToSsNv'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgNv'
        DataType = ftFloat
      end
      item
        Name = 'SmForFz'
        DataType = ftFloat
      end
      item
        Name = 'SmToFz'
        DataType = ftFloat
      end
      item
        Name = 'SmSvPrgFz'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 't_Prp'
    Left = 364
    Top = 227
    object tblPrpNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPrpZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object tblPrpSmForPF: TFloatField
      FieldName = 'SmForPF'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToPFCmn: TFloatField
      FieldName = 'SmToPFCmn'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToPFInv: TFloatField
      FieldName = 'SmToPFInv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgPf: TFloatField
      FieldName = 'SmSvPrgPf'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForSsTvp: TFloatField
      FieldName = 'SmForSsTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToSsTvp: TFloatField
      FieldName = 'SmToSsTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgTvp: TFloatField
      FieldName = 'SmSvPrgTvp'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForSsNv: TFloatField
      FieldName = 'SmForSsNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToSsNv: TFloatField
      FieldName = 'SmToSsNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgNv: TFloatField
      FieldName = 'SmSvPrgNv'
      DisplayFormat = '#.00'
    end
    object tblPrpSmForFz: TFloatField
      FieldName = 'SmForFz'
      DisplayFormat = '#.00'
    end
    object tblPrpSmToFz: TFloatField
      FieldName = 'SmToFz'
      DisplayFormat = '#.00'
    end
    object tblPrpSmSvPrgFz: TFloatField
      FieldName = 'SmSvPrgFz'
      DisplayFormat = '#.00'
    end
  end
  object qryPrp: TQuery
    Left = 356
    Top = 139
  end
  object dsrcPrp: TDataSource
    DataSet = qryPrp
    Left = 376
    Top = 152
  end
  object dsrcPrp2: TDataSource
    DataSet = tblPrp
    Left = 376
    Top = 240
  end
end
