object FormAddSpsOpk: TFormAddSpsOpk
  Left = 357
  Top = 346
  Width = 725
  Height = 306
  Caption = 'FormAddSpsOpk'
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
    Width = 717
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      717
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
      Left = 640
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
    Width = 717
    Height = 133
    Align = alTop
    DataSource = dsrcOpk
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewTabN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRIG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAMIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REC'
        Visible = True
      end>
  end
  object dbgrZNdb: TDBGrid
    Left = 0
    Top = 164
    Width = 717
    Height = 115
    Align = alClient
    DataSource = dsrcZ
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qryOpk: TQuery
    DatabaseName = '_AddOpk'
    SQL.Strings = (
      'Select * from Opk_Sps'
      'order by DtProc, NewTabN')
    Left = 40
    Top = 72
    object qryOpkNR: TIntegerField
      FieldName = 'NR'
      Origin = '_ADDOPK."Opk_Sps.DB".NR'
    end
    object qryOpkNewTabN: TIntegerField
      FieldName = 'NewTabN'
      Origin = '_ADDOPK."Opk_Sps.DB".NewTabN'
    end
    object qryOpkDTPROC: TDateField
      FieldName = 'DTPROC'
      Origin = '_ADDOPK."Opk_Sps.DB".DTPROC'
    end
    object qryOpkOBJ: TSmallintField
      FieldName = 'OBJ'
      Origin = '_ADDOPK."Opk_Sps.DB".OBJ'
    end
    object qryOpkNCH: TStringField
      FieldName = 'NCH'
      Origin = '_ADDOPK."Opk_Sps.DB".NCH'
      Size = 1
    end
    object qryOpkVED: TSmallintField
      FieldName = 'VED'
      Origin = '_ADDOPK."Opk_Sps.DB".VED'
    end
    object qryOpkBRIG: TSmallintField
      FieldName = 'BRIG'
      Origin = '_ADDOPK."Opk_Sps.DB".BRIG'
    end
    object qryOpkTabN: TFloatField
      FieldName = 'TabN'
      Origin = '_ADDOPK."Opk_Sps.DB".TabN'
    end
    object qryOpkFAMIO: TStringField
      FieldName = 'FAMIO'
      Origin = '_ADDOPK."Opk_Sps.DB".FAMIO'
    end
    object qryOpkREC: TFloatField
      FieldName = 'REC'
      Origin = '_ADDOPK."Opk_Sps.DB".REC'
    end
  end
  object dsrcOpk: TDataSource
    DataSet = qryOpk
    Left = 56
    Top = 88
  end
  object qryZ: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Z_Sps'
      'where NR = -1')
    UpdateObject = updZ
    Left = 296
    Top = 168
    object qryZNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_SPS.NR'
    end
    object qryZKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_SPS.KDSPS'
    end
    object qryZNCH: TStringField
      FieldName = 'NCH'
      Origin = 'DbMain.Z_SPS.NCH'
      FixedChar = True
      Size = 1
    end
    object qryZDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_SPS.DTPROC'
    end
    object qryZTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_SPS.TABN'
    end
    object qryZKDOBJ: TSmallintField
      FieldName = 'KDOBJ'
      Origin = 'DbMain.Z_SPS.KDOBJ'
    end
    object qryZKDKATP: TSmallintField
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_SPS.KDKATP'
    end
    object qryZNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_SPS.NOTES'
      Size = 35
    end
    object qryZOLDKDOBJ: TSmallintField
      FieldName = 'OLDKDOBJ'
      Origin = 'DbMain.Z_SPS.OLDKDOBJ'
    end
  end
  object updZ: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Sps'
      'set'
      '  KDSPS = :KDSPS,'
      '  NCH = :NCH,'
      '  DTPROC = :DTPROC,'
      '  TABN = :TABN,'
      '  KDOBJ = :KDOBJ,'
      '  KDKATP = :KDKATP,'
      '  NOTES = :NOTES,'
      '  OLDKDOBJ = :OLDKDOBJ,'
      '  ARMS = :ARMS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Sps'
      
        '  (KDSPS, NCH, DTPROC, TABN, KDOBJ, KDKATP, NOTES, OLDKDOBJ, ARM' +
        'S)'
      'values'
      
        '  (:KDSPS, :NCH, :DTPROC, :TABN, :KDOBJ, :KDKATP, :NOTES, :OLDKD' +
        'OBJ, :ARMS)')
    DeleteSQL.Strings = (
      'delete from Z_Sps'
      'where'
      '  NR = :OLD_NR')
    Left = 328
    Top = 192
  end
  object dsrcZ: TDataSource
    DataSet = qryZ
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
  object qryInSps: TQuery
    Left = 216
    Top = 80
  end
end
