object FormGtZplMO: TFormGtZplMO
  Left = 485
  Top = 488
  Width = 468
  Height = 239
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtZplMO'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 200
  Constraints.MinWidth = 400
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
  object dbtNmPSch: TDBText
    Left = 0
    Top = 0
    Width = 452
    Height = 17
    Hint = #1055#1086#1083#1077' "'#1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072'"'
    Align = alTop
    Color = clMoneyGreen
    DataField = 'NmPSch'
    DataSource = dsrcZpl
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
  object dbgrZpl: TDBGrid
    Left = 0
    Top = 17
    Width = 452
    Height = 151
    Hint = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' "'#1047#1072#1088#1087#1083#1072#1090#1072'"'
    Align = alClient
    Color = 11861218
    DataSource = dsrcZpl
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrZplDblClick
    OnEnter = dbgrZplEnter
    OnExit = dbgrZplExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PSCH'
        Title.Alignment = taCenter
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmPSch'
        Width = 288
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Nr_GOrd'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdUPoz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPoz'
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 168
    Width = 452
    Height = 32
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      452
      32)
    object bBtnOk: TBitBtn
      Left = 287
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 369
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct PSCH'
      'from ViNuMain '
      'where DtProc = '#39'10/01/2013'#39' ')
    Left = 56
    Top = 80
  end
  object cdsZpl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NmPSch'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'Nr_GOrd'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'KdUPoz'
        DataType = ftSmallint
      end
      item
        Name = 'UPoz'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    OnCalcFields = cdsZplCalcFields
    Left = 128
    Top = 80
    object cdsZplPSCH: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsZplNmPSch: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
      FieldName = 'NmPSch'
      Size = 65
    end
    object cdsZplNr_GOrd: TStringField
      DisplayLabel = #8470' '#1078'/'#1086
      FieldName = 'Nr_GOrd'
      Size = 10
    end
    object cdsZplKdUPoz: TSmallintField
      DisplayLabel = #1048#1060
      FieldKind = fkCalculated
      FieldName = 'KdUPoz'
      Calculated = True
    end
    object cdsZplUPoz: TStringField
      DisplayLabel = #1059#1095'. '#1087#1086#1079#1080#1094#1080#1103
      FieldKind = fkCalculated
      FieldName = 'UPoz'
      Calculated = True
    end
  end
  object dsrcZpl: TDataSource
    DataSet = cdsZpl
    Left = 144
    Top = 96
  end
end
