object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 738
  Top = 377
  Height = 201
  Width = 538
  object DbMain: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER=SYSDBA')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object QryVBln: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    RequestLive = True
    UpdateObject = UpdVBln
    Left = 88
    Top = 16
  end
  object QryPayTypes: TQuery
    DatabaseName = 'DbMain'
    Left = 152
    Top = 16
  end
  object UpdVBln: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VBln '
      'set DayFlags = :DayFlags '
      'where Spec_Nr = :Spec_Nr')
    Left = 88
    Top = 64
  end
end
