object DmIndxExcl: TDmIndxExcl
  OldCreateOrder = False
  Left = 398
  Top = 264
  Height = 134
  Width = 301
  object QryIndxExcl: TQuery
    CachedUpdates = True
    AfterInsert = IndxExclAfterInsert
    RequestLive = True
    SQL.Strings = (
      'select * from z_EmplIndxExcl')
    UpdateObject = UpdIndxExcl
    Left = 24
    Top = 8
    object QryIndxExclNr: TIntegerField
      FieldName = 'Nr'
    end
    object QryIndxExclTabN: TIntegerField
      DisplayLabel = #1058#1072#1073'.'#8470
      FieldName = 'TabN'
    end
    object QryIndxExclDtBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095'.'
      FieldName = 'DtBeg'
      OnGetText = IndxExclDtGetText
    end
    object QryIndxExclDtEnd: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095
      FieldName = 'DtEnd'
      OnGetText = IndxExclDtGetText
    end
    object QryIndxExclNotes: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      DisplayWidth = 128
      FieldName = 'Notes'
      Size = 128
    end
  end
  object DsrcExclList: TDataSource
    DataSet = QryIndxExcl
    Left = 48
    Top = 16
  end
  object UpdIndxExcl: TUpdateSQL
    ModifySQL.Strings = (
      'update z_EmplIndxExcl'
      'set'
      '  TABN = :TABN,'
      '  DTBEG = :DTBEG,'
      '  DTEND = :DTEND,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_EmplIndxExcl'
      '  (NR, TABN, DTBEG, DTEND, NOTES)'
      'values'
      '  (:NR, :TABN, :DTBEG, :DTEND, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_EmplIndxExcl'
      'where'
      '  NR = :OLD_NR')
    Left = 72
    Top = 24
  end
  object CdsRec: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsRecAfterInsert
    Left = 168
    Top = 8
    object CdsRecNr: TIntegerField
      FieldName = 'Nr'
    end
    object CdsRecTabN: TIntegerField
      FieldName = 'TabN'
    end
    object CdsRecDtBeg: TDateTimeField
      FieldName = 'DtBeg'
      OnGetText = IndxExclDtGetText
      OnSetText = CdsRecDtSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1; '
    end
    object CdsRecDtEnd: TDateTimeField
      FieldName = 'DtEnd'
      OnGetText = IndxExclDtGetText
      OnSetText = CdsRecDtSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1; '
    end
    object CdsRecNotes: TStringField
      FieldName = 'Notes'
      Size = 128
    end
  end
  object DsrclRec: TDataSource
    DataSet = CdsRec
    Left = 192
    Top = 24
  end
end
