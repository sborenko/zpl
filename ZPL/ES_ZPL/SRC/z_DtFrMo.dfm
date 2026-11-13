object FormDatForMO: TFormDatForMO
  Left = 400
  Top = 187
  Width = 681
  Height = 485
  BorderIcons = [biSystemMenu]
  Caption = 'FormDatForMO'
  Color = clBtnFace
  Constraints.MaxHeight = 800
  Constraints.MaxWidth = 850
  Constraints.MinHeight = 250
  Constraints.MinWidth = 650
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
  object Splitter1: TSplitter
    Left = 0
    Top = 195
    Width = 673
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 427
    Width = 673
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      673
      31)
    object LabelSort: TLabel
      Left = 4
      Top = 1
      Width = 74
      Height = 31
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086#1076#1088#1086#1073#1085#1086#1089#1090#1077#1081
      Transparent = True
      WordWrap = True
    end
    object bBtnCancel: TBitBtn
      Left = 595
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object rBtnSortByZaMG: TRadioButton
      Left = 88
      Top = 14
      Width = 75
      Height = 17
      Alignment = taLeftJustify
      Caption = #1087#1086' '#1084#1077#1089#1103#1094#1091
      TabOrder = 2
      OnClick = rBtnSortClick
    end
    object rBtnSortByPSch: TRadioButton
      Left = 88
      Top = -1
      Width = 75
      Height = 17
      Alignment = taLeftJustify
      Caption = #1087#1086' '#1089#1095#1105#1090#1091
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rBtnSortClick
    end
  end
  object dbgrShort: TDBGrid
    Left = 0
    Top = 0
    Width = 673
    Height = 195
    Align = alTop
    Color = 11009242
    DataSource = dsrcShort
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDrawColumnCell = dbgrShortDrawColumnCell
    OnEnter = dnGridEnter
    OnExit = dnGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Nach'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Udrg'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vupl'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Ost'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_VDlg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vzvr'
        Width = 55
        Visible = True
      end>
  end
  object dbgrDet: TDBGrid
    Left = 0
    Top = 198
    Width = 673
    Height = 229
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcDet
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDrawColumnCell = dbgrDetDrawColumnCell
    OnEnter = dnGridEnter
    OnExit = dnGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PSch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZaMesGod'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Nach'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Udrg'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vupl'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Ost'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_VDlg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vzvr'
        Width = 61
        Visible = True
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_INFFORGO_2 (8285, '#39'10/01/2013'#39')')
    Left = 40
    Top = 144
  end
  object cdsDet: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sm_Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Ost'
        DataType = ftFloat
      end
      item
        Name = 'Sm_VDlg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vzvr'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnPSchZaMG'
        Fields = 'PSch;ZaMesGod'
      end
      item
        Name = 'OnZaMGPSch'
        Fields = 'ZaMesGod;PSch'
      end>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 272
    Data = {
      BF0000009619E0BD01000000180000000A000000000003000000BF0004546162
      4E040001000000000006447450726F630400060000000000085A614D6573476F
      6404000600000000000450536368010049000000010005574944544802000200
      0A0007536D5F4E616368080004000000000007536D5F55647267080004000000
      000007536D5F5675706C080004000000000006536D5F4F737408000400000000
      0007536D5F56446C67080004000000000007536D5F567A767208000400000000
      000000}
    object cdsDetTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsDetDtProc: TDateField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yy'
    end
    object cdsDetZaMesGod: TDateField
      DisplayLabel = #1047#1072' '#1052#1043
      FieldName = 'ZaMesGod'
      OnGetText = cdsDetZaMesGodGetText
      DisplayFormat = 'mm/yy'
    end
    object cdsDetPSch: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSch'
      Size = 10
    end
    object cdsDetSm_Nach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Sm_Nach'
      DisplayFormat = '0.00'
    end
    object cdsDetSm_Udrg: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      FieldName = 'Sm_Udrg'
      DisplayFormat = '0.00'
    end
    object cdsDetSm_Vupl: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1090#1099
      FieldName = 'Sm_Vupl'
      DisplayFormat = '0.00'
    end
    object cdsDetSm_Ost: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'Sm_Ost'
      DisplayFormat = '0.00'
    end
    object cdsDetSm_VDlg: TFloatField
      DisplayLabel = #1074' '#1044#1086#1083#1075' '#1058#1052
      FieldName = 'Sm_VDlg'
    end
    object cdsDetSm_Vzvr: TFloatField
      DisplayLabel = #1042#1079#1074#1088#1044#1086#1083#1075#1072#1055#1052
      FieldName = 'Sm_Vzvr'
    end
  end
  object dsrcDet: TDataSource
    DataSet = cdsDet
    Left = 88
    Top = 280
  end
  object cdsShort: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'PSch'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sm_Nach'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Udrg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vupl'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Ost'
        DataType = ftFloat
      end
      item
        Name = 'Sm_VDlg'
        DataType = ftFloat
      end
      item
        Name = 'Sm_Vzvr'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnPSch'
        Fields = 'PSch'
      end>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 144
    object cdsShortTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsShortDtProc: TDateField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yy'
    end
    object cdsShortPSch: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSch'
      Size = 10
    end
    object cdsShortSm_Nach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'Sm_Nach'
      DisplayFormat = '0.00'
    end
    object cdsShortSm_Udrg: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1080#1103
      FieldName = 'Sm_Udrg'
      DisplayFormat = '0.00'
    end
    object cdsShortSm_Vupl: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1090#1099
      FieldName = 'Sm_Vupl'
      DisplayFormat = '0.00'
    end
    object cdsShortSm_Ost: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'Sm_Ost'
      DisplayFormat = '0.00'
    end
    object cdsShortSm_VDlg: TFloatField
      DisplayLabel = #1074' '#1044#1086#1083#1075#1058#1052
      FieldName = 'Sm_VDlg'
    end
    object cdsShortSm_Vzvr: TFloatField
      DisplayLabel = #1042#1079#1074#1088#1044#1086#1083#1075#1072#1055#1052
      FieldName = 'Sm_Vzvr'
    end
  end
  object dsrcShort: TDataSource
    DataSet = cdsShort
    Left = 88
    Top = 152
  end
end
