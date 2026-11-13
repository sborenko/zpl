object DataLogin: TDataLogin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1071
  Top = 534
  Height = 145
  Width = 154
  object DbLogin: TDatabase
    DatabaseName = 'DbPsw'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 31
    Top = 8
  end
  object QrySelect: TQuery
    DatabaseName = 'DbPsw'
    SQL.Strings = (
      '')
    Left = 15
    Top = 40
  end
  object QryUpdate: TQuery
    DatabaseName = 'DbPsw'
    Left = 56
    Top = 40
  end
end
