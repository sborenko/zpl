object DataMod: TDataMod
  OldCreateOrder = False
  Left = 999
  Top = 536
  Height = 166
  Width = 228
  object TblSrc: TTable
    Left = 80
    Top = 48
  end
  object TblDst: TTable
    TableType = ttFoxPro
    Left = 120
    Top = 48
  end
  object Database: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'user_name=SYSDBA')
    SessionName = 'Default'
    Left = 16
    Top = 16
  end
end
