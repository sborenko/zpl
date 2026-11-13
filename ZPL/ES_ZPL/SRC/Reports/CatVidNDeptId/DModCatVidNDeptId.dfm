object DmCatVidNDeptId: TDmCatVidNDeptId
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 398
  Top = 264
  Height = 204
  Width = 301
  object CdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 56
  end
  object CdsMisVidN: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'VidNSh'
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <>
    IndexFieldNames = 'VidN'
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 56
  end
  object QryNU: TQuery
    Left = 16
    Top = 16
  end
  object DsrcMisVidN: TDataSource
    DataSet = CdsMisVidN
    Left = 120
    Top = 72
  end
  object DsrcReport: TDataSource
    DataSet = CdsReport
    Left = 224
    Top = 72
  end
  object CdsGrpTtl: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 128
  end
  object CdsRptTtl: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 128
  end
end
