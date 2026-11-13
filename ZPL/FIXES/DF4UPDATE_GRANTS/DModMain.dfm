object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 724
  Top = 241
  Height = 350
  Width = 491
  object TblResult: TTable
    TableType = ttFoxPro
    Left = 136
    Top = 120
  end
  object Query: TQuery
    Left = 24
    Top = 88
  end
  object QryPeek: TQuery
    Left = 48
    Top = 208
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    Left = 264
    Top = 72
  end
  object TblTIN: TTable
    DatabaseName = 'DbMain'
    Exclusive = True
    TableName = 'TMP_DF4_STUD_FIX'
    Left = 200
    Top = 216
  end
end
