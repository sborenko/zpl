object DmVacatStorn: TDmVacatStorn
  OldCreateOrder = False
  Left = 78
  Top = 276
  Height = 261
  Width = 393
  object QryOrig: TQuery
    AfterScroll = QryOrigAfterScroll
    OnCalcFields = DsCalcFields
    Left = 32
    Top = 80
    object QryOrigNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object QryOrigKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object QryOrigDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object QryOrigZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object QryOrigDTSTORN: TDateTimeField
      DisplayLabel = #1057#1090#1086#1088#1085#1052#1077#1089
      FieldName = 'DTSTORN'
      Origin = 'DbMain.Z_OTKL.DTSTORN'
      DisplayFormat = 'mm/yy'
    end
    object QryOrigTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object QryOrigVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object QryOrigShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldKind = fkCalculated
      FieldName = 'ShVidN'
      Size = 15
      Calculated = True
    end
    object QryOrigOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object QryOrigCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object QryOrigSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
      DisplayFormat = '#.00'
    end
    object QryOrigOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object QryOrigKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object QryOrigKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object QryOrigDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryOrigDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object QryOrigPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object QryOrigKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object QryOrigNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
    end
    object QryOrigPRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object QryOrigPRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object QryOrigKTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object QryOrigPRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object QryOrigSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object QryOrigDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object QryOrigNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object QryOrigMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object QryOrigSPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object QryOrigPBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object QryOrigSTORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
  end
  object DsrcParts: TDataSource
    Left = 240
    Top = 80
  end
  object DsrcOrig: TDataSource
    DataSet = QryOrig
    Left = 56
    Top = 96
  end
  object CdsBuff: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsBuffAfterOpen
    Left = 312
    Top = 80
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 128
  end
end
