object FormAddNu104: TFormAddNu104
  Left = 295
  Top = 123
  Width = 990
  Height = 876
  Caption = 'FormAddNu104'
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
    Width = 982
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      982
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
      Left = 902
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
    Width = 982
    Height = 818
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
        FieldName = 'NR'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdObj'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewTabN'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewVidN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdSbu'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 33
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obj'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ved'
        Width = 27
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
        Width = 35
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
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZatr'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otkuda'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prr'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrPV'
        Width = 33
        Visible = True
      end>
  end
  object qryOld: TQuery
    DatabaseName = '_NichAdd'
    SQL.Strings = (
      'Select * from n_nu3')
    Left = 80
    Top = 96
    object qryOldNR: TIntegerField
      FieldName = 'NR'
      Origin = '_NICHADD."n_nu3.DB".NR'
    end
    object qryOldNewKdObj: TSmallintField
      FieldName = 'NewKdObj'
      Origin = '_NICHADD."n_nu3.DB".NewKdObj'
    end
    object qryOldNewTabN: TIntegerField
      FieldName = 'NewTabN'
      Origin = '_NICHADD."n_nu3.DB".NewTabN'
    end
    object qryOldNewVidN: TStringField
      FieldName = 'NewVidN'
      Origin = '_NICHADD."n_nu3.DB".NewVidN'
      Size = 4
    end
    object qryOldNewKdSbu: TSmallintField
      FieldName = 'NewKdSbu'
      Origin = '_NICHADD."n_nu3.DB".NewKdSbu'
    end
    object qryOldTabN: TSmallintField
      FieldName = 'TabN'
      Origin = '_NICHADD."n_nu3.DB".TabN'
    end
    object qryOldDtProc: TDateField
      FieldName = 'DtProc'
      Origin = '_NICHADD."n_nu3.DB".DtProc'
    end
    object qryOldZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      Origin = '_NICHADD."n_nu3.DB".ZaMesGod'
    end
    object qryOldObj: TSmallintField
      FieldName = 'Obj'
      Origin = '_NICHADD."n_nu3.DB".Obj'
    end
    object qryOldVed: TSmallintField
      FieldName = 'Ved'
      Origin = '_NICHADD."n_nu3.DB".Ved'
    end
    object qryOldDt_Beg: TDateField
      FieldName = 'Dt_Beg'
      Origin = '_NICHADD."n_nu3.DB".Dt_Beg'
    end
    object qryOldDt_End: TDateField
      FieldName = 'Dt_End'
      Origin = '_NICHADD."n_nu3.DB".Dt_End'
    end
    object qryOldVidN: TSmallintField
      FieldName = 'VidN'
      Origin = '_NICHADD."n_nu3.DB".VidN'
    end
    object qryOldPdn: TSmallintField
      FieldName = 'Pdn'
      Origin = '_NICHADD."n_nu3.DB".Pdn'
    end
    object qryOldChas: TFloatField
      FieldName = 'Chas'
      Origin = '_NICHADD."n_nu3.DB".Chas'
    end
    object qryOldSumma: TFloatField
      FieldName = 'Summa'
      Origin = '_NICHADD."n_nu3.DB".Summa'
    end
    object qryOldSZatr: TStringField
      FieldName = 'SZatr'
      Origin = '_NICHADD."n_nu3.DB".SZatr'
      Size = 8
    end
    object qryOldOtkuda: TStringField
      FieldName = 'Otkuda'
      Origin = '_NICHADD."n_nu3.DB".Otkuda'
      Size = 13
    end
    object qryOldPrr: TSmallintField
      FieldName = 'Prr'
      Origin = '_NICHADD."n_nu3.DB".Prr'
    end
    object qryOldPrPV: TSmallintField
      FieldName = 'PrPV'
      Origin = '_NICHADD."n_nu3.DB".PrPV'
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
      'Select  first 1 * from Z_NU')
    Left = 88
    Top = 192
  end
end
