object FormSvdSPZ: TFormSvdSPZ
  Left = 368
  Top = 278
  Width = 650
  Height = 500
  ActiveControl = BitBtn4
  BorderIcons = [biSystemMenu]
  Caption = 'FormSvdSPZ'
  Color = clBtnFace
  Constraints.MaxWidth = 650
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
    Width = 642
    Height = 473
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'ts1'
      object Bevel1: TBevel
        Tag = 300
        Left = 0
        Top = 413
        Width = 634
        Height = 2
        Align = alBottom
      end
      object Panel4: TPanel
        Left = 0
        Top = 415
        Width = 634
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          634
          27)
        object sBtnGo: TSpeedButton
          Left = 490
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
          Left = 563
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
        Left = 443
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
        object LabelDbg: TLabel
          Left = 2
          Top = 6
          Width = 189
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'LabelDbg'
        end
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
              #1042#1099#1076#1077#1083#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1089#1095#1077#1090' ('#1084#1086#1078#1085#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1086') '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085 +
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
            Caption = #1045#1089#1083#1080' '#1085#1077#1090' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1089#1095#1077#1090#1086#1074' - '#1076#1086#1082#1091#1084#1077#1085#1090' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086
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
        Width = 443
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
        Width = 634
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          634
          30)
        object sBtnBack2: TSpeedButton
          Left = 408
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
          Width = 187
          Height = 29
          AutoSize = False
          Caption = #1041#1102#1076#1078#1077#1090' '#1080' '#1057#1087#1077#1094#1057#1088#1077#1076#1089#1090#1074#1072'. '#1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          WordWrap = True
        end
        object sBtnPrt: TSpeedButton
          Left = 486
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
          Left = 330
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
          Left = 558
          Top = 5
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1099#1093#1086#1076
          TabOrder = 0
          Kind = bkCancel
        end
      end
      object dbgrSpZ: TDBGrid
        Left = 0
        Top = 0
        Width = 634
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
            Width = 14
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDOBJ'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PSch'
            Width = 42
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
            FieldName = 'VIDN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMVIDN'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 21
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
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vid_SpZ'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VID_KEKV'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNT'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KRSCH'
            Visible = True
          end>
      end
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select Cast(1 as SmallInt) as VNU,'
      ' Cast(9999 as SmallInt) as KdObj, PSch,'
      ' KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSpZ,'
      ' Vid_KEKV, Sum(Smm) as SMM, Sum(CNT) as CNT,'
      '       Cast(null as Char(10)) as KrSch'
      ' from FOR_GO4 ('#39'01/01/2006'#39')'
      ' where ((PSCH = "801/'#1089#1073'") and'
      
        '             (SchBU in ("801/14","801/15","801/17","801/'#1073'")))  o' +
        'r'
      '           ((PSCH = "811/'#1089#1073'") and'
      '             (SchBU in ("811/01","811/05","811/20","811/'#1072'")))'
      
        'group by PSch, KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSp' +
        'Z, Vid_KEKV')
    Left = 28
    Top = 145
  end
  object cdsSPZ: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsSPZCalcFields
    Left = 28
    Top = 200
    object cdsSPZVNU: TSmallintField
      FieldName = 'VNU'
    end
    object cdsSPZKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object cdsSPZPSCH: TStringField
      DisplayLabel = 'PSCH'
      FieldName = 'PSch'
      Size = 10
    end
    object cdsSPZKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsSPZPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsSPZSCHBU: TStringField
      FieldName = 'SCHBU'
      FixedChar = True
      Size = 10
    end
    object cdsSPZVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsSPZNMVIDN: TStringField
      FieldName = 'NMVIDN'
      Size = 65
    end
    object cdsSPZSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsSPZSMM: TFloatField
      FieldName = 'SMM'
      DisplayFormat = '0.00'
    end
    object cdsSPZVid_KdSpZ: TSmallintField
      FieldName = 'Vid_KdSpZ'
    end
    object cdsSPZVid_SpZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'Vid_SpZ'
      Size = 10
      Calculated = True
    end
    object cdsSPZVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
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
    Left = 44
    Top = 163
  end
  object dsrcSPZ: TDataSource
    DataSet = cdsSPZ
    Left = 48
    Top = 208
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
  object pop2: TPopupMenu
    Left = 116
    Top = 75
    object pop2details: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086' '#1087#1086' '#1089#1090#1088#1086#1082#1077
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1092#1072#1081#1083#1072' '#1053#1059
      OnClick = pop2detailsClick
    end
  end
end
