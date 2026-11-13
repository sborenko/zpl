object DmSickPregn: TDmSickPregn
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 693
  Top = 470
  Height = 641
  Width = 911
  object QryVBln: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_vBln')
    UpdateObject = UpdVBln
    Left = 32
    Top = 16
    object QryVBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object QryVBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VBLN.KDSPS'
    end
    object QryVBlnDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VBLN.DTPROC'
    end
    object QryVBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VBLN.TABN'
    end
    object QryVBlnALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VBLN.ALGRASCH'
    end
    object QryVBlnNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VBLN.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object QryVBlnSERLIST: TStringField
      DisplayWidth = 8
      FieldName = 'SERLIST'
      Origin = 'DbMain.Z_VBLN.SERLIST'
      Size = 8
    end
    object QryVBlnNRLIST: TStringField
      DisplayWidth = 25
      FieldName = 'NRLIST'
      Origin = 'DbMain.Z_VBLN.NRLIST'
      Size = 25
    end
    object QryVBlnDTLIST: TDateTimeField
      FieldName = 'DTLIST'
      Origin = 'DbMain.Z_VBLN.DTLIST'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryVBlnDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VBLN.DTBEG'
      OnChange = QryVBlnDTBEGChange
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryVBlnDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
      OnChange = QryVBlnDTENDChange
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryVBlnCNTDAYS: TSmallintField
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VBLN.CNTDAYS'
    end
    object QryVBlnCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VBLN.CNTCHAS'
    end
    object QryVBlnVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VBLN.VIDN'
      FixedChar = True
      Size = 4
    end
    object QryVBlnShVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 10
      Lookup = True
    end
    object QryVBlnPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object QryVBlnKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VBLN.KDTEMU'
    end
    object QryVBlnNmTemu: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 35
      Calculated = True
    end
    object QryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object QryVBlnShObj: TStringField
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object QryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
    end
    object QryVBlnShKatP: TStringField
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object QryVBlnNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VBLN.NOTES'
      Size = 35
    end
    object QryVBlnSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VBLN.SMSRDN'
    end
    object QryVBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VBLN.SPEC_NR'
    end
    object QryVBlnSMBLN: TFloatField
      FieldName = 'SMBLN'
      Origin = 'DbMain.Z_VBLN.SMBLN'
    end
    object QryVBlnKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VBLN.KDSPZ'
    end
    object QryVBlnSPZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'SPZ'
      Size = 10
      Calculated = True
    end
    object QryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      Origin = 'DbMain.Z_VBLN.DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object QryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      Origin = 'DbMain.Z_VBLN.LISTCONT'
      FixedChar = True
      Size = 1
    end
    object QryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
      Origin = 'DbMain.Z_VBLN.PREDSPEC_NR'
    end
    object QryVBlnPredNr: TStringField
      FieldKind = fkCalculated
      FieldName = 'PredNr'
      Size = 15
      Calculated = True
    end
    object QryVBlnPredDt: TDateField
      FieldKind = fkCalculated
      FieldName = 'PredDt'
      Calculated = True
    end
    object QryVBlnLNKSTOTP: TIntegerField
      FieldName = 'LNKSTOTP'
      Origin = 'DbMain.Z_VBLN.LNKSTOTP'
    end
    object QryVBlnPRBLN: TSmallintField
      FieldName = 'PRBLN'
      Origin = 'DbMain.Z_VBLN.PRBLN'
    end
    object QryVBlnNmPrBln: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmPrBln'
      Size = 55
      Calculated = True
    end
    object QryVBlnSHEMA: TSmallintField
      FieldName = 'SHEMA'
      Origin = 'DbMain.Z_VBLN.SHEMA'
    end
    object QryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object QryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
      Origin = 'DbMain.Z_VBLN.STGCMN'
    end
    object QryVBlnSTG12: TFloatField
      FieldName = 'STG12'
      Origin = 'DbMain.Z_VBLN.STG12'
    end
    object QryVBlnDTZ: TDateTimeField
      FieldName = 'DTZ'
      Origin = 'DbMain.Z_VBLN.DTZ'
    end
    object QryVBlnNRZ: TIntegerField
      FieldName = 'NRZ'
      Origin = 'DbMain.Z_VBLN.NRZ'
    end
    object QryVBlnDIGITAL: TStringField
      FieldName = 'DIGITAL'
      Size = 1
    end
  end
  object UpdVBln: TUpdateSQL
    ModifySQL.Strings = (
      'update z_vBln'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  ALGRASCH = :ALGRASCH,'
      '  NCHBUDMES = :NCHBUDMES,'
      '  SERLIST = :SERLIST,'
      '  NRLIST = :NRLIST,'
      '  DTLIST = :DTLIST,'
      '  DTBEG = :DTBEG,'
      '  DTEND = :DTEND,'
      '  CNTDAYS = :CNTDAYS,'
      '  VIDN = :VIDN,'
      '  PRBLN = :PRBLN,'
      '  DAY5FIRST = :DAY5FIRST,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  CNTCHAS = :CNTCHAS,'
      '  PROCOPL = :PROCOPL,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  SMSRDN = :SMSRDN,'
      '  SMBLN = :SMBLN,'
      '  SPEC_NR = :SPEC_NR,'
      '  LISTCONT = :LISTCONT,'
      '  PREDSPEC_NR = :PREDSPEC_NR,'
      '  LNKSTOTP = :LNKSTOTP,'
      '  SHEMA = :SHEMA,'
      '  STGCMN = :STGCMN,'
      '  STG12 = :STG12,'
      '  DTZ = :DTZ,'
      '  NRZ = :NRZ,'
      '   DIGITAL = :DIGITAL'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_vBln'
      
        '  (KDSPS, DTPROC, TABN, ALGRASCH, NCHBUDMES, SERLIST, NRLIST, DT' +
        'LIST, DTBEG, '
      
        '   DTEND, CNTDAYS, VIDN, PRBLN, DAY5FIRST, OLDKDVIDN, CNTCHAS, P' +
        'ROCOPL, '
      
        '   KDTEMU, KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, SMBLN, SPEC_NR, ' +
        'LISTCONT, '
      
        '   PREDSPEC_NR, LNKSTOTP, SHEMA, STGCMN, STG12, DTZ, NRZ, DIGITA' +
        'L)'
      'values'
      
        '  (:KDSPS, :DTPROC, :TABN, :ALGRASCH, :NCHBUDMES, :SERLIST, :NRL' +
        'IST, :DTLIST, '
      
        '   :DTBEG, :DTEND, :CNTDAYS, :VIDN, :PRBLN, :DAY5FIRST, :OLDKDVI' +
        'DN, :CNTCHAS, '
      
        '   :PROCOPL, :KDTEMU, :KDOBJ, :KDKATP, :KDSPZ, :NOTES, :SMSRDN, ' +
        ':SMBLN, '
      
        '   :SPEC_NR, :LISTCONT, :PREDSPEC_NR, :LNKSTOTP, :SHEMA, :STGCMN' +
        ', :STG12, '
      '   :DTZ, :NRZ, :DIGITAL)')
    DeleteSQL.Strings = (
      'delete from z_vBln'
      'where'
      '  NR = :OLD_NR')
    Left = 56
    Top = 40
  end
  object QryRBln: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 1 rb.*, Cast(-1 As SmallInt) As MyFoxFld '
      ' from Z_RBln rb'
      ' where rb.Spec_NR = -1'
      ''
      '')
    UpdateObject = UpdRBln
    Left = 200
    Top = 16
    object QryRBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_ROTP.NR'
    end
    object QryRBlnTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_RBLN.TABN'
    end
    object QryRBlnSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_ROTP.SPEC_NR'
    end
    object QryRBlnZAMESGOD: TDateTimeField
      DisplayLabel = #1052#1077#1089#1043#1086#1076
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_ROTP.ZAMESGOD'
      DisplayFormat = 'mm-yyyy'
    end
    object QryRBlnRusMesGod: TStringField
      FieldKind = fkCalculated
      FieldName = 'RusMesGod'
      Size = 15
      Calculated = True
    end
    object QryRBlnSMZARABOTKA: TFloatField
      DisplayLabel = #1047#1072#1088#1072#1073' '#1054#1089#1085
      FieldName = 'SMZARABOTKA'
      Origin = 'DbMain.Z_ROTP.SMZARABOTKA'
      DisplayFormat = '#.00'
    end
    object QryRBlnCNTDAYS: TFloatField
      DisplayLabel = #1044#1085#1080' '#1054#1089#1085
      FieldName = 'CNTDAYS'
    end
    object QryRBlnKOEFZP: TFloatField
      DisplayLabel = #1050#1086#1101#1092'-'#1090
      FieldName = 'KOEFZP'
      Origin = 'DbMain.Z_ROTP.KOEFZP'
    end
    object QryRBlnSmZpKoef: TFloatField
      DisplayLabel = #1057#1084#1084#1042#1047#1072#1095#1077#1090#1054#1089#1085
      FieldKind = fkCalculated
      FieldName = 'SmZpKoef'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object QryRBlnKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_RBLN.KDSPS'
    end
    object QryRBlnMYFOXFLD: TSmallintField
      FieldName = 'MYFOXFLD'
    end
    object QryRBlnNMPOKAZ: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
      FieldName = 'NMPOKAZ'
      FixedChar = True
      Size = 12
    end
    object QryRBlnVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object QryRBlnShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object QryRBlnSUMPROC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMPROC'
    end
    object QryRBlnSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      FixedChar = True
      Size = 1
    end
    object QryRBlnSMVZACHET: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1079#1072#1095#1077#1090
      FieldName = 'SMVZACHET'
      DisplayFormat = '#.00'
    end
    object QryRBlnSM_SVM: TFloatField
      DisplayLabel = #1047#1072#1088#1086#1073#1057#1074#1084
      FieldName = 'SM_SVM'
      DisplayFormat = '#.00'
    end
    object QryRBlnCNTDAYS_SVM: TFloatField
      DisplayLabel = #1044#1085#1080#1057#1074#1084
      FieldName = 'CNTDAYS_SVM'
    end
    object QryRBlnSMVZACHET_SVM: TFloatField
      DisplayLabel = #1057#1084#1057#1074#1084#1042#1047#1072#1095#1105#1090
      FieldName = 'SMVZACHET_SVM'
      DisplayFormat = '#.00'
    end
    object QryRBlnSMVZACHET_CMN: TFloatField
      DisplayLabel = #1057#1084#1054#1073#1097#1042#1047#1072#1095#1105#1090
      FieldName = 'SMVZACHET_CMN'
      DisplayFormat = '#.00'
    end
  end
  object UpdRBln: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_RBln'
      'set'
      '  TABN = :TABN,'
      '  KDSPS = :KDSPS,'
      '  SPEC_NR = :SPEC_NR,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  SMZARABOTKA = :SMZARABOTKA,'
      '  KOEFZP = :KOEFZP,'
      '  CNTDAYS = :CNTDAYS,'
      '  NMPOKAZ = :NMPOKAZ,'
      '  VIDN = :VIDN,'
      '  SUMPROC = :SUMPROC,'
      '  SP = :SP,'
      '  SMVZACHET = :SMVZACHET,'
      '  SM_SVM = :SM_SVM,'
      '  CNTDAYS_SVM = :CNTDAYS_SVM,'
      '  SMVZACHET_SVM = :SMVZACHET_SVM,'
      '  SMVZACHET_CMN = :SMVZACHET_CMN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_RBln'
      
        '  (TABN, KDSPS, SPEC_NR, ZAMESGOD, SMZARABOTKA, KOEFZP, CNTDAYS,' +
        ' '
      'NMPOKAZ, '
      '   VIDN, SUMPROC, SP, SMVZACHET, SM_SVM, CNTDAYS_SVM, '
      'SMVZACHET_SVM, SMVZACHET_CMN)'
      'values'
      '  (:TABN, :KDSPS, :SPEC_NR, :ZAMESGOD, :SMZARABOTKA, :KOEFZP, '
      ':CNTDAYS, '
      
        '   :NMPOKAZ, :VIDN, :SUMPROC, :SP, :SMVZACHET, :SM_SVM, :CNTDAYS' +
        '_SVM, '
      ':SMVZACHET_SVM, '
      '   :SMVZACHET_CMN)')
    DeleteSQL.Strings = (
      'delete from Z_RBln'
      'where'
      '  NR = :OLD_NR')
    Left = 224
    Top = 40
  end
  object QryViNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 10 * from ViNuMain '
      'where TabN = 1239 and ZaMesGod = '#39'08/01/2015'#39)
    Left = 362
    Top = 16
    object QryViNuVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object QryViNuSHVIDN: TStringField
      FieldName = 'SHVIDN'
      Size = 15
    end
    object QryViNuTABN: TIntegerField
      FieldName = 'TABN'
    end
    object QryViNuKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object QryViNuPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
    object QryViNuLVL: TSmallintField
      FieldName = 'LVL'
    end
    object QryViNuSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 10
    end
    object QryViNuDTPROC: TDateTimeField
      FieldName = 'DTPROC'
    end
    object QryViNuZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
    end
    object QryViNuCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object QryViNuSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object QryViNuVID_KDSPZ: TSmallintField
      FieldName = 'VID_KDSPZ'
    end
    object QryViNuVID_SPZ: TStringField
      FieldName = 'VID_SPZ'
      Size = 10
    end
    object QryViNuVID_KDSCHDT: TSmallintField
      FieldName = 'VID_KDSCHDT'
    end
    object QryViNuVID_SCHDT: TStringField
      FieldName = 'VID_SCHDT'
      Size = 10
    end
    object QryViNuVID_KDSCHKT: TSmallintField
      FieldName = 'VID_KDSCHKT'
    end
    object QryViNuVID_SCHKT: TStringField
      FieldName = 'VID_SCHKT'
      Size = 10
    end
    object QryViNuVID_KEKV: TStringField
      FieldName = 'VID_KEKV'
      FixedChar = True
      Size = 4
    end
    object QryViNuNR: TIntegerField
      FieldName = 'NR'
    end
    object QryViNuDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object QryViNuDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object QryViNuKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
    end
    object QryViNuKDKATP: TSmallintField
      FieldName = 'KDKATP'
    end
    object QryViNuKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object QryViNuPDN: TSmallintField
      FieldName = 'PDN'
    end
    object QryViNuOZN_PILG: TStringField
      FieldName = 'OZN_PILG'
      FixedChar = True
      Size = 10
    end
    object QryViNuNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object QryViNuPRR: TSmallintField
      FieldName = 'PRR'
    end
    object QryViNuPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object QryViNuKTO: TSmallintField
      FieldName = 'KTO'
    end
    object QryViNuPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object QryViNuMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object QryViNuSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object QryViNuSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object QryViNuDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object QryViNuNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object QryViNuKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object QryViNuSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object QryViNuZP13: TStringField
      FieldName = 'ZP13'
      Size = 1
    end
    object QryViNuOTP: TStringField
      FieldName = 'OTP'
      Size = 1
    end
    object QryViNuBLN: TStringField
      FieldName = 'BLN'
      Size = 1
    end
    object QryViNuDKR: TStringField
      FieldName = 'DKR'
      Size = 1
    end
    object QryViNuOTPUSKN: TStringField
      FieldName = 'OTPUSKN'
      Size = 1
    end
    object QryViNuBOLNIC: TStringField
      FieldName = 'BOLNIC'
      Size = 1
    end
    object QryViNuSPRM: TStringField
      FieldName = 'SPRM'
      Size = 1
    end
    object QryViNuSSRK: TStringField
      FieldName = 'SSRK'
      FixedChar = True
      Size = 1
    end
    object QryViNuCPRM: TStringField
      FieldName = 'CPRM'
      Size = 1
    end
    object QryViNuDETI: TStringField
      FieldName = 'DETI'
      Size = 1
    end
    object QryViNuDETIM: TStringField
      FieldName = 'DETIM'
      Size = 1
    end
    object QryViNuDETIK: TStringField
      FieldName = 'DETIK'
      Size = 1
    end
    object QryViNuDETIG: TStringField
      FieldName = 'DETIG'
      Size = 1
    end
    object QryViNuIND: TStringField
      FieldName = 'IND'
      Size = 1
    end
    object QryViNuDHD: TStringField
      FieldName = 'DHD'
      Size = 1
    end
    object QryViNuOKLFND: TStringField
      FieldName = 'OKLFND'
      Size = 1
    end
    object QryViNuCBUDG: TStringField
      FieldName = 'CBUDG'
      Size = 1
    end
    object QryViNuSNDB: TStringField
      FieldName = 'SNDB'
      Size = 1
    end
    object QryViNuSPDN: TStringField
      FieldName = 'SPDN'
      Size = 1
    end
    object QryViNuSWSB: TStringField
      FieldName = 'SWSB'
      Size = 1
    end
    object QryViNuSPRF: TStringField
      FieldName = 'SPRF'
      Size = 1
    end
    object QryViNuSPENS: TStringField
      FieldName = 'SPENS'
      Size = 1
    end
    object QryViNuSALIM: TStringField
      FieldName = 'SALIM'
      Size = 1
    end
    object QryViNuCNDB: TStringField
      FieldName = 'CNDB'
      Size = 1
    end
    object QryViNuSSOCSTRAH: TStringField
      FieldName = 'SSOCSTRAH'
      Size = 1
    end
    object QryViNuSBZR: TStringField
      FieldName = 'SBZR'
      Size = 1
    end
    object QryViNuSP_PF: TStringField
      FieldName = 'SP_PF'
      FixedChar = True
      Size = 1
    end
    object QryViNuSP_FSTVP: TStringField
      FieldName = 'SP_FSTVP'
      FixedChar = True
      Size = 1
    end
    object QryViNuSP_FSNV: TStringField
      FieldName = 'SP_FSNV'
      FixedChar = True
      Size = 1
    end
    object QryViNuSP_FZ: TStringField
      FieldName = 'SP_FZ'
      FixedChar = True
      Size = 1
    end
    object QryViNuSOVM: TStringField
      FieldName = 'SOVM'
      Size = 1
    end
    object QryViNuSPOV: TStringField
      FieldName = 'SPOV'
      Size = 1
    end
    object QryViNuNdbDtBeg: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'NdbDtBeg'
      Calculated = True
    end
    object QryViNuNdbDtEnd: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'NdbDtEnd'
      Calculated = True
    end
  end
  object TblRBln: TTable
    DatabaseName = 'Es_Ind'
    FieldDefs = <
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'VIDN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end
      item
        Name = 'CntDays'
        DataType = ftSmallint
      end
      item
        Name = 'CntChas'
        DataType = ftFloat
      end
      item
        Name = 'Smm'
        DataType = ftFloat
      end
      item
        Name = 'SmmSovm'
        DataType = ftFloat
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Spec_NR'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 't__RBln'
    Left = 32
    Top = 128
    object TblRBlnDtProc: TDateField
      FieldName = 'DtProc'
    end
    object TblRBlnVIDN: TStringField
      FieldName = 'VIDN'
      Size = 4
    end
    object TblRBlnShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object TblRBlnDtBeg: TDateField
      FieldName = 'DtBeg'
      DisplayFormat = 'dd/mm/yy'
    end
    object TblRBlnDtEnd: TDateField
      FieldName = 'DtEnd'
      DisplayFormat = 'dd/mm/yy'
    end
    object TblRBlnCntDays: TSmallintField
      FieldName = 'CntDays'
    end
    object TblRBlnCntChas: TFloatField
      FieldName = 'CntChas'
      DisplayFormat = '#.00'
    end
    object TblRBlnSmm: TFloatField
      FieldName = 'Smm'
      DisplayFormat = '0.00'
    end
    object TblRBlnSmmSovm: TFloatField
      FieldName = 'SmmSovm'
      DisplayFormat = '0.00'
    end
    object TblRBlnNotes: TStringField
      FieldName = 'Notes'
      Size = 35
    end
    object TblRBlnSpec_NR: TIntegerField
      FieldName = 'Spec_NR'
    end
  end
  object QryPeek: TQuery
    Left = 493
    Top = 16
  end
  object QryOtkl: TQuery
    Left = 504
    Top = 120
  end
end
