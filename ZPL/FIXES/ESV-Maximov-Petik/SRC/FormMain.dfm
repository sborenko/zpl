object FrmMain: TFrmMain
  Left = 247
  Top = 153
  Width = 756
  Height = 353
  Caption = 'Fix'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 641
    Height = 289
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BtnFix: TBitBtn
    Left = 664
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Fix'
    TabOrder = 1
    OnClick = BtnFixClick
  end
  object Database: TDatabase
    AliasName = 'Es_Opi'
    Connected = True
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'user=sysdba')
    SessionName = 'Default'
    Left = 680
    Top = 8
  end
  object Query: TQuery
    CachedUpdates = True
    SQL.Strings = (
      'select first 1 * from z_nu where 1 = 0')
    UpdateObject = UpdateSQL
    Left = 680
    Top = 48
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update z_nu'
      'set'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  GRP = :GRP,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  KDSPZ = :KDSPZ,'
      '  OZN_PILG = :OZN_PILG,'
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
      '  STORN = :STORN,'
      '  PLG = :PLG,'
      '  KDBNK = :KDBNK,'
      '  KDTEMU = :KDTEMU,'
      '  SOVM = :SOVM'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_nu'
      
        '  (DTPROC, ZAMESGOD, TABN, VIDN, GRP, CHAS, SUMMA, DT_BEG, DT_EN' +
        'D, '
      'KDSPS, '
      
        '   KDOBJ, KDKATP, KDSPZ, OZN_PILG, PDN, NOTES, PRR, PRPV, KTO, P' +
        'RKR, '
      'MYNOTES, '
      '   SPECPS, SPEC_NR, OLDKDOBJ, OLDKDVIDN, DTVDPV, NRVDPV, STORN, '
      'PLG, KDBNK, '
      '   KDTEMU, SOVM)'
      'values'
      
        '  (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :GRP, :CHAS, :SUMMA, :DT_BE' +
        'G, '
      ':DT_END, '
      
        '   :KDSPS, :KDOBJ, :KDKATP, :KDSPZ, :OZN_PILG, :PDN, :NOTES, :PR' +
        'R, :PRPV, '
      
        '   :KTO, :PRKR, :MYNOTES, :SPECPS, :SPEC_NR, :OLDKDOBJ, :OLDKDVI' +
        'DN, '
      ':DTVDPV, '
      '   :NRVDPV, :STORN, :PLG, :KDBNK, :KDTEMU, :SOVM)')
    DeleteSQL.Strings = (
      'delete from z_nu'
      'where'
      '  NR = :OLD_NR')
    Left = 696
    Top = 64
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 712
    Top = 80
  end
end
