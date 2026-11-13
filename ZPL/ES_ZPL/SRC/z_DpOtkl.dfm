object FormAddOtkl: TFormAddOtkl
  Left = 312
  Top = 163
  Width = 863
  Height = 640
  Caption = 'FormAddOtkl'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 31
    Width = 855
    Height = 582
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Go !!!'
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 778
      Top = 3
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
    end
  end
  object Query1: TQuery
    DatabaseName = '_TEMP'
    SQL.Strings = (
      'Select * from ToOtkl'
      '')
    Left = 48
    Top = 72
    object Query1NR: TFloatField
      FieldName = 'NR'
      Origin = '_TEMP."TOOTKL.DBF".NR'
    end
    object Query1TABN: TFloatField
      FieldName = 'TABN'
      Origin = '_TEMP."TOOTKL.DBF".TABN'
    end
    object Query1FAM: TStringField
      FieldName = 'FAM'
      Origin = '_TEMP."TOOTKL.DBF".FAM'
      Size = 9
    end
    object Query1IMA: TStringField
      FieldName = 'IMA'
      Origin = '_TEMP."TOOTKL.DBF".IMA'
      Size = 9
    end
    object Query1OTCH: TStringField
      FieldName = 'OTCH'
      Origin = '_TEMP."TOOTKL.DBF".OTCH'
      Size = 9
    end
    object Query1DTPROC: TDateField
      FieldName = 'DTPROC'
      Origin = '_TEMP."TOOTKL.DBF".DTPROC'
    end
    object Query1SMM: TFloatField
      FieldName = 'SMM'
      Origin = '_TEMP."TOOTKL.DBF".SMM'
    end
    object Query1PRP: TFloatField
      FieldName = 'PRP'
      Origin = '_TEMP."TOOTKL.DBF".PRP'
    end
    object Query1PFIND: TFloatField
      FieldName = 'PFIND'
      Origin = '_TEMP."TOOTKL.DBF".PFIND'
    end
  end
  object Query2: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Otkl')
    UpdateObject = UpdateSQL1
    Left = 88
    Top = 216
    object Query2NR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_OTKL.NR'
    end
    object Query2KDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_OTKL.KDSPS'
    end
    object Query2DTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_OTKL.DTPROC'
    end
    object Query2ZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      Origin = 'DbMain.Z_OTKL.ZAMESGOD'
    end
    object Query2TABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_OTKL.TABN'
    end
    object Query2VIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_OTKL.VIDN'
      FixedChar = True
      Size = 4
    end
    object Query2OLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_OTKL.OLDKDVIDN'
    end
    object Query2CHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_OTKL.CHAS'
    end
    object Query2SUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_OTKL.SUMMA'
    end
    object Query2OLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_OTKL.OLDKDOBJ'
    end
    object Query2KDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_OTKL.KDOBJ'
    end
    object Query2KDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_OTKL.KDKATP'
    end
    object Query2DT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_OTKL.DT_BEG'
    end
    object Query2DT_END: TDateTimeField
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_OTKL.DT_END'
    end
    object Query2PDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_OTKL.PDN'
    end
    object Query2KDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_OTKL.KDSPZ'
    end
    object Query2NOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_OTKL.NOTES'
      Size = 25
    end
    object Query2PRR: TSmallintField
      FieldName = 'PRR'
      Origin = 'DbMain.Z_OTKL.PRR'
    end
    object Query2PRPV: TSmallintField
      FieldName = 'PRPV'
      Origin = 'DbMain.Z_OTKL.PRPV'
    end
    object Query2KTO: TSmallintField
      FieldName = 'KTO'
      Origin = 'DbMain.Z_OTKL.KTO'
    end
    object Query2PRKR: TSmallintField
      FieldName = 'PRKR'
      Origin = 'DbMain.Z_OTKL.PRKR'
    end
    object Query2SPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_OTKL.SPEC_NR'
    end
    object Query2DTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
      Origin = 'DbMain.Z_OTKL.DTVDPV'
    end
    object Query2NRVDPV: TIntegerField
      FieldName = 'NRVDPV'
      Origin = 'DbMain.Z_OTKL.NRVDPV'
    end
    object Query2MYNOTES: TStringField
      FieldName = 'MYNOTES'
      Origin = 'DbMain.Z_OTKL.MYNOTES'
      Size = 25
    end
    object Query2SPECPS: TIntegerField
      FieldName = 'SPECPS'
      Origin = 'DbMain.Z_OTKL.SPECPS'
    end
    object Query2PBNK: TSmallintField
      FieldName = 'PBNK'
      Origin = 'DbMain.Z_OTKL.PBNK'
    end
    object Query2STORN: TStringField
      FieldName = 'STORN'
      Origin = 'DbMain.Z_OTKL.STORN'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 64
    Top = 88
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update z_Otkl'
      'set'
      '  KDSPS = :KDSPS,'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  OLDKDVIDN = :OLDKDVIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  OLDKDOBJ = :OLDKDOBJ,'
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
      '  STORN = :STORN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_Otkl'
      
        '  (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, OLDKDVIDN, CHAS, SUMMA, ' +
        'OLDKDOBJ, '
      
        '   KDOBJ, KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, PRR, PRPV, ' +
        'KTO, PRKR, '
      '   SPEC_NR, DTVDPV, NRVDPV, MYNOTES, SPECPS, PBNK, STORN)'
      'values'
      
        '  (:KDSPS, :DTPROC, :ZAMESGOD, :TABN, :VIDN, :OLDKDVIDN, :CHAS, ' +
        ':SUMMA, '
      
        '   :OLDKDOBJ, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :' +
        'NOTES, '
      
        '   :PRR, :PRPV, :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTE' +
        'S, :SPECPS, '
      '   :PBNK, :STORN)')
    DeleteSQL.Strings = (
      'delete from z_Otkl'
      'where'
      '  NR = :OLD_NR')
    Left = 104
    Top = 232
  end
end
