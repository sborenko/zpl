object FormOtklDp: TFormOtklDp
  Left = 386
  Top = 188
  Width = 694
  Height = 416
  Caption = 'FormOtklDp'
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
    Width = 686
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      686
      31)
    object sBtnGo: TSpeedButton
      Left = 3
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Go !!!'
      OnClick = sBtnGoClick
    end
    object BitBtn1: TBitBtn
      Left = 607
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrDp: TDBGrid
    Left = 0
    Top = 31
    Width = 686
    Height = 358
    Align = alClient
    DataSource = dsrcDp
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'N_R'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdSps'
        Width = 35
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
        FieldName = 'TabN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chas'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdKatP'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PdN'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdSpZ'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRR'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MyNotes'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrPV'
        Width = 21
        Visible = True
      end>
  end
  object qryDp: TQuery
    DatabaseName = '_D_TEMP'
    SQL.Strings = (
      'Select * from tb_Otkl order by TabN, ZaMesGod, VidN')
    Left = 16
    Top = 88
    object qryDpN_R: TIntegerField
      FieldName = 'N_R'
      Origin = '_D_TEMP."tb_Otkl.DB".N_R'
    end
    object qryDpKdSps: TSmallintField
      FieldName = 'KdSps'
      Origin = '_D_TEMP."tb_Otkl.DB".KdSps'
    end
    object qryDpDtProc: TDateField
      FieldName = 'DtProc'
      Origin = '_D_TEMP."tb_Otkl.DB".DtProc'
    end
    object qryDpZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      Origin = '_D_TEMP."tb_Otkl.DB".ZaMesGod'
    end
    object qryDpTabN: TIntegerField
      FieldName = 'TabN'
      Origin = '_D_TEMP."tb_Otkl.DB".TabN'
    end
    object qryDpVidN: TStringField
      FieldName = 'VidN'
      Origin = '_D_TEMP."tb_Otkl.DB".VidN'
      Size = 4
    end
    object qryDpChas: TFloatField
      FieldName = 'Chas'
      Origin = '_D_TEMP."tb_Otkl.DB".Chas'
    end
    object qryDpSumma: TFloatField
      FieldName = 'Summa'
      Origin = '_D_TEMP."tb_Otkl.DB".Summa'
    end
    object qryDpKdObj: TSmallintField
      FieldName = 'KdObj'
      Origin = '_D_TEMP."tb_Otkl.DB".KdObj'
    end
    object qryDpKdKatP: TSmallintField
      FieldName = 'KdKatP'
      Origin = '_D_TEMP."tb_Otkl.DB".KdKatP'
    end
    object qryDpPdN: TSmallintField
      FieldName = 'PdN'
      Origin = '_D_TEMP."tb_Otkl.DB".PdN'
    end
    object qryDpKdSpZ: TSmallintField
      FieldName = 'KdSpZ'
      Origin = '_D_TEMP."tb_Otkl.DB".KdSpZ'
    end
    object qryDpPRR: TSmallintField
      FieldName = 'PRR'
      Origin = '_D_TEMP."tb_Otkl.DB".PRR'
    end
    object qryDpNotes: TStringField
      FieldName = 'Notes'
      Origin = '_D_TEMP."tb_Otkl.DB".Notes'
      Size = 25
    end
    object qryDpMyNotes: TStringField
      FieldName = 'MyNotes'
      Origin = '_D_TEMP."tb_Otkl.DB".MyNotes'
      Size = 25
    end
    object qryDpPrPV: TSmallintField
      FieldName = 'PrPV'
      Origin = '_D_TEMP."tb_Otkl.DB".PrPV'
    end
  end
  object dsrcDp: TDataSource
    DataSet = qryDp
    Left = 32
    Top = 96
  end
  object qryTmp: TQuery
    Left = 64
    Top = 200
  end
  object qryAdd: TQuery
    Left = 128
    Top = 200
  end
end
