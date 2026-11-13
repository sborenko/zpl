object FormAddPereOpk: TFormAddPereOpk
  Left = 303
  Top = 250
  Width = 855
  Height = 398
  Caption = 'FormAddPereOpk'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      847
      31)
    object sBtnGo: TSpeedButton
      Left = 5
      Top = 3
      Width = 75
      Height = 25
      Caption = 'G O !'
      OnClick = sBtnGoClick
    end
    object BitBtn1: TBitBtn
      Left = 770
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
  end
  object dbgrOpk: TDBGrid
    Left = 0
    Top = 31
    Width = 847
    Height = 133
    Align = alTop
    DataSource = dsrcOpk
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbgrZNdb: TDBGrid
    Left = 0
    Top = 164
    Width = 847
    Height = 207
    Align = alClient
    DataSource = dsrcZPere
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qryOpk: TQuery
    DatabaseName = '__U_104'
    SQL.Strings = (
      'Select * from Pere_104')
    Left = 40
    Top = 72
  end
  object dsrcOpk: TDataSource
    DataSet = qryOpk
    Left = 56
    Top = 88
  end
  object qryZPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Pere'
      'where NR = -1')
    UpdateObject = updZPere
    Left = 296
    Top = 168
    object qryZPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryZPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object qryZPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object qryZPereDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
    end
    object qryZPereKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
    end
    object qryZPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
    end
    object qryZPerePRCWRKTIME: TFloatField
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.PRCWRKTIME'
    end
    object qryZPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
    end
    object qryZPereOKLTRF: TFloatField
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
    end
    object qryZPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object qryZPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object qryZPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object qryZPereDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryZPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object qryZPerePR_PENS: TSmallintField
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object qryZPereSOVM: TSmallintField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
    end
    object qryZPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
    end
    object qryZPerePROCLG: TFloatField
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object qryZPereKOLMIN: TSmallintField
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object qryZPerePRFS: TSmallintField
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object qryZPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryZPereDT_PRIKAZA: TDateTimeField
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
    end
    object qryZPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object qryZPereINV: TSmallintField
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object qryZPereRANG: TSmallintField
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object qryZPereRAZR: TSmallintField
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object qryZPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
    end
    object qryZPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object qryZPerePRDEKR: TStringField
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryZPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryZPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
  end
  object updZPere: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Pere'
      'set'
      '  KDSPS = :KDSPS,'
      '  TABN = :TABN,'
      '  DT_BEG = :DT_BEG,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
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
      '  SPEC_NR = :SPEC_NR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Pere'
      
        '  (KDSPS, TABN, DT_BEG, KDOBJ, KDKATP, PRCWRKTIME, SO, OKLTRF, A' +
        'VANS, SP_AV, '
      
        '   KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM, PDNLG, PROCLG, KOLMI' +
        'N, PRFS, '
      
        '   NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RANG, RAZR, DT_END, OLDKD' +
        'OBJ, PRDEKR, '
      '   CMBOKL, SPEC_NR)'
      'values'
      
        '  (:KDSPS, :TABN, :DT_BEG, :KDOBJ, :KDKATP, :PRCWRKTIME, :SO, :O' +
        'KLTRF, '
      
        '   :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :PR_PENS, :SOVM,' +
        ' :PDNLG, '
      
        '   :PROCLG, :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIKAZA, :NOTES, :I' +
        'NV, :RANG, '
      '   :RAZR, :DT_END, :OLDKDOBJ, :PRDEKR, :CMBOKL, :SPEC_NR)')
    DeleteSQL.Strings = (
      'delete from Z_Pere'
      'where'
      '  NR = :OLD_NR')
    Left = 328
    Top = 192
  end
  object dsrcZPere: TDataSource
    DataSet = qryZPere
    Left = 312
    Top = 176
  end
  object qryOpkUpi: TQuery
    DatabaseName = '_AddOpk'
    SQL.Strings = (
      'Select * from Opk_Upi order by NewTabN')
    Left = 568
    Top = 104
  end
  object qryOVK: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from TK_OVK')
    Left = 423
    Top = 105
  end
  object qryKvd: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from TK_KVD'
      'order by OldVidN')
    Left = 376
    Top = 104
  end
end
