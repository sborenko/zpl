object FormEBln: TFormEBln
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 689
  Top = 397
  Height = 646
  Width = 697
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
    Left = 160
    Top = 80
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
  object TblDM: TTable
    FieldDefs = <
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'PlusB'
        DataType = ftSmallint
      end
      item
        Name = 'MinusB'
        DataType = ftSmallint
      end
      item
        Name = 'NoVid'
        DataType = ftSmallint
      end
      item
        Name = 'NoPayPartTime'
        DataType = ftInteger
      end>
    StoreDefs = True
    Left = 233
    Top = 277
  end
  object QryViNu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select First 10 * from ViNuMain '
      'where TabN = 1239 and ZaMesGod = '#39'08/01/2015'#39)
    Left = 122
    Top = 244
  end
  object QryVBln: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_vBln')
    Left = 120
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
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryVBlnDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VBLN.DTEND'
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
    object QryVBlnPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VBLN.PROCOPL'
    end
    object QryVBlnKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VBLN.KDTEMU'
    end
    object QryVBlnKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VBLN.KDOBJ'
    end
    object QryVBlnKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VBLN.KDKATP'
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
    object QryVBlnDAY5FIRST: TStringField
      FieldName = 'DAY5FIRST'
      Origin = 'DbMain.Z_VBLN.DAY5FIRST'
      FixedChar = True
      Size = 1
    end
    object QryVBlnLISTCONT: TStringField
      FieldName = 'LISTCONT'
      Origin = 'DbMain.Z_VBLN.NR'
      FixedChar = True
      Size = 1
    end
    object QryVBlnPREDSPEC_NR: TIntegerField
      FieldName = 'PREDSPEC_NR'
      Origin = 'DbMain.Z_VBLN.NR'
    end
    object QryVBlnLNKSTOTP: TIntegerField
      FieldName = 'LNKSTOTP'
      Origin = 'DbMain.Z_VBLN.LNKSTOTP'
    end
    object QryVBlnPRBLN: TSmallintField
      FieldName = 'PRBLN'
      Origin = 'DbMain.Z_VBLN.PRBLN'
    end
    object QryVBlnSHEMA: TSmallintField
      FieldName = 'SHEMA'
      Origin = 'DbMain.Z_VBLN.SHEMA'
    end
    object QryVBlnSTGCMN: TFloatField
      FieldName = 'STGCMN'
      Origin = 'DbMain.Z_VBLN.STGCMN'
    end
    object QryVBlnSTG12: TFloatField
      FieldName = 'STG12'
      Origin = 'DbMain.Z_VBLN.STG12'
    end
    object QryVBlnOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_VBLN.OLDKDVIDN'
    end
    object QryVBlnDIGITAL: TStringField
      FieldName = 'DIGITAL'
      Size = 1
    end
    object QryVBlnAct_Dt: TDateTimeField
      FieldName = 'Act_Dt'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object QryVBlnAct_Num: TStringField
      FieldName = 'Act_Num'
      Size = 25
    end
  end
  object QryTmp: TQuery
    Left = 120
    Top = 312
  end
  object QryRBlnOld: TQuery
    DatabaseName = 'DbMain'
    Left = 160
    Top = 168
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
    Left = 176
    Top = 96
  end
end
