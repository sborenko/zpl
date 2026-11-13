object DataStorn500X: TDataStorn500X
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 561
  Top = 125
  Height = 247
  Width = 374
  object OtklQry: TQuery
    CachedUpdates = True
    OnCalcFields = OtklQryCalcFields
    SQL.Strings = (
      'select * from z_otkl')
    UpdateObject = OtklUpdSQL
    Left = 16
    Top = 16
    object OtklQryNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object OtklQryKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object OtklQryDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
    end
    object OtklQryZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
    end
    object OtklQryDTSTORN: TDateTimeField
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
    end
    object OtklQryTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object OtklQryVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object OtklQryShVidN: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object OtklQryOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object OtklQryCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object OtklQrySUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
    end
    object OtklQryOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object OtklQryKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object OtklQryKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object OtklQryDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
    end
    object OtklQryDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
    end
    object OtklQryPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object OtklQryKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object OtklQryNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 35
    end
    object OtklQryPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object OtklQryPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object OtklQryKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object OtklQryPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object OtklQrySPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object OtklQryDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object OtklQryNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object OtklQryMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object OtklQrySPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object OtklQryPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object OtklQrySTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object OtklQryKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_OTKL.KDBNK'
    end
    object OtklQryKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_OTKL.KDTEMU'
    end
    object OtklQrySovm: TStringField
      FieldName = 'Sovm'
      Size = 1
    end
  end
  object PartsCDS: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 248
    Top = 16
  end
  object qryTmp: TQuery
    Left = 256
    Top = 136
  end
  object PartsDSrc: TDataSource
    DataSet = PartsCDS
    Left = 272
    Top = 40
  end
  object OtklUpdSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_OTKL'
      'set'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  STORN = :STORN,'
      '  DTSTORN = :DTSTORN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  PDN = :PDN,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  SPEC_NR = :SPEC_NR,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  PBNK = :PBNK,'
      '  KDBNK = :KDBNK'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_OTKL'
      '('
      '    TABN'
      '    , VIDN'
      '    , KDSPS'
      '    , DTPROC'
      '    , ZAMESGOD'
      '    , STORN'
      '    , DTSTORN'
      '    , CHAS'
      '    , SUMMA'
      '    , KDTEMU'
      '    , KDOBJ'
      '    , KDKATP'
      '    , DT_BEG'
      '    , DT_END'
      '    , PDN'
      '    , KDSPZ'
      '    , NOTES'
      '    , PRR'
      '    , PRPV'
      '    , KTO'
      '    , PRKR'
      '    , SPEC_NR'
      '    , DTVDPV'
      '    , NRVDPV'
      '    , MYNOTES'
      '    , SPECPS'
      '    , PBNK'
      '    , KDBNK'
      ')'
      'values'
      '('
      '    :TABN'
      '    , :VIDN'
      '    , :KDSPS'
      '    , :DTPROC'
      '    , :ZAMESGOD'
      '    , :STORN'
      '    , :DTSTORN'
      '    , :CHAS'
      '    , :SUMMA'
      '    , :KDTEMU'
      '    , :KDOBJ'
      '    , :KDKATP'
      '    , :DT_BEG'
      '    , :DT_END'
      '    , :PDN'
      '    , :KDSPZ'
      '    , :NOTES'
      '    , :PRR'
      '    , :PRPV'
      '    , :KTO'
      '    , :PRKR'
      '    , :SPEC_NR'
      '    , :DTVDPV'
      '    , :NRVDPV'
      '    , :MYNOTES'
      '    , :SPECPS'
      '    , :PBNK'
      '    , :KDBNK'
      ')')
    DeleteSQL.Strings = (
      'delete from Z_OTKL'
      'where'
      '  NR = :OLD_NR')
    Left = 40
    Top = 40
  end
  object OrigCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 16
  end
  object OperCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 40
  end
end
