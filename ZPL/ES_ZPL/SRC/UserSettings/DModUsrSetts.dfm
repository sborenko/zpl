object DMUsrSetts: TDMUsrSetts
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 865
  Top = 272
  Height = 131
  Width = 268
  object TblSetts: TTable
    DatabaseName = 'DbMain'
    FieldDefs = <
      item
        Name = 'USER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SETT_NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SETT_VALUE'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'SETT_TYPE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 16
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY12'
        Fields = 'USER_ID;SETT_NAME'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'USER_SETTINGS'
    Left = 168
    Top = 16
    object TblSettsUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Required = True
    end
    object TblSettsSETT_NAME: TStringField
      FieldName = 'SETT_NAME'
      Required = True
      Size = 64
    end
    object TblSettsSETT_VALUE: TStringField
      FieldName = 'SETT_VALUE'
      Size = 64
    end
    object TblSettsSETT_TYPE: TStringField
      FieldName = 'SETT_TYPE'
      FixedChar = True
      Size = 16
    end
    object TblSettsLAST_UPDATED: TDateTimeField
      FieldName = 'LAST_UPDATED'
    end
  end
  object DSrcSettings: TDataSource
    DataSet = TblSetts
    Left = 184
    Top = 32
  end
  object Database: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER=SYSDBA')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
end
