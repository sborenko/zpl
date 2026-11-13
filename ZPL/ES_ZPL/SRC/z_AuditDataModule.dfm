object DmAudit: TDmAudit
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 870
  Top = 404
  Height = 238
  Width = 314
  object QryAudit: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select'
      '  round(sum(summa), 2) as TotalSum'
      '  , count(*) as RecCount'
      'from'
      '  z_nu'
      'where'
      '  tabn = :TabN'
      '  and dtproc = :DtProc'
      '  and cast(vidn as int) < 8000')
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TabN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DtProc'
        ParamType = ptUnknown
      end>
    object QryAuditTOTALSUM: TFloatField
      FieldName = 'TOTALSUM'
    end
    object QryAuditRECCOUNT: TIntegerField
      FieldName = 'RECCOUNT'
    end
  end
end
