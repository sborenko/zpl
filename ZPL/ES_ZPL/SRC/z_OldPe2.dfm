object FormRemontPere: TFormRemontPere
  Left = 303
  Top = 124
  Width = 700
  Height = 582
  BorderIcons = [biSystemMenu]
  Caption = 'FormRemontPere'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrOldPere: TDBGrid
    Left = 0
    Top = 30
    Width = 692
    Height = 525
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcOldPere
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJ'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VED'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRIG'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DROJD'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KATPREM'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 11
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DPRIEM'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUVOLN'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 5
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKP'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKP'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKU'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKU'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKAZA'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKAZA'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZR'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RANG'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVALID'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_PENS'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOVM'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZATRO'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRFOLD'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AVANS'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ND'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDNLG'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLMIN'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSNLG'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STR'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SBERK'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KRD'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALM'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISPL'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEREVOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSUDA'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRFS'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRUDERG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRUV'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D13ZP'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DVUSL'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRDPRM91'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEKR'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LS'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LGOTA'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN_1'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJ_1'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VED_1'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_1'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF_1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZATR'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KAT'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST_1'
        Width = 72
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      692
      30)
    object sBtnGo: TSpeedButton
      Left = 5
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100'!'
      OnClick = sBtnGoClick
    end
    object Label1: TLabel
      Left = 88
      Top = 9
      Width = 429
      Height = 13
      Caption = 
        #1041#1091#1076#1077#1090' '#1087#1088#1086#1074#1077#1076#1077#1085#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1097#1080#1093' '#1074' '#1041#1044' '#1085#1086#1074#1086 +
        #1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    end
    object bBtnCancel: TBitBtn
      Left = 615
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryOldPere: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'select * from pere2'
      'where tabn > 0 '
      'order by TabN, Dt_Beg, NR')
    Left = 92
    Top = 178
    object qryOldPereNR: TFloatField
      FieldName = 'NR'
      Origin = 'D_01."pere2.DBF".NR'
    end
    object qryOldPereTABN: TFloatField
      FieldName = 'TABN'
      Origin = 'D_01."pere2.DBF".TABN'
    end
    object qryOldPereDT_BEG: TDateField
      FieldName = 'DT_BEG'
      Origin = 'D_01."pere2.DBF".DT_BEG'
    end
    object qryOldPereDT_END: TDateField
      FieldName = 'DT_END'
      Origin = 'D_01."pere2.DBF".DT_END'
    end
    object qryOldPereOBJ: TSmallintField
      FieldName = 'OBJ'
      Origin = 'D_01."pere2.DBF".OBJ'
    end
    object qryOldPereVED: TSmallintField
      FieldName = 'VED'
      Origin = 'D_01."pere2.DBF".VED'
    end
    object qryOldPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'D_01."pere2.DBF".SO'
    end
    object qryOldPereOKLTRF: TFloatField
      FieldName = 'OKLTRF'
      Origin = 'D_01."pere2.DBF".OKLTRF'
    end
    object qryOldPereSZATR: TStringField
      FieldName = 'SZATR'
      Origin = 'D_01."pere2.DBF".SZATR'
      Size = 8
    end
    object qryOldPereKAT: TSmallintField
      FieldName = 'KAT'
      Origin = 'D_01."pere2.DBF".KAT'
    end
    object qryOldPereDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'D_01."pere2.DBF".DOLGNOST'
    end
    object qryOldPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'D_01."pere2.DBF".NR_PRIKAZA'
      Size = 10
    end
    object qryOldPereDT_PRIKAZA: TDateField
      FieldName = 'DT_PRIKAZA'
      Origin = 'D_01."pere2.DBF".DT_PRIKAZA'
    end
  end
  object dsrcOldPere: TDataSource
    DataSet = qryOldPere
    Left = 104
    Top = 192
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    Left = 204
    Top = 178
  end
  object qryOZS: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'Select * from z_OZS')
    Left = 320
    Top = 248
  end
  object qryPere: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Pere')
    UpdateObject = updPere
    Left = 188
    Top = 370
    object qryPereNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PERE.NR'
    end
    object qryPereKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_PERE.KDSPS'
    end
    object qryPereTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_PERE.TABN'
    end
    object qryPereDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_PERE.DT_BEG'
    end
    object qryPereKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_PERE.KDOBJ'
    end
    object qryPereKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_PERE.KDKATP'
    end
    object qryPerePRCWRKTIME: TFloatField
      FieldName = 'PRCWRKTIME'
      Origin = 'DbMain.Z_PERE.PRCWRKTIME'
    end
    object qryPereSO: TSmallintField
      FieldName = 'SO'
      Origin = 'DbMain.Z_PERE.SO'
    end
    object qryPereOKLTRF: TFloatField
      FieldName = 'OKLTRF'
      Origin = 'DbMain.Z_PERE.OKLTRF'
    end
    object qryPereAVANS: TFloatField
      FieldName = 'AVANS'
      Origin = 'DbMain.Z_PERE.AVANS'
    end
    object qryPereSP_AV: TStringField
      FieldName = 'SP_AV'
      Origin = 'DbMain.Z_PERE.SP_AV'
      Size = 1
    end
    object qryPereKDDOLGN: TSmallintField
      FieldName = 'KDDOLGN'
      Origin = 'DbMain.Z_PERE.KDDOLGN'
    end
    object qryPereDOLGNOST: TStringField
      FieldName = 'DOLGNOST'
      Origin = 'DbMain.Z_PERE.DOLGNOST'
      Size = 40
    end
    object qryPereKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_PERE.KDSPZ'
    end
    object qryPerePR_PENS: TSmallintField
      FieldName = 'PR_PENS'
      Origin = 'DbMain.Z_PERE.PR_PENS'
    end
    object qryPereSOVM: TSmallintField
      FieldName = 'SOVM'
      Origin = 'DbMain.Z_PERE.SOVM'
    end
    object qryPerePDNLG: TSmallintField
      FieldName = 'PDNLG'
      Origin = 'DbMain.Z_PERE.PDNLG'
    end
    object qryPerePROCLG: TFloatField
      FieldName = 'PROCLG'
      Origin = 'DbMain.Z_PERE.PROCLG'
    end
    object qryPereKOLMIN: TSmallintField
      FieldName = 'KOLMIN'
      Origin = 'DbMain.Z_PERE.KOLMIN'
    end
    object qryPerePRFS: TSmallintField
      FieldName = 'PRFS'
      Origin = 'DbMain.Z_PERE.PRFS'
    end
    object qryPereNR_PRIKAZA: TStringField
      FieldName = 'NR_PRIKAZA'
      Origin = 'DbMain.Z_PERE.NR_PRIKAZA'
      Size = 10
    end
    object qryPereDT_PRIKAZA: TDateTimeField
      FieldName = 'DT_PRIKAZA'
      Origin = 'DbMain.Z_PERE.DT_PRIKAZA'
    end
    object qryPereNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PERE.NOTES'
      Size = 35
    end
    object qryPereINV: TSmallintField
      FieldName = 'INV'
      Origin = 'DbMain.Z_PERE.INV'
    end
    object qryPereRANG: TSmallintField
      FieldName = 'RANG'
      Origin = 'DbMain.Z_PERE.RANG'
    end
    object qryPereRAZR: TSmallintField
      FieldName = 'RAZR'
      Origin = 'DbMain.Z_PERE.RAZR'
    end
    object qryPereDT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_PERE.DT_END'
    end
    object qryPereOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_PERE.OLDKDOBJ'
    end
    object qryPerePRDEKR: TStringField
      FieldName = 'PRDEKR'
      Origin = 'DbMain.Z_PERE.PRDEKR'
      FixedChar = True
      Size = 1
    end
    object qryPereCMBOKL: TStringField
      FieldName = 'CMBOKL'
      Origin = 'DbMain.Z_PERE.CMBOKL'
      FixedChar = True
      Size = 1
    end
    object qryPereSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_PERE.SPEC_NR'
    end
  end
  object updPere: TUpdateSQL
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
    Left = 200
    Top = 384
  end
  object qryOVK: TQuery
    DatabaseName = 'D_01'
    SQL.Strings = (
      'Select * from Z_OVK')
    Left = 352
    Top = 248
    object qryOVKOBJ: TSmallintField
      FieldName = 'OBJ'
      Origin = 'D_01."Z_OVK.DBF".OBJ'
    end
    object qryOVKVED: TSmallintField
      FieldName = 'VED'
      Origin = 'D_01."Z_OVK.DBF".VED'
    end
    object qryOVKKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'D_01."Z_OVK.DBF".KDOBJ'
    end
    object qryOVKNEWKDOBJ: TSmallintField
      FieldName = 'NEWKDOBJ'
      Origin = 'D_01."Z_OVK.DBF".NEWKDOBJ'
    end
    object qryOVKNAIMENOV: TStringField
      FieldName = 'NAIMENOV'
      Origin = 'D_01."Z_OVK.DBF".NAIMENOV'
      Size = 35
    end
    object qryOVKSOKRNAIM: TStringField
      FieldName = 'SOKRNAIM'
      Origin = 'D_01."Z_OVK.DBF".SOKRNAIM'
      Size = 15
    end
  end
  object qryMetka: TQuery
    Left = 144
    Top = 120
  end
end
