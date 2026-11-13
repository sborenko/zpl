object DmDismisThisMnth: TDmDismisThisMnth
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 706
  Top = 222
  Height = 228
  Width = 352
  object QryDismissed: TQuery
    Left = 56
    Top = 16
  end
  object CdsDismissed: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 16
  end
  object DsrcDismised: TDataSource
    DataSet = CdsDismissed
    Left = 144
    Top = 32
  end
end
