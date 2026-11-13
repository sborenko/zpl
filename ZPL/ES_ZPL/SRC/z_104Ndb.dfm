object FormAddNadb106: TFormAddNadb106
  Left = 174
  Top = 211
  Width = 942
  Height = 466
  Caption = 'FormAddNadb106'
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
    Width = 934
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      934
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
      Left = 854
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
    Width = 934
    Height = 408
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
        FieldName = 'NewTabN'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewVidN'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdSbu'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NewKdObj'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TabN'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMPROC'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SZatr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Obj'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VED'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KAT'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOLGNOST'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKAZA'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKAZA'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKEND'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKEND'
        Width = 61
        Visible = True
      end>
  end
  object qryOld: TQuery
    DatabaseName = '__U_106'
    SQL.Strings = (
      'Select u.NewTabN, v.NewVidN, s.NewKdSbu, o.NewKdObj, n.*'
      'from nadb_106 n '
      '              Left outer join u106_2 u on u.TabN = n.TabN'
      '              Left outer join Vids_106 v on v.VidN = n.VidN'
      '              Left outer join SpZ_106 s on s.SZatr = n.SZatr'
      '              Left outer join op_106 o on o.Obj = n.Obj'
      'order by n.TabN, n.Dt_Beg, n.VidN')
    Left = 80
    Top = 96
    object qryOldNewTabN: TIntegerField
      DisplayWidth = 12
      FieldName = 'NewTabN'
    end
    object qryOldNewVidN: TStringField
      DisplayWidth = 9
      FieldName = 'NewVidN'
      Size = 4
    end
    object qryOldNewKdSbu: TSmallintField
      DisplayWidth = 12
      FieldName = 'NewKdSbu'
    end
    object qryOldNewKdObj: TSmallintField
      DisplayWidth = 12
      FieldName = 'NewKdObj'
    end
    object qryOldTabN: TFloatField
      DisplayWidth = 12
      FieldName = 'TabN'
    end
    object qryOldVidN: TSmallintField
      DisplayWidth = 5
      FieldName = 'VidN'
    end
    object qryOldSUMPROC: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMPROC'
    end
    object qryOldSP: TStringField
      DisplayWidth = 3
      FieldName = 'SP'
      Size = 1
    end
    object qryOldDT_BEG: TDateField
      DisplayWidth = 12
      FieldName = 'DT_BEG'
    end
    object qryOldDT_END: TDateField
      DisplayWidth = 12
      FieldName = 'DT_END'
    end
    object qryOldSZatr: TStringField
      DisplayWidth = 10
      FieldName = 'SZatr'
      Size = 8
    end
    object qryOldObj: TSmallintField
      DisplayWidth = 12
      FieldName = 'Obj'
    end
    object qryOldVED: TSmallintField
      DisplayWidth = 12
      FieldName = 'VED'
    end
    object qryOldKAT: TSmallintField
      DisplayWidth = 12
      FieldName = 'KAT'
    end
    object qryOldDOLGNOST: TStringField
      DisplayWidth = 18
      FieldName = 'DOLGNOST'
      Size = 15
    end
    object qryOldNR_PRIKAZA: TStringField
      DisplayWidth = 14
      FieldName = 'NR_PRIKAZA'
      Size = 10
    end
    object qryOldDT_PRIKAZA: TDateField
      DisplayWidth = 14
      FieldName = 'DT_PRIKAZA'
    end
    object qryOldNR_PRIKEND: TStringField
      DisplayWidth = 14
      FieldName = 'NR_PRIKEND'
      Size = 10
    end
    object qryOldDT_PRIKEND: TDateField
      DisplayWidth = 14
      FieldName = 'DT_PRIKEND'
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
