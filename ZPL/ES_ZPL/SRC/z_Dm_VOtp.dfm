object DmVOtp: TDmVOtp
  OldCreateOrder = False
  Left = 895
  Top = 261
  Height = 127
  Width = 332
  object qryVOtp: TQuery
    BeforePost = qryVOtpBeforePost
    AfterPost = qryVOtpAfterPost
    OnCalcFields = qryVOtpCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * '
      'from z_VOtp '
      'where TabN = 1239')
    UpdateObject = updVOtp
    Left = 16
    Top = 16
    object qryVOtpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VOTP.NR'
    end
    object qryVOtpKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VOTP.KDSPS'
    end
    object qryVOtpDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VOTP.DTPROC'
    end
    object qryVOtpTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_VOTP.TABN'
    end
    object qryVOtpCUROKLTRF: TFloatField
      FieldName = 'CUROKLTRF'
      Origin = 'DbMain.Z_VOTP.CUROKLTRF'
    end
    object qryVOtpALGRASCH: TSmallintField
      FieldName = 'ALGRASCH'
      Origin = 'DbMain.Z_VOTP.ALGRASCH'
    end
    object qryVOtpUSEKOEFOKL: TStringField
      FieldName = 'USEKOEFOKL'
      Origin = 'DbMain.Z_VOTP.USEKOEFOKL'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHMATPOM: TStringField
      FieldName = 'NCHMATPOM'
      Origin = 'DbMain.Z_VOTP.NCHMATPOM'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNCHBUDMES: TStringField
      FieldName = 'NCHBUDMES'
      Origin = 'DbMain.Z_VOTP.NCHBUDMES'
      FixedChar = True
      Size = 1
    end
    object qryVOtpRK: TStringField
      FieldName = 'RK'
      Origin = 'DbMain.Z_VOTP.RK'
      FixedChar = True
      Size = 1
    end
    object qryVOtpNRPRIK: TStringField
      FieldName = 'NRPRIK'
      Origin = 'DbMain.Z_VOTP.NRPRIK'
      Size = 15
    end
    object qryVOtpDTPRIK: TDateTimeField
      FieldName = 'DTPRIK'
      Origin = 'DbMain.Z_VOTP.DTPRIK'
    end
    object qryVOtpDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_VOTP.DTBEG'
    end
    object qryVOtpCNTDAYS: TSmallintField
      FieldName = 'CNTDAYS'
      Origin = 'DbMain.Z_VOTP.CNTDAYS'
    end
    object qryVOtpDTEND: TDateTimeField
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_VOTP.DTEND'
    end
    object qryVOtpCNTCHAS: TFloatField
      FieldName = 'CNTCHAS'
      Origin = 'DbMain.Z_VOTP.CNTCHAS'
    end
    object qryVOtpVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_VOTP.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVOtpShVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'VIDN'
      Size = 10
      Lookup = True
    end
    object qryVOtpNmVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'NmVidN'
      LookupDataSet = DmMain.qryVidN_LU
      LookupKeyFields = 'VIDN'
      LookupResultField = 'NMVIDN'
      KeyFields = 'VIDN'
      Size = 64
      Lookup = True
    end
    object qryVOtpPROCOPL: TFloatField
      FieldName = 'PROCOPL'
      Origin = 'DbMain.Z_VOTP.PROCOPL'
    end
    object qryVOtpKDTEMU: TSmallintField
      FieldName = 'KDTEMU'
      Origin = 'DbMain.Z_VOTP.KDTEMU'
    end
    object qryVOtpNmTemu: TStringField
      FieldKind = fkCalculated
      FieldName = 'NmTemu'
      Size = 35
      Calculated = True
    end
    object qryVOtpKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_VOTP.KDOBJ'
    end
    object qryVOtpShObj: TStringField
      FieldKind = fkLookup
      FieldName = 'ShObj'
      LookupDataSet = DmMain.qryObjLU
      LookupKeyFields = 'KDOBJ'
      LookupResultField = 'SHOBJ'
      KeyFields = 'KDOBJ'
      Size = 10
      Lookup = True
    end
    object qryVOtpKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_VOTP.KDKATP'
    end
    object qryVOtpShKatP: TStringField
      FieldKind = fkLookup
      FieldName = 'ShKatP'
      LookupDataSet = DmMain.qryKatPers_LU
      LookupKeyFields = 'KDKATP'
      LookupResultField = 'SHKATP'
      KeyFields = 'KDKATP'
      Size = 10
      Lookup = True
    end
    object qryVOtpKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_VOTP.KDSPZ'
    end
    object qryVOtpSPZ: TStringField
      FieldKind = fkLookup
      FieldName = 'SPZ'
      LookupDataSet = DmMain.qrySBU_LU
      LookupKeyFields = 'KDSCH'
      LookupResultField = 'SCHBU'
      KeyFields = 'KDSPZ'
      Size = 10
      Lookup = True
    end
    object qryVOtpNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VOTP.NOTES'
      Size = 35
    end
    object qryVOtpSMSRDN: TFloatField
      FieldName = 'SMSRDN'
      Origin = 'DbMain.Z_VOTP.SMSRDN'
    end
    object qryVOtpSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_VOTP.SPEC_NR'
    end
    object qryVOtpSMOTP: TFloatField
      FieldName = 'SMOTP'
      Origin = 'DbMain.Z_VOTP.SMOTP'
    end
  end
  object dsrcVOtp: TDataSource
    DataSet = qryVOtp
    Left = 80
    Top = 16
  end
  object updVOtp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_VOtp'
      'set'
      '  NR = :NR,'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  CUROKLTRF = :CUROKLTRF,'
      '  ALGRASCH = :ALGRASCH,'
      '  USEKOEFOKL = :USEKOEFOKL,'
      '  NCHMATPOM = :NCHMATPOM,'
      '  NCHBUDMES = :NCHBUDMES,'
      '  RK = :RK,'
      '  NRPRIK = :NRPRIK,'
      '  DTPRIK = :DTPRIK,'
      '  DTBEG = :DTBEG,'
      '  CNTDAYS = :CNTDAYS,'
      '  DTEND = :DTEND,'
      '  CNTCHAS = :CNTCHAS,'
      '  VIDN = :VIDN,'
      '  PROCOPL = :PROCOPL,'
      '  KDTEMU = :KDTEMU,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  NOTES = :NOTES,'
      '  SMSRDN = :SMSRDN,'
      '  SPEC_NR = :SPEC_NR,'
      '  SMOTP = :SMOTP'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_VOtp'
      '  (NR, KDSPS, DTPROC, TABN, CUROKLTRF, ALGRASCH, USEKOEFOKL, '
      'NCHMATPOM, '
      
        '   NCHBUDMES, RK, NRPRIK, DTPRIK, DTBEG, CNTDAYS, DTEND, CNTCHAS' +
        ', '
      'VIDN, '
      
        '   PROCOPL, KDTEMU, KDOBJ, KDKATP, KDSPZ, NOTES, SMSRDN, SPEC_NR' +
        ', '
      'SMOTP)'
      'values'
      
        '  (:NR, :KDSPS, :DTPROC, :TABN, :CUROKLTRF, :ALGRASCH, :USEKOEFO' +
        'KL, '
      ':NCHMATPOM, '
      '   :NCHBUDMES, :RK, :NRPRIK, :DTPRIK, :DTBEG, :CNTDAYS, :DTEND, '
      ':CNTCHAS, '
      
        '   :VIDN, :PROCOPL, :KDTEMU, :KDOBJ, :KDKATP, :KDSPZ, :NOTES, :S' +
        'MSRDN, '
      '   :SPEC_NR, :SMOTP)')
    DeleteSQL.Strings = (
      'delete from z_VOtp'
      'where'
      '  NR = :OLD_NR')
    Left = 144
    Top = 16
  end
end
