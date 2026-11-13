object FormAddOtkl104: TFormAddOtkl104
  Left = 294
  Top = 193
  Width = 855
  Height = 373
  Caption = 'FormAddOtkl104'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Go !!!'
      OnClick = sBtnGoClick
    end
    object bBtnCancel: TBitBtn
      Left = 767
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrOldNu: TDBGrid
    Left = 0
    Top = 31
    Width = 847
    Height = 315
    Align = alClient
    DataSource = dsrcOldNu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewTabN'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewVidN'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdSbu'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdObj'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtProc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZaMesGod'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obj'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ved'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt_Beg'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt_End'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pdn'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chas'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZatr'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otkuda'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrPV'
        Width = 30
        Visible = True
      end>
  end
  object qryOld: TQuery
    DatabaseName = '_NichAdd'
    SQL.Strings = (
      'Select *  from n_Ot'
      'order by TabN, DtProc, VidN')
    Left = 80
    Top = 96
    object qryOldTabN: TFloatField
      FieldName = 'TabN'
      Origin = '_NICHADD."n_Ot.DB".TabN'
    end
    object qryOldNewTabN: TIntegerField
      FieldName = 'NewTabN'
    end
    object qryOldNewVidN: TStringField
      FieldName = 'NewVidN'
      Size = 4
    end
    object qryOldNewKdSbu: TSmallintField
      FieldName = 'NewKdSbu'
    end
    object qryOldNewKdObj: TSmallintField
      FieldName = 'NewKdObj'
    end
    object qryOldDtProc: TDateField
      FieldName = 'DtProc'
    end
    object qryOldZaMesGod: TDateField
      FieldName = 'ZaMesGod'
    end
    object qryOldObj: TSmallintField
      FieldName = 'Obj'
    end
    object qryOldVed: TSmallintField
      FieldName = 'Ved'
      Origin = '_NICHADD."n_Ot.DB".Ved'
    end
    object qryOldDt_Beg: TDateField
      FieldName = 'Dt_Beg'
    end
    object qryOldDt_End: TDateField
      FieldName = 'Dt_End'
    end
    object qryOldVidN: TSmallintField
      FieldName = 'VidN'
    end
    object qryOldPdn: TSmallintField
      FieldName = 'Pdn'
    end
    object qryOldChas: TFloatField
      FieldName = 'Chas'
    end
    object qryOldSumma: TFloatField
      FieldName = 'Summa'
    end
    object qryOldSZatr: TStringField
      FieldName = 'SZatr'
      Size = 8
    end
    object qryOldOtkuda: TStringField
      FieldName = 'Otkuda'
      Size = 13
    end
    object qryOldPrPV: TSmallintField
      FieldName = 'PrPV'
    end
  end
  object dsrcOldNu: TDataSource
    DataSet = qryOld
    Left = 96
    Top = 112
  end
  object qryNew: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      '')
    Left = 152
    Top = 136
  end
end
