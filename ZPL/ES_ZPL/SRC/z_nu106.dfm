object FormNu106: TFormNu106
  Left = 298
  Top = 119
  Width = 790
  Height = 843
  Caption = 'FormNu106'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 548
    Top = 34
    Height = 782
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 34
    Width = 548
    Height = 782
    Align = alLeft
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
    Width = 782
    Height = 34
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 3
      Top = 3
      Width = 81
      Height = 29
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1058#1072#1073#1085#39#1099' '#1074' otkl_106 '#1085#1072' '#1085#1086#1074#1099#1077
      Caption = 'Go'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object Panel2: TPanel
    Left = 551
    Top = 34
    Width = 231
    Height = 782
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 0
      Top = 313
      Width = 231
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object dbgrUpi106: TDBGrid
      Left = 0
      Top = 0
      Width = 231
      Height = 313
      Align = alTop
      DataSource = dsrcUpi106
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 316
      Width = 231
      Height = 466
      Align = alClient
      DataSource = dsrcKvd106
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object qry1: TQuery
    DatabaseName = 'd_106'
    SQL.Strings = (
      'Select * from nu_00_05'
      '        order by TabN')
    Left = 40
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 56
    Top = 144
  end
  object qryUpi106: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select Tabn_new, tabn, tabn110'
      ' from upi_106'
      'order by tabn_new')
    Left = 616
    Top = 104
  end
  object dsrcUpi106: TDataSource
    Left = 632
    Top = 120
  end
  object qryKvd106: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select VidN, newVidN'
      ' from kvd_106'
      'order by VidN'
      ' ')
    Left = 615
    Top = 282
  end
  object dsrcKvd106: TDataSource
    Left = 632
    Top = 296
  end
  object qryZNU: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_NU'
      'where tabn = -1')
    UpdateObject = updZNU
    Left = 112
    Top = 296
  end
  object updZNU: TUpdateSQL
    ModifySQL.Strings = (
      'update z_NU'
      'set'
      '  DTPROC = :DTPROC,'
      '  ZAMESGOD = :ZAMESGOD,'
      '  TABN = :TABN,'
      '  VIDN = :VIDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  DT_BEG = :DT_BEG,'
      '  DT_END = :DT_END,'
      '  KDSPS = :KDSPS,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  PDN = :PDN,'
      '  NOTES = :NOTES,'
      '  PRR = :PRR,'
      '  PRPV = :PRPV,'
      '  KTO = :KTO,'
      '  PRKR = :PRKR,'
      '  MYNOTES = :MYNOTES,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  OLDKDVIDN = :OLDKDVIDN'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_NU'
      '  (DTPROC, ZAMESGOD, TABN, VIDN, CHAS, SUMMA, DT_BEG, DT_END, '
      '   KDSPS, KDOBJ, KDKATP, PDN, NOTES, PRR, PRPV, KTO, PRKR, '
      '   MYNOTES, OLDKDOBJ, OLDKDVIDN)'
      'values'
      
        '  (:DTPROC, :ZAMESGOD, :TABN, :VIDN, :CHAS, :SUMMA, :DT_BEG, :DT' +
        '_END, '
      
        '   :KDSPS, :KDOBJ, :KDKATP, :PDN, :NOTES, :PRR, :PRPV, :KTO, :PR' +
        'KR,     '
      '   :MYNOTES, :OLDKDOBJ, :OLDKDVIDN)')
    DeleteSQL.Strings = (
      'delete from z_NU'
      'where'
      '  NR = :OLD_NR')
    Left = 128
    Top = 312
  end
end
