object DMdUser: TDMdUser
  OldCreateOrder = False
  Left = 1108
  Top = 230
  Height = 150
  Width = 215
  object DBLogin: TDatabase
    DatabaseName = 'DBLogin'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'user=SYSDBA')
    SessionName = 'Default'
    Left = 23
    Top = 8
  end
  object QryUser: TQuery
    DatabaseName = 'DBLogin'
    SQL.Strings = (
      '')
    Left = 95
    Top = 32
  end
end
