object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 418
  Top = 206
  Height = 176
  Width = 469
  object Database: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 24
    Top = 32
  end
  object QryCmn: TQuery
    DatabaseName = 'DbMain'
    Left = 392
    Top = 32
  end
  object QryAllows: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    UpdateObject = UpdAllows
    Left = 256
    Top = 32
  end
  object QryEmplList: TQuery
    Left = 136
    Top = 32
  end
  object UpdAllows: TUpdateSQL
    DeleteSQL.Strings = (
      'delete '
      'from z_Nadb '
      'where Nr = :Old_Nr')
    Left = 280
    Top = 56
  end
end
