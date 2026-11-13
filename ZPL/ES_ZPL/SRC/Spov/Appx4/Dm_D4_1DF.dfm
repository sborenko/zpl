object DmD41DF: TDmD41DF
  OldCreateOrder = False
  Left = 242
  Top = 208
  Height = 380
  Width = 663
  object tblProm: TTable
    DatabaseName = '__KBDE'
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NP'
        DataType = ftInteger
      end
      item
        Name = 'BadID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'fNU'
        DataType = ftSmallint
      end
      item
        Name = 'TIN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Sovm'
        DataType = ftSmallint
      end
      item
        Name = 'Fam'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Ima'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'S_NAR'
        DataType = ftFloat
      end
      item
        Name = 'S_DOX'
        DataType = ftFloat
      end
      item
        Name = 'S_TAXN'
        DataType = ftFloat
      end
      item
        Name = 'S_TAXP'
        DataType = ftFloat
      end
      item
        Name = 'OZN_DOX'
        DataType = ftSmallint
      end
      item
        Name = 'D_PRIYN'
        DataType = ftDate
      end
      item
        Name = 'D_ZVILN'
        DataType = ftDate
      end
      item
        Name = 'OZN_PILG'
        DataType = ftSmallint
      end
      item
        Name = 'OZNAKA'
        DataType = ftSmallint
      end
      item
        Name = 'DopRec'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'tblProm.db'
    Left = 12
    Top = 16
    object tblPromNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblPromNP: TIntegerField
      FieldName = 'NP'
    end
    object tblPromBadID: TStringField
      FieldName = 'BadID'
      Size = 10
    end
    object tblPromfNU: TSmallintField
      FieldName = 'fNU'
    end
    object tblPromTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblPromTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblPromSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblPromFam: TStringField
      FieldName = 'Fam'
    end
    object tblPromIma: TStringField
      FieldName = 'Ima'
    end
    object tblPromOtch: TStringField
      FieldName = 'Otch'
    end
    object tblPromS_NAR: TFloatField
      FieldName = 'S_NAR'
    end
    object tblPromS_DOX: TFloatField
      FieldName = 'S_DOX'
    end
    object tblPromS_TAXN: TFloatField
      FieldName = 'S_TAXN'
    end
    object tblPromS_TAXP: TFloatField
      FieldName = 'S_TAXP'
    end
    object tblPromOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblPromD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblPromD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblPromOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblPromOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblPromDopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
  end
  object qryZPrmUv: TQuery
    Left = 16
    Top = 224
  end
  object qryZPere: TQuery
    Left = 72
    Top = 224
  end
  object qryZNu: TQuery
    Left = 120
    Top = 224
  end
  object qryLgotu: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Get_Lgota (3774, '#39'08/01/2010'#39', '#39'08/31/2010'#39')')
    Left = 96
    Top = 120
  end
  object qryDop: TQuery
    Left = 168
    Top = 224
  end
  object tblTmp: TTable
    Left = 544
    Top = 24
  end
  object qryTmp: TQuery
    Left = 544
    Top = 80
  end
  object tblID: TTable
    DatabaseName = 'D00'
    TableName = 'd_104_ID.db'
    Left = 72
    Top = 16
    object tblIDNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblIDNP: TIntegerField
      FieldName = 'NP'
    end
    object tblIDTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblIDRecNR: TIntegerField
      FieldName = 'RecNR'
    end
    object tblIDTabN: TIntegerField
      FieldName = 'TabN'
    end
    object tblIDSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblIDFam: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'Fam'
    end
    object tblIDIma: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'Ima'
    end
    object tblIDOtch: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otch'
    end
    object tblIDBadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object tblIDS_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object tblIDS_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object tblIDS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object tblIDS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object tblIDOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblIDD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblIDD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblIDOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblIDOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblIDDopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
  end
  object dsrcID: TDataSource
    DataSet = tblID
    Left = 96
    Top = 32
  end
  object tblFIO: TTable
    DatabaseName = 'D00'
    TableName = 'd_104_FI.db'
    Left = 144
    Top = 16
    object tblFIONR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblFIONP: TIntegerField
      FieldName = 'NP'
    end
    object tblFIOTIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object tblFIOSovm: TSmallintField
      FieldName = 'Sovm'
    end
    object tblFIOFam: TStringField
      FieldName = 'Fam'
    end
    object tblFIOIma: TStringField
      FieldName = 'Ima'
    end
    object tblFIOOtch: TStringField
      FieldName = 'Otch'
    end
    object tblFIOBadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object tblFIOPasport: TStringField
      FieldName = 'Pasport'
    end
    object tblFIOS_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object tblFIOS_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object tblFIOS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object tblFIOS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object tblFIOOZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object tblFIOD_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object tblFIOD_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object tblFIOOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object tblFIOOZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object tblFIODopRec: TStringField
      FieldName = 'DopRec'
      Size = 1
    end
    object tblFIOTabN: TIntegerField
      FieldName = 'TabN'
    end
  end
  object dsrcFIO: TDataSource
    DataSet = tblFIO
    Left = 168
    Top = 32
  end
  object qry1000: TQuery
    Left = 488
    Top = 80
  end
  object tbl1000: TTable
    TableName = 't__1000'
    Left = 488
    Top = 24
  end
  object tblForCopy: TTable
    TableType = ttDBase
    Left = 296
    Top = 24
  end
  object qryProm: TQuery
    DatabaseName = '__KBDE'
    SQL.Strings = (
      
        'Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg' +
        ', '
      
        '           d_Zviln, d_Priyn, Oznaka, DopRec, Sum(S_Nar) as S_NAR' +
        ', '
      '           Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, '
      '           Sum(S_TaxP) as S_TAXP'
      'from tblProm where TIN = '#39'1713602260'#39
      
        'group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pi' +
        'lg, '
      
        '                                            d_Zviln, d_Priyn, OZ' +
        'NAKA, DopRec')
    Left = 16
    Top = 120
    object qryPromTIN: TStringField
      FieldName = 'TIN'
      Origin = '__KBDE."tblProm.DB".TIN'
      Size = 10
    end
    object qryPromBadID: TStringField
      FieldName = 'BadID'
      Origin = '__KBDE."tblProm.DB".BadId'
      Size = 10
    end
    object qryPromSovm: TSmallintField
      FieldName = 'Sovm'
      Origin = '__KBDE."tblProm.DB".Sovm'
    end
    object qryPromTabN: TIntegerField
      FieldName = 'TabN'
    end
    object qryPromFam: TStringField
      FieldName = 'Fam'
      Origin = '__KBDE."tblProm.DB".Fam'
    end
    object qryPromIma: TStringField
      FieldName = 'Ima'
      Origin = '__KBDE."tblProm.DB".Ima'
    end
    object qryPromOtch: TStringField
      FieldName = 'Otch'
      Origin = '__KBDE."tblProm.DB".Otch'
    end
    object qryPromOzn_Dox: TSmallintField
      FieldName = 'Ozn_Dox'
      Origin = '__KBDE."tblProm.DB".OZN_DOX'
    end
    object qryPromOzn_Pilg: TSmallintField
      FieldName = 'Ozn_Pilg'
      Origin = '__KBDE."tblProm.DB".OZN_PILG'
    end
    object qryPromd_Zviln: TDateField
      FieldName = 'd_Zviln'
      Origin = '__KBDE."tblProm.DB".D_ZVILN'
    end
    object qryPromd_Priyn: TDateField
      FieldName = 'd_Priyn'
      Origin = '__KBDE."tblProm.DB".D_PRIYN'
    end
    object qryPromOznaka: TSmallintField
      FieldName = 'Oznaka'
      Origin = '__KBDE."tblProm.DB".OZNAKA'
    end
    object qryPromDopRec: TStringField
      FieldName = 'DopRec'
      Origin = '__KBDE."tblProm.DB".DopRec'
      Size = 1
    end
    object qryPromS_NAR: TFloatField
      FieldName = 'S_NAR'
      Origin = '__KBDE."tblProm.DB".S_NAR'
      DisplayFormat = '#.00'
    end
    object qryPromS_DOX: TFloatField
      FieldName = 'S_DOX'
      Origin = '__KBDE."tblProm.DB".S_DOX'
      DisplayFormat = '#.00'
    end
    object qryPromS_TAXN: TFloatField
      FieldName = 'S_TAXN'
      Origin = '__KBDE."tblProm.DB".S_TAXN'
      DisplayFormat = '#.00'
    end
    object qryPromS_TAXP: TFloatField
      FieldName = 'S_TAXP'
      Origin = '__KBDE."tblProm.DB".S_TAXP'
      DisplayFormat = '#.00'
    end
  end
  object dsrcProm: TDataSource
    DataSet = qryProm
    Left = 40
    Top = 136
  end
  object qryFio2: TQuery
    DatabaseName = 'D00'
    DataSource = dsrcFIO
    SQL.Strings = (
      'Select *'
      'from dF2_1.db'
      'where (TIN = :TIN)'
      'order by cDir, fNU')
    Left = 176
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIN'
        ParamType = ptUnknown
      end>
    object qryFio2NR: TIntegerField
      FieldName = 'NR'
    end
    object qryFio2NP: TIntegerField
      FieldName = 'NP'
    end
    object qryFio2cDir: TStringField
      FieldName = 'cDir'
      Size = 4
    end
    object qryFio2fNU: TSmallintField
      FieldName = 'fNU'
    end
    object qryFio2TIN: TStringField
      FieldName = 'TIN'
      Size = 10
    end
    object qryFio2TabN: TIntegerField
      FieldName = 'TabN'
    end
    object qryFio2Fam: TStringField
      FieldName = 'Fam'
    end
    object qryFio2Ima: TStringField
      FieldName = 'Ima'
    end
    object qryFio2Otch: TStringField
      FieldName = 'Otch'
    end
    object qryFio2BadId: TStringField
      FieldName = 'BadId'
      Size = 10
    end
    object qryFio2S_NAR: TFloatField
      FieldName = 'S_NAR'
      DisplayFormat = '#.00'
    end
    object qryFio2S_DOX: TFloatField
      FieldName = 'S_DOX'
      DisplayFormat = '#.00'
    end
    object qryFio2S_TAXN: TFloatField
      FieldName = 'S_TAXN'
      DisplayFormat = '#.00'
    end
    object qryFio2S_TAXP: TFloatField
      FieldName = 'S_TAXP'
      DisplayFormat = '#.00'
    end
    object qryFio2OZN_DOX: TSmallintField
      FieldName = 'OZN_DOX'
    end
    object qryFio2D_PRIYN: TDateField
      FieldName = 'D_PRIYN'
    end
    object qryFio2D_ZVILN: TDateField
      FieldName = 'D_ZVILN'
    end
    object qryFio2OZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object qryFio2OZNAKA: TSmallintField
      FieldName = 'OZNAKA'
    end
    object qryFio2NoNwBD: TBooleanField
      FieldName = 'NoNwBD'
    end
  end
  object dsrcFio2: TDataSource
    DataSet = qryFio2
    Left = 200
    Top = 136
  end
  object qryRkvzt: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_DfRkvzt')
    UpdateObject = updRkvzt
    Left = 336
    Top = 120
  end
  object dsrcRkvzt: TDataSource
    DataSet = qryRkvzt
    Left = 360
    Top = 136
  end
  object updRkvzt: TUpdateSQL
    ModifySQL.Strings = (
      'update z_DfRkvzt'
      'set'
      '  DTBEG = :DTBEG,'
      '  ORGEDRPOU = :ORGEDRPOU,'
      '  ORGNAME = :ORGNAME,'
      '  DIR_ID = :DIR_ID,'
      '  DIR_PHONE = :DIR_PHONE,'
      '  DIR_FIO = :DIR_FIO,'
      '  BUH_ID = :BUH_ID,'
      '  BUH_PHONE = :BUH_PHONE,'
      '  BUH_FIO = :BUH_FIO,'
      '  DPIEDRPOU = :DPIEDRPOU,'
      '  DPINAME = :DPINAME'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_DfRkvzt'
      
        '  (DTBEG, ORGEDRPOU, ORGNAME, DIR_ID, DIR_PHONE, DIR_FIO, BUH_ID' +
        ', '
      'BUH_PHONE, '
      '   BUH_FIO, DPIEDRPOU, DPINAME)'
      'values'
      '  (:DTBEG, :ORGEDRPOU, :ORGNAME, :DIR_ID, :DIR_PHONE, :DIR_FIO, '
      ':BUH_ID, '
      '   :BUH_PHONE, :BUH_FIO, :DPIEDRPOU, :DPINAME)')
    DeleteSQL.Strings = (
      'delete from z_DfRkvzt'
      'where'
      '  NR = :OLD_NR')
    Left = 384
    Top = 152
  end
  object cdsLgotu: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'OZN_PILG'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 136
    object cdsLgotuOZN_PILG: TSmallintField
      DisplayWidth = 4
      FieldName = 'OZN_PILG'
    end
  end
  object QryPeek: TQuery
    Left = 456
    Top = 200
  end
  object CdsAlim: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 200
    object CdsAlimInn: TStringField
      FieldName = 'Inn'
      Size = 10
    end
    object CdsAlimOznDoh: TIntegerField
      FieldName = 'Ozn'
    end
    object CdsAlimSum: TFloatField
      FieldName = 'Sum'
    end
  end
end
