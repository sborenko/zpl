object FormChkNuZaMG: TFormChkNuZaMG
  Left = 345
  Top = 234
  Width = 659
  Height = 510
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormChkNuZaMG'
  Color = clBtnFace
  Constraints.MaxWidth = 780
  Constraints.MinHeight = 455
  Constraints.MinWidth = 655
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
  object PanelRight: TPanel
    Left = 492
    Top = 0
    Width = 159
    Height = 476
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 9
      Width = 122
      Height = 28
      AutoSize = False
      Caption = #1057#1091#1084#1084#1099' '#1079#1072'  '#1082#1072#1082#1086#1081' '#1084#1077#1089#1103#1094' '#1074#1099#1074#1086#1076#1080#1090#1100'?:'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 57
      Top = 8
      Width = 15
      Height = 13
      Caption = #1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object PanelRB: TPanel
      Left = 0
      Top = 434
      Width = 159
      Height = 42
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        159
        42)
      object sBtnStayOnTop: TSpeedButton
        Left = 4
        Top = 17
        Width = 23
        Height = 25
        Hint = #1042#1089#1077#1075#1076#1072' '#1087#1086#1074#1077#1088#1093' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1086#1082#1086#1085
        AllowAllUp = True
        Anchors = [akLeft, akBottom]
        GroupIndex = 3
        Down = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
          77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
          07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnStayOnTopClick
      end
      object sBtnGoBack: TSpeedButton
        Left = 32
        Top = 5
        Width = 61
        Height = 25
        Hint = #1053#1072#1079#1072#1076' '#1085#1072' '#1101#1082#1088#1072#1085' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
        Anchors = [akLeft, akBottom]
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
        Spacing = 0
        Visible = False
        OnClick = sBtnGoBackClick
      end
      object sBtnCtrl: TSpeedButton
        Left = 32
        Top = 17
        Width = 61
        Height = 25
        Hint = #1055#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1089#1090#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1081' '#1080' '#1074#1079#1085#1086#1089#1086#1074
        Anchors = [akLeft, akBottom]
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        ParentShowHint = False
        ShowHint = True
        OnClick = sBtnCtrlClick
      end
      object bBtnClose: TBitBtn
        Left = 95
        Top = 17
        Width = 61
        Height = 25
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
        Anchors = [akLeft, akBottom]
        Caption = #1042#1099#1093#1086#1076
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bBtnCloseClick
        Kind = bkCancel
        Spacing = 0
      end
    end
    object PanelRT: TPanel
      Left = -1
      Top = 46
      Width = 160
      Height = 345
      BevelOuter = bvNone
      TabOrder = 1
      object grBoxGroupCase: TGroupBox
        Left = 7
        Top = 24
        Width = 147
        Height = 52
        Caption = ' '#1057#1087#1086#1089#1086#1073' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1080' '
        TabOrder = 0
        object rBtnGrpByVidN: TRadioButton
          Left = 10
          Top = 15
          Width = 121
          Height = 17
          Hint = #1057#1091#1084#1084#1099', '#1074#1099#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1103#1094#1077', '#1075#1088#1091#1087#1087#1080#1088#1091#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1074#1080#1076#1072#1084
          Caption = '- '#1086#1073#1097#1080#1084#1080' '#1089#1091#1084#1084#1072#1084#1080
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
          OnClick = rBtnGrpByVidNClick
        end
        object rBtnGrpByVidNDtProc: TRadioButton
          Left = 10
          Top = 31
          Width = 113
          Height = 17
          Hint = #1057#1091#1084#1084#1099' '#1075#1088#1091#1087#1087#1080#1088#1091#1102#1090#1089#1103' '#1087#1086' '#1074#1080#1076#1072#1084' '#1080' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084' '#1074#1099#1087#1083#1072#1090' ('#1056'.'#1052#1077#1089')'
          Caption = '- '#1087#1086'-'#1084#1077#1089#1103#1095#1085#1086
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rBtnGrpByVidNClick
        end
      end
      object chBoxSvDtZaMG: TCheckBox
        Left = 25
        Top = 0
        Width = 124
        Height = 17
        Hint = #1055#1086#1084#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1084#1077#1089#1103#1094', '#1089' '#1082#1086#1090#1086#1088#1099#1084' '#1088#1072#1073#1086#1090#1072#1083#1080
        Alignment = taLeftJustify
        Caption = #1055#1086#1084#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1081
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 7
        Top = 83
        Width = 147
        Height = 176
        Hint = #1042#1089#1077' '#1076#1072#1085#1085#1099#1077' '#1085#1072' '#1082#1086#1085#1077#1094' '#1084#1077#1089#1103#1094#1072
        Caption = ' '#1048#1079' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        object Shape2: TShape
          Left = 89
          Top = 41
          Width = 48
          Height = 20
        end
        object Shape3: TShape
          Left = 89
          Top = 62
          Width = 48
          Height = 20
        end
        object Shape4: TShape
          Left = 111
          Top = 132
          Width = 24
          Height = 20
        end
        object Label3: TLabel
          Left = 12
          Top = 134
          Width = 96
          Height = 13
          Caption = #1048#1085#1074#1072#1083#1080#1076' ('#1075#1088#1091#1087#1087#1072') ..'
        end
        object Label4: TLabel
          Left = 7
          Top = 22
          Width = 59
          Height = 13
          Caption = #1054#1082#1083#1072#1076' ........'
        end
        object Label5: TLabel
          Left = 7
          Top = 43
          Width = 76
          Height = 13
          Caption = '% '#1088#1072#1073'.'#1074#1088#1077#1084#1077#1085#1080
        end
        object Label6: TLabel
          Left = 7
          Top = 64
          Width = 77
          Height = 13
          Caption = '% '#1083#1100#1075#1086#1090#1099' .........'
        end
        object LabelPrcWrkTime: TLabel
          Left = 90
          Top = 42
          Width = 44
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LabelPrcWrkTime'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object LabelProcLg: TLabel
          Left = 90
          Top = 63
          Width = 44
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LabelProcLg'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object LabelInv: TLabel
          Left = 112
          Top = 133
          Width = 22
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LabelInv'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Shape1: TShape
          Left = 70
          Top = 19
          Width = 67
          Height = 20
        end
        object LabelOklTrf: TLabel
          Left = 71
          Top = 21
          Width = 63
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'LabelOklTrf'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object ChBoxPPS: TCheckBox
          Left = 8
          Top = 83
          Width = 126
          Height = 17
          Alignment = taLeftJustify
          Caption = #1055#1055#1057' ........................'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = ChBoxPPSClick
        end
        object ChBoxPens: TCheckBox
          Left = 8
          Top = 99
          Width = 126
          Height = 17
          Alignment = taLeftJustify
          Caption = #1055#1077#1085#1089#1080#1086#1085#1077#1088' .............'
          TabOrder = 1
          OnClick = ChBoxPensClick
        end
        object ChBoxProfs: TCheckBox
          Left = 8
          Top = 115
          Width = 126
          Height = 17
          Alignment = taLeftJustify
          Caption = #1063#1083#1077#1085' '#1087#1088#1086#1092#1089#1086#1102#1079#1072' ...'
          TabOrder = 2
          OnClick = ChBoxProfsClick
        end
        object ChBoxIsUvoln: TCheckBox
          Left = 8
          Top = 153
          Width = 126
          Height = 17
          Alignment = taLeftJustify
          Caption = #1059#1074#1086#1083#1077#1085' ....................'
          TabOrder = 3
          OnClick = ChBoxIsUvolnClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 7
        Top = 266
        Width = 147
        Height = 71
        Caption = ' '#1059#1076#1077#1088#1078#1072#1085#1080#1103' '
        TabOrder = 3
        object rBtnUdergAll: TRadioButton
          Left = 8
          Top = 14
          Width = 113
          Height = 17
          Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080' '#1074#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
          Caption = '- '#1074' '#1089' '#1077
          Checked = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = True
          OnClick = rBtnFilterClick
        end
        object rBtnUdergSotr: TRadioButton
          Left = 8
          Top = 30
          Width = 131
          Height = 17
          Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          Caption = '- '#1090#1086#1083#1100#1082#1086' '#1089' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rBtnFilterClick
        end
        object rBtnUdergPrp: TRadioButton
          Left = 8
          Top = 46
          Width = 113
          Height = 18
          Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1074#1079#1085#1086#1089#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
          Caption = '- '#1090#1086#1083#1100#1082#1086' '#1089' '#1087#1088#1077#1076#1087#1088'.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = rBtnFilterClick
        end
      end
    end
    object DBComboZaMG: TDBComboBox
      Left = 78
      Top = 23
      Width = 71
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072', '#1047#1040' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1099' '#1074#1099#1087#1083#1072#1090#1099' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
      DataField = 'DtZaMG'
      DataSource = dsrcZaMG
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        '01-2003'
        '02-2003'
        '03-2003'
        '04-2003'
        '05-2003'
        '06-2003'
        '07-2003'
        '08-2003'
        '09-2003'
        '10-2003'
        '11-2003'
        '12-2003'
        '01-2004')
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = DBComboZaMGChange
      OnEnter = DBComboZaMGEnter
      OnExit = DBComboZaMGExit
      OnKeyDown = DBComboZaMGKeyDown
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 492
    Height = 476
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    OnChange = PageControl1Change
    object ts1: TTabSheet
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1091#1076#1077#1088#1078#1072#1085#1080#1103
      object dbgrNu: TDBGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 445
        Align = alClient
        Color = clInfoBk
        DataSource = dsrcNu
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrNuDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NR'
            Width = 21
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIDN'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHVIDN'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPROC'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPDN'
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
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FSNV'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SP_FZ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPRF'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALIM'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRR'
            Width = 18
            Visible = True
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1091#1076#1077#1088#1078#1072#1085#1080#1081
      ImageIndex = 1
      object F6B: TF6Book
        Left = 0
        Top = 0
        Width = 484
        Height = 452
        Align = alClient
        TabOrder = 0
        ControlData = {
          214334120800000006320000B72E000001002300FFFF000000000A00E4010000
          C4010000040000100000040A0000090006050006000000EE0401060000EF1400
          0000FF0000FFFF0000FFFFFFFFFFFFFFFFF1FF3D12000000005C1C7C1A180000
          000000010058020E01003115C8000000FF7F900100000000CC00050041726961
          6C3115C8000000FF7FBC0200000000CC000500417269616C3115C8000200FF7F
          900100000000CC000500417269616C3115C8000200FF7FBC0200000000CC0005
          00417269616C3115C8000000FF7F900100000000CC000500417269616C1E2F05
          0015000123002C00230023003000220040042E0022003B005C002D0023002C00
          230023003000220040042E0022001E3906001A000123002C0023002300300022
          0040042E0022003B005B005200650064005D005C002D0023002C002300230030
          00220040042E0022001E3B07001B000123002C002300230030002E0030003000
          220040042E0022003B005C002D0023002C002300230030002E00300030002200
          40042E0022001E45080020000123002C002300230030002E0030003000220040
          042E0022003B005B005200650064005D005C002D0023002C002300230030002E
          0030003000220040042E0022001E572A002900012A0020005F002D0023002C00
          230023003000220040042E0022003B002A0020005C002D0023002C0023002300
          3000220040042E0022003B002A0020005F002D0022002D002200220040042E00
          22003B0040001E1E29001900002A20232C2323303B2A205C2D232C2323303B2A
          20222D223B401E672C003100012A0020005F002D0023002C002300230030002E
          0030003000220040042E0022003B002A0020005C002D0023002C002300230030
          002E0030003000220040042E0022003B002A0020005F002D0022002D0022003F
          003F00220040042E0022003B0040001E262B002100002A20232C2323302E3030
          3B2A205C2D232C2323302E30303B2A20222D223F3F3B401E1A17001500005C24
          232C2323305F293B5C285C24232C2323305C291E1F18001A00005C24232C2323
          305F293B5B5265645D5C285C24232C2323305C291E2019001B00005C24232C23
          23302E30305F293B5C285C24232C2323302E30305C291E251A002000005C2423
          2C2323302E30305F293B5B5265645D5C285C24232C2323302E30305C291E2B40
          002600002A205F2D232C2323302220223B2A205C2D232C2323302220223B2A20
          5F2D222D222220223B401E3341002E00002A205F2D232C2323302E3030222022
          3B2A205C2D232C2323302E30302220223B2A205F2D222D223F3F2220223B40ED
          050000000000EC03000000E01800000000F5FF200000000000000000000000C0
          2000000000E01801000000F5FF200000F40000000000000000C02000000000E0
          1801000000F5FF200000F40000000000000000C02000000000E01802000000F5
          FF200000F40000000000000000C02000000000E01802000000F5FF200000F400
          00000000000000C02000000000E01800000000F5FF200000F400000000000000
          00C02000000000E01800000000F5FF200000F40000000000000000C020000000
          00E01800000000F5FF200000F40000000000000000C02000000000E018000000
          00F5FF200000F40000000000000000C02000000000E01800000000F5FF200000
          F40000000000000000C02000000000E01800000000F5FF200000F40000000000
          000000C02000000000E01800000000F5FF200000F40000000000000000C02000
          000000E01800000000F5FF200000F40000000000000000C02000000000E01800
          000000F5FF200000F40000000000000000C02000000000E01800000000F5FF20
          0000F40000000000000000C02000000000E01800000000010020000000000000
          0000000000C02000000000E01801002B00F5FF200000F80000000000000000C0
          2000000000E01801002900F5FF200000F80000000000000000C02000000000E0
          1801004100F5FF200000F80000000000000000C02000000000E01801004000F5
          FF200000F80000000000000000C02000000000E01801000900F5FF200000F800
          00000000000000C02000000000E01804000000F0FF1200004800000000000000
          00C0200000000092E2380000000000FFFFFF00FF00000000FF00000000FF00FF
          FF0000FF00FF0000FFFF00800000000080000000008000808000008000800000
          808000C0C0C000808080008080FF0080206000FDF9D000A0E0E00060008000FF
          8080000080C000C0C0FF0000008000FF00FF00FFFF000000FFFF008000800080
          000000008080000000FF0000CFFF0069FFFF00E0FFE000FFFF8000A6CAF000DD
          9CB300B38FEE00E3E3E3002A6FF9003FB8CD0048843600958C41008E5E4200A0
          627A00624FAC00969696001D2FBE002866760000450000453E01006A28130085
          396A004A32850042424200850A000006005368656574318C010007000A090006
          1000060000000D01000C640011010010FCA9F1D24D62503F5F01002A00002B01
          00250000FF0081C10414050200002641150A0700005061676520265083000084
          000026000000000000E83F27000000000000E83F28000000000000F03F290000
          00000000F03F4EFFE2010000FFFFFFFF2A88367E13A0377E00000000041D7A00
          9203160046000000000000008CAF13000000000000000000460000000414C30A
          049C130098A9377E041D7A000004840094000801032F000002000900F604F802
          0000010007002C01020000002C01000000000000000000008CAF1300649D1300
          50AE13008CAF13000414C30A005082008CAF13000414C30A50AE130043138200
          8CAF130050AE13000414C30AEE12011C52000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          2C0000000FC9F399000002000200020000000100000000000000840000000000
          0E00CC0C0000040087007401740005006704070000006804010000006A040400
          00006904020000006C040B000100000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000009000700010007000100640000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000002C0068DE4900A1220900640001000100010000002C012C010000
          00000000E03F000000000000E03F0100000000000000000000000000000000F7
          189200FFCCFFFFFF00D4D0C800FF00FFFF0000000000000000F2100000000000
          000000000000000300FFFFF6150015001500FF0000037D0000000025160F0002
          0046007D01000100490A0F00020046007D020002006E090F00020046007D0300
          0300000A0F00020046007D0400040049080F00020046007D0500FF0026090F00
          020046003E12A606000000000000000000000000000000001D0F030000000000
          000100000000000000A0640064009926090A1600000138B78A051B00000134B8
          8A051D00000128B98A05150000011CBA8A051C00000114BB8A051A00000104BC
          8A0515000001F0BC8A0513000001D0BE8A051F000001D0BF8A051C000001CCC0
          8A051C000001C8C18A051B000001C0C28A0518000001B0C38A05150000019CC4
          8A051600000188C58A051500000174C68A051500000160C78A051500000150C8
          8A051700000148C98A051E00000144CA8A051C00000138CB8A051400000130CC
          8A05210000012CCD8A051A00000120CE8A051700000114CF8A051700000110D0
          8A051F00000114D18A051F00000114D28A051D0000010CD38A051A00000104D4
          8A051E000001F8D48A0515000001E8D58A051A000001E0D68A051E000001D8D7
          8A0519000001CCD88A051A000001C0D98A0517000001B8DA8A051E000001B4DB
          8A051B000001ACDC8A0517000001A4DD8A051D0000019CDE8A051900000194DF
          8A051D0000018CE08A051A00000184E18A051B0000017CE28A051800000170E3
          8A051800000168E48A051B0000015CE58A05150000014CE68A051900000144E7
          8A051B00000140E88A051B00000138E98A051800000174EA8A051600000164EB
          8A051900000154EC8A051500000148ED8A051B00000144EE8A051B00000138EF
          8A051600000128F08A051900000120F18A051D00000114F28A051600000104F3
          8A0519000001F4F38A0516000001E0F48A0515000001E0F58A0527000001E8F6
          8A051B000001E4F78A051D000001E0F88A051E000001D0F98A0512000001B8FA
          8A0515000001ACFB8A051B000001ECFC8A0514000001E0FD8A051D000001DCFE
          8A051B000001D0FF8A0516000001B4008B050E00000198018B05160000018C02
          8B051D00000188038B051D0000017C048B051600000168058B05130000015406
          8B051600000140078B05150000012C088B05160000011C098B051A000001140A
          8B051C000001040B8B0512000001EC0B8B052200000134578B05040000015C57
          8B05040000018C578B0504000001BC578B0504000001E8578B05040000011458
          8B050400000140588B050400000170588B05040000019C588B0504000001C858
          8B0504000001F0588B05040000011C598B050400000148598B05040000017859
          8B0504000001A8598B0504000001D8598B0504000001085A8B0504000001385A
          8B0504000001605A8B05040000018C5A8B0504000001BC5A8B0504000001EC5A
          8B0504000001145B8B0504000001485B8B0504000001785B8B05040000014438
          8F050400000174388F0504000001A4388F0504000001D0388F0504000001FC38
          8F050400000128398F050400000158398F050400000188398F0504000001B839
          8F0504000006F055890500000001F055890511000001E4568905040000012C57
          89050F000006000000009C05000005000A6D4D6E755A70536F766DA005000008
          0007646267724E7532A40500000900067172794E7532A80500000C0007647372
          634E7532AC0500000F000B7172794E75324B44535053B00500000E000E717279
          4E75325A414D4553474F44B405000010000A7172794E75325649444EB8050000
          10000C7172794E753253485649444EBC0500001400097172794E7532536D4EC0
          0500001400097172794E7532536D55C4050000040006706F704E7532C8050000
          05000A706F704E753248656164CC05000005000D706F704E7532526173636865
          74D005000005000E706F704E7532507274524C697374D405000005000A706F70
          4E753253657031D805000005000D706F704E753256696453756D6DDC05000005
          0010706F704E753256696453756D6D4F6E65E0050000050010706F704E753256
          696453756D6D54776FE405000005000A706F704E7532536F7274E80500000500
          10706F704E7532536F727442795669644EEC050000050010706F704E7532536F
          727442795A614D47F0050000050011706F704E75325368775370656356696473
          F4050000050009706F704E7532536877F805000005000C706F704E7532536877
          446574FC05000005000E706F704E75325368774E6F4465740006000005000870
          6F704E755368770406000005000D706F704E755368774E6F4465740806000000
          01FFFFFFFFFF8C007765020003004600360042000300000009006C7400000000
          00000600}
      end
    end
  end
  object qryNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select Gen_Id(My_Gen_ID, 1) as NR, VidN, shVidN, DtProc,'
      '       SPdN, SPrf, SP_PF, SAlim, SP_FsTvp, SP_FsNv, SP_FZ, PRR,'
      '       Sum(cast(summa as Numeric(18,2))) as SUMMA'
      'from ViNuMain where TabN = 1239 and ZaMesGod = '#39'05/01/2007'#39
      'group by VidN, shVidN, DtProc, SPdN, SPrf, SP_PF, SAlim, '
      
        '                                                      SP_FsTvp, ' +
        'SP_FsNv, SP_FZ, PRR')
    Left = 104
    Top = 104
    object qryNuNR: TIntegerField
      DisplayLabel = #8470
      FieldName = 'NR'
    end
    object qryNuVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNuSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryNuDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryNuSPDN: TStringField
      DisplayLabel = #1055#1053
      FieldName = 'SPDN'
      OnGetText = qryNuSPFldGetText
      Size = 1
    end
    object qryNuSPRF: TStringField
      DisplayLabel = #1055#1088#1092#1089
      FieldName = 'SPRF'
      OnGetText = qryNuSPFldGetText
      Size = 1
    end
    object qryNuSP_PF: TStringField
      DisplayLabel = #1055#1060
      FieldName = 'SP_PF'
      OnGetText = qryNuSPFldGetText
      FixedChar = True
      Size = 1
    end
    object qryNuSALIM: TStringField
      DisplayLabel = #1040#1083#1080#1084
      FieldName = 'SALIM'
      OnGetText = qryNuSPFldGetText
      Size = 1
    end
    object qryNuSP_FSTVP: TStringField
      DisplayLabel = #1058#1074#1087#1060#1089
      FieldName = 'SP_FSTVP'
      OnGetText = qryNuSPFldGetText
      FixedChar = True
      Size = 1
    end
    object qryNuSP_FSNV: TStringField
      DisplayLabel = #1053#1074#1060#1089
      FieldName = 'SP_FSNV'
      OnGetText = qryNuSPFldGetText
      FixedChar = True
      Size = 1
    end
    object qryNuSP_FZ: TStringField
      DisplayLabel = #1060#1047
      FieldName = 'SP_FZ'
      OnGetText = qryNuSPFldGetText
      FixedChar = True
      Size = 1
    end
    object qryNuPRR: TSmallintField
      DisplayLabel = 'prr'
      FieldName = 'PRR'
    end
    object qryNuSUMMA: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
      Precision = 15
      Size = 2
    end
  end
  object dsrcNu: TDataSource
    DataSet = qryNu
    Left = 120
    Top = 120
  end
  object cdsZaMG: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtZaMG'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 144
    Data = {
      290000009619E0BD01000000180000000100000000000300000029000644745A
      614D4704000600000000000000}
    object cdsZaMGDtZaMG: TDateField
      FieldName = 'DtZaMG'
      OnSetText = cdsZaMGDtZaMGSetText
    end
  end
  object dsrcZaMG: TDataSource
    DataSet = cdsZaMG
    Left = 320
    Top = 160
  end
  object qryTmp: TQuery
    Left = 308
    Top = 91
  end
end
