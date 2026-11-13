object DMUsrStats: TDMUsrStats
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 746
  Top = 647
  Height = 150
  Width = 215
  object TblStats: TTable
    DatabaseName = 'DbMain'
    FieldDefs = <
      item
        Name = 'USER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PARAM_NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'PARAM_VALUE'
        DataType = ftInteger
      end
      item
        Name = 'LAST_UPDATED'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY13'
        Fields = 'USER_ID;PARAM_NAME'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'USER_STATISTICS'
    Left = 104
    Top = 16
    object TblStatsUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Required = True
    end
    object TblStatsPARAM_NAME: TStringField
      FieldName = 'PARAM_NAME'
      Required = True
      Size = 64
    end
    object TblStatsPARAM_VALUE: TIntegerField
      FieldName = 'PARAM_VALUE'
    end
    object TblStatsLAST_UPDATED: TDateTimeField
      FieldName = 'LAST_UPDATED'
    end
  end
end
