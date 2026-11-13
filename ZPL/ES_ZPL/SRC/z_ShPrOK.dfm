object FormShwPrOk: TFormShwPrOk
  Left = 273
  Top = 0
  Width = 800
  Height = 716
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormShwPrOk'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 576
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 449
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clFuchsia
    ParentColor = False
  end
  object Splitter3: TSplitter
    Left = 0
    Top = 72
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clYellow
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      792
      31)
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 164
      Height = 25
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1091' '#1087#1088#1080#1082#1072#1079#1072' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1054#1090#1082#1088#1099#1090#1100'"'
      FocusControl = dbeNrPri
      Transparent = True
      WordWrap = True
    end
    object LabelPriCntRec: TLabel
      Left = 392
      Top = 10
      Width = 89
      Height = 13
      Caption = 'LabelPriCntRec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 714
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = bBtnCancelClick
      Kind = bkCancel
      Spacing = 0
    end
    object dbeNrPri: TDBEdit
      Left = 176
      Top = 5
      Width = 49
      Height = 21
      DataField = 'NrPri'
      DataSource = dsrcVvod
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = dbeNrPriEnter
      OnExit = dbeNrPriExit
    end
    object dbeDtPri: TDBEdit
      Left = 225
      Top = 5
      Width = 82
      Height = 21
      DataField = 'DtPri'
      DataSource = dsrcVvod
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = dbeNrPriEnter
      OnExit = dbeNrPriExit
    end
    object bBtnOpen: TBitBtn
      Left = 312
      Top = 4
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Default = True
      TabOrder = 3
      OnClick = bBtnOpenClick
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
      Spacing = 1
    end
  end
  object dbgrPri: TDBGrid
    Left = 0
    Top = 75
    Width = 792
    Height = 374
    Hint = #1055#1091#1085#1082#1090#1099' '#1087#1088#1080#1082#1072#1079#1072
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcPri
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
    OnDblClick = dbgrPriDblClick
    OnEnter = dbgrPriEnter
    OnExit = dbgrPriExit
    Columns = <
      item
        Expanded = False
        FieldName = 'nr_prikaza'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_prikaza'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_punkta'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_punkta'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tip_punkta'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razrabotka'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_priem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_vstupdolgn'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_peremecshen'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CntURec'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_uvoln'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fam'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ima'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otch'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pol'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_nomer'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dob'
        Width = 65
        Visible = True
      end>
  end
  object dbgrPere: TDBGrid
    Left = 0
    Top = 452
    Width = 792
    Height = 124
    Hint = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
    Align = alBottom
    Color = 11009242
    DataSource = dsrcPere
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
    OnEnter = dbgrPriEnter
    OnExit = dbgrPriExit
    Columns = <
      item
        Expanded = False
        FieldName = 'nomer_v_bd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_prikaza'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_prikaza'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_prikaza_begin'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_prikaza_begin'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_priem'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_vstupdolgn'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_peremecshen'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_uvoln'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1090#1080#1087#1088#1072#1073#1086#1090#1099
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1089#1090#1072#1074#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1076#1077#1085#1100#1075#1080
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1089#1086#1089#1090#1072#1074
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1086#1082#1083#1072#1076
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1089#1095#1077#1090
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1090#1077#1084#1072
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1086#1082#1083#1072#1076'_'#1087#1086'_'#1076#1086#1083#1078#1085
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1076#1072#1090#1072'_'#1082#1086#1085#1082#1091#1088#1089
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'actual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1090#1080#1087#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_katp'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'short_name_katp'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1087#1086#1076#1088#1072#1079#1076
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1085#1072#1079#1074#1087#1086#1076#1088
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1089#1086#1082#1088#1085#1072#1079#1074#1087#1086#1076#1088
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1082#1086#1076#1076#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1085#1072#1079#1074#1076#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1089#1086#1082#1088#1085#1072#1079#1074#1076#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 87
        Visible = True
      end>
  end
  object dbgrNadb: TDBGrid
    Left = 0
    Top = 579
    Width = 792
    Height = 110
    Hint = #1053#1072#1076#1073#1072#1074#1082#1080
    Align = alBottom
    Color = 9428986
    DataSource = dsrcNadb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrPriEnter
    OnExit = dbgrPriExit
    Columns = <
      item
        Expanded = False
        FieldName = 'nomer_v_bd'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_prikaza'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_prikaza'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_begin_dopl'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_end_dopl'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vidn'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_dopl'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type_dopl'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'proc_dopl'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sum_dopl'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kdkatp'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'short_name_katp'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_katp'
        Width = 223
        Visible = True
      end>
  end
  object dbgrState: TDBGrid
    Left = 0
    Top = 31
    Width = 792
    Height = 41
    Hint = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' "'#1047#1072#1088#1087#1083#1072#1090#1072'" '#1085#1072' '#1076#1072#1090#1091' '#1087#1088#1080#1082#1072#1079#1072
    Align = alTop
    Color = 13429757
    DataSource = dsrcState
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
        FieldName = 'DT_BEG'
        Width = 73
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
        FieldName = 'SHOBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRCWRKTIME'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO'
        Width = 17
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDDOLGN'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPZ'
        Width = 30
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
        FieldName = 'PSCH'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_PENS'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRFS'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKAZA'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKAZA'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 43
        Visible = True
      end>
  end
  object qryPri: TQuery
    DatabaseName = 'EsDbOk'
    SQL.Strings = (
      'Select * from o_prikaz'
      'where Nr_Prikaza = 7'
      '                   order by nr_punkta')
    Left = 8
    Top = 72
  end
  object cdsPri: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nr_prikaza'
        DataType = ftSmallint
      end
      item
        Name = 'dt_prikaza'
        DataType = ftDate
      end
      item
        Name = 'nr_punkta'
        DataType = ftSmallint
      end
      item
        Name = 'kod_punkta'
        DataType = ftInteger
      end
      item
        Name = 'tip_punkta'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'razrabotka'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'dt_priem'
        DataType = ftDate
      end
      item
        Name = 'dt_vstupdolgn'
        DataType = ftDate
      end
      item
        Name = 'dt_peremecshen'
        DataType = ftDate
      end
      item
        Name = 'dt_uvoln'
        DataType = ftDate
      end
      item
        Name = 'fam'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ima'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'otch'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'pol'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'id_nomer'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'dob'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPri'
    StoreDefs = True
    AfterScroll = cdsPriAfterScroll
    OnCalcFields = cdsPriCalcFields
    Left = 8
    Top = 104
    object cdsPrinr_prikaza: TSmallintField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'nr_prikaza'
    end
    object cdsPridt_prikaza: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'dt_prikaza'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPrinr_punkta: TSmallintField
      DisplayLabel = #8470' '#1087#1091#1085#1082#1090#1072
      FieldName = 'nr_punkta'
    end
    object cdsPrikod_punkta: TIntegerField
      DisplayLabel = #1050#1076#1055#1091#1085#1082#1090#1072
      FieldName = 'kod_punkta'
    end
    object cdsPridt_priem: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1105#1084#1072
      FieldName = 'dt_priem'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPridt_vstupdolgn: TDateField
      DisplayLabel = #1044#1090#1042#1089#1091#1087#1083#1042#1044#1086#1083#1078#1085'.'
      FieldName = 'dt_vstupdolgn'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPridt_peremecshen: TDateField
      DisplayLabel = #1044#1090#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      FieldName = 'dt_peremecshen'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPridt_uvoln: TDateField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085'.'
      FieldName = 'dt_uvoln'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPrifam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'fam'
      Size = 255
    end
    object cdsPriima: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'ima'
      Size = 255
    end
    object cdsPriotch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'otch'
      Size = 255
    end
    object cdsPripol: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'pol'
      FixedChar = True
      Size = 1
    end
    object cdsPriid_nomer: TStringField
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1048#1044
      FieldName = 'id_nomer'
      FixedChar = True
      Size = 12
    end
    object cdsPridob: TDateField
      DisplayLabel = #1044#1090#1056#1086#1078#1076#1077#1085#1080#1103
      FieldName = 'dob'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsPritip_punkta: TStringField
      DisplayLabel = #1058#1080#1087#1055#1091#1085#1082#1090#1072
      FieldName = 'tip_punkta'
      Size = 255
    end
    object cdsPrirazrabotka: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'razrabotka'
      FixedChar = True
      Size = 10
    end
    object cdsPriTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldKind = fkCalculated
      FieldName = 'TabN'
      Calculated = True
    end
    object cdsPriCntURec: TSmallintField
      DisplayLabel = #1050#1074#1086#1047#1072#1087
      FieldKind = fkCalculated
      FieldName = 'CntURec'
      Calculated = True
    end
  end
  object dspPri: TDataSetProvider
    DataSet = qryPri
    Left = 40
    Top = 72
  end
  object dsrcPri: TDataSource
    DataSet = cdsPri
    Left = 24
    Top = 120
  end
  object cdsVvod: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NrPri'
        DataType = ftSmallint
      end
      item
        Name = 'DtPri'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 5
    object cdsVvodNrPri: TSmallintField
      FieldName = 'NrPri'
    end
    object cdsVvodDtPri: TDateField
      FieldName = 'DtPri'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcVvod: TDataSource
    DataSet = cdsVvod
    Left = 16
    Top = 16
  end
  object qryPere: TQuery
    DatabaseName = 'EsDbOk'
    SQL.Strings = (
      
        'Select * from o_rabota where Substr(nr_Prikaza, 1, 3) = '#39'414'#39' an' +
        'd'
      '                              dt_Prikaza = '#39'2013/05/20'#39)
    Left = 8
    Top = 504
  end
  object dspPere: TDataSetProvider
    DataSet = qryPere
    Left = 40
    Top = 504
  end
  object cdsPere: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPere'
    Left = 8
    Top = 536
    object cdsPerenomer_v_bd: TIntegerField
      DisplayLabel = #8470' '#1074' '#1041#1044
      FieldName = 'nomer_v_bd'
    end
    object cdsPerenr_prikaza: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'nr_prikaza'
      Size = 255
    end
    object cdsPeredt_prikaza: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'dt_prikaza'
    end
    object cdsPeredt_prikaza_begin: TDateField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'dt_prikaza_begin'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPerenr_prikaza_begin: TStringField
      DisplayLabel = #8470' '#1053#1072#1095#1072#1083#1072#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'nr_prikaza_begin'
      Size = 255
    end
    object cdsPereCDSDesigner: TIntegerField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = #1082#1086#1076#1087#1086#1076#1088#1072#1079#1076
    end
    object cdsPereCDSDesigner2: TIntegerField
      DisplayLabel = #1050#1076#1044#1086#1083#1078#1085
      FieldName = #1082#1086#1076#1076#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object cdsPeredt_priem: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1105#1084#1072
      FieldName = 'dt_priem'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPeredt_vstupdolgn: TDateField
      DisplayLabel = #1044#1090#1042#1089#1091#1087#1083'.'#1074#1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'dt_vstupdolgn'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPeredt_peremecshen: TDateField
      DisplayLabel = #1044#1090#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      FieldName = 'dt_peremecshen'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPeredt_uvoln: TDateField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085'.'
      FieldName = 'dt_uvoln'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPereCDSDesigner3: TIntegerField
      DisplayLabel = #1050#1076#1058#1080#1087#1072#1056#1072#1073#1086#1090#1099
      FieldName = #1082#1086#1076#1090#1080#1087#1088#1072#1073#1086#1090#1099
    end
    object cdsPereCDSDesigner4: TFloatField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = #1089#1090#1072#1074#1082#1072
    end
    object cdsPereCDSDesigner5: TStringField
      DisplayLabel = #1044#1077#1085#1100#1075#1080
      FieldName = #1076#1077#1085#1100#1075#1080
      Size = 255
    end
    object cdsPereCDSDesigner6: TIntegerField
      DisplayLabel = #1050#1076#1057#1086#1089#1090#1072#1074#1072
      FieldName = #1082#1086#1076#1089#1086#1089#1090#1072#1074
    end
    object cdsPereCDSDesigner7: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = #1086#1082#1083#1072#1076
      DisplayFormat = '#.00'
    end
    object cdsPereCDSDesigner8: TIntegerField
      DisplayLabel = #1050#1076#1057#1095#1105#1090#1072
      FieldName = #1082#1086#1076#1089#1095#1077#1090
    end
    object cdsPereCDSDesigner9: TStringField
      DisplayLabel = #1058#1077#1084#1072
      FieldName = #1090#1077#1084#1072
      Size = 255
    end
    object cdsPere__: TIntegerField
      DisplayLabel = #1054#1082#1083#1072#1076'_'#1055#1086'_'#1044#1086#1083#1078#1085
      FieldName = #1086#1082#1083#1072#1076'_'#1087#1086'_'#1076#1086#1083#1078#1085
    end
    object cdsPere_: TDateField
      DisplayLabel = #1044#1090'_'#1050#1086#1085#1082#1091#1088#1089#1072
      FieldName = #1076#1072#1090#1072'_'#1082#1086#1085#1082#1091#1088#1089
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsPereactual: TIntegerField
      DisplayLabel = 'Actual'
      FieldName = 'actual'
    end
    object cdsPereCDSDesigner10: TSmallintField
      DisplayLabel = #1050#1086#1076#1058#1080#1087#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      FieldName = #1082#1086#1076#1090#1080#1087#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
    end
    object cdsPerename_katp: TStringField
      DisplayLabel = #1050#1090#1075#1088#1055#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'name_katp'
      Size = 255
    end
    object cdsPereshort_name_katp: TStringField
      DisplayLabel = #1064#1092#1088#1055#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'short_name_katp'
      FixedChar = True
      Size = 8
    end
    object cdsPereCDSDesigner11: TStringField
      DisplayLabel = #1053#1072#1079#1074#1055#1086#1076#1088
      FieldName = #1085#1072#1079#1074#1087#1086#1076#1088
      Size = 255
    end
    object cdsPereCDSDesigner12: TStringField
      DisplayLabel = #1064#1092#1088#1055#1086#1076#1088#1072#1079#1076
      FieldName = #1089#1086#1082#1088#1085#1072#1079#1074#1087#1086#1076#1088
      Size = 255
    end
    object cdsPereCDSDesigner13: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = #1085#1072#1079#1074#1076#1086#1083#1078#1085#1086#1089#1090#1100
      Size = 255
    end
    object cdsPereCDSDesigner14: TStringField
      DisplayLabel = #1064#1092#1088#1044#1086#1083#1078#1085#1086#1089#1090#1080
      FieldName = #1089#1086#1082#1088#1085#1072#1079#1074#1076#1086#1083#1078#1085#1086#1089#1090#1100
      Size = 255
    end
  end
  object dsrcPere: TDataSource
    DataSet = cdsPere
    Left = 24
    Top = 552
  end
  object qryNadb: TQuery
    DatabaseName = 'EsDbOk'
    SQL.Strings = (
      
        'Select * from o_Doplaty where Substr(nr_Prikaza, 1, 3) = '#39'414'#39' a' +
        'nd'
      '                              dt_Prikaza = '#39'2013/05/20'#39)
    Left = 16
    Top = 632
  end
  object dspNadb: TDataSetProvider
    DataSet = qryNadb
    Left = 48
    Top = 632
  end
  object cdsNadb: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nomer_v_bd'
        DataType = ftInteger
      end
      item
        Name = 'nr_prikaza'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'dt_prikaza'
        DataType = ftDate
      end
      item
        Name = 'dt_begin_dopl'
        DataType = ftDate
      end
      item
        Name = 'dt_end_dopl'
        DataType = ftDate
      end
      item
        Name = 'vidn'
        DataType = ftSmallint
      end
      item
        Name = 'name_dopl'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'type_dopl'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'proc_dopl'
        DataType = ftFloat
      end
      item
        Name = 'sum_dopl'
        DataType = ftFloat
      end
      item
        Name = 'kdkatp'
        DataType = ftSmallint
      end
      item
        Name = 'name_katp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'short_name_katp'
        Attributes = [faFixed]
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspNadb'
    StoreDefs = True
    Left = 16
    Top = 664
    object cdsNadbnomer_v_bd: TIntegerField
      DisplayLabel = #8470' '#1074' '#1041#1044
      FieldName = 'nomer_v_bd'
    end
    object cdsNadbnr_prikaza: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'nr_prikaza'
      Size = 255
    end
    object cdsNadbdt_prikaza: TDateField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'dt_prikaza'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNadbdt_begin_dopl: TDateField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072#1053#1076#1073
      FieldName = 'dt_begin_dopl'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNadbdt_end_dopl: TDateField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095#1053#1076#1073
      FieldName = 'dt_end_dopl'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsNadbvidn: TSmallintField
      DisplayLabel = #1042#1080#1076#1053#1076#1073
      FieldName = 'vidn'
    end
    object cdsNadbname_dopl: TStringField
      DisplayLabel = #1053#1072#1079#1074#1053#1076#1073
      FieldName = 'name_dopl'
      Size = 255
    end
    object cdsNadbtype_dopl: TStringField
      DisplayLabel = #1058#1080#1087#1053#1076#1073
      FieldName = 'type_dopl'
      FixedChar = True
      Size = 1
    end
    object cdsNadbproc_dopl: TFloatField
      DisplayLabel = '% '#1085#1076#1073
      FieldName = 'proc_dopl'
      DisplayFormat = '#.00'
    end
    object cdsNadbsum_dopl: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072#1053#1076#1073
      FieldName = 'sum_dopl'
      DisplayFormat = '0.00'
    end
    object cdsNadbkdkatp: TSmallintField
      DisplayLabel = #1050#1076#1050#1072#1090#1055
      FieldName = 'kdkatp'
    end
    object cdsNadbname_katp: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'name_katp'
      Size = 255
    end
    object cdsNadbshort_name_katp: TStringField
      DisplayLabel = #1064#1092#1088#1050#1072#1090#1055
      FieldName = 'short_name_katp'
      FixedChar = True
      Size = 8
    end
  end
  object dsrcNadb: TDataSource
    DataSet = cdsNadb
    Left = 32
    Top = 680
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_Upi where TabN = 1239')
    Left = 8
    Top = 160
  end
  object qryState: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select s.TabN, s.KdSps, s.Dt_Beg, s.KdObj, ko.ShObj, ko.NmObj,'
      
        '       s.KdKatP, kp.ShKatP, kp.NmKatP, s.PrcWrkTime, s.SO, s.Okl' +
        'Trf,  '
      '       s.KdDolgn, s.Dolgnost, s.KdSpZ, ks.SchBU, ks.PSCH, '
      
        '       s.Pr_Pens, s.Sovm, s.Prfs, s.Inv, s.Nr_Prikaza, s.Dt_Prik' +
        'aza, s.Notes'
      'from Z_GETWRKPEREONDATE (1239, '#39'06/01/2013'#39') s '
      '     Left Outer Join z_KdObj ko on ko.KdObj = s.KdObj'
      '     Left Outer Join z_KatPers kp on kp.KdKatP = s.KdKatP'
      '     Left Outer Join Kd_SBU ks on ks.KdSch = s.KdSpZ')
    Left = 8
    Top = 192
    object qryStateTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
    end
    object qryStateKDSPS: TSmallintField
      DisplayLabel = #1050#1076#1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryStateDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
    end
    object qryStateKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
    end
    object qryStateSHOBJ: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088#1079#1076
      FieldName = 'SHOBJ'
      Size = 15
    end
    object qryStateNMOBJ: TStringField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      FieldName = 'NMOBJ'
      Size = 65
    end
    object qryStateKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088
      FieldName = 'KDKATP'
    end
    object qryStateSHKATP: TStringField
      DisplayLabel = #1064#1092#1088#1050#1090#1075#1088
      FieldName = 'SHKATP'
      Size = 10
    end
    object qryStateNMKATP: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'NMKATP'
      Size = 35
    end
    object qryStatePRCWRKTIME: TFloatField
      DisplayLabel = '%'#1056#1072#1073#1042#1088#1077#1084#1077#1085#1080
      FieldName = 'PRCWRKTIME'
    end
    object qryStateSO: TSmallintField
      DisplayLabel = #1057#1054#1087#1083
      FieldName = 'SO'
    end
    object qryStateOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083'/'#1058#1088#1092
      FieldName = 'OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryStateKDDOLGN: TSmallintField
      DisplayLabel = #1050#1076#1044#1086#1083#1078#1085
      FieldName = 'KDDOLGN'
    end
    object qryStateDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Size = 40
    end
    object qryStateKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095#1041#1059
      FieldName = 'KDSPZ'
    end
    object qryStateSCHBU: TStringField
      DisplayLabel = #1057#1095#1105#1090#1041#1059
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryStatePSCH: TStringField
      DisplayLabel = #1055#1057#1095
      FieldName = 'PSCH'
      Size = 10
    end
    object qryStatePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089
      FieldName = 'PR_PENS'
    end
    object qryStateSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084
      FieldName = 'SOVM'
    end
    object qryStatePRFS: TSmallintField
      DisplayLabel = #1055#1088#1092#1089#1079
      FieldName = 'PRFS'
    end
    object qryStateINV: TSmallintField
      DisplayLabel = #1043#1088#1048#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
      FieldName = 'INV'
    end
    object qryStateNR_PRIKAZA: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NR_PRIKAZA'
      Size = 10
    end
    object qryStateDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1082#1072#1079#1072
      FieldName = 'DT_PRIKAZA'
    end
    object qryStateNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 35
    end
  end
  object dsrcState: TDataSource
    DataSet = qryState
    Left = 24
    Top = 208
  end
end
