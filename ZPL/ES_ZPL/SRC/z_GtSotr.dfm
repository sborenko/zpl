object FormGetSotr: TFormGetSotr
  Left = 33
  Top = 385
  Width = 700
  Height = 460
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormGetSotr'
  Color = clMoneyGreen
  Constraints.MaxHeight = 850
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 460
  Constraints.MinWidth = 700
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      692
      30)
    object BtnStayOnTop: TSpeedButton
      Left = 4
      Top = 3
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1074#1087#1077#1088#1077#1076#1080
      AllowAllUp = True
      GroupIndex = 5
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnStayOnTopClick
    end
    object BtnClose: TBitBtn
      Left = 614
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BtnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      Spacing = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 280
    Height = 384
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 280
      Height = 164
      Align = alTop
      Alignment = taCenter
      Color = clMoneyGreen
      Lines.Strings = (
        #1057#1087#1088#1072#1074#1072' '#1087#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074' '
        #1074#1074#1086#1076#1080#1084#1086#1081' '#1085#1072#1076#1073#1072#1074#1082#1080'. '#1055#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '
        #1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1093' '#1087#1086#1083#1077#1081' '#1074#1089#1077#1084' '#1087#1086#1076#1082#1083#1102#1095#1072#1077#1084#1099#1084' '#1074' '
        #1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084' '#1073#1091#1076#1091#1090' '#1074' '
        #1085#1072#1076#1073#1074#1082#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1099' '#1079#1072#1087#1080#1089#1080' '#1074' '
        #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080' '
        #1089' '#1074#1074#1077#1076#1077#1085#1085#1099#1084#1080' '#1042#1072#1084#1080' '#1074#1082#1072#1079'i'#1074#1082#1072#1084#1080'.'
        #1063#1090#1086#1073#1099' '#1074#1082#1083#1102#1095#1080#1090#1100' ('#1074#1099#1082#1083#1102#1095#1080#1090#1100') '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '
        #1094#1077#1083#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077', '#1089#1076#1077#1083#1072#1081#1090#1077' '#1085#1072' '#1085#1077#1084' '
        #1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1082#1086#1081'. '#1040#1085#1072#1083#1086#1075#1080#1095#1085#1086' '#1084#1086#1078#1085#1086' '
        #1074#1082#1083#1102#1095#1080#1090#1100' ('#1074#1099#1082#1083#1102#1095#1080#1090#1100') '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '
        #1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'.'
        '')
      ReadOnly = True
      TabOrder = 0
    end
    object LbxFilter: TListBox
      Left = 13
      Top = 241
      Width = 62
      Height = 32
      Color = clRed
      ItemHeight = 13
      Items.Strings = (
        '1000-2399')
      TabOrder = 1
      Visible = False
    end
    object dbgrObj: TDBGrid
      Left = 0
      Top = 164
      Width = 280
      Height = 220
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsrcObj
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrObjDblClick
      OnEnter = dbgrEnter
      OnExit = dbgrExit
      OnKeyDown = dbgrObjKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'KDOBJ'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHOBJ'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COUNT'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMOBJ'
          Width = 85
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 692
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 280
    Top = 30
    Width = 412
    Height = 384
    ActivePage = tsNdb
    Align = alClient
    Constraints.MaxWidth = 412
    Constraints.MinWidth = 412
    Style = tsButtons
    TabOrder = 3
    object tsOtkl: TTabSheet
      Caption = 'tsOtkl'
      object panelOtkl: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 223
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object PanelKatPers: TPanel
          Left = 1
          Top = 192
          Width = 402
          Height = 30
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clMoneyGreen
          TabOrder = 0
          object Label7: TLabel
            Left = 110
            Top = 7
            Width = 218
            Height = 13
            Caption = #1047#1072#1076#1072#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1082#1080
            Enabled = False
          end
          object sBtnNeedKdKatP: TSpeedButton
            Left = 420
            Top = 4
            Width = 15
            Height = 21
            Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
            Enabled = False
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000E0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700700000778888870077777777777777007770777777877700770007777888
              7700700000778888870000000008887888007700077778787700770007777888
              770077000777788877007777777777777700}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sBtnNeedKdKatPClick
          end
          object chBoxAllKatP: TCheckBox
            Left = 8
            Top = 5
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = #1042#1089#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object dbeShNeedKatP: TDBEdit
            Left = 333
            Top = 4
            Width = 85
            Height = 21
            DataField = 'ShNeedKatP'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnEnter = dbEditEnter
            OnExit = dbEditExit
          end
        end
      end
      object dbgrSps: TDBGrid
        Left = 0
        Top = 223
        Width = 404
        Height = 130
        Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        Align = alClient
        Color = clSkyBlue
        DataSource = dsrcSps
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
        OnDrawColumnCell = dbgrSpsDrawColumnCell
        OnDblClick = dbgrSpsDblClick
        OnEnter = dbgrEnter
        OnExit = dbgrExit
        OnKeyDown = dbgrSpsKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHKATP'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAM'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMA'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTCH'
            Width = 118
            Visible = True
          end>
      end
    end
    object tsNdb: TTabSheet
      Caption = 'tsNdb'
      ImageIndex = 1
      object panelNdb: TPanel
        Left = 0
        Top = 0
        Width = 404
        Height = 137
        Align = alTop
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 48
          Top = 6
          Width = 81
          Height = 13
          Caption = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          FocusControl = dbeVidN
        end
        object Label3: TLabel
          Left = 48
          Top = 23
          Width = 64
          Height = 13
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        end
        object Label4: TLabel
          Left = 141
          Top = 23
          Width = 141
          Height = 13
          Caption = #1044#1072#1090#1072' '#1080' '#8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086' '#1085#1072#1095#1072#1083#1077
          FocusControl = dbeNrPrBeg
        end
        object Label5: TLabel
          Left = 48
          Top = 59
          Width = 82
          Height = 13
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        end
        object Label6: TLabel
          Left = 141
          Top = 59
          Width = 165
          Height = 13
          Caption = #1044#1072#1090#1072' '#1080' '#8470' '#1087#1088#1080#1082#1072#1079#1072' '#1086#1073' '#1086#1082#1086#1085#1095#1072#1085#1080#1080
          FocusControl = dbeNrPrEnd
        end
        object Label8: TLabel
          Left = 256
          Top = 6
          Width = 34
          Height = 13
          Caption = #1057#1091#1084#1084#1072
          FocusControl = dbeSumma
        end
        object Label9: TLabel
          Left = 48
          Top = 97
          Width = 63
          Height = 13
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          FocusControl = dbeNotes
        end
        object dbeVidN: TDBEdit
          Left = 141
          Top = 2
          Width = 42
          Height = 21
          DataField = 'VidN'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnEnter = dbEditEnter
          OnExit = dbeVidNExit
        end
        object dbeNrPrBeg: TDBEdit
          Left = 224
          Top = 37
          Width = 146
          Height = 21
          DataField = 'NrPrBeg'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeNrPrEnd: TDBEdit
          Left = 224
          Top = 74
          Width = 146
          Height = 21
          DataField = 'NrPrEnd'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeSumma: TDBEdit
          Left = 299
          Top = 2
          Width = 71
          Height = 21
          DataField = 'Summa'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeNotes: TDBEdit
          Left = 48
          Top = 111
          Width = 321
          Height = 21
          DataField = 'Notes'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeDt_Beg: TDBEdit
          Left = 48
          Top = 37
          Width = 77
          Height = 21
          DataField = 'Dt_Beg'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeDt_End: TDBEdit
          Left = 48
          Top = 74
          Width = 77
          Height = 21
          DataField = 'Dt_End'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeDtPrBeg: TDBEdit
          Left = 141
          Top = 37
          Width = 77
          Height = 21
          DataField = 'DtPrBeg'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
        object dbeDtPrEnd: TDBEdit
          Left = 141
          Top = 74
          Width = 77
          Height = 21
          DataField = 'DtPrEnd'
          DataSource = dsrcTmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnEnter = dbEditEnter
          OnExit = dbEditExit
        end
      end
      object dbgrSpsNdb: TDBGrid
        Left = 0
        Top = 137
        Width = 404
        Height = 216
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcSps
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrSpsNdbDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KDKATP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHKATP'
            Visible = True
          end>
      end
    end
  end
  object qryObj: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct ko.AIndx, s.KdObj, Count(s.NR), ko.ShObj, ko.NmO' +
        'bj'
      'from z_sps s'
      '     Left outer join z_KdObj ko on ko.KdObj = s.KdObj'
      'where s.dtProc = '#39'2005/09/01'#39' '
      'group by ko.AIndx, s.KdObj, ko.ShObj, ko.NmObj')
    Left = 56
    Top = 296
    object qryObjAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object qryObjKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryObjCOUNT: TIntegerField
      DisplayLabel = #1050'-'#1074#1086#1057#1086#1090#1088
      FieldName = 'COUNT'
    end
    object qryObjSHOBJ: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryObjNMOBJ: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NMOBJ'
      Size = 65
    end
  end
  object qrySps: TQuery
    OnCalcFields = qrySpsCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcObj
    SQL.Strings = (
      
        'Select sps.TabN, sps.KdKatP, ktg.ShKatP, upi.Fam, Upi.Ima, upi.O' +
        'tch '
      'from z_sps sps'
      '     Left outer join z_Upi upi on upi.TabN = sps.TabN'
      '     Left outer join z_KatPers ktg on Ktg.KdKatP = sps.KdKatP'
      'where sps.dtProc = '#39'2005/09/01'#39' and sps.KdObj = :KdObj'
      'order by Fam, Ima, otch')
    Left = 312
    Top = 304
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDOBJ'
        ParamType = ptUnknown
        Size = 2
      end>
    object qrySpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qrySpsKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object qrySpsSHKATP: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089
      FieldName = 'SHKATP'
      Size = 10
    end
    object qrySpsFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qrySpsFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
  end
  object dsrcObj: TDataSource
    DataSet = qryObj
    Left = 72
    Top = 304
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 328
    Top = 320
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Dt_Beg'
        DataType = ftDate
      end
      item
        Name = 'DtPrBeg'
        DataType = ftDate
      end
      item
        Name = 'NrPrBeg'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Dt_End'
        DataType = ftDate
      end
      item
        Name = 'DtPrEnd'
        DataType = ftDate
      end
      item
        Name = 'NrPrEnd'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 202
    Top = 200
    object cdsTmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsTmpShVidN: TStringField
      FieldName = 'ShVidN'
    end
    object cdsTmpDt_Beg: TDateField
      FieldName = 'Dt_Beg'
    end
    object cdsTmpDtPrBeg: TDateField
      FieldName = 'DtPrBeg'
    end
    object cdsTmpNrPrBeg: TStringField
      FieldName = 'NrPrBeg'
      Size = 15
    end
    object cdsTmpDt_End: TDateField
      FieldName = 'Dt_End'
    end
    object cdsTmpDtPrEnd: TDateField
      FieldName = 'DtPrEnd'
    end
    object cdsTmpNrPrEnd: TStringField
      FieldName = 'NrPrEnd'
      Size = 15
    end
    object cdsTmpSumma: TFloatField
      FieldName = 'Summa'
    end
    object cdsTmpNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 208
    Top = 216
  end
end
