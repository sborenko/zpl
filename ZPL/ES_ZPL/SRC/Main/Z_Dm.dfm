object DmMain: TDmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 336
  Top = 43
  Height = 677
  Width = 922
  object dspTmp: TDataSetProvider
    Left = 448
    Top = 352
  end
  object QryTmp: TQuery
    Left = 432
    Top = 336
  end
  object qryNadb: TQuery
    CachedUpdates = True
    BeforePost = qryNadbBeforePost
    AfterPost = qryNadbAfterPost
    AfterDelete = qryNadbAfterDelete
    OnCalcFields = qryNadbCalcFields
    OnNewRecord = qryNadbNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from  Z_VINADB where TABN = 115 order by NR desc')
    UpdateObject = updNadb
    Left = 352
    Top = 8
    object qryNadbNR: TIntegerField
      DisplayLabel = #1057#1055#1057
      FieldName = 'NR'
      Origin = 'DbMain.Z_VINADB.NR'
    end
    object qryNadbKDSPS: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1057#1055#1057
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VINADB.KDSPS'
    end
    object qryNadbSPSRSCH: TSmallintField
      DisplayLabel = #1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_VINADB.SPSRSCH'
    end
    object qryNadbTABN: TIntegerField
      DisplayLabel = #1058#1072#1073' '#8470
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VINADB.TABN'
    end
    object qryNadbVIDN: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1080#1076#1072
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VINADB.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryNadbSHVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'SHVIDN'
      Origin = 'DbMain.Z_VINADB.SHVIDN'
      Size = 15
    end
    object qryNadbGRP: TSmallintField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'GRP'
      Origin = 'DbMain.Z_VINADB.GRP'
    end
    object qryNadbSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084'-%'
      FieldName = 'SUMPROC'
      Origin = 'DbMain.Z_VINADB.SUMPROC'
      DisplayFormat = '#.00'
    end
    object qryNadbSP: TStringField
      DisplayLabel = #1088'-%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_VINADB.SP'
      Size = 1
    end
    object qryNadbPRCSOVM: TFloatField
      DisplayLabel = '% '#1089#1086#1074#1084'.'
      FieldName = 'PRCSOVM'
      Origin = 'DbMain.Z_VINADB.PRCSOVM'
      DisplayFormat = '#.00'
    end
    object qryNadbDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_VINADB.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbDT_END: TDateTimeField
      DisplayLabel = #1044'-'#1090' '#1086#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_VINADB.DT_END'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbKDTEMU: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1090#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VINADB.KDTEMU'
    end
    object qryNadbKDOBJ: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1087#1076#1088'.'
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VINADB.KDOBJ'
    end
    object qryNadbSHOBJ: TStringField
      FieldName = 'SHOBJ'
      Origin = 'DbMain.Z_VINADB.SHOBJ'
      Size = 15
    end
    object qryNadbKDKATP: TSmallintField
      DisplayLabel = #1050#1072#1090' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VINADB.KDKATP'
    end
    object qryNadbSHKATP: TStringField
      FieldName = 'SHKATP'
      Origin = 'DbMain.Z_VINADB.SHKATP'
      Size = 10
    end
    object qryNadbPRCHS: TStringField
      FieldName = 'PRCHS'
      Origin = 'DbMain.Z_VINADB.PRCHS'
      Size = 1
    end
    object qryNadbPRSMM: TStringField
      FieldName = 'PRSMM'
      Origin = 'DbMain.Z_VINADB.PRSMM'
      Size = 1
    end
    object qryNadbKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VINADB.KDSPZ'
    end
    object qryNadbSCHBU: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1041#1059
      FieldName = 'SCHBU'
      Origin = 'DbMain.Z_VINADB.SCHBU'
      Size = 15
    end
    object qryNadbSPEC_NR: TIntegerField
      DisplayLabel = #1057#1087#1077#1094'. NR'
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VINADB.SPEC_NR'
    end
    object qryNadbNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VINADB.NOTES'
      Size = 254
    end
    object qryNadbNRPRBEG: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082'. '#1085#1072#1095'.'
      FieldName = 'NRPRBEG'
      Origin = 'DbMain.Z_VINADB.NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryNadbDTPRBEG: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1053#1072#1095
      FieldName = 'DTPRBEG'
      Origin = 'DbMain.Z_VINADB.DTPRBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbDTPREND: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1054#1082#1086#1085#1095
      FieldName = 'DTPREND'
      Origin = 'DbMain.Z_VINADB.DTPREND'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNadbNRPREND: TStringField
      DisplayLabel = #1055#1088'.'#8470' '#1086#1082'.'
      FieldName = 'NRPREND'
      Origin = 'DbMain.Z_VINADB.NRPREND'
      FixedChar = True
      Size = 10
    end
    object qryNadbNRPKT: TIntegerField
      DisplayLabel = #8470' '#1087#1072#1082#1077#1090#1072
      FieldName = 'NRPKT'
      Origin = 'DbMain.Z_VINADB.NRPKT'
    end
    object qryNadbDTVPKT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1082#1090
      FieldName = 'DTVPKT'
      Origin = 'DbMain.Z_VINADB.DTVPKT'
    end
    object qryNadbPRC_WT: TFloatField
      DisplayLabel = '% '#1088#1072#1073'.'#1074#1088'.'
      FieldName = 'PRC_WT'
      Origin = 'DbMain.Z_VINADB.PRC_WT'
    end
    object qryNadbZP13: TStringField
      FieldName = 'ZP13'
      Origin = 'DbMain.Z_VINADB.ZP13'
      Size = 1
    end
    object qryNadbOTP: TStringField
      FieldName = 'OTP'
      Origin = 'DbMain.Z_VINADB.OTP'
      Size = 1
    end
    object qryNadbBLN: TStringField
      FieldName = 'BLN'
      Origin = 'DbMain.Z_VINADB.BLN'
      Size = 1
    end
    object qryNadbDKR: TStringField
      FieldName = 'DKR'
      Origin = 'DbMain.Z_VINADB.DKR'
      Size = 1
    end
    object qryNadbOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Origin = 'DbMain.Z_VINADB.OTPUSKN'
      Size = 1
    end
    object qryNadbBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Origin = 'DbMain.Z_VINADB.BOLNIC'
      Size = 1
    end
    object qryNadbSPRM: TStringField
      FieldName = 'SPRM'
      Origin = 'DbMain.Z_VINADB.SPRM'
      Size = 1
    end
    object qryNadbCPRM: TStringField
      FieldName = 'CPRM'
      Origin = 'DbMain.Z_VINADB.CPRM'
      Size = 1
    end
    object qryNadbSSRK: TStringField
      FieldName = 'SSRK'
      Origin = 'DbMain.Z_VINADB.SSRK'
      FixedChar = True
      Size = 1
    end
    object qryNadbDETI: TStringField
      FieldName = 'DETI'
      Origin = 'DbMain.Z_VINADB.DETI'
      Size = 1
    end
    object qryNadbDETIM: TStringField
      FieldName = 'DETIM'
      Origin = 'DbMain.Z_VINADB.DETIM'
      Size = 1
    end
    object qryNadbDETIK: TStringField
      FieldName = 'DETIK'
      Origin = 'DbMain.Z_VINADB.DETIK'
      Size = 1
    end
    object qryNadbDETIG: TStringField
      FieldName = 'DETIG'
      Origin = 'DbMain.Z_VINADB.DETIG'
      Size = 1
    end
    object qryNadbIND: TStringField
      FieldName = 'IND'
      Origin = 'DbMain.Z_VINADB.IND'
      Size = 1
    end
    object qryNadbDHD: TStringField
      FieldName = 'DHD'
      Origin = 'DbMain.Z_VINADB.DHD'
      Size = 1
    end
    object qryNadbOKLFND: TStringField
      FieldName = 'OKLFND'
      Origin = 'DbMain.Z_VINADB.OKLFND'
      Size = 1
    end
    object qryNadbCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.Z_VINADB.CBUDG'
      Size = 1
    end
    object qryNadbSNDB: TStringField
      FieldName = 'SNDB'
      Origin = 'DbMain.Z_VINADB.SNDB'
      Size = 1
    end
    object qryNadbSPDN: TStringField
      FieldName = 'SPDN'
      Origin = 'DbMain.Z_VINADB.SPDN'
      Size = 1
    end
    object qryNadbSWSB: TStringField
      FieldName = 'SWSB'
      Origin = 'DbMain.Z_VINADB.SWSB'
      Size = 1
    end
    object qryNadbSPRF: TStringField
      FieldName = 'SPRF'
      Origin = 'DbMain.Z_VINADB.SPRF'
      Size = 1
    end
    object qryNadbSPENS: TStringField
      FieldName = 'SPENS'
      Origin = 'DbMain.Z_VINADB.SPENS'
      Size = 1
    end
    object qryNadbSALIM: TStringField
      FieldName = 'SALIM'
      Origin = 'DbMain.Z_VINADB.SALIM'
      Size = 1
    end
    object qryNadbCNDB: TStringField
      FieldName = 'CNDB'
      Origin = 'DbMain.Z_VINADB.CNDB'
      Size = 1
    end
    object qryNadbSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Origin = 'DbMain.Z_VINADB.SSOCSTRAH'
      Size = 1
    end
    object qryNadbSBZR: TStringField
      FieldName = 'SBZR'
      Origin = 'DbMain.Z_VINADB.SBZR'
      Size = 1
    end
    object qryNadbSP_PF: TStringField
      FieldName = 'SP_PF'
      Origin = 'DbMain.Z_VINADB.SP_PF'
      FixedChar = True
      Size = 1
    end
    object qryNadbSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      Origin = 'DbMain.Z_VINADB.SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object qryNadbSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      Origin = 'DbMain.Z_VINADB.SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object qryNadbSP_FZ: TStringField
      FieldName = 'SP_FZ'
      Origin = 'DbMain.Z_VINADB.SP_FZ'
      FixedChar = True
      Size = 1
    end
    object qryNadbSOVM: TStringField
      DisplayLabel = #1057#1086#1074#1084'.'
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_VINADB.SOVM'
      Size = 1
    end
    object qryNadbSPOV: TStringField
      FieldName = 'SPOV'
      Origin = 'DbMain.Z_VINADB.SPOV'
      Size = 1
    end
    object qryNadbKEKV: TStringField
      FieldName = 'KEKV'
      Origin = 'DbMain.Z_VINADB.KEKV'
      FixedChar = True
      Size = 4
    end
    object qryNadbKDSCHDT: TSmallintField
      FieldName = 'KDSCHDT'
      Origin = 'DbMain.Z_VINADB.KDSCHDT'
    end
    object qryNadbKDSCHKT: TSmallintField
      FieldName = 'KDSCHKT'
      Origin = 'DbMain.Z_VINADB.KDSCHKT'
    end
    object qryNadbIS_PERE: TStringField
      FieldName = 'IS_PERE'
      Origin = 'DbMain.Z_VINADB.IS_PERE'
      FixedChar = True
      Size = 1
    end
    object qryNadbKD_DLZHN: TSmallintField
      FieldName = 'KD_DLZHN'
      Origin = 'DbMain.Z_VINADB.KD_DLZHN'
    end
    object qryNadbKD_PROF: TStringField
      DisplayLabel = 'KdProf'
      FieldKind = fkCalculated
      FieldName = 'KD_PROF'
      Size = 255
      Calculated = True
    end
    object qryNadbDLZHN: TStringField
      FieldKind = fkCalculated
      FieldName = 'DLZHN'
      Origin = 'DbMain.Z_VINADB.DLZHN'
      Size = 255
      Calculated = True
    end
    object qryNadbKD_SOVM: TSmallintField
      FieldName = 'KD_SOVM'
      Origin = 'DbMain.Z_VINADB.KD_SOVM'
    end
    object qryNadbSHSOVM: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHSOVM'
      LookupDataSet = cdsSovm
      LookupKeyFields = 'KDSOVM'
      LookupResultField = 'SHSOVM'
      Origin = 'DbMain.Z_VINADB.SHSOVM'
      Size = 15
      Calculated = True
    end
    object qryNadbSPOV_MERGE: TStringField
      DisplayWidth = 1
      FieldName = 'SPOV_MERGE'
      Size = 1
    end
    object qryNadbPartSalId: TIntegerField
      FieldName = 'PartSalId'
    end
    object qryNadbIgnNoPayVac: TStringField
      FieldName = 'IgnNoPayVac'
      Size = 1
    end
  end
  object dsrcNadb: TDataSource
    DataSet = qryNadb
    Left = 360
    Top = 24
  end
  object updNadb: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Nadb'
      'set'
      '  KDSPS = :KDSPS,'
      '  SPSRSCH = :SPSRSCH,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  PRCSOVM = :PRCSOVM,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PRCHS = :PRCHS,'
      '  PRSMM = :PRSMM,'
      '  KDSPZ = :KDSPZ,'
      '  SPEC_NR = :SPEC_NR,'
      '  NOTES = :NOTES,'
      '  NRPRBEG = :NRPRBEG,'
      '  DTPRBEG = :DTPRBEG,'
      '  NRPREND = :NRPREND,'
      '  DTPREND = :DTPREND,'
      '  PRC_WT = :PRC_WT,'
      '  GRP = :GRP,'
      '  KD_DLZHN = :KD_DLZHN,'
      '  KD_SOVM = :KD_SOVM,'
      '  IS_PERE = :IS_PERE,'
      '  SPOV_MERGE = :SPOV_MERGE,'
      '  PartSalId = :PartSalId,'
      '  IgnNoPayVac = :IgnNoPayVac'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Nadb ('
      'KDSPS, SPSRSCH, TABN, VIDN, SUMPROC, SP, PRCSOVM, '
      'DT_BEG, DT_END, '
      'KDTEMU, KDOBJ, KDKATP, PRCHS, PRSMM, KDSPZ, SPEC_NR, '
      'NOTES, NRPRBEG, DTPRBEG, NRPREND, DTPREND, '
      'PRC_WT, GRP, KD_DLZHN, KD_SOVM, IS_PERE, '
      'SPOV_MERGE, PartSalId, IgnNoPayVac)'
      'values ('
      ':KDSPS, :SPSRSCH, :TABN, :VIDN, :SUMPROC, :SP, :PRCSOVM, '
      ':DT_BEG, :DT_END, '
      ':KDTEMU, :KDOBJ, :KDKATP, :PRCHS, :PRSMM, :KDSPZ, :SPEC_NR, '
      ':NOTES, :NRPRBEG, :DTPRBEG, :NRPREND, :DTPREND, '
      ':PRC_WT, :GRP, :KD_DLZHN, :KD_SOVM, :IS_PERE, '
      ':SPOV_MERGE, :PartSalId, :IgnNoPayVac)')
    DeleteSQL.Strings = (
      'delete from z_Nadb'
      'where'
      '  NR = :OLD_NR')
    Left = 368
    Top = 40
  end
  object QryPere: TQuery
    CachedUpdates = True
    BeforeInsert = QryPereBeforeInsert
    AfterPost = QryPereAfterPost
    AfterDelete = QryPereAfterDelete
    OnCalcFields = QryPereCalcFields
    OnNewRecord = QryPereNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select first 10 * from Z_PERE')
    UpdateObject = updPere
    Left = 232
    Top = 8
    object QryPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object QryPereKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object QryPereShSps: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShSps'
      Size = 15
      Calculated = True
    end
    object QryPereBM: TStringField
      DisplayLabel = #1041#1052#1077#1089
      FieldName = 'BM'
      FixedChar = True
      Size = 1
    end
    object QryPereDTBM: TDateTimeField
      DisplayLabel = #1044#1090#1041#1052
      FieldName = 'DTBM'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object QryPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object QryPereDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object QryPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
      OnValidate = FldKdKatPValidate
    end
    object QryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
      OnValidate = FldSoValidate
    end
    object QryPereOKLTRF: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
      DisplayFormat = '#.00'
    end
    object QryPereSmCmbOkl: TFloatField
      DisplayLabel = #1054#1082#1083#1072#1076'('#1058#1072#1088#1080#1092')'
      FieldKind = fkCalculated
      FieldName = 'SmCmbOkl'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object QryPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object QryPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object QryPereOLDKDOK: TSmallintField
      DisplayLabel = #1057#1050#1076#1044#1086#1083#1078#1085'.'
      FieldName = 'OLDKDOK'
    end
    object QryPereOldDolgnOK: TStringField
      DisplayLabel = #1057#1044#1086#1083#1078#1085#1054#1050
      FieldKind = fkCalculated
      FieldName = 'OldDolgnOK'
      Size = 127
      Calculated = True
    end
    object QryPereOldCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldCode'
      Size = 10
      Calculated = True
    end
    object QryPereOldD_zkpp: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldD_zkpp'
      Size = 10
      Calculated = True
    end
    object QryPereOldNameD: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldNameD'
      Size = 254
      Calculated = True
    end
    object QryPereOldNameFull: TStringField
      FieldKind = fkCalculated
      FieldName = 'OldNameFull'
      Size = 254
      Calculated = True
    end
    object QryPereNEWKDOK: TSmallintField
      DisplayLabel = #1053#1050#1076#1044#1086#1083#1078#1085'.'
      FieldName = 'NEWKDOK'
    end
    object QryPereNewDolgnOK: TStringField
      DisplayLabel = #1053#1044#1086#1083#1078#1085#1054#1050
      FieldKind = fkCalculated
      FieldName = 'NewDolgnOK'
      Size = 127
      Calculated = True
    end
    object QryPereNewCode: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewCode'
      Size = 10
      Calculated = True
    end
    object QryPereNewD_zkpp: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewD_zkpp'
      Size = 10
      Calculated = True
    end
    object QryPereNewNameD: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewNameD'
      Size = 255
      Calculated = True
    end
    object QryPereNewNameFull: TStringField
      FieldKind = fkCalculated
      FieldName = 'NewNameFull'
      Size = 255
      Calculated = True
    end
    object QryPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object QryPereDOLGNOST: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object QryPerePR_PENS: TSmallintField
      DisplayLabel = #1055#1077#1085#1089#1080#1086#1085#1077#1088
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object QryPereSOVM: TSmallintField
      DisplayLabel = #1057#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
      OnValidate = FldSovmValidate
    end
    object QryPereShSovm: TStringField
      FieldKind = fkLookup
      FieldName = 'ShSovm'
      LookupDataSet = cdsSovm
      LookupKeyFields = 'KDSOVM'
      LookupResultField = 'SHSOVM'
      KeyFields = 'SOVM'
      Size = 15
      Lookup = True
    end
    object QryPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
      OnValidate = FldPdNlgValidate
    end
    object QryPerePROCLG: TFloatField
      DisplayLabel = '% '#1083#1100#1075#1086#1090#1099
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object QryPereKOLMIN: TSmallintField
      DisplayLabel = #1050'-'#1074#1086' '#1084#1080#1085#1080#1084#1091#1084#1086#1074
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object QryPereShSO: TStringField
      DisplayLabel = #1057#1080#1089#1090#1054#1087#1083
      FieldKind = fkLookup
      FieldName = 'ShSO'
      LookupDataSet = qrySysOpl_LU
      LookupKeyFields = 'KDOPL'
      LookupResultField = 'NMOPL'
      KeyFields = 'SO'
      Size = 25
      Lookup = True
    end
    object QryPereShPdNlg: TStringField
      DisplayLabel = #1057#1093#1055#1076#1053#1083#1075
      FieldKind = fkLookup
      FieldName = 'ShPdNlg'
      LookupDataSet = qryShPdn_LU
      LookupKeyFields = 'KDSH'
      LookupResultField = 'SHSH'
      KeyFields = 'PDNLG'
      Size = 25
      Lookup = True
    end
    object QryPereKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
    end
    object QryPereNmTemu: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1090#1077#1084#1099
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 25
      Calculated = True
    end
    object QryPereKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
      OnValidate = FldKdObjValidate
    end
    object QryPereShObj: TStringField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object QryPereShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object QryPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object QryPereNPD: TSmallintField
      DisplayLabel = #1053#1087#1056#1044
      FieldName = 'NPD'
      OnValidate = QryPereNPDValidate
    end
    object QryPerePRCWRKTIME: TFloatField
      DisplayLabel = '%'#1056#1072#1073#1042#1088#1077#1084
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object QryPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object QryPereSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 15
      Calculated = True
    end
    object QryPereNOINDX: TStringField
      FieldName = 'NoIndx'
      FixedChar = True
      Size = 1
    end
    object QryPerePRFS: TSmallintField
      DisplayLabel = #1055#1088#1092#1057#1079
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object QryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object QryPereNR_PRIKAZA: TStringField
      DisplayLabel = #8470' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object QryPereRAZR: TSmallintField
      DisplayLabel = #1056#1072#1079#1088'.'
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object QryPereDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090' '#1087#1088#1080#1082#1072#1079#1072
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPereRANG: TSmallintField
      DisplayLabel = #1056#1072#1085#1075
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object QryPereINV: TSmallintField
      DisplayLabel = #1048#1085#1074'.'
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object QryPerePRDEKR: TStringField
      DisplayLabel = #1044#1077#1082#1088
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object QryPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object QryPereSPEC_NR: TIntegerField
      DisplayLabel = #1057#1087#1077#1094'_'#1053#1056
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
    object QryPereNRPKT: TIntegerField
      FieldName = 'NRPKT'
    end
    object QryPereDTVPKT: TDateTimeField
      FieldName = 'DTVPKT'
    end
    object QryPereIS_PERE: TStringField
      FieldName = 'IS_PERE'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcPere: TDataSource
    DataSet = QryPere
    Left = 240
    Top = 24
  end
  object updPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_PERE'
      'set'
      '  BM = :BM,'
      '  DTBM = :DTBM,'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  NPD = :NPD,'
      '  PRCWRKTIME = :PRCWRKTIME,'
      '  SO = :SO,'
      '  OKLTRF = :OKLTRF,'
      '  AVANS = :AVANS,'
      '  SP_AV = :SP_AV,'
      '  KDDOLGN = :KDDOLGN,'
      '  DOLGNOST = :DOLGNOST,'
      '  KDSPZ = :KDSPZ,'
      '  PR_PENS = :PR_PENS,'
      '  SOVM = :SOVM,'
      '  PDNLG = :PDNLG,'
      '  PROCLG = :PROCLG,'
      '  KOLMIN = :KOLMIN,'
      '  PRFS = :PRFS,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  NOTES = :NOTES,'
      '  INV = :INV,'
      '  RANG = :RANG,'
      '  RAZR = :RAZR,'
      '  DT_END = :DT_END,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  PRDEKR = :PRDEKR,'
      '  CMBOKL = :CMBOKL,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPKT = :NRPKT,'
      '  DTVPKT = :DTVPKT,'
      '  NOINDX = :NOINDX,'
      '  OLDKDOK = :OLDKDOK,'
      '  NEWKDOK = :NEWKDOK,'
      '  IS_PERE = :IS_PERE'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_PERE'
      '  (BM, DTBM, KDSPS, TABN, DT_BEG, KDTEMU, KDOBJ, KDKATP, NPD, '
      'PRCWRKTIME, '
      '   SO, OKLTRF, AVANS, SP_AV, KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, '
      'SOVM, PDNLG, '
      
        '   PROCLG, KOLMIN, PRFS, NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RAN' +
        'G, '
      'RAZR, '
      '   DT_END, OLDKDOBJ, PRDEKR, CMBOKL, SPEC_NR, NRPKT, DTVPKT, '
      'NOINDX, OLDKDOK, '
      '   NEWKDOK, IS_PERE)'
      'values'
      
        '  (:BM, :DTBM, :KDSPS, :TABN, :DT_BEG, :KDTEMU, :KDOBJ, :KDKATP,' +
        ' :NPD, '
      
        '   :PRCWRKTIME, :SO, :OKLTRF, :AVANS, :SP_AV, :KDDOLGN, :DOLGNOS' +
        'T, '
      ':KDSPZ, '
      
        '   :PR_PENS, :SOVM, :PDNLG, :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA' +
        ', '
      ':DT_PRIKAZA, '
      
        '   :NOTES, :INV, :RANG, :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMB' +
        'OKL, '
      ':SPEC_NR, '
      '   :NRPKT, :DTVPKT, :NOINDX, :OLDKDOK, :NEWKDOK, :IS_PERE)')
    DeleteSQL.Strings = (
      'delete from Z_PERE'
      'where'
      '  NR = :OLD_NR')
    Left = 248
    Top = 40
  end
  object qryUdrg: TQuery
    CachedUpdates = True
    BeforePost = qryUdrgBeforePost
    AfterPost = qryUdrgAfterPost
    AfterDelete = qryUdrgAfterDelete
    OnCalcFields = qryUdrgCalcFields
    OnNewRecord = qryUdrgNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_Uderg'
      'where TabN = :TabN')
    UpdateObject = updUdrg
    Left = 408
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
      end>
    object qryUdrgNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_UDERG.KDSPS'
    end
    object qryUdrgKDSLG: TSmallintField
      DisplayLabel = #1050#1076#1048#1057#1083#1078#1073
      FieldName = 'KDSLG'
      Origin = 'DbMain.Z_UDERG.KDSLG'
    end
    object qryUdrgNmSlg: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmSlg'
      Size = 200
      Calculated = True
    end
    object qryUdrgTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UDERG.TABN'
    end
    object qryUdrgVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_UDERG.VIDN'
      OnValidate = FldVidNValidate
      FixedChar = True
      Size = 4
    end
    object qryUdrgSUMDOLG: TFloatField
      DisplayLabel = #1054#1073#1097#1057#1084#1044#1086#1083#1075#1072
      FieldName = 'SUMDOLG'
      Origin = 'DbMain.Z_UDERG.SUMDOLG'
      DisplayFormat = '#.00'
    end
    object qryUdrgSUMVZN: TFloatField
      DisplayLabel = #1057#1084'(%)'#1059#1076#1088#1078
      FieldName = 'SUMVZN'
      Origin = 'DbMain.Z_UDERG.SUMVZN'
      DisplayFormat = '#.00'
    end
    object qryUdrgSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_UDERG.SP'
      Size = 1
    end
    object qryUdrgNOMDOK: TStringField
      DisplayLabel = #8470' '#1076#1086#1082'-'#1090#1072
      FieldName = 'NOMDOK'
      Origin = 'DbMain.Z_UDERG.NOMDOK'
      Size = 15
    end
    object qryUdrgDTDOK: TDateTimeField
      DisplayLabel = #1044#1090#1044#1086#1082
      FieldName = 'DTDOK'
      Origin = 'DbMain.Z_UDERG.DTDOK'
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_UDERG.DT_BEG'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_UDERG.DT_END'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgKDRSSCH: TIntegerField
      FieldName = 'KDRSSCH'
      Origin = 'DbMain.Z_UDERG.KDRSSCH'
    end
    object qryUdrgKOMU: TStringField
      DisplayLabel = #1050#1086#1084#1091' '#1085#1072#1087#1088#1072#1074#1083#1103#1090#1100
      DisplayWidth = 254
      FieldName = 'KOMU'
      Origin = 'DbMain.Z_UDERG.KOMU'
      Size = 254
    end
    object qryUdrgShVidN: TStringField
      DisplayLabel = #1042#1080#1076#1059#1076#1077#1088#1078
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 10
      Lookup = True
    end
    object qryUdrgKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_UDERG.KDSPZ'
    end
    object qryUdrgPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'SpZ'
      Size = 15
      Calculated = True
    end
    object qryUdrgADRES: TStringField
      DisplayWidth = 254
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_UDERG.ADRES'
      Size = 254
    end
    object qryUdrgKDPST: TIntegerField
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_UDERG.KDPST'
    end
    object qryUdrgShPst: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072
      FieldKind = fkCalculated
      FieldName = 'ShPst'
      Size = 10
      Calculated = True
    end
    object qryUdrgPOSTA: TStringField
      FieldName = 'POSTA'
      Origin = 'DbMain.Z_UDERG.POSTA'
      FixedChar = True
      Size = 1
    end
    object qryUdrgNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_UDERG.NOTES'
      Size = 150
    end
    object qryUdrgNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgRSCHET: TStringField
      FieldName = 'RSCHET'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 55
    end
    object qryUdrgOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Origin = 'DbMain.Z_UDERG.NR'
      Size = 15
    end
    object qryUdrgSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_UDERG.SPSRSCH'
    end
    object qryUdrgNmPst: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmPst'
      Size = 65
      Calculated = True
    end
    object qryUdrgS_P: TStringField
      DisplayLabel = '%'
      FieldKind = fkCalculated
      FieldName = 'S_P'
      Size = 1
      Calculated = True
    end
    object qryUdrgNRPOST: TStringField
      DisplayLabel = #1053#1088#1055#1086#1089#1090'-'#1103
      FieldName = 'NRPOST'
      Origin = 'DbMain.Z_UDERG.NRPOST'
      Size = 15
    end
    object qryUdrgDTPOST: TDateTimeField
      DisplayLabel = #1044#1090#1055#1086#1089#1090'-'#1103
      FieldName = 'DTPOST'
      Origin = 'DbMain.Z_UDERG.DTPOST'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUdrgSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_UDERG.SPEC_NR'
    end
    object qryUdrgTargetInn: TStringField
      FieldName = 'TargetInn'
      Size = 10
    end
    object qryUdrgOznDoh: TIntegerField
      FieldName = 'OznDoh'
      OnValidate = qryUdrgOznDohValidate
    end
  end
  object dsrcUdrg: TDataSource
    DataSet = qryUdrg
    Left = 416
    Top = 24
  end
  object updUdrg: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Uderg'
      'set'
      '  KDSPS = :KDSPS,'
      '  KDSLG = :KDSLG,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  SUMDOLG = :SUMDOLG,'
      '  SUMVZN = :SUMVZN,'
      '  SPSRSCH = :SPSRSCH,'
      '  SP = :SP,'
      '  NOMDOK = :NOMDOK,'
      '  DTDOK = :DTDOK,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPZ = :KDSPZ,'
      '  KDRSSCH = :KDRSSCH,'
      '  KOMU = :KOMU,'
      '  ADRES = :ADRES,'
      '  KDPST = :KDPST,'
      '  POSTA = :POSTA,'
      '  NOTES = :NOTES,'
      '  NOMSBERBANK = :NOMSBERBANK,'
      '  LICSCHET = :LICSCHET,'
      '  RSCHET = :RSCHET,'
      '  BANK = :BANK,'
      '  OKPOBANKA = :OKPOBANKA,'
      '  PROC_PSB = :PROC_PSB,'
      '  SPEC_NR = :SPEC_NR,'
      '  NRPOST = :NRPOST,'
      '  DTPOST = :DTPOST,'
      '  TargetInn = :TargetInn,'
      '  OznDoh = :OznDoh'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Uderg'
      
        '  (KDSPS, KDSLG, TABN, VIDN, SUMDOLG, SUMVZN, SPSRSCH, SP, NOMDO' +
        'K, '
      'DTDOK, '
      '   DT_BEG, DT_END, KDSPZ, KDRSSCH, KOMU, ADRES, KDPST, POSTA, '
      'NOTES, NOMSBERBANK, '
      
        '   LICSCHET, RSCHET, BANK, OKPOBANKA, PROC_PSB, SPEC_NR, NRPOST,' +
        ' '
      'DTPOST, TargetInn, OznDoh)'
      'values'
      
        '  (:KDSPS, :KDSLG, :TABN, :VIDN, :SUMDOLG, :SUMVZN, :SPSRSCH, :S' +
        'P, '
      ':NOMDOK, '
      
        '   :DTDOK, :DT_BEG, :DT_END, :KDSPZ, :KDRSSCH, :KOMU, :ADRES, :K' +
        'DPST, '
      ':POSTA, '
      '   :NOTES, :NOMSBERBANK, :LICSCHET, :RSCHET, :BANK, :OKPOBANKA, '
      ':PROC_PSB, '
      '   :SPEC_NR, :NRPOST, :DTPOST, :TargetInn, :OznDoh)')
    DeleteSQL.Strings = (
      'delete from z_Uderg'
      'where'
      '  NR = :OLD_NR')
    Left = 424
    Top = 40
  end
  object qryOtkl: TQuery
    CachedUpdates = True
    BeforePost = qryOtklBeforePost
    AfterPost = qryOtklAfterPost
    AfterDelete = qryOtklAfterDelete
    OnCalcFields = qryOtklCalcFields
    OnNewRecord = qryOtklNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from ViOtklMain'
      'where TabN = 1293 and DtProc = '#39'06/01/2017'#39
      '')
    UpdateObject = updOtkl
    Left = 472
    Top = 8
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm-yy'
    end
    object qryOtklDTSTORN: TDateTimeField
      DisplayLabel = #1052#1077#1089#1057#1090#1086#1088#1085
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      OnSetText = qryOtklZAMESGODSetText
      OnValidate = qryOtklZAMESGODValidate
      DisplayFormat = 'mm-yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOtklTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object qryOtklKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.VIOTKLMAIN.KDTEMU'
    end
    object qryOtklNMTEMU: TStringField
      DisplayLabel = #1053#1072#1079#1074#1058#1077#1084#1099
      FieldName = 'NMTEMU'
      Origin = 'DbMain.VIOTKLMAIN.NMTEMU'
      Size = 65
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
      OnValidate = qryOtklKDOBJValidate
    end
    object qryOtklKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
      OnValidate = qryOtklKDKATPValidate
    end
    object qryOtklDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      OnSetText = DateFieldSetText
      OnValidate = qryOtklDT_BEGValidate
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOtklDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      OnSetText = DateFieldSetText
      OnValidate = qryOtklDT_ENDValidate
      DisplayFormat = 'dd/mm/yy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      OnSetText = qryOtklVIDNSetText
      OnValidate = FldVidNValidate
      FixedChar = True
      Size = 4
    end
    object qryOtklShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryOtklPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object qryOtklCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
      OnGetText = PmntsHoursGetText
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      OnGetText = PmntsSumGetText
      OnValidate = qryOtklSUMMAValidate
      DisplayFormat = '#.00'
    end
    object qryOtklNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 254
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      DisplayLabel = #1057#1087#1077#1094#1053#1056
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object qryOtklShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldName = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
    end
    object qryOtklShObj: TStringField
      DisplayLabel = #1055#1076#1088
      FieldName = 'SHOBJ'
      LookupDataSet = qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
    end
    object qryOtklKDSPZ: TSmallintField
      DisplayLabel = #1050#1076#1057#1095
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object qryOtklSchBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      OnSetText = qryOtklSchBUSetText
      Size = 15
    end
    object qryOtklKDBNK: TSmallintField
      DisplayLabel = #1041#1085#1082#1050#1076
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_OTKL.KDBNK'
    end
    object qryOtklDTVDPV: TDateTimeField
      DisplayLabel = #1044#1090#1042#1077#1076
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryOtklNRVDPV: TIntegerField
      DisplayLabel = #1053#1088#1042#1077#1076
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      DisplayLabel = 'MyNotes'
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object qryOtklFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 30
      Calculated = True
    end
    object qryOtklNDbe: TStringField
      FieldKind = fkLookup
      FieldName = 'NDbe'
      LookupDataSet = qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'NDBE'
      KeyFields = 'VIDN'
      Size = 1
      Lookup = True
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object qryOtklSTORN: TStringField
      DisplayLabel = #1057#1090#1088#1085
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtklCBUDG: TStringField
      FieldName = 'CBUDG'
      Origin = 'DbMain.VIOTKLMAIN.CBUDG'
      Size = 1
    end
    object qryOtklOTKL_SOVM: TStringField
      FieldName = 'OTKL_SOVM'
    end
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 480
    Top = 24
  end
  object updOtkl: TUpdateSQL
    ModifySQL.Strings = (
      'update z_OTKL'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  DTSTORN = :DTSTORN,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  KdTemu = :KdTemu,'
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
      '  STORN = :STORN,'
      '  KDBNK = :KDBNK'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_OTKL'
      '  (KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, SUMMA, '
      ' KdTemu, KDOBJ, KDKATP, '
      
        '   DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, KTO, PRKR, SPEC' +
        '_NR, '
      'DTVDPV, '
      '   NRVDPV, MYNOTES, SPECPS, PBNK, STORN, KDBNK)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, :S' +
        'UMMA, '
      ' :KdTemu, :KDOBJ, '
      
        '   :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, :PRR, :PRPV,' +
        ' :KTO, '
      
        '   :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, :SPECPS, :PBNK, ' +
        ':STORN, '
      '   :KDBNK)')
    DeleteSQL.Strings = (
      'delete from z_OTKL'
      'where'
      '  NR = :OLD_NR')
    Left = 488
    Top = 40
  end
  object QryNuCmn: TQuery
    CachedUpdates = True
    OnCalcFields = QryNuCmnCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from ViNuMain'
      'where TabN = 1239 and  dtProc = '#39'07/01/2017'#39' ')
    UpdateObject = UpdNu
    Left = 32
    Top = 480
  end
  object UpdNu: TUpdateSQL
    ModifySQL.Strings = (
      'update z_NU'
      'set'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  PDN = :PDN,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  MYNOTES = :MYNOTES,'
      '  SPECPS = :SPECPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  DTVDPV = :DTVDPV,'
      '  NRVDPV = :NRVDPV,'
      '  KDBNK = :KDBNK,'
      '  KDTEMU = :KDTEMU'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_NU'
      '  (DTPROC, ZAMESGOD, TABN, VIDN, CHAS, SUMMA, DT_BEG, DT_END, '
      'KDSPS, KDOBJ, '
      
        '   KDKATP, KDSPZ, PDN, NOTES, PRR, PRPV, KTO, PRKR, MYNOTES, SPE' +
        'CPS, '
      'SPEC_NR, '
      '   OLDKDOBJ, OLDKDVIDN, DTVDPV, NRVDPV, KDBNK, KDTEMU)'
      'values'
      
        '  (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :CHAS, :SUMMA, :DT_BEG, :DT' +
        '_END, '
      ':KDSPS, '
      
        '   :KDOBJ, :KDKATP, :KDSPZ, :PDN, :NOTES, :PRR, :PRPV, :KTO, :PR' +
        'KR, '
      ':MYNOTES, '
      
        '   :SPECPS, :SPEC_NR, :OLDKDOBJ, :OLDKDVIDN, :DTVDPV, :NRVDPV, :' +
        'KDBNK, '
      '   :KDTEMU)')
    DeleteSQL.Strings = (
      'delete from z_NU'
      'where'
      '  NR = :OLD_NR')
    Left = 48
    Top = 504
  end
  object qrySysOpl_LU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_SysOpl')
    Left = 160
    Top = 184
  end
  object qryShPdn_LU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_ShPdn')
    Left = 232
    Top = 184
  end
  object qryKatPers_LU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KatPers')
    Left = 304
    Top = 184
  end
  object cdsPdN: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'POROG'
        DataType = ftFloat
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end
      item
        Name = 'PRC'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsPdN_DtProcPorogDesc'
        DescFields = 'DtProc;Porog'
        Fields = 'DtProc;Porog'
        Options = [ixDescending]
      end>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    Left = 16
    Top = 256
  end
  object qryEDays: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from E_Days'
      'order by E_Day, NR')
    Left = 376
    Top = 184
  end
  object cdsEDays: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsEDays_EDayDesc'
        DescFields = 'E_Day'
        Fields = 'E_Day'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 256
  end
  object cdsPF: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'POROG'
        DataType = ftFloat
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end
      item
        Name = 'PRC'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsPF_DtProcPorogDesc'
        DescFields = 'DtProc;Porog'
        Fields = 'DtProc;Porog'
        Options = [ixDescending]
      end>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    Left = 112
    Top = 256
  end
  object qryObjLU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KdObj'
      'order by KdObj')
    Left = 16
    Top = 184
  end
  object dsrcObjLU: TDataSource
    DataSet = qryObjLU
    Left = 32
    Top = 200
  end
  object qryVidN_LU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * '
      'from z_KdVidN '
      'order by VidN')
    Left = 328
    Top = 96
  end
  object qryKoefOtp: TQuery
    CachedUpdates = True
    AfterPost = qryKoefOtpAfterPost
    AfterDelete = qryKoefOtpAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KoefOtp'
      'order by MesGod')
    UpdateObject = updKoefOtp
    Left = 440
    Top = 96
    object qryKoefOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KOEFOTP.NR'
    end
    object qryKoefOtpMESGOD: TDateTimeField
      DisplayLabel = #1052#1077#1089'-'#1043#1086#1076
      FieldName = 'MESGOD'
      Origin = 'DbMain.Z_KOEFOTP.MESGOD'
      DisplayFormat = 'mm-yyyy'
      EditMask = '!15/99/0000;1;_'
    end
    object qryKoefOtpKOEFOTP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFOTP'
      Origin = 'DbMain.Z_KOEFOTP.KOEFOTP'
    end
    object qryKoefOtpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_KOEFOTP.NOTES'
      Size = 65
    end
  end
  object dsrcKoefOtp: TDataSource
    DataSet = qryKoefOtp
    Left = 456
    Top = 112
  end
  object updKoefOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KoefOtp'
      'set'
      '  MESGOD = :MESGOD,'
      '  KOEFOTP = :KOEFOTP,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KoefOtp'
      '  (MESGOD, KOEFOTP, NOTES)'
      'values'
      '  (:MESGOD, :KOEFOTP, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_KoefOtp'
      'where'
      '  NR = :OLD_NR')
    Left = 472
    Top = 128
  end
  object qryBanki: TQuery
    CachedUpdates = True
    BeforePost = qryBankiBeforePost
    AfterPost = qryBankiAfterPost
    AfterDelete = qryBankiAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Banki'
      'order by NmBnk')
    UpdateObject = updBanki
    Left = 512
    Top = 96
    object qryBankiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_BANKI.NR'
    end
    object qryBankiKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_BANKI.KDBNK'
    end
    object qryBankiSHBNK: TStringField
      FieldName = 'SHBNK'
      Origin = 'DbMain.Z_BANKI.SHBNK'
      Size = 10
    end
    object qryBankiNMBNK: TStringField
      FieldName = 'NMBNK'
      Origin = 'DbMain.Z_BANKI.NMBNK'
      Size = 35
    end
    object qryBankiNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_BANKI.NOTES'
      Size = 35
    end
  end
  object dsrcBanki: TDataSource
    DataSet = qryBanki
    Left = 528
    Top = 112
  end
  object updBanki: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Banki'
      'set'
      '  KDBNK = :KDBNK,'
      '  SHBNK = :SHBNK,'
      '  NMBNK = :NMBNK,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Banki'
      '  (KDBNK, SHBNK, NMBNK, NOTES)'
      'values'
      '  (:KDBNK, :SHBNK, :NMBNK, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_Banki'
      'where'
      '  NR = :OLD_NR')
    Left = 544
    Top = 128
  end
  object qryKatVN: TQuery
    CachedUpdates = True
    BeforePost = qryKatVNBeforePost
    AfterPost = qryKatVNAfterPost
    AfterDelete = qryKatVNAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KatVN'
      'order by KdKatVn')
    UpdateObject = updKatVN
    Left = 16
    Top = 96
    object qryKatVNNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KATVN.NR'
    end
    object qryKatVNKDKATVN: TSmallintField
      FieldName = 'KDKATVN'
      Origin = 'DbMain.Z_KATVN.KDKATVN'
    end
    object qryKatVNNMKATVN: TStringField
      FieldName = 'NMKATVN'
      Origin = 'DbMain.Z_KATVN.NMKATVN'
      Size = 25
    end
    object qryKatVNNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_KATVN.NOTES'
      Size = 250
    end
  end
  object dsrcKatVN: TDataSource
    DataSet = qryKatVN
    Left = 32
    Top = 112
  end
  object updKatVN: TUpdateSQL
    ModifySQL.Strings = (
      'update z_KatVN'
      'set'
      '  KDKATVN = :KDKATVN,'
      '  NMKATVN = :NMKATVN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_KatVN'
      '  (KDKATVN, NMKATVN, NOTES)'
      'values'
      '  (:KDKATVN, :NMKATVN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_KatVN'
      'where'
      '  NR = :OLD_NR')
    Left = 48
    Top = 128
  end
  object qryMesSps: TQuery
    OnCalcFields = qryMesSpsCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct DtProc from Z_SPS')
    Left = 384
    Top = 96
    object qryMesSpsDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object qryMesSpsRusMes: TStringField
      DisplayLabel = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
      FieldKind = fkCalculated
      FieldName = 'RusMes'
      Calculated = True
    end
  end
  object qryDolgn: TQuery
    CachedUpdates = True
    BeforePost = qryDolgnBeforePost
    AfterPost = qryDolgnAfterPost
    AfterDelete = qryDolgnAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KdDolgn'
      'order by NmDolgn')
    UpdateObject = updDolgn
    Left = 266
    Top = 256
    object qryDolgnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDDOLGN.NR'
    end
    object qryDolgnKDDOLGN: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_KDDOLGN.KDDOLGN'
    end
    object qryDolgnSHDOLGN: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHDOLGN'
      Origin = 'DbMain.Z_KDDOLGN.NMDOLGN'
      Size = 15
    end
    object qryDolgnNMDOLGN: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMDOLGN'
      Origin = 'DbMain.Z_KDDOLGN.NMDOLGN'
      Size = 40
    end
    object qryDolgnNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_KDDOLGN.NOTES'
      Size = 25
    end
  end
  object dsrcDolgn: TDataSource
    DataSet = qryDolgn
    Left = 282
    Top = 272
  end
  object updDolgn: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KdDolgn'
      'set'
      '  NR = :NR,'
      '  KDDOLGN = :KDDOLGN,'
      '  SHDOLGN = :SHDOLGN,'
      '  NMDOLGN = :NMDOLGN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KdDolgn'
      '  (NR, KDDOLGN, SHDOLGN, NMDOLGN, NOTES)'
      'values'
      '  (:NR, :KDDOLGN, :SHDOLGN, :NMDOLGN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_KdDolgn'
      'where'
      '  NR = :OLD_NR')
    Left = 299
    Top = 288
  end
  object qrySBU_LU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select KDSCH, SCHBU, NMSCH, Sch_17, PS_17'
      'from Kd_SBU')
    Left = 456
    Top = 264
  end
  object tblTmp: TTable
    Left = 504
    Top = 336
  end
  object qryTmpPere: TQuery
    DatabaseName = 'DbMain'
    Left = 376
    Top = 320
  end
  object QryPrmUv: TQuery
    CachedUpdates = True
    AfterOpen = QryPrmUvAfterOpen
    AfterPost = QryPrmUvAfterPost
    AfterDelete = QryPrmUvAfterDelete
    OnCalcFields = QryPrmUvCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_PrmUv'
      'where KdSps = 0'
      '')
    UpdateObject = updPrmUv
    Left = 176
    Top = 8
    object QryPrmUvNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRMUV.NR'
    end
    object QryPrmUvKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
    end
    object QryPrmUvTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PRMUV.TABN'
    end
    object QryPrmUvDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'DT_PRIEM'
      Origin = 'DbMain.Z_PRMUV.DT_PRIEM'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPrmUvDT_UVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085
      FieldName = 'DT_UVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_UVOLN'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPrmUvNR_PRIKAZA: TStringField
      DisplayLabel = #1053#1088#1055#1088#1055#1088#1080#1077#1084
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.NR_PRIKAZA'
      Size = 10
    end
    object QryPrmUvDT_PRIKAZA: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1055#1088#1080#1077#1084
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PRMUV.DT_PRIKAZA'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPrmUvKDPIDZV: TSmallintField
      DisplayLabel = #1050#1076#1059#1074
      FieldName = 'KDPIDZV'
      Origin = 'DbMain.Z_PRMUV.KDPIDZV'
    end
    object QryPrmUvPidZviln: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072#1059#1074#1086#1083#1100#1085'.'
      FieldKind = fkCalculated
      FieldName = 'PidZviln'
      Size = 150
      Calculated = True
    end
    object QryPrmUvNR_PRUVOLN: TStringField
      DisplayLabel = #1053#1088#1055#1088#1059#1074#1086#1083#1085
      FieldName = 'NR_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.NR_PRUVOLN'
      Size = 10
    end
    object QryPrmUvDT_PRUVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1059#1074#1086#1083#1085
      FieldName = 'DT_PRUVOLN'
      Origin = 'DbMain.Z_PRMUV.DT_PRUVOLN'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryPrmUvNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PRMUV.NOTES'
      Size = 35
    end
  end
  object dsrcPrmUv: TDataSource
    DataSet = QryPrmUv
    Left = 184
    Top = 24
  end
  object updPrmUv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PrmUv'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_PRIEM = :DT_PRIEM,'
      '  DT_UVOLN = :DT_UVOLN,'
      '  NR_PRIKAZA = :NR_PRIKAZA,'
      '  DT_PRIKAZA = :DT_PRIKAZA,'
      '  KDPIDZV = :KDPIDZV,'
      '  NR_PRUVOLN = :NR_PRUVOLN,'
      '  DT_PRUVOLN = :DT_PRUVOLN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PrmUv'
      
        '  (KDSPS, TABN, DT_PRIEM, DT_UVOLN, NR_PRIKAZA, DT_PRIKAZA, KDPI' +
        'DZV, '
      'NR_PRUVOLN, '
      '   DT_PRUVOLN, NOTES)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_PRIEM, :DT_UVOLN, :NR_PRIKAZA, :DT_PRIKAZA' +
        ', '
      ':KDPIDZV, '
      '   :NR_PRUVOLN, :DT_PRUVOLN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_PrmUv'
      'where'
      '  NR = :OLD_NR')
    Left = 192
    Top = 40
  end
  object qryTPdn: TQuery
    CachedUpdates = True
    AfterPost = qryTPdnAfterPost
    AfterDelete = qryTPdnAfterPost
    OnNewRecord = qryTPdnNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TPDN'
      'order by DtBeg, NR')
    UpdateObject = updTPdn
    Left = 8
    Top = 320
    object qryTPdnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TPDN.NR'
    end
    object qryTPdnDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TPDN.DTBEG'
      DisplayFormat = 'mm-yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qryTPdnPRCPDN: TFloatField
      DisplayLabel = '% '#1055#1085'1'
      FieldName = 'PRCPDN'
      Origin = 'DbMain.Z_TPDN.PRCPDN'
      DisplayFormat = '#.00'
    end
    object qryTPdnPRCPDN2: TFloatField
      DisplayLabel = '% '#1055#1085'2'
      FieldName = 'PRCPDN2'
      Origin = 'DbMain.Z_TPDN.PRCPDN2'
      DisplayFormat = '#.00'
    end
    object qryTPdnPRCWSB: TFloatField
      DisplayLabel = '% '#1042#1057#1073
      FieldName = 'PRCWSB'
      Origin = 'DbMain.Z_TPDN.PRCWSB'
      DisplayFormat = '#.00'
    end
    object qryTPdnMINZP: TFloatField
      DisplayLabel = #1052#1080#1085#1047#1087#1053#1043
      FieldName = 'MINZP'
      Origin = 'DbMain.Z_TPDN.MINZP'
      OnValidate = qryTPdnMINZPValidate
      DisplayFormat = '#.00'
    end
    object qryTPdnMINZP2: TFloatField
      DisplayLabel = #1052#1080#1085#1047#1087'2'
      FieldName = 'MINZP2'
      Origin = 'DbMain.Z_TPDN.MINZP2'
      DisplayFormat = '#.00'
    end
    object qryTPdnPROGMIN: TFloatField
      DisplayLabel = #1055#1088#1078#1052#1080#1085#1053#1043
      FieldName = 'PROGMIN'
      Origin = 'DbMain.Z_TPDN.PROGMIN'
      DisplayFormat = '#.00'
    end
    object qryTPdnPROGMIN2: TFloatField
      DisplayLabel = #1055#1088#1078#1052#1080#1085'2'
      FieldName = 'PROGMIN2'
      Origin = 'DbMain.Z_TPDN.PROGMIN2'
      DisplayFormat = '#.00'
    end
    object qryTPdnPOROGLG: TFloatField
      DisplayLabel = #1055#1086#1088#1086#1075#1051#1100#1075#1086#1090#1099
      FieldName = 'POROGLG'
      Origin = 'DbMain.Z_TPDN.POROGLG'
      DisplayFormat = '#.00'
    end
    object qryTPdnPROCLG: TFloatField
      DisplayLabel = '% '#1051#1100#1075#1086#1090#1099
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_TPDN.PROCLG'
      OnValidate = qryTPdnPROCLGValidate
      DisplayFormat = '#.00'
    end
    object qryTPdnSM2660: TFloatField
      DisplayLabel = #1057#1084#1055#1092#1052#1072#1093
      FieldName = 'SM2660'
      Origin = 'DbMain.Z_TPDN.SM2660'
    end
    object qryTPdnSMLG100: TFloatField
      DisplayLabel = #1057#1084#1051#1100#1075'100'
      FieldName = 'SMLG100'
      Origin = 'DbMain.Z_TPDN.SMLG100'
      DisplayFormat = '#.00'
    end
    object qryTPdnSMLG150: TFloatField
      DisplayLabel = #1057#1084#1051#1100#1075'150'
      FieldName = 'SMLG150'
      Origin = 'DbMain.Z_TPDN.SMLG150'
      DisplayFormat = '#.00'
    end
    object qryTPdnSMLG200: TFloatField
      DisplayLabel = #1057#1084#1051#1100#1075'200'
      FieldName = 'SMLG200'
      Origin = 'DbMain.Z_TPDN.SMLG200'
      DisplayFormat = '#.00'
    end
    object qryTPdnNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TPDN.NOTES'
      Size = 35
    end
  end
  object updTPdn: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TPDN'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCPDN = :PRCPDN,'
      '  PRCPDN2 = :PRCPDN2,'
      '  PRCWSB = :PRCWSB,'
      '  MINZP = :MINZP,'
      '  MINZP2 = :MINZP2,'
      '  PROGMIN = :PROGMIN,'
      '  PROGMIN2 = :PROGMIN2,'
      '  POROGLG = :POROGLG,'
      '  PROCLG = :PROCLG,'
      '  SM2660 = :SM2660,'
      '  SMLG100 = :SMLG100,'
      '  SMLG150 = :SMLG150,'
      '  SMLG200 = :SMLG200,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TPDN'
      '  (DTBEG, PRCPDN, PRCPDN2, PRCWSB, MINZP, MINZP2, PROGMIN, '
      'PROGMIN2, POROGLG, '
      '   PROCLG, SM2660, SMLG100, SMLG150, SMLG200, NOTES)'
      'values'
      
        '  (:DTBEG, :PRCPDN, :PRCPDN2, :PRCWSB, :MINZP, :MINZP2, :PROGMIN' +
        ', '
      ':PROGMIN2, '
      
        '   :POROGLG, :PROCLG, :SM2660, :SMLG100, :SMLG150, :SMLG200, :NO' +
        'TES)')
    DeleteSQL.Strings = (
      'delete from z_TPDN'
      'where'
      '  NR = :OLD_NR')
    Left = 24
    Top = 336
  end
  object qryDPere: TQuery
    CachedUpdates = True
    OnCalcFields = qryDPereCalcFields
    OnNewRecord = qryDPereNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcPere
    SQL.Strings = (
      'Select * from Z_CmbOkl'
      'where Spec_NR = :Spec_NR'
      'order by OklTrf desc')
    UpdateObject = updDPere
    Left = 289
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPEC_NR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_CMBOKL.NR'
    end
    object qryDPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_CMBOKL.KDSPS'
    end
    object qryDPereShSps: TStringField
      DisplayLabel = #1057#1087#1089#1082
      FieldKind = fkCalculated
      FieldName = 'ShSps'
      Size = 15
      Calculated = True
    end
    object qryDPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_CMBOKL.TABN'
    end
    object qryDPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_CMBOKL.SPEC_NR'
    end
    object qryDPerePRCOKL: TFloatField
      DisplayLabel = '%'#1086#1082#1083#1072#1076#1072
      FieldName = 'PRCOKL'
      Origin = 'DbMain.Z_CMBOKL.OKLTRF'
    end
    object qryDPereOKLTRF: TFloatField
      DisplayLabel = #1057#1084#1054#1082#1083#1072#1076#1072
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_CMBOKL.OKLTRF'
      DisplayFormat = '#.00'
    end
    object qryDPereKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_CMBOKL.KDOBJ'
    end
    object qryDPereShObj: TStringField
      DisplayLabel = #1064#1092#1088#1055#1076#1088
      FieldKind = fkCalculated
      FieldName = 'ShObj'
      Size = 35
      Calculated = True
    end
    object qryDPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_CMBOKL.KDSPZ'
    end
    object qryDPereSpz: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldKind = fkCalculated
      FieldName = 'Spz'
      Size = 10
      Calculated = True
    end
    object qryDPereNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_CMBOKL.NOTES'
      Size = 35
    end
  end
  object dsrcDPere: TDataSource
    DataSet = qryDPere
    Left = 297
    Top = 24
  end
  object updDPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_CmbOkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  SPEC_NR = :SPEC_NR,'
      '  PRCOKL = :PRCOKL,'
      '  OKLTRF = :OKLTRF,'
      '  KDOBJ = :KDOBJ,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_CmbOkl'
      '  (KDSPS, TABN, SPEC_NR, PRCOKL, OKLTRF, KDOBJ, KDSPZ, NOTES)'
      'values'
      
        '  (:KDSPS, :TABN, :SPEC_NR, :PRCOKL, :OKLTRF, :KDOBJ, :KDSPZ, :N' +
        'OTES)')
    DeleteSQL.Strings = (
      'delete from Z_CmbOkl'
      'where'
      '  NR = :OLD_NR')
    Left = 305
    Top = 40
  end
  object qryLog: TQuery
    Left = 488
    Top = 184
  end
  object cdsBankiLsLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsEDays_EDayDesc'
        DescFields = 'E_Day'
        Fields = 'E_Day'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 256
  end
  object cdsSovm: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsEDays_EDayDesc'
        DescFields = 'E_Day'
        Fields = 'E_Day'
        Options = [ixDescending]
      end>
    Params = <>
    StoreDefs = True
    Left = 208
    Top = 256
    object cdsSovmNR: TIntegerField
      FieldName = 'NR'
    end
    object cdsSovmKDSOVM: TSmallintField
      FieldName = 'KDSOVM'
    end
    object cdsSovmSHSOVM: TStringField
      FieldName = 'SHSOVM'
      Size = 15
    end
    object cdsSovmNMSOVM: TStringField
      FieldName = 'NMSOVM'
      Size = 35
    end
    object cdsSovmNOTES: TStringField
      FieldName = 'NOTES'
      Size = 65
    end
  end
  object dsrcSovm: TDataSource
    DataSet = cdsSovm
    Left = 216
    Top = 272
  end
  object qryPst: TQuery
    CachedUpdates = True
    BeforePost = qryPstBeforePost
    AfterPost = qryPstAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Pst')
    UpdateObject = updPst
    Left = 92
    Top = 98
    object qryPstNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PST.NR'
    end
    object qryPstKDPST: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_PST.KDPST'
    end
    object qryPstSHPST: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHPST'
      Origin = 'DbMain.Z_PST.SHPST'
      FixedChar = True
      Size = 10
    end
    object qryPstNMPST: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMPST'
      Origin = 'DbMain.Z_PST.NMPST'
      FixedChar = True
      Size = 65
    end
    object qryPstIS_PST: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072
      FieldName = 'IS_PST'
      Origin = 'DbMain.Z_PST.IS_PST'
      FixedChar = True
      Size = 1
    end
    object qryPstNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PST.NOTES'
      Size = 95
    end
  end
  object dsrcPst: TDataSource
    DataSet = qryPst
    Left = 108
    Top = 114
  end
  object updPst: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Pst'
      'set'
      '  KDPST = :KDPST,'
      '  SHPST = :SHPST,'
      '  NMPST = :NMPST,'
      '  IS_PST = :IS_PST,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Pst'
      '  (KDPST, SHPST, NMPST, IS_PST, NOTES)'
      'values'
      '  (:KDPST, :SHPST, :NMPST, :IS_PST, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_Pst'
      'where'
      '  NR = :OLD_NR')
    Left = 124
    Top = 130
  end
  object qryPsb: TQuery
    CachedUpdates = True
    AfterPost = qryPsbAfterPost
    DatabaseName = 'DbMain'
    DataSource = dsrcPst
    SQL.Strings = (
      'Select * from z_Pst_Psb'
      'where KdPst = :KdPst'
      'order by DtBeg')
    UpdateObject = updPsb
    Left = 160
    Top = 96
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDPST'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryPsbNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PST_PSB.NR'
    end
    object qryPsbKDPST: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_PST_PSB.KDPST'
    end
    object qryPsbDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_PST_PSB.DTBEG'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPsbPRCPSB: TFloatField
      DisplayLabel = '% '#1089#1073#1086#1088#1072
      FieldName = 'PRCPSB'
      Origin = 'DbMain.Z_PST_PSB.PRCPSB'
    end
    object qryPsbSHKALA: TSmallintField
      DisplayLabel = #1055#1086#1064#1082#1072#1083#1077
      FieldName = 'SHKALA'
      Origin = 'DbMain.Z_PST_PSB.SHKALA'
    end
    object qryPsbNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PST_PSB.NOTES'
      Size = 95
    end
  end
  object dsrcPsb: TDataSource
    DataSet = qryPsb
    Left = 176
    Top = 112
  end
  object updPsb: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Pst_Psb'
      'set'
      '  KDPST = :KDPST,'
      '  DTBEG = :DTBEG,'
      '  PRCPSB = :PRCPSB,'
      '  SHKALA = :SHKALA,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Pst_Psb'
      '  (KDPST, DTBEG, PRCPSB, SHKALA, NOTES)'
      'values'
      '  (:KDPST, :DTBEG, :PRCPSB, :SHKALA, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_Pst_Psb'
      'where'
      '  NR = :OLD_NR')
    Left = 192
    Top = 128
  end
  object qryPstShk: TQuery
    CachedUpdates = True
    AfterPost = qryPstShkAfterPost
    DatabaseName = 'DbMain'
    DataSource = dsrcPsb
    SQL.Strings = (
      'Select * from Z_PST_SHK where KdPst = :KdPst and DtBeg = :DtBeg '
      '   order by SmFrom')
    UpdateObject = updPstShk
    Left = 232
    Top = 96
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDPST'
        ParamType = ptUnknown
        Size = 2
      end
      item
        DataType = ftDateTime
        Name = 'DTBEG'
        ParamType = ptUnknown
        Size = 8
      end>
    object qryPstShkNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PST_SHK.NR'
    end
    object qryPstShkKDPST: TSmallintField
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_PST_SHK.KDPST'
    end
    object qryPstShkDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_PST_SHK.DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPstShkSMFROM: TFloatField
      DisplayLabel = #1057#1091#1084#1054#1090
      FieldName = 'SMFROM'
      Origin = 'DbMain.Z_PST_SHK.SMFROM'
      DisplayFormat = '#.00'
    end
    object qryPstShkSMTOINC: TFloatField
      DisplayLabel = #1057#1091#1084#1044#1086#1042#1082#1083
      FieldName = 'SMTOINC'
      Origin = 'DbMain.Z_PST_SHK.SMTOINC'
      DisplayFormat = '#.00'
    end
    object qryPstShkSMCONST: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1057#1084
      FieldName = 'SMCONST'
      Origin = 'DbMain.Z_PST_SHK.SMCONST'
      DisplayFormat = '#.00'
    end
    object qryPstShkPRC: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'PRC'
      Origin = 'DbMain.Z_PST_SHK.PRC'
      DisplayFormat = '#.00'
    end
    object qryPstShkONSMBOLEE: TFloatField
      DisplayLabel = #1053#1072#1057#1091#1084#1041#1086#1083#1077#1077
      FieldName = 'ONSMBOLEE'
      Origin = 'DbMain.Z_PST_SHK.ONSMBOLEE'
      DisplayFormat = '#.00'
    end
    object qryPstShkNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PST_SHK.NOTES'
      Size = 35
    end
  end
  object dsrcPstShk: TDataSource
    DataSet = qryPstShk
    Left = 248
    Top = 112
  end
  object updPstShk: TUpdateSQL
    ModifySQL.Strings = (
      'update z_pst_shk'
      'set'
      '  KDPST = :KDPST,'
      '  DTBEG = :DTBEG,'
      '  SMFROM = :SMFROM,'
      '  SMTOINC = :SMTOINC,'
      '  SMCONST = :SMCONST,'
      '  PRC = :PRC,'
      '  ONSMBOLEE = :ONSMBOLEE,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_pst_shk'
      
        '  (KDPST, DTBEG, SMFROM, SMTOINC, SMCONST, PRC, ONSMBOLEE, NOTES' +
        ')'
      'values'
      
        '  (:KDPST, :DTBEG, :SMFROM, :SMTOINC, :SMCONST, :PRC, :ONSMBOLEE' +
        ', :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_pst_shk'
      'where'
      '  NR = :OLD_NR')
    Left = 264
    Top = 128
  end
  object cdsShkPps: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'DTPROC'
        DataType = ftDateTime
      end
      item
        Name = 'POROG'
        DataType = ftFloat
      end
      item
        Name = 'SMM'
        DataType = ftFloat
      end
      item
        Name = 'PRC'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'cdsShkPPS_DtProcPorogDesc'
        DescFields = 'DtProc;Porog'
        Fields = 'DtProc;Porog'
        Options = [ixDescending]
      end>
    Params = <>
    ProviderName = 'dspTmp'
    StoreDefs = True
    Left = 64
    Top = 256
  end
  object cdsSBU: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftInteger
      end
      item
        Name = 'KDSCH'
        DataType = ftSmallint
      end
      item
        Name = 'SCHBU'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NMSCH'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'AINDX'
        DataType = ftSmallint
      end
      item
        Name = 'PINDX'
        DataType = ftSmallint
      end
      item
        Name = 'LVL'
        DataType = ftSmallint
      end
      item
        Name = 'INDX'
        DataType = ftSmallint
      end
      item
        Name = 'HSCH'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KDPSCH'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'cdsSbuKdSch'
        Fields = 'KdSch'
      end
      item
        Name = 'cdsSbuSchBU'
        Fields = 'Sch_17'
      end>
    IndexName = 'cdsSbuKdSch'
    Params = <>
    ProviderName = 'dspCDS'
    StoreDefs = True
    BeforeOpen = cdsSBUBeforeOpen
    AfterOpen = cdsSBUAfterOpen
    Left = 344
    Top = 256
  end
  object qryTPrp: TQuery
    CachedUpdates = True
    BeforeInsert = qryTPrpBeforeInsert
    BeforePost = qryTPrpBeforePost
    AfterPost = qryTPrpAfterPost
    AfterDelete = qryTPrpAfterPost
    OnNewRecord = qryTPrpNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TblPrp'
      'order by DtBeg, NR'
      '')
    UpdateObject = updTPrp
    Left = 176
    Top = 336
    object qryTPrpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLPRP.NR'
    end
    object qryTPrpDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TBLPRP.DTBEG'
      OnSetText = DateFieldSetText
      DisplayFormat = 'mm/yyyy'
      EditMask = '!91/99/0000;1;_'
    end
    object qryTPrpPRCPFCMN: TFloatField
      DisplayLabel = #1042' '#1055#1060' '#1086#1073#1097'.'
      FieldName = 'PRCPFCMN'
      Origin = 'DbMain.Z_TBLPRP.PRCPFCMN'
    end
    object qryTPrpPRCPFINV: TFloatField
      DisplayLabel = #1042' '#1055#1060' '#1089' '#1080#1085#1074'.'
      FieldName = 'PRCPFINV'
      Origin = 'DbMain.Z_TBLPRP.PRCPFINV'
    end
    object qryTPrpPRCSS1BLN: TFloatField
      DisplayLabel = #1042' '#1060#1057#1057' '#1058#1042#1055
      FieldName = 'PRCSS1BLN'
      Origin = 'DbMain.Z_TBLPRP.PRCSS1BLN'
    end
    object qryTPrpPRCSS2NSL: TFloatField
      DisplayLabel = #1042' '#1060#1057#1057' '#1053#1042
      FieldName = 'PRCSS2NSL'
      Origin = 'DbMain.Z_TBLPRP.PRCSS2NSL'
    end
    object qryTPrpPRCFZ: TFloatField
      DisplayLabel = #1042' '#1060#1047
      FieldName = 'PRCFZ'
      Origin = 'DbMain.Z_TBLPRP.PRCFZ'
    end
    object qryTPrpPRCFZ1006: TFloatField
      DisplayLabel = #1042' '#1060#1079'1006'
      FieldName = 'PRCFZ1006'
      Origin = 'DbMain.Z_TBLPRP.PRCFZ1006'
    end
    object qryTPrpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TBLPRP.NOTES'
      Size = 35
    end
  end
  object updTPrp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TblPrp'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCPFCMN = :PRCPFCMN,'
      '  PRCPFINV = :PRCPFINV,'
      '  PRCSS1BLN = :PRCSS1BLN,'
      '  PRCSS2NSL = :PRCSS2NSL,'
      '  PRCFZ = :PRCFZ,'
      '  PRCFZ1006 = :PRCFZ1006,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TblPrp'
      
        '  (DTBEG, PRCPFCMN, PRCPFINV, PRCSS1BLN, PRCSS2NSL, PRCFZ, PRCFZ' +
        '1006, NOTES)'
      'values'
      
        '  (:DTBEG, :PRCPFCMN, :PRCPFINV, :PRCSS1BLN, :PRCSS2NSL, :PRCFZ,' +
        ' :PRCFZ1006, '
      '   :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_TblPrp'
      'where'
      '  NR = :OLD_NR')
    Left = 192
    Top = 352
  end
  object qryNewTabN: TQuery
    Left = 776
    Top = 8
  end
  object qryUpiLS: TQuery
    Left = 16
    Top = 8
  end
  object qryAllowSps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from zz_UsrlKdSps')
    Left = 616
    Top = 288
  end
  object qryUpi: TQuery
    CachedUpdates = True
    BeforePost = qryUpiBeforePost
    AfterPost = qryUpiAfterPost
    AfterDelete = qryUpiAfterPost
    OnCalcFields = qryUpiCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Upi')
    UpdateObject = updUpi
    Left = 64
    Top = 8
    object qryUpiNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UPI.NR'
    end
    object qryUpiTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UPI.TABN'
    end
    object qryUpiID: TStringField
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074'.'#1048#1044
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
    object qryUpiFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
      Size = 32
    end
    object qryUpiIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Origin = 'DbMain.Z_UPI.IMA'
      Size = 15
    end
    object qryUpiOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
      Origin = 'DbMain.Z_UPI.OTCH'
    end
    object qryUpiDOB: TDateTimeField
      DisplayLabel = #1044#1090#1056#1086#1078#1076'.'
      FieldName = 'DOB'
      Origin = 'DbMain.Z_UPI.DOB'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryUpiPOL: TStringField
      DisplayLabel = #1055#1086#1083
      FieldName = 'POL'
      Origin = 'DbMain.Z_UPI.POL'
      Size = 1
    end
    object qryUpiPRUV: TSmallintField
      FieldName = 'PRUV'
      Origin = 'DbMain.Z_UPI.PRUV'
    end
    object qryUpiOBJFROM: TSmallintField
      FieldName = 'OBJFROM'
      Origin = 'DbMain.Z_UPI.OBJFROM'
    end
    object qryUpiOLDTABN: TIntegerField
      FieldName = 'OLDTABN'
      Origin = 'DbMain.Z_UPI.OLDTABN'
    end
    object qryUpiLASTDTPRM: TDateTimeField
      FieldName = 'LASTDTPRM'
      Origin = 'DbMain.Z_UPI.LASTDTPRM'
    end
    object qryUpiLASTDTUVL: TDateTimeField
      FieldName = 'LASTDTUVL'
      Origin = 'DbMain.Z_UPI.LASTDTUVL'
    end
    object qryUpiMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_UPI.MYNOTES'
      FixedChar = True
      Size = 25
    end
    object qryUpiPRARC: TSmallintField
      FieldName = 'PRARC'
      Origin = 'DbMain.Z_UPI.PRARC'
    end
    object qryUpiFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryUpiDtBegLS: TDateField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldKind = fkCalculated
      FieldName = 'DtBegLS'
      Calculated = True
    end
    object qryUpiShBnk: TStringField
      DisplayLabel = #1064#1092#1088#1041#1085#1082
      FieldKind = fkCalculated
      FieldName = 'ShBnk'
      Size = 15
      Calculated = True
    end
    object qryUpiLicSch: TStringField
      DisplayLabel = #1051#1080#1094#1057#1095#1077#1090
      FieldKind = fkCalculated
      FieldName = 'LicSch'
      Size = 25
      Calculated = True
    end
    object qryUpiUKRCITIZ: TStringField
      DisplayLabel = #1043#1088#1072#1078#1076'.'#1059#1082#1088#1072#1080#1085#1099
      FieldName = 'UKRCITIZ'
      Required = True
      Size = 1
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 80
    Top = 16
  end
  object updUpi: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Upi'
      'set'
      '  TABN = :TABN,'
      '  ID = :ID,'
      '  FAM = :FAM,'
      '  IMA = :IMA,'
      '  OTCH = :OTCH,'
      '  DOB = :DOB,'
      '  POL = :POL,'
      '  PRUV = :PRUV,'
      '  OBJFROM = :OBJFROM,'
      '  OLDTABN = :OLDTABN,'
      '  LASTDTPRM = :LASTDTPRM,'
      '  LASTDTUVL = :LASTDTUVL,'
      '  MYNOTES = :MYNOTES,'
      '  PRARC = :PRARC,'
      '  UKRCITIZ = :UKRCITIZ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Upi'
      
        '  (NR, TABN, ID, FAM, IMA, OTCH, DOB, POL, PRUV, OBJFROM, OLDTAB' +
        'N, '
      'LASTDTPRM, '
      '   LASTDTUVL, MYNOTES, PRARC, UKRCITIZ)'
      'values'
      
        '  (:NR, :TABN, :ID, :FAM, :IMA, :OTCH, :DOB, :POL, :PRUV, :OBJFR' +
        'OM, :OLDTABN, '
      '   :LASTDTPRM, :LASTDTUVL, :MYNOTES, :PRARC, :UKRCITIZ)')
    DeleteSQL.Strings = (
      'delete from z_Upi'
      'where'
      '  NR = :OLD_NR')
    Left = 96
    Top = 24
  end
  object qryTmp2: TQuery
    Left = 552
    Top = 336
  end
  object qryTSs: TQuery
    CachedUpdates = True
    BeforeInsert = qryTSsBeforeInsert
    BeforePost = qryTSsBeforePost
    OnNewRecord = qryTSsNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TblSs'
      'order by DtBeg, NR'
      '')
    UpdateObject = updTSs
    Left = 232
    Top = 336
    object qryTSsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLSS.NR'
    end
    object qryTSsDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TBLSS.DTBEG'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryTSsPRCDOMIN: TFloatField
      DisplayLabel = '%'#1076#1086#1055#1088#1078#1052#1080#1085'2'
      FieldName = 'PRCDOMIN'
      Origin = 'DbMain.Z_TBLSS.PRCDOMIN'
    end
    object qryTSsPRCDOMAX: TFloatField
      DisplayLabel = '%'#1076#1086#1057#1084#1055#1092#1052#1072#1093
      FieldName = 'PRCDOMAX'
      Origin = 'DbMain.Z_TBLSS.PRCDOMAX'
    end
    object qryTSsNOTES: TStringField
      DisplayLabel = #1055#1088#1085#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TBLSS.NOTES'
      Size = 25
    end
  end
  object updTSs: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TblSs'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCDOMIN = :PRCDOMIN,'
      '  PRCDOMAX = :PRCDOMAX,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TblSs'
      '  (DTBEG, PRCDOMIN, PRCDOMAX, NOTES)'
      'values'
      '  (:DTBEG, :PRCDOMIN, :PRCDOMAX, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_TblSs'
      'where'
      '  NR = :OLD_NR')
    Left = 248
    Top = 352
  end
  object qryTFz: TQuery
    CachedUpdates = True
    BeforeInsert = qryTFzBeforeInsert
    BeforePost = qryTFzBeforePost
    OnNewRecord = qryTFzNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TblFz'
      'order by DtBeg, NR'
      '')
    UpdateObject = updTFz
    Left = 288
    Top = 336
    object qryTFzNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TBLFZ.NR'
    end
    object qryTFzDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TBLFZ.DTBEG'
      OnSetText = DateFieldSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryTFzPRCDOMIN: TFloatField
      FieldName = 'PRCDOMIN'
      Origin = 'DbMain.Z_TBLFZ.PRCDOMIN'
    end
    object qryTFzPRCDOMAX: TFloatField
      DisplayLabel = '%'#1076#1086#1057#1084#1055#1092#1052#1072#1093
      FieldName = 'PRCDOMAX'
      Origin = 'DbMain.Z_TBLFZ.PRCDOMAX'
    end
    object qryTFzNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TBLFZ.NOTES'
      Size = 25
    end
  end
  object updTFz: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TblFz'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCDOMIN = :PRCDOMIN,'
      '  PRCDOMAX = :PRCDOMAX,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TblFz'
      '  (DTBEG, PRCDOMIN, PRCDOMAX, NOTES)'
      'values'
      '  (:DTBEG, :PRCDOMIN, :PRCDOMAX, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_TblFz'
      'where'
      '  NR = :OLD_NR')
    Left = 304
    Top = 352
  end
  object qryBLS: TQuery
    Left = 536
    Top = 184
  end
  object qryEsv: TQuery
    CachedUpdates = True
    AfterPost = qryEsvAfterPost
    AfterDelete = qryEsvAfterDelete
    OnNewRecord = qryEsvNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TESV'
      'order by DtBeg, NR')
    UpdateObject = updEsv
    Left = 64
    Top = 320
    object qryEsvNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TESV.NR'
    end
    object qryEsvDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TESV.DTBEG'
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryEsvPRCCMN: TFloatField
      DisplayLabel = '%'#1054#1073#1097
      FieldName = 'PRCCMN'
      Origin = 'DbMain.Z_TESV.PRCCMN'
    end
    object qryEsvSMCMN: TFloatField
      DisplayLabel = #1057#1084#1054#1073#1097
      FieldName = 'SMCMN'
      Origin = 'DbMain.Z_TESV.SMCMN'
      DisplayFormat = '#.00'
    end
    object qryEsvPRCPPS: TFloatField
      DisplayLabel = '%'#1055#1055#1057
      FieldName = 'PRCPPS'
      Origin = 'DbMain.Z_TESV.PRCPPS'
    end
    object qryEsvSMPPS: TFloatField
      DisplayLabel = #1057#1084#1055#1055#1057
      FieldName = 'SMPPS'
      Origin = 'DbMain.Z_TESV.SMPPS'
      DisplayFormat = '#.00'
    end
    object qryEsvPRCBLN: TFloatField
      DisplayLabel = '%'#1041#1083#1085
      FieldName = 'PRCBLN'
      Origin = 'DbMain.Z_TESV.PRCBLN'
    end
    object qryEsvPRCBLNINV: TFloatField
      DisplayLabel = '%'#1041#1083#1085#1048#1085#1074
      FieldName = 'PRCBLNINV'
      Origin = 'DbMain.Z_TESV.PRCBLNINV'
    end
    object qryEsvSMBLN: TFloatField
      DisplayLabel = #1057#1084#1041#1083#1085
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_TESV.SMBLN'
      DisplayFormat = '#.00'
    end
    object qryEsvSMBLNINV: TFloatField
      DisplayLabel = #1057#1084#1041#1083#1085#1048#1085#1074
      FieldName = 'SMBLNINV'
      Origin = 'DbMain.Z_TESV.SMBLNINV'
      DisplayFormat = '#.00'
    end
    object qryEsvPRCDEKR: TFloatField
      DisplayLabel = '% '#1076#1077#1082#1088'.'
      FieldName = 'PRCDEKR'
      Origin = 'DbMain.Z_TESV.PRCDEKR'
    end
    object qryEsvSMDEKR: TFloatField
      DisplayLabel = #1057#1084#1044#1077#1082#1088
      FieldName = 'SMDEKR'
      Origin = 'DbMain.Z_TESV.SMDEKR'
      DisplayFormat = '#.00'
    end
    object qryEsvPRCDEKRINV: TFloatField
      DisplayLabel = '% '#1076#1077#1082#1088#1048#1085#1074
      FieldName = 'PRCDEKRINV'
      Origin = 'DbMain.Z_TESV.PRCDEKRINV'
    end
    object qryEsvSMDEKRINV: TFloatField
      DisplayLabel = #1057#1084#1044#1077#1082#1088#1048#1085#1074
      FieldName = 'SMDEKRINV'
      Origin = 'DbMain.Z_TESV.PRCDEKRINV'
      DisplayFormat = '#.00'
    end
    object qryEsvPRCGPD: TFloatField
      DisplayLabel = '%'#1043#1055#1044
      FieldName = 'PRCGPD'
      Origin = 'DbMain.Z_TESV.PRCGPD'
    end
    object qryEsvSMGPD: TFloatField
      DisplayLabel = #1057#1084#1043#1055#1044
      FieldName = 'SMGPD'
      Origin = 'DbMain.Z_TESV.SMGPD'
      DisplayFormat = '#.00'
    end
    object qryEsvNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TESV.NOTES'
      Size = 35
    end
  end
  object dsrcEsv: TDataSource
    DataSet = qryEsv
    Left = 72
    Top = 328
  end
  object updEsv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TESV'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCCMN = :PRCCMN,'
      '  SMCMN = :SMCMN,'
      '  PRCPPS = :PRCPPS,'
      '  PRCBLNINV = :PRCBLNINV,'
      '  SMPPS = :SMPPS,'
      '  SMBLNINV = :SMBLNINV,'
      '  PRCBLN = :PRCBLN,'
      '  SMBLN = :SMBLN,'
      '  PRCDEKR = :PRCDEKR,'
      '  SMDEKR = :SMDEKR,'
      '  PRCDEKRINV = :PRCDEKRINV,'
      '  SMDEKRINV = :SMDEKRINV,'
      '  PRCGPD = :PRCGPD,'
      '  SMGPD = :SMGPD,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TESV'
      
        '  (DTBEG, PRCCMN, SMCMN, PRCPPS, PRCBLNINV, SMPPS, SMBLNINV, PRC' +
        'BLN, SMBLN, '
      '   PRCDEKR, SMDEKR, PRCDEKRINV, SMDEKRINV, PRCGPD, SMGPD, NOTES)'
      'values'
      
        '  (:DTBEG, :PRCCMN, :SMCMN, :PRCPPS, :PRCBLNINV, :SMPPS, :SMBLNI' +
        'NV, :PRCBLN, '
      
        '   :SMBLN, :PRCDEKR, :SMDEKR, :PRCDEKRINV, :SMDEKRINV, :PRCGPD, ' +
        ':SMGPD, '
      '   :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_TESV'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 336
  end
  object qryEsvP: TQuery
    CachedUpdates = True
    AfterPost = qryEsvPAfterPost
    AfterDelete = qryEsvPAfterDelete
    OnNewRecord = qryEsvPNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_TEsvP'
      'order by DtBeg, NR')
    UpdateObject = updEsvP
    Left = 104
    Top = 320
    object qryEsvPNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TESVP.NR'
    end
    object qryEsvPDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_TESVP.DTBEG'
      DisplayFormat = 'mm/yyyy'
    end
    object qryEsvPPRCCMN: TFloatField
      DisplayLabel = '%'#1054#1073#1097
      FieldName = 'PRCCMN'
      Origin = 'DbMain.Z_TESVP.PRCCMN'
    end
    object qryEsvPSMCMN: TFloatField
      DisplayLabel = #1057#1084#1054#1073#1097
      FieldName = 'SMCMN'
      Origin = 'DbMain.Z_TESVP.SMCMN'
      DisplayFormat = '#.00'
    end
    object qryEsvPPRCBLN: TFloatField
      DisplayLabel = '%'#1041#1083#1085
      FieldName = 'PRCBLN'
      Origin = 'DbMain.Z_TESVP.PRCBLN'
    end
    object qryEsvPPRCBLNINV: TFloatField
      DisplayLabel = '%'#1041#1083#1085#1048#1085#1074
      FieldName = 'PRCBLNINV'
      Origin = 'DbMain.Z_TESVP.PRCBLNINV'
    end
    object qryEsvPSMBLN: TFloatField
      DisplayLabel = #1057#1084#1041#1083#1085
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_TESVP.SMBLN'
      DisplayFormat = '#.00'
    end
    object qryEsvPSMBLNINV: TFloatField
      DisplayLabel = #1057#1084#1041#1083#1085#1048#1085#1074
      FieldName = 'SMBLNINV'
      Origin = 'DbMain.Z_TESVP.SMBLNINV'
      DisplayFormat = '#.00'
    end
    object qryEsvPPRCDEKR: TFloatField
      DisplayLabel = '% '#1076#1077#1082#1088'.'
      FieldName = 'PRCDEKR'
      Origin = 'DbMain.Z_TESVP.PRCDEKR'
    end
    object qryEsvPSMDEKR: TFloatField
      DisplayLabel = #1057#1084#1044#1077#1082#1088'.'
      FieldName = 'SMDEKR'
      Origin = 'DbMain.Z_TESVP.SMDEKR'
      DisplayFormat = '#.00'
    end
    object qryEsvPPRCDEKRINV: TFloatField
      DisplayLabel = '%'#1076#1077#1082#1088#1048#1085#1074
      FieldName = 'PRCDEKRINV'
      Origin = 'DbMain.Z_TESVP.PRCDEKRINV'
    end
    object qryEsvPSMDEKRINV: TFloatField
      DisplayLabel = #1057#1084#1044#1077#1082#1088#1048#1085#1074
      FieldName = 'SMDEKRINV'
      Origin = 'DbMain.Z_TESVP.SMDEKRINV'
      DisplayFormat = '#.00'
    end
    object qryEsvPPRCGPD: TFloatField
      DisplayLabel = '%'#1043#1055#1044
      FieldName = 'PRCGPD'
      Origin = 'DbMain.Z_TESVP.PRCGPD'
    end
    object qryEsvPSMGPD: TFloatField
      DisplayLabel = #1057#1084#1043#1055#1044
      FieldName = 'SMGPD'
      Origin = 'DbMain.Z_TESVP.SMGPD'
      DisplayFormat = '#.00'
    end
    object qryEsvPPRCINV: TFloatField
      DisplayLabel = '%'#1048#1085#1074
      FieldName = 'PRCINV'
      Origin = 'DbMain.Z_TESVP.PRCGPD'
    end
    object qryEsvPSMINV: TFloatField
      DisplayLabel = #1057#1084#1048#1085#1074
      FieldName = 'SMINV'
      Origin = 'DbMain.Z_TESVP.SMGPD'
      DisplayFormat = '#.00'
    end
    object qryEsvPNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TESVP.NOTES'
      Size = 35
    end
  end
  object dsrcEsvP: TDataSource
    DataSet = qryEsvP
    Left = 120
    Top = 328
  end
  object updEsvP: TUpdateSQL
    ModifySQL.Strings = (
      'update z_TEsvP'
      'set'
      '  DTBEG = :DTBEG,'
      '  PRCCMN = :PRCCMN,'
      '  SMCMN = :SMCMN,'
      '  PRCBLN = :PRCBLN,'
      '  PRCBLNINV = :PRCBLNINV,'
      '  SMBLN = :SMBLN,'
      '  SMBLNINV = :SMBLNINV,'
      '  PRCDEKR = :PRCDEKR,'
      '  SMDEKR = :SMDEKR,'
      '  PRCDEKRINV = :PRCDEKRINV,'
      '  SMDEKRINV = :SMDEKRINV,'
      '  PRCGPD = :PRCGPD,'
      '  SMGPD = :SMGPD,'
      '  PRCINV = :PRCINV,'
      '  SMINV = :SMINV,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_TEsvP'
      
        '  (DTBEG, PRCCMN, SMCMN, PRCBLN, PRCBLNINV, SMBLN, SMBLNINV, PRC' +
        'DEKR, SMDEKR, '
      '   PRCDEKRINV, SMDEKRINV, PRCGPD, SMGPD, PRCINV, SMINV, NOTES)'
      'values'
      
        '  (:DTBEG, :PRCCMN, :SMCMN, :PRCBLN, :PRCBLNINV, :SMBLN, :SMBLNI' +
        'NV, :PRCDEKR, '
      
        '   :SMDEKR, :PRCDEKRINV, :SMDEKRINV, :PRCGPD, :SMGPD, :PRCINV, :' +
        'SMINV, '
      '   :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_TEsvP'
      'where'
      '  NR = :OLD_NR')
    Left = 128
    Top = 336
  end
  object qrySpecBLS: TQuery
    Left = 592
    Top = 184
  end
  object qryTmp3: TQuery
    Left = 600
    Top = 336
  end
  object qryCalcF: TQuery
    DatabaseName = 'C_T_E_M_P'
    SQL.Strings = (
      'select * from copy856')
    Left = 544
    Top = 256
  end
  object timerPG: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = timerPGTimer
    Left = 728
    Top = 8
  end
  object DbOKTest: TDatabase
    AliasName = 'Postgres UPO'
    DatabaseName = 'EsDbOK'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=buch'
      'PASSWORD=buch2008')
    SessionName = 'Default'
    Left = 728
    Top = 64
  end
  object qryIspSlg: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_IspSlg order by KdSlg')
    Left = 616
    Top = 96
    object qryIspSlgNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_ISPSLG.NR'
    end
    object qryIspSlgKDSLG: TSmallintField
      FieldName = 'KDSLG'
      Origin = 'DbMain.Z_ISPSLG.KDSLG'
    end
    object qryIspSlgNMSLG: TStringField
      FieldName = 'NMSLG'
      Origin = 'DbMain.Z_ISPSLG.NMSLG'
      Size = 200
    end
    object qryIspSlgNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_ISPSLG.NOTES'
      Size = 200
    end
    object qryIspSlgADRES: TStringField
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_ISPSLG.ADRES'
      Size = 200
    end
  end
  object qryAmz: TQuery
    Left = 704
    Top = 184
  end
  object tblCreSpsState: TTable
    DatabaseName = 'DbMain'
    TableName = 'Z_CRESPSSTATE'
    Left = 688
    Top = 360
  end
  object QryPeek: TQuery
    Left = 768
    Top = 368
  end
  object CdsPmnts: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PmntsProvider'
    OnCalcFields = CdsPmntsCalcFields
    Left = 168
    Top = 480
    object CdsPmntsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_NU.NR'
    end
    object CdsPmntsKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_NU.KDSPS'
    end
    object CdsPmntsDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_NU.DTPROC'
      DisplayFormat = 'mm-yy'
    end
    object CdsPmntsZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_NU.ZAMESGOD'
      DisplayFormat = 'mm-yy'
      EditMask = '!01/00/0000;1;_'
    end
    object CdsPmntsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_NU.TABN'
    end
    object CdsPmntsDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_NU.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object CdsPmntsDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_NU.DT_END'
      OnGetText = PmntsDtEndGetText
      DisplayFormat = 'dd/mm/yy'
    end
    object CdsPmntsVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_NU.VIDN'
      FixedChar = True
      Size = 4
    end
    object CdsPmntsOldVidN: TSmallintField
      DisplayLabel = #1057#1090#1088#1042#1080#1076#1053
      FieldKind = fkLookup
      FieldName = 'OldVidN'
      LookupDataSet = qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'OLDKDVIDN'
      KeyFields = 'VIDN'
      Lookup = True
    end
    object CdsPmntsShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 15
      Lookup = True
    end
    object CdsPmntsGRP: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'GRP'
      Origin = 'DbMain.VINUMAIN.GRP'
    end
    object CdsPmntsPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
      Origin = 'DbMain.Z_NU.PDN'
    end
    object CdsPmntsCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_NU.CHAS'
      OnGetText = PmntsHoursGetText
    end
    object CdsPmntsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_NU.SUMMA'
      OnGetText = PmntsSumGetText
      DisplayFormat = '# ##0.00'
    end
    object CdsPmntsSmN: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmN'
      OnGetText = PmntsSumGetText
      DisplayFormat = '# ##0.00'
      Calculated = True
    end
    object CdsPmntsSmU: TFloatField
      DisplayLabel = #1059#1076#1077#1088#1078#1072#1085#1086
      FieldKind = fkCalculated
      FieldName = 'SmU'
      OnGetText = PmntsSumGetText
      DisplayFormat = '# ##0.00'
      Calculated = True
    end
    object CdsPmntsKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1055#1077#1088#1089
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_NU.KDKATP'
    end
    object CdsPmntsShKatP: TStringField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object CdsPmntsKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_NU.KDOBJ'
    end
    object CdsPmntsShObj: TStringField
      DisplayLabel = #1055#1076#1088
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object CdsPmntsKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_NU.KDSPZ'
    end
    object CdsPmntsPSCH: TStringField
      DisplayLabel = #1057#1095#1105#1090#1048#1060
      FieldName = 'PSCH'
      Origin = 'DbMain.VINU.PSCH'
      Size = 10
    end
    object CdsPmntsSCHBU: TStringField
      DisplayLabel = #1057#1073#1057#1095#1048#1060
      FieldName = 'SCHBU'
      Origin = 'DbMain.VINU.SCHBU'
      Size = 10
    end
    object CdsPmntsSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_NU.SPEC_NR'
      OnGetText = PmntsSpecNrGetText
    end
    object CdsPmntsPRR: TSmallintField
      DisplayLabel = 'prr'
      FieldName = 'PRR'
      Origin = 'DbMain.Z_NU.PRR'
    end
    object CdsPmntsPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_NU.PRPV'
    end
    object CdsPmntsPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_NU.PRKR'
    end
    object CdsPmntsKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_NU.KTO'
    end
    object CdsPmntsSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_NU.SPECPS'
    end
    object CdsPmntsDTVDPV: TDateTimeField
      DisplayLabel = #1044#1090#1042#1076#1055#1042
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_NU.DTVDPV'
      DisplayFormat = 'dd/mm/yy'
    end
    object CdsPmntsNRVDPV: TIntegerField
      DisplayLabel = #8470#1074#1076#1055#1042
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_NU.NRVDPV'
    end
    object CdsPmntsKDBNK: TSmallintField
      DisplayLabel = #1041#1085#1082#1050#1076
      FieldName = 'KDBNK'
      Origin = 'DbMain.Z_NU.KDBNK'
    end
    object CdsPmntsKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KdTemu'
      Origin = 'DbMain.Z_NU.KDTEMU'
      OnGetText = CdsPmntsKdTemuGetText
    end
    object CdsPmntsNMTEMU: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1090#1077#1084#1099
      FieldName = 'NmTemu'
      Origin = 'DbMain.VINUMAIN.NMTEMU'
      Size = 65
    end
    object CdsPmntsSOVM: TStringField
      FieldName = 'SOVM'
      Origin = 'DbMain.VINUMAIN.SOVM'
      Size = 1
    end
    object CdsPmntsNuSovm: TStringField
      FieldName = 'NuSovm'
      Size = 1
    end
    object CdsPmntsStorn: TStringField
      FieldName = 'Storn'
      Size = 1
    end
  end
  object DsrcPmnts: TDataSource
    DataSet = CdsPmnts
    Left = 184
    Top = 504
  end
  object PmntsProvider: TDataSetProvider
    DataSet = QryNuCmn
    Left = 104
    Top = 480
  end
end
