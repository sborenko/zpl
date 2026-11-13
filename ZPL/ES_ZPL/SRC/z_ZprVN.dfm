object FormVidNZapros: TFormVidNZapros
  Left = 178
  Top = 283
  Width = 979
  Height = 565
  BorderIcons = [biSystemMenu]
  Caption = 'FormVidNZapros'
  Color = clBtnFace
  Constraints.MinHeight = 470
  Constraints.MinWidth = 850
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
  object LbxFilter: TListBox
    Left = 148
    Top = 148
    Width = 102
    Height = 57
    Color = clLime
    ItemHeight = 13
    Items.Strings = (
      '1000-9999 // '#1042#1057#1045)
    TabOrder = 0
    Visible = False
  end
  object Panel0: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      971
      31)
    object Label1: TLabel
      Left = 3
      Top = 8
      Width = 19
      Height = 13
      Caption = #1042#1080#1076
    end
    object sBtnVidN: TSpeedButton
      Left = 71
      Top = 4
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
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
      OnClick = sBtnVidNClick
    end
    object sBtnBack: TSpeedButton
      Left = 668
      Top = 16
      Width = 72
      Height = 25
      Hint = #1055#1086#1074#1090#1086#1088#1080#1090#1100' '#1074#1074#1086#1076' '#1079#1072#1076#1072#1085#1080#1103
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
      OnClick = sBtnBackClick
    end
    object dbtShVidN: TDBText
      Left = 95
      Top = 9
      Width = 61
      Height = 13
      Hint = #1064#1080#1092#1088' '#1074#1080#1076#1072
      AutoSize = True
      Color = clBtnFace
      DataField = 'ShVidN'
      DataSource = dsrcZd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object sBtnPrt: TSpeedButton
      Left = 822
      Top = 3
      Width = 72
      Height = 25
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072' '#1074#1099#1073#1086#1088#1082#1080
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
    object dbeVidN: TDBEdit
      Left = 27
      Top = 4
      Width = 43
      Height = 21
      Hint = #1042#1080#1076
      DataField = 'VidN'
      DataSource = dsrcZd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      OnDblClick = sBtnVidNClick
      OnEnter = dbeVidNEnter
      OnExit = dbeVidNExit
      OnKeyDown = dbeVidNKeyDown
    end
    object dbComboMes: TDBComboBox
      Left = 411
      Top = 4
      Width = 71
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
      Style = csDropDownList
      DataField = 'DtMes'
      DataSource = dsrcZd
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
      TabOrder = 4
      OnEnter = dbComboMesEnter
      OnExit = dbComboMesExit
      OnKeyDown = dbComboMesKeyDown
    end
    object rBtnDtPrc: TRadioButton
      Left = 174
      Top = 7
      Width = 70
      Height = 17
      Hint = #1042#1099#1073#1086#1088#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094'"'
      Caption = #1074' '#1084#1077#1089#1103#1094#1077
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
    end
    object rBtnDtZaMG: TRadioButton
      Left = 247
      Top = 7
      Width = 71
      Height = 17
      Hint = #1042#1099#1073#1086#1088#1082#1072' '#1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
      Caption = #1079#1072' '#1084#1077#1089#1103#1094
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 895
      Top = 3
      Width = 72
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 741
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcNu
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      TabOrder = 7
    end
    object PanelInfo: TPanel
      Left = 1
      Top = 1
      Width = 17
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object LabelInf: TLabel
        Left = 6
        Top = 8
        Width = 255
        Height = 13
        Caption = #1047#1072#1087#1080#1089#1077#1081' 5500, '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' 5000. '#1057#1091#1084#1084#1072' 67567.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object bBtnForw: TBitBtn
      Left = 668
      Top = 0
      Width = 72
      Height = 25
      Hint = #1048#1089#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1083#1077#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = bBtnForwClick
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
    end
    object checkPeriod: TCheckBox
      Left = 327
      Top = 8
      Width = 81
      Height = 17
      Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076
      TabOrder = 3
      OnClick = checkPeriodClick
    end
    object dbComboMesEnd: TDBComboBox
      Left = 495
      Top = 4
      Width = 71
      Height = 21
      Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      Style = csDropDownList
      DataField = 'DtMesEnd'
      DataSource = dsrcZd
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
      OnEnter = dbComboMesEnter
      OnExit = dbComboMesExit
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 31
    Width = 971
    Height = 507
    ActivePage = tsNu
    Align = alClient
    Style = tsButtons
    TabOrder = 2
    object tsNu: TTabSheet
      Caption = 'tsNu'
      object LabelSort: TLabel
        Left = 0
        Top = 0
        Width = 963
        Height = 13
        Align = alTop
        Alignment = taCenter
      end
      object dbgrNu: TDBGrid
        Left = 0
        Top = 13
        Width = 963
        Height = 463
        Hint = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1073#1086#1088#1082#1080
        Align = alClient
        DataSource = dsrcNu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopMenuVidNRqst
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
            FieldName = 'DTPROC'
            Width = 34
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
            FieldName = 'TABN'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHOBJ'
            Title.Caption = #1055#1086#1076#1088'.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHKATP'
            Title.Caption = #1050#1072#1090'.'#1087#1077#1088#1089'.'
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
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 48
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
            FieldName = 'PSCH'
            Width = 27
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
            FieldName = 'KDOBJ'
            Width = 43
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
            FieldName = 'NOTES'
            Width = 36
            Visible = True
          end>
      end
    end
    object tsOtkl: TTabSheet
      Caption = 'tsOtkl'
      ImageIndex = 1
      object dbgrOtkl: TDBGrid
        Left = 0
        Top = 0
        Width = 963
        Height = 476
        Align = alClient
        Color = clMoneyGreen
        DataSource = dsrcOtkl
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
        Columns = <
          item
            Expanded = False
            FieldName = 'TABN'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FamIO'
            Width = 117
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
            FieldName = 'DTPROC'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZAMESGOD'
            Width = 45
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
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CHAS'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMMA'
            Width = 44
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
            Width = 27
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_BEG'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_END'
            Width = 51
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
            FieldName = 'PSCH'
            Width = 31
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
            FieldName = 'NOTES'
            Width = 65
            Visible = True
          end>
      end
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, nu.* '
      'from viOtkl nu'
      '  Left Outer join z_Upi u on u.TabN = nu.TabN '
      'where nu.DtProc = '#39'06/01/2006'#39' and nu.VidN = '#39'1204'#39)
    Left = 312
    Top = 112
  end
  object cdsNu: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsNuCalcFields
    Left = 312
    Top = 160
    object cdsNuFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object cdsNuIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object cdsNuOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object cdsNuFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object cdsNuPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 12
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsNuSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      DisplayWidth = 12
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsNuNMSCH: TStringField
      DisplayWidth = 78
      FieldName = 'NMSCH'
      Size = 65
    end
    object cdsNuSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 18
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsNuNMVIDN: TStringField
      DisplayWidth = 77
      FieldName = 'NMVIDN'
      Size = 64
    end
    object cdsNuOLDKDVIDN: TSmallintField
      DisplayLabel = #1057#1090#1042#1080#1076
      DisplayWidth = 13
      FieldName = 'OLDKDVIDN'
    end
    object cdsNuVID_KDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'VID_KDSPZ'
    end
    object cdsNuKEKV: TStringField
      DisplayWidth = 6
      FieldName = 'KEKV'
      FixedChar = True
      Size = 4
    end
    object cdsNuNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object cdsNuDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 22
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsNuZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 22
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsNuTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 12
      FieldName = 'TABN'
    end
    object cdsNuVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsNuCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      DisplayWidth = 12
      FieldName = 'CHAS'
    end
    object cdsNuSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object cdsNuDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNuDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      DisplayWidth = 22
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNuKDSPS: TSmallintField
      DisplayLabel = #1050#1076#1057#1087#1089
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object cdsNuKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      DisplayWidth = 12
      FieldName = 'KDOBJ'
    end
    object cdsNuKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055#1077#1088#1089
      DisplayWidth = 12
      FieldName = 'KDKATP'
    end
    object cdsNuKDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPZ'
    end
    object cdsNuPDN: TSmallintField
      DisplayLabel = #1055#1053
      DisplayWidth = 12
      FieldName = 'PDN'
    end
    object cdsNuNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 30
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsNuPRR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRR'
    end
    object cdsNuPRPV: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRPV'
    end
    object cdsNuKTO: TSmallintField
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object cdsNuPRKR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRKR'
    end
    object cdsNuMYNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'MYNOTES'
      Size = 25
    end
    object cdsNuSPECPS: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPECPS'
    end
    object cdsNuSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
    end
    object cdsNuOLDKDOBJ: TSmallintField
      DisplayWidth = 12
      FieldName = 'OLDKDOBJ'
    end
    object cdsNuShObj: TStringField
      FieldName = 'SHOBJ'
      Size = 15
    end
    object cdsNuShKatP: TStringField
      FieldName = 'SHKATP'
      Size = 10
    end
  end
  object DspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 352
    Top = 112
  end
  object dsrcNu: TDataSource
    DataSet = cdsNu
    Left = 328
    Top = 168
  end
  object cdsZd: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'DtMesEnd'
        DataType = ftDate
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 34
    Top = 107
    object StringField1: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object StringField2: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsTmpDtMes: TDateField
      FieldName = 'DtMes'
      OnSetText = cdsZdDtMesSetText
    end
    object cdsZdDtMesEnd: TDateField
      FieldName = 'DtMesEnd'
      OnSetText = cdsZdDtMesEndSetText
    end
  end
  object dsrcZd: TDataSource
    DataSet = cdsZd
    Left = 58
    Top = 123
  end
  object cdsOtkl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
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
      end
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
        Size = 25
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
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    OnCalcFields = cdsOtklCalcFields
    Left = 312
    Top = 256
    object cdsOtklFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object cdsOtklFAM: TStringField
      FieldName = 'FAM'
    end
    object cdsOtklIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object cdsOtklOTCH: TStringField
      FieldName = 'OTCH'
    end
    object cdsOtklNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object cdsOtklDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object cdsOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsOtklSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object cdsOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object cdsOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object cdsOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object cdsOtklKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
    end
    object cdsOtklKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object cdsOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object cdsOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object cdsOtklSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsOtklPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsOtklPRR: TSmallintField
      FieldName = 'PRR'
    end
    object cdsOtklPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object cdsOtklKTO: TSmallintField
      FieldName = 'KTO'
    end
    object cdsOtklPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object cdsOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object cdsOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object cdsOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object cdsOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object cdsOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object cdsOtklPBNK: TSmallintField
      FieldName = 'PBNK'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = cdsOtkl
    Left = 328
    Top = 264
  end
  object PopMenuVidNRqst: TPopupMenu
    Left = 124
    Top = 250
    object NSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object NSortByTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        GroupIndex = 1
        OnClick = NSortByTabNClick
      end
      object NSortByFIO: TMenuItem
        Caption = '- '#1087#1086' '#1060'.'#1048'.'#1054
        Checked = True
        GroupIndex = 1
        OnClick = NSortByFIOClick
      end
      object NSortByKdObj: TMenuItem
        Caption = '- '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076'., '#1082#1072#1090'.'#1087#1077#1088#1089'., '#1060#1048#1054
        GroupIndex = 1
        OnClick = NSortByKdObjClick
      end
      object NSortByKatP: TMenuItem
        Caption = '- '#1087#1086' '#1082#1072#1090'.'#1087#1077#1088#1089'., '#1087#1086#1076#1088#1072#1079#1076'., '#1060#1048#1054
        GroupIndex = 1
        OnClick = NSortByKatPClick
      end
    end
  end
end
