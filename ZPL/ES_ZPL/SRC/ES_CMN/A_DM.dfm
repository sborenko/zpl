object Form_Dm: TForm_Dm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 479
  Top = 357
  Height = 404
  Width = 670
  object qryTmp: TQuery
    Left = 544
    Top = 208
  end
  object tblChCh: TTable
    Left = 600
    Top = 104
  end
  object qrySpsOpl: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from SpsOpl'
      'order by KdSpsO')
    Left = 288
    Top = 152
  end
  object tblTmp: TTable
    FieldDefs = <
      item
        Name = 'tblTmpField1'
      end>
    StoreDefs = True
    Left = 600
    Top = 208
  end
  object qryNdsHist: TQuery
    AfterPost = qryNdsHistAfterPost
    AfterDelete = qryNdsHistAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from NDS_HIST'
      'order by DtBeg desc')
    UpdateObject = updNdsHist
    Left = 248
    Top = 16
    object qryNdsHistNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.NDS_HIST.NR'
    end
    object qryNdsHistDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.NDS_HIST.DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryNdsHistPROCNDS: TFloatField
      DisplayLabel = '% '#1053#1044#1057
      FieldName = 'PROCNDS'
      Origin = 'DbMain.NDS_HIST.PROCNDS'
    end
    object qryNdsHistNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.NDS_HIST.NOTES'
      Size = 65
    end
  end
  object dsrcNdsHist: TDataSource
    DataSet = qryNdsHist
    Left = 264
    Top = 32
  end
  object updNdsHist: TUpdateSQL
    ModifySQL.Strings = (
      'update NDS_HIST'
      'set'
      '  DTBEG = :DTBEG,'
      '  PROCNDS = :PROCNDS,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into NDS_HIST'
      '  (DTBEG, PROCNDS, NOTES)'
      'values'
      '  (:DTBEG, :PROCNDS, :NOTES)')
    DeleteSQL.Strings = (
      'delete from NDS_HIST'
      'where'
      '  NR = :OLD_NR')
    Left = 280
    Top = 48
  end
  object qryVidDoc: TQuery
    AfterPost = qryVidDocAfterPost
    AfterDelete = qryVidDocAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from vid_doc')
    UpdateObject = updVidDoc
    Left = 328
    Top = 16
    object qryVidDocNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.VID_DOC.NR'
    end
    object qryVidDocKDVIDDOC: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDVIDDOC'
      Origin = 'DbMain.VID_DOC.KDVIDDOC'
      FixedChar = True
      Size = 2
    end
    object qryVidDocSHVIDDOC: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHVIDDOC'
      Origin = 'DbMain.VID_DOC.SHVIDDOC'
      Size = 10
    end
    object qryVidDocNMVIDDOC: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'NMVIDDOC'
      Origin = 'DbMain.VID_DOC.NMVIDDOC'
      Size = 65
    end
  end
  object dsrcVidDoc: TDataSource
    DataSet = qryVidDoc
    Left = 344
    Top = 32
  end
  object updVidDoc: TUpdateSQL
    ModifySQL.Strings = (
      'update vid_doc'
      'set'
      '  KDVIDDOC = :KDVIDDOC,'
      '  SHVIDDOC = :SHVIDDOC,'
      '  NMVIDDOC = :NMVIDDOC'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into vid_doc'
      '  (KDVIDDOC, SHVIDDOC, NMVIDDOC)'
      'values'
      '  (:KDVIDDOC, :SHVIDDOC, :NMVIDDOC)')
    DeleteSQL.Strings = (
      'delete from vid_doc'
      'where'
      '  NR = :OLD_NR')
    Left = 352
    Top = 48
  end
  object cdsCheck: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 152
  end
  object qryCheck: TQuery
    Left = 600
    Top = 152
  end
  object qryTypeDocs: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from TypeDocs'
      'order by TypD')
    UpdateObject = updTypeDocs
    Left = 400
    Top = 16
    object qryTypeDocsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.TYPEDOCS.NR'
    end
    object qryTypeDocsTYPD: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'TYPD'
      Origin = 'DbMain.TYPEDOCS.TYPD'
      FixedChar = True
      Size = 5
    end
    object qryTypeDocsNMDOC: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMDOC'
      Origin = 'DbMain.TYPEDOCS.NMDOC'
      FixedChar = True
      Size = 35
    end
    object qryTypeDocsNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.TYPEDOCS.NOTES'
      Size = 65
    end
  end
  object dsrcTypeDocs: TDataSource
    DataSet = qryTypeDocs
    Left = 416
    Top = 32
  end
  object updTypeDocs: TUpdateSQL
    ModifySQL.Strings = (
      'update TypeDocs'
      'set'
      '  TYPD = :TYPD,'
      '  NMDOC = :NMDOC,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into TypeDocs'
      '  (TYPD, NMDOC, NOTES)'
      'values'
      '  (:TYPD, :NMDOC, :NOTES)')
    DeleteSQL.Strings = (
      'delete from TypeDocs'
      'where'
      '  NR = :OLD_NR')
    Left = 432
    Top = 48
  end
  object cdsMovValLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        DataType = ftSmallint
      end
      item
        Name = 'KDVAL'
        DataType = ftSmallint
      end
      item
        Name = 'DTBEG'
        DataType = ftDateTime
      end
      item
        Name = 'KURS'
        DataType = ftFloat
      end
      item
        Name = 'KURSTOUE'
        DataType = ftFloat
      end
      item
        Name = 'ZANEDBV'
        DataType = ftFloat
      end
      item
        Name = 'ZANEDUE'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'mv_KdVal'
        DescFields = 'DtBeg;NR'
        Fields = 'KdVal;DtBeg;NR'
        Options = [ixDescending]
      end>
    IndexName = 'mv_KdVal'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsMovValLUBeforeOpen
    Left = 520
    Top = 40
  end
  object dspCDS: TDataSetProvider
    DataSet = qryCDS
    Left = 288
    Top = 104
  end
  object cdsSbuLU: TClientDataSet
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
        Name = 'SCH_17'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'PSCH'
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
        Name = 'DOPPRIZN'
        DataType = ftSmallint
      end
      item
        Name = 'OLDSCHET'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NR_GORD'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'OnKdSch'
        Fields = 'KdSch'
      end
      item
        Name = 'OnSchBU'
        Fields = 'SchBU'
      end
      item
        Name = 'OnSch_17'
        Fields = 'Sch_17'
      end>
    IndexName = 'OnKdSch'
    Params = <>
    ProviderName = 'dspCDS'
    StoreDefs = True
    BeforeOpen = cdsSbuLUBeforeOpen
    AfterOpen = cdsSbuLUAfterOpen
    Left = 352
    Top = 104
  end
  object cdsWhoLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsWhoLuKdWho'
        Fields = 'KdWho'
      end>
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsWhoLUBeforeOpen
    Left = 416
    Top = 104
  end
  object cdsRSchLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsRSchLuKdWho'
        Fields = 'KdWho'
      end
      item
        Name = 'cdsRSchLuKdRSch'
        Fields = 'KdRSch'
      end>
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsRSchLUBeforeOpen
    Left = 480
    Top = 104
  end
  object cdsBnkPdrLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsBnkPdrLuKdWho'
        Fields = 'KdWho;ShPPdr'
      end>
    IndexName = 'cdsBnkPdrLuKdWho'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsBnkPdrLUBeforeOpen
    AfterOpen = cdsBnkPdrLUAfterOpen
    Left = 352
    Top = 152
  end
  object cdsDgvLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsDgvLuKdDgv'
        Fields = 'KdDgv'
      end>
    IndexName = 'cdsDgvLuKdDgv'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsDgvLUBeforeOpen
    Left = 544
    Top = 104
  end
  object cdsStzLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsStzLuKdStZ'
        Fields = 'KdStZ'
      end>
    IndexName = 'cdsStzLuKdStZ'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsStzLUBeforeOpen
    Left = 480
    Top = 152
  end
  object cdsValLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsValLuKdVal'
        Fields = 'KdVal'
      end>
    IndexName = 'cdsValLuKdVal'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsValLUBeforeOpen
    Left = 480
    Top = 16
  end
  object cdsGrpLU: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsGrpLuKdGrp'
        Fields = 'KdGrp'
      end>
    IndexName = 'cdsGrpLuKdGrp'
    Params = <>
    StoreDefs = True
    BeforeOpen = cdsGrpLUBeforeOpen
    Left = 416
    Top = 152
  end
  object cdsUsrs: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeOpen = cdsUsrsBeforeOpen
    Left = 544
    Top = 256
  end
  object qryKdSps: TQuery
    CachedUpdates = True
    BeforePost = qryKdSpsBeforePost
    AfterPost = qryKdSpsAfterPost
    AfterDelete = qryKdSpsAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_KdSps'
      'order by KdSps')
    Left = 416
    Top = 208
    object qryKdSpsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'ESZPL.Z_KDSPS.NR'
    end
    object qryKdSpsKDSPS: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDSPS'
      Origin = 'ESZPL.Z_KDSPS.KDSPS'
    end
    object qryKdSpsSHSPS: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHSPS'
      Origin = 'ESZPL.Z_KDSPS.SHSPS'
      Size = 15
    end
    object qryKdSpsNMSPS: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMSPS'
      Origin = 'ESZPL.Z_KDSPS.NMSPS'
      Size = 65
    end
    object qryKdSpsNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'ESZPL.Z_KDSPS.NOTES'
      Size = 65
    end
  end
  object dsrcKdSps: TDataSource
    DataSet = qryKdSps
    Left = 432
    Top = 224
  end
  object updKdSps: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_KdSps'
      'set'
      '  KDSPS = :KDSPS,'
      '  SHSPS = :SHSPS,'
      '  NMSPS = :NMSPS,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_KdSps'
      '  (KDSPS, SHSPS, NMSPS, NOTES)'
      'values'
      '  (:KDSPS, :SHSPS, :NMSPS, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_KdSps'
      'where'
      '  NR = :OLD_NR')
    Left = 448
    Top = 240
  end
  object qryUpoz: TQuery
    CachedUpdates = True
    BeforePost = qryUpozBeforePost
    AfterPost = qryUpozAfterPost
    AfterDelete = qryUpozAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from KdUPoz'
      'order by KPr')
    UpdateObject = updUpoz
    Left = 344
    Top = 208
    object qryUpozNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KDUPOZ.NR'
    end
    object qryUpozKPR: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KPR'
      Origin = 'DbMain.KDUPOZ.KPR'
    end
    object qryUpozSPECNAIM: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SPECNAIM'
      Origin = 'DbMain.KDUPOZ.SPECNAIM'
      Size = 15
    end
    object qryUpozNAIMENOV: TStringField
      FieldName = 'NAIMENOV'
      Origin = 'DbMain.KDUPOZ.NAIMENOV'
      Size = 35
    end
    object qryUpozSCHET: TStringField
      DisplayLabel = #1056'/'#1057#1095' '#1074' '#1082#1072#1079#1085#1072#1095'.'
      FieldName = 'SCHET'
      Origin = 'DbMain.KDUPOZ.SCHET'
      Size = 16
    end
    object qryUpozSCHETKAZN: TStringField
      DisplayLabel = 'ShetKazn'
      FieldName = 'SCHETKAZN'
      Origin = 'DbMain.KDUPOZ.SCHETKAZN'
      Size = 5
    end
    object qryUpozBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.KDUPOZ.BANK'
      Size = 35
    end
    object qryUpozKBANKA: TStringField
      FieldName = 'KBANKA'
      Origin = 'DbMain.KDUPOZ.KBANKA'
      Size = 10
    end
    object qryUpozKDB_SCH: TSmallintField
      FieldName = 'KDB_SCH'
      Origin = 'DbMain.KDUPOZ.KDB_SCH'
    end
    object qryUpozB_SCHET: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'B_SCHET'
      Origin = 'DbMain.KDUPOZ.B_SCHET'
      OnValidate = qryUpozB_SCHETValidate
      Size = 10
    end
    object qryUpozKDZ_SCH: TSmallintField
      FieldName = 'KDZ_SCH'
      Origin = 'DbMain.KDUPOZ.KDZ_SCH'
    end
    object qryUpozZ_SCHET: TStringField
      DisplayLabel = #1057#1095#1047#1072#1090#1088#1072#1090
      FieldName = 'Z_SCHET'
      Origin = 'DbMain.KDUPOZ.Z_SCHET'
      OnValidate = qryUpozZ_SCHETValidate
      Size = 10
    end
    object qryUpozZ_SCH_17: TStringField
      DisplayLabel = #1057#1095#1047#1072#1090#1088'_17'
      FieldName = 'Z_SCH_17'
      Origin = 'DbMain.KDUPOZ.Z_SCH_17'
      Size = 15
    end
    object qryUpozNMKFK: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074'.'#1087#1088#1086#1075#1088#1072#1084#1084#1099
      FieldName = 'NMKFK'
      Origin = 'DbMain.KDUPOZ.NMKFK'
      Size = 85
    end
    object qryUpozKDF_SCH: TSmallintField
      FieldName = 'KDF_SCH'
      Origin = 'DbMain.KDUPOZ.KDF_SCH'
    end
    object qryUpozF_SCHET: TStringField
      DisplayLabel = #1057#1095#1055#1088#1080#1093#1086#1076#1072
      FieldName = 'F_SCHET'
      Origin = 'DbMain.KDUPOZ.F_SCHET'
      OnValidate = qryUpozF_SCHETValidate
      Size = 10
    end
    object qryUpozPSMETU: TStringField
      DisplayLabel = #1055#1088#1057#1084#1077#1090#1099
      FieldName = 'PSMETU'
      Origin = 'DbMain.KDUPOZ.PSMETU'
      Size = 5
    end
    object qryUpozPLIMITA: TStringField
      DisplayLabel = #1055#1088#1051#1080#1084
      FieldName = 'PLIMITA'
      Origin = 'DbMain.KDUPOZ.PLIMITA'
      Size = 5
    end
    object qryUpozPPLANA: TStringField
      DisplayLabel = #1055#1088#1055#1083#1040
      FieldName = 'PPLANA'
      Origin = 'DbMain.KDUPOZ.PPLANA'
      Size = 5
    end
    object qryUpozSCH_KSS: TStringField
      FieldName = 'SCH_KSS'
      Origin = 'DbMain.KDUPOZ.SCH_KSS'
      Size = 10
    end
    object qryUpozKOD_OKPO: TStringField
      FieldName = 'KOD_OKPO'
      Origin = 'DbMain.KDUPOZ.KOD_OKPO'
      Size = 10
    end
    object qryUpozNOMNDS: TFloatField
      FieldName = 'NOMNDS'
      Origin = 'DbMain.KDUPOZ.NOMNDS'
    end
    object qryUpozNOMSVID: TFloatField
      FieldName = 'NOMSVID'
      Origin = 'DbMain.KDUPOZ.NOMSVID'
    end
    object qryUpozADRES: TStringField
      FieldName = 'ADRES'
      Origin = 'DbMain.KDUPOZ.ADRES'
      Size = 35
    end
    object qryUpozTELEFON: TStringField
      FieldName = 'TELEFON'
      Origin = 'DbMain.KDUPOZ.TELEFON'
      Size = 10
    end
  end
  object dsrcUPoz: TDataSource
    DataSet = qryUpoz
    Left = 360
    Top = 224
  end
  object updUpoz: TUpdateSQL
    ModifySQL.Strings = (
      'update KdUPoz'
      'set'
      '  KPR = :KPR,'
      '  SPECNAIM = :SPECNAIM,'
      '  NAIMENOV = :NAIMENOV,'
      '  SCHET = :SCHET,'
      '  SCHETKAZN = :SCHETKAZN,'
      '  BANK = :BANK,'
      '  KBANKA = :KBANKA,'
      '  KDB_SCH = :KDB_SCH,'
      '  B_SCHET = :B_SCHET,'
      '  KDZ_SCH = :KDZ_SCH,'
      '  Z_SCHET = :Z_SCHET,'
      '  KDF_SCH = :KDF_SCH,'
      '  F_SCHET = :F_SCHET,'
      '  PSMETU = :PSMETU,'
      '  PLIMITA = :PLIMITA,'
      '  PPLANA = :PPLANA,'
      '  SCH_KSS = :SCH_KSS,'
      '  KOD_OKPO = :KOD_OKPO,'
      '  NOMNDS = :NOMNDS,'
      '  NOMSVID = :NOMSVID,'
      '  ADRES = :ADRES,'
      '  TELEFON = :TELEFON,'
      '  NMKFK = :NMKFK'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into KdUPoz'
      
        '  (KPR, SPECNAIM, NAIMENOV, SCHET, SCHETKAZN, BANK, KBANKA, KDB_' +
        'SCH, B_SCHET, '
      
        '   KDZ_SCH, Z_SCHET, KDF_SCH, F_SCHET, PSMETU, PLIMITA, PPLANA, ' +
        'SCH_KSS, '
      '   KOD_OKPO, NOMNDS, NOMSVID, ADRES, TELEFON, NMKFK)'
      'values'
      
        '  (:KPR, :SPECNAIM, :NAIMENOV, :SCHET, :SCHETKAZN, :BANK, :KBANK' +
        'A, :KDB_SCH, '
      
        '   :B_SCHET, :KDZ_SCH, :Z_SCHET, :KDF_SCH, :F_SCHET, :PSMETU, :P' +
        'LIMITA, '
      
        '   :PPLANA, :SCH_KSS, :KOD_OKPO, :NOMNDS, :NOMSVID, :ADRES, :TEL' +
        'EFON, :NMKFK)')
    DeleteSQL.Strings = (
      'delete from KdUPoz'
      'where'
      '  NR = :OLD_NR')
    Left = 376
    Top = 240
  end
  object DbMain: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    BeforeConnect = MyDbBeforeConnect
    Left = 24
    Top = 8
  end
  object qryUsrSpec: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      '')
    Left = 600
    Top = 256
  end
  object TimLastReg: TTimer
    Interval = 60000
    Left = 600
    Top = 16
  end
  object qryLog: TQuery
    Left = 480
    Top = 208
  end
  object dbOks: TDatabase
    AliasName = 'es_oks'
    DatabaseName = 'EsDbOks'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    BeforeConnect = MyDbBeforeConnect
    Left = 24
    Top = 72
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.*,  p.Dt_Priem, p.Dt_Uvoln'
      'from z_Upi u '
      
        '  Left outer join Get_PrmUvState_OnDate(u.TabN, '#39'11/01/2007'#39') p ' +
        'on 1=1'
      ' where (not p.Dt_Priem is Null) and '
      
        '               (p.Dt_Uvoln is Null or p.Dt_Uvoln >= '#39'10/01/2007'#39 +
        ')'
      'order by u.TabN')
    Left = 224
    Top = 208
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
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074#1099#1081#1048#1044
      FieldName = 'ID'
      Origin = 'DbMain.Z_UPI.ID'
      Size = 10
    end
    object qryUpiFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
      Origin = 'DbMain.Z_UPI.FAM'
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
      DisplayLabel = #1044#1090#1056#1086#1078#1076
      FieldName = 'DOB'
      Origin = 'DbMain.Z_UPI.DOB'
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
    object qryUpiDT_PRIEM: TDateTimeField
      DisplayLabel = #1044#1090#1055#1088#1080#1077#1084#1072
      FieldName = 'DT_PRIEM'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryUpiDT_UVOLN: TDateTimeField
      DisplayLabel = #1044#1090#1059#1074#1086#1083#1100#1085
      FieldName = 'DT_UVOLN'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 240
    Top = 224
  end
  object qryAllStZ: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_StZ'
      'where KdStZ = :nKdStZ')
    Left = 288
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nKdStZ'
        ParamType = ptUnknown
      end>
  end
  object DbOK: TDatabase
    AliasName = 'Postgres UPO'
    DatabaseName = 'EsDbOK'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=buch'
      'PASSWORD=buch2008')
    SessionName = 'Default'
    Left = 24
    Top = 136
  end
  object qryCDS: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Kd_Sbu'
      '')
    Left = 248
    Top = 104
  end
  object TblDlzhn: TTable
    DatabaseName = 'DbMain'
    TableName = 'O_DOLGNOST'
    Left = 112
    Top = 24
  end
end
