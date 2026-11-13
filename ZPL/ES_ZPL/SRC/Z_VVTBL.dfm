object FormVvTbl: TFormVvTbl
  Left = 286
  Top = 183
  Width = 561
  Height = 463
  Caption = 'FormVvTbl'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    553
    436)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrTab: TDBGrid
    Left = 0
    Top = 40
    Width = 553
    Height = 394
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcTab
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDVIDN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 50
        Visible = True
      end>
  end
  object qryTab: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Tabel')
    UpdateObject = updTab
    Left = 24
    Top = 88
    object qryTabNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_TABEL.NR'
    end
    object qryTabDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_TABEL.DTPROC'
    end
    object qryTabTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_TABEL.TABN'
    end
    object qryTabKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_TABEL.KDOBJ'
    end
    object qryTabKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_TABEL.KDKATP'
    end
    object qryTabDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_TABEL.DT_BEG'
    end
    object qryTabKDVIDN: TSmallintField
      FieldName = 'KDVIDN'
      Origin = 'DbMain.Z_TABEL.KDVIDN'
    end
    object qryTabPDN: TSmallintField
      FieldName = 'PDN'
      Origin = 'DbMain.Z_TABEL.PDN'
    end
    object qryTabCHAS: TFloatField
      FieldName = 'CHAS'
      Origin = 'DbMain.Z_TABEL.CHAS'
    end
    object qryTabSUMMA: TFloatField
      FieldName = 'SUMMA'
      Origin = 'DbMain.Z_TABEL.SUMMA'
    end
    object qryTabSPZ: TStringField
      FieldName = 'SPZ'
      Origin = 'DbMain.Z_TABEL.SPZ'
      Size = 10
    end
    object qryTabNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_TABEL.NOTES'
      Size = 13
    end
    object qryTabShVidN: TStringField
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupKeyFields = 'KDVIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'KDVIDN'
      Lookup = True
    end
  end
  object dsrcTab: TDataSource
    DataSet = qryTab
    Left = 40
    Top = 104
  end
  object updTab: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Tabel'
      'set'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  KDOBJ = :KDOBJ,'
      '  KDVED = :KDVED,'
      '  KDBRIG = :KDBRIG,'
      '  KDKATP = :KDKATP,'
      '  DT_BEG = :DT_BEG,'
      '  KDVIDN = :KDVIDN,'
      '  PDN = :PDN,'
      '  CHAS = :CHAS,'
      '  SUMMA = :SUMMA,'
      '  SPZ = :SPZ,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Tabel'
      
        '  (DTPROC, TABN, KDOBJ, KDVED, KDBRIG, KDKATP, DT_BEG, KDVIDN, P' +
        'DN, '
      'CHAS, '
      '   SUMMA, SPZ, NOTES)'
      'values'
      
        '  (:DTPROC, :TABN, :KDOBJ, :KDVED, :KDBRIG, :KDKATP, :DT_BEG, :K' +
        'DVIDN, '
      '   :PDN, :CHAS, :SUMMA, :SPZ, :NOTES)')
    DeleteSQL.Strings = (
      'delete from Z_Tabel'
      'where'
      '  NR = :OLD_NR')
    Left = 56
    Top = 120
  end
end
