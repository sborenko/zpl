object FormVbYear: TFormVbYear
  Left = 511
  Top = 306
  Width = 160
  Height = 350
  ActiveControl = dbgrYears
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbYear'
  Color = clBtnFace
  Constraints.MaxWidth = 160
  Constraints.MinHeight = 350
  Constraints.MinWidth = 160
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
  object dbgrYears: TDBGrid
    Left = 0
    Top = 0
    Width = 144
    Height = 277
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcYears
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
    OnDblClick = dbgrYearsDblClick
    OnEnter = dbgrYearsEnter
    OnExit = dbgrYearsExit
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'God'
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 277
    Width = 144
    Height = 34
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      144
      34)
    object bBtnOk: TBitBtn
      Left = 3
      Top = 9
      Width = 64
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 82
      Top = 9
      Width = 59
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object cdsYears: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'God'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 120
    object cdsYearsGod: TSmallintField
      DisplayLabel = #1044#1086#1089#1090#1091#1087#1085#1099' '#1075#1086#1076#1099
      DisplayWidth = 14
      FieldName = 'God'
    end
  end
  object dsrcYears: TDataSource
    DataSet = cdsYears
    Left = 80
    Top = 136
  end
end
