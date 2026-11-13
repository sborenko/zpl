object FormAddUpi104: TFormAddUpi104
  Left = 290
  Top = 163
  Width = 959
  Height = 565
  BorderIcons = [biSystemMenu]
  Caption = 'FormAddUpi104'
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
    Width = 951
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      951
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
      Left = 872
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrOldUpi: TDBGrid
    Left = 0
    Top = 31
    Width = 951
    Height = 507
    Align = alClient
    DataSource = dsrcOldUpi
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'z_TabN'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'z_Fam'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_Ima'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_Otch'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DPriem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUvoln'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ident'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN_1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obj'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKLTRF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdSBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZatr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KAT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKAZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKAZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pol'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdObj'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewTabN'
        Visible = True
      end>
  end
  object qryOldUpi: TQuery
    DatabaseName = '_NichAdd'
    SQL.Strings = (
      'Select s.KdSch as NewKdSbu, u.*'
      'from n_Up_Z u Left Outer join n_SpZ s on s.SZatr = u.SZatr'
      'order by u.TabN, u.Dt_Beg')
    Left = 72
    Top = 304
    object qryOldUpiz_Fam: TStringField
      DisplayWidth = 9
      FieldName = 'z_Fam'
    end
    object qryOldUpiZ_Ima: TStringField
      DisplayWidth = 18
      FieldName = 'Z_Ima'
      Size = 15
    end
    object qryOldUpiZ_Otch: TStringField
      DisplayWidth = 11
      FieldName = 'Z_Otch'
    end
    object qryOldUpiNotes: TStringField
      FieldName = 'Notes'
      Origin = '_NICHADD."n_Up_Z.DB".Notes'
      Size = 6
    end
    object qryOldUpiz_TabN: TIntegerField
      DisplayWidth = 12
      FieldName = 'z_TabN'
    end
    object qryOldUpiID: TStringField
      DisplayWidth = 12
      FieldName = 'ID'
      Size = 10
    end
    object qryOldUpiTabN: TSmallintField
      FieldName = 'TabN'
      Origin = '_NICHADD."n_Up_Z.DB".TabN'
    end
    object qryOldUpiFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object qryOldUpiIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object qryOldUpiOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object qryOldUpiDPriem: TDateField
      FieldName = 'DPriem'
      Origin = '_NICHADD."n_Up_Z.DB".DPriem'
    end
    object qryOldUpiDUvoln: TDateField
      FieldName = 'DUvoln'
      Origin = '_NICHADD."n_Up_Z.DB".DUvoln'
    end
    object qryOldUpiIdent: TStringField
      DisplayWidth = 12
      FieldName = 'Ident'
      Size = 10
    end
    object qryOldUpiLS: TStringField
      DisplayWidth = 19
      FieldName = 'LS'
      Size = 16
    end
    object qryOldUpiTabN_1: TFloatField
      DisplayWidth = 12
      FieldName = 'TabN_1'
    end
    object qryOldUpiDT_BEG: TDateField
      DisplayWidth = 12
      FieldName = 'DT_BEG'
    end
    object qryOldUpiDT_END: TDateField
      DisplayWidth = 12
      FieldName = 'DT_END'
    end
    object qryOldUpiObj: TSmallintField
      DisplayWidth = 12
      FieldName = 'Obj'
    end
    object qryOldUpiVED: TSmallintField
      DisplayWidth = 12
      FieldName = 'VED'
    end
    object qryOldUpiSO: TSmallintField
      DisplayWidth = 12
      FieldName = 'SO'
    end
    object qryOldUpiOKLTRF: TFloatField
      DisplayWidth = 12
      FieldName = 'OKLTRF'
    end
    object qryOldUpiSZatr: TStringField
      DisplayWidth = 10
      FieldName = 'SZatr'
      Size = 8
    end
    object qryOldUpiKAT: TSmallintField
      DisplayWidth = 12
      FieldName = 'KAT'
    end
    object qryOldUpiDOLGNOST: TStringField
      DisplayWidth = 24
      FieldName = 'DOLGNOST'
    end
    object qryOldUpiNR_PRIKAZA: TStringField
      DisplayWidth = 14
      FieldName = 'NR_PRIKAZA'
      Size = 10
    end
    object qryOldUpiDT_PRIKAZA: TDateField
      DisplayWidth = 14
      FieldName = 'DT_PRIKAZA'
    end
    object qryOldUpiPol: TStringField
      FieldName = 'Pol'
      Origin = '_NICHADD."n_Up_Z.DB".Pol'
      Size = 1
    end
    object qryOldUpiNewKdSBU: TSmallintField
      DisplayWidth = 12
      FieldName = 'NewKdSBU'
    end
    object qryOldUpiNewKdObj: TSmallintField
      DisplayWidth = 12
      FieldName = 'NewKdObj'
    end
    object qryOldUpiNewTabN: TIntegerField
      FieldName = 'NewTabN'
    end
  end
  object dsrcOldUpi: TDataSource
    DataSet = qryOldUpi
    Left = 80
    Top = 320
  end
  object qryTmp: TQuery
    Left = 176
    Top = 360
  end
  object qryOldTmp: TQuery
    DatabaseName = '__U_104'
    Left = 80
    Top = 360
  end
end
