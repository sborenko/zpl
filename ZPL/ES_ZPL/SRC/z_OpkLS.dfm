object FormOpkLS: TFormOpkLS
  Left = 379
  Top = 106
  Width = 694
  Height = 864
  Caption = 'FormOpkLS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrOpkLS: TDBGrid
    Left = 0
    Top = 31
    Width = 686
    Height = 806
    Align = alClient
    DataSource = dsrcOpkLS
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
    Width = 686
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 1
    DesignSize = (
      686
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = 'GO !'
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 604
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryOpkLS: TQuery
    Active = True
    DatabaseName = '_Add_OPK'
    SQL.Strings = (
      'select * from ls_Zero')
    Left = 120
    Top = 80
    object qryOpkLSz_TabN: TIntegerField
      FieldName = 'z_TabN'
      Origin = '_ADD_OPK."ls_Zero.DB".z_TabN'
    end
    object qryOpkLSNewTabN: TIntegerField
      FieldName = 'NewTabN'
      Origin = '_ADD_OPK."ls_Zero.DB".NewTabN'
    end
    object qryOpkLSTabN: TFloatField
      FieldName = 'TabN'
      Origin = '_ADD_OPK."ls_Zero.DB".TabN'
    end
    object qryOpkLSFam: TStringField
      FieldName = 'Fam'
      Origin = '_ADD_OPK."ls_Zero.DB".Fam'
    end
    object qryOpkLSIma: TStringField
      FieldName = 'Ima'
      Origin = '_ADD_OPK."ls_Zero.DB".Ima'
      Size = 15
    end
    object qryOpkLSOtch: TStringField
      FieldName = 'Otch'
      Origin = '_ADD_OPK."ls_Zero.DB".Otch'
    end
    object qryOpkLSLS: TStringField
      FieldName = 'LS'
      Origin = '_ADD_OPK."ls_Zero.DB".LS'
      Size = 16
    end
    object qryOpkLSNR: TIntegerField
      FieldName = 'NR'
      Origin = '_ADD_OPK."ls_Zero.DB".NR'
    end
    object qryOpkLSTabn_1: TIntegerField
      FieldName = 'Tabn_1'
      Origin = '_ADD_OPK."ls_Zero.DB".Tabn_1'
    end
    object qryOpkLSDTBEG: TDateTimeField
      FieldName = 'DTBEG'
      Origin = '_ADD_OPK."ls_Zero.DB".DTBEG'
    end
    object qryOpkLSLICSCH: TStringField
      FieldName = 'LICSCH'
      Origin = '_ADD_OPK."ls_Zero.DB".LICSCH'
      Size = 25
    end
    object qryOpkLSKDBNK: TSmallintField
      FieldName = 'KDBNK'
      Origin = '_ADD_OPK."ls_Zero.DB".KDBNK'
    end
    object qryOpkLSNOTES: TStringField
      FieldName = 'NOTES'
      Origin = '_ADD_OPK."ls_Zero.DB".NOTES'
      Size = 25
    end
  end
  object dsrcOpkLS: TDataSource
    DataSet = qryOpkLS
    Left = 136
    Top = 96
  end
  object qryLocate: TQuery
    Left = 248
    Top = 176
  end
  object qryAdd: TQuery
    Left = 248
    Top = 232
  end
end
