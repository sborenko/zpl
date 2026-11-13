object FormShIndDbg: TFormShIndDbg
  Left = 312
  Top = 131
  Width = 870
  Height = 355
  ActiveControl = dbgrDbg
  BorderIcons = [biSystemMenu]
  Caption = 'FormShIndDbg'
  Color = clBtnFace
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
    Width = 862
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      862
      31)
    object bBtnCancel: TBitBtn
      Left = 784
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcDbg
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrDbg: TDBGrid
    Left = 0
    Top = 31
    Width = 862
    Height = 297
    Align = alClient
    Color = 11926506
    DataSource = dsrcDbg
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrDbgDrawColumnCell
    OnEnter = dbgrDbgEnter
    OnExit = dbgrDbgExit
  end
  object cdsDbg: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'LastPrm'
        DataType = ftDate
      end
      item
        Name = 'Da'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'SmOklNdbIndM'
        DataType = ftFloat
      end
      item
        Name = 'SmToIndx'
        DataType = ftFloat
      end
      item
        Name = 'DtBM'
        DataType = ftDate
      end
      item
        Name = 'DtRprMin'
        DataType = ftDate
      end
      item
        Name = 'SmOklNdbBM'
        DataType = ftFloat
      end
      item
        Name = 'SmProgMin'
        DataType = ftFloat
      end
      item
        Name = 'SmMinZpBM'
        DataType = ftFloat
      end
      item
        Name = 'PrcIndBM'
        DataType = ftFloat
      end
      item
        Name = 'PredpSmInd'
        DataType = ftFloat
      end
      item
        Name = 'SmDelta'
        DataType = ftFloat
      end
      item
        Name = 'SmIndx'
        DataType = ftFloat
      end
      item
        Name = 'IsMin'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 96
    object cdsDbgNR: TIntegerField
      DisplayWidth = 11
      FieldName = 'NR'
    end
    object cdsDbgLastPrm: TDateField
      DisplayWidth = 15
      FieldName = 'LastPrm'
    end
    object cdsDbgDa: TStringField
      DisplayWidth = 4
      FieldName = 'Da'
      Size = 3
    end
    object cdsDbgTabN: TIntegerField
      DisplayWidth = 15
      FieldName = 'TabN'
    end
    object cdsDbgSmOklNdbIndM: TFloatField
      DisplayWidth = 18
      FieldName = 'SmOklNdbIndM'
      DisplayFormat = '#.00'
    end
    object cdsDbgSmToIndx: TFloatField
      DisplayWidth = 15
      FieldName = 'SmToIndx'
      DisplayFormat = '#.00'
    end
    object cdsDbgDtBM: TDateField
      DisplayWidth = 15
      FieldName = 'DtBM'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsDbgDtRprMin: TDateField
      DisplayWidth = 15
      FieldName = 'DtRprMin'
    end
    object cdsDbgSmOklNdbBM: TFloatField
      DisplayWidth = 17
      FieldName = 'SmOklNdbBM'
      DisplayFormat = '#.00'
    end
    object cdsDbgSmProgMin: TFloatField
      DisplayLabel = 'SmProgMinBM'
      DisplayWidth = 15
      FieldName = 'SmProgMin'
      DisplayFormat = '#.00'
    end
    object cdsDbgSmMinZpBM: TFloatField
      DisplayWidth = 15
      FieldName = 'SmMinZpBM'
      DisplayFormat = '#.00'
    end
    object cdsDbgPrcIndBM: TFloatField
      DisplayWidth = 15
      FieldName = 'PrcIndBM'
      DisplayFormat = '#.00'
    end
    object cdsDbgPredpSmInd: TFloatField
      DisplayWidth = 15
      FieldName = 'PredpSmInd'
      DisplayFormat = '#.00'
    end
    object cdsDbgSmDelta: TFloatField
      DisplayWidth = 15
      FieldName = 'SmDelta'
      DisplayFormat = '#.00'
    end
    object cdsDbgSmIndx: TFloatField
      DisplayWidth = 15
      FieldName = 'SmIndx'
      DisplayFormat = '#.00'
    end
    object cdsDbgIsMin: TStringField
      DisplayLabel = #1052#1084
      FieldName = 'IsMin'
      Size = 1
    end
  end
  object dsrcDbg: TDataSource
    DataSet = cdsDbg
    Left = 144
    Top = 112
  end
end
