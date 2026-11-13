object FormChDatMO: TFormChDatMO
  Left = 392
  Top = 400
  Width = 650
  Height = 250
  BorderIcons = [biSystemMenu]
  Caption = 'FormChDatMO'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 750
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
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 31
    Width = 642
    Height = 192
    Align = alClient
    Color = 11009242
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDrawColumnCell = dbgrTmpDrawColumnCell
    OnEnter = dnGridEnter
    OnExit = dnGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtProc'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZaMesGod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSch'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Nach'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Udrg'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Vupl'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sm_Ost'
        Width = 86
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      642
      31)
    object bBtnCancel: TBitBtn
      Left = 564
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_INFFORGO_2 (8285, '#39'10/01/2013'#39')')
    Left = 24
    Top = 48
  end
  object cdsTmp: TClientDataSet
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 80
    Data = {
      9F0000009619E0BD0100000018000000080000000000030000009F0004546162
      4E040001000000000006447450726F630400060000000000085A614D6573476F
      6404000600000000000450536368010049000000010005574944544802000200
      0A0007536D5F4E616368080004000000000007536D5F55647267080004000000
      000007536D5F5675706C080004000000000006536D5F4F737408000400000000
      000000}
    object cdsTmpTabN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TabN'
    end
    object cdsTmpDtProc: TDateField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsTmpZaMesGod: TDateField
      DisplayLabel = #1047#1072' '#1052#1043
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsTmpPSch: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSch'
      Size = 10
    end
    object cdsTmpSm_Nach: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'Sm_Nach'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Udrg: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1086
      FieldName = 'Sm_Udrg'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Vupl: TFloatField
      DisplayLabel = #1042#1099#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'Sm_Vupl'
      DisplayFormat = '0.00'
    end
    object cdsTmpSm_Ost: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'Sm_Ost'
      DisplayFormat = '0.00'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 80
    Top = 88
  end
end
