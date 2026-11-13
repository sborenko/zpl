object FormStz_2: TFormStz_2
  Left = 336
  Top = 212
  Width = 665
  Height = 397
  ActiveControl = dbgrStZ
  BorderIcons = [biSystemMenu]
  Caption = 'FormStz_2'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 780
  Constraints.MinHeight = 340
  Constraints.MinWidth = 665
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrStZ: TDBGrid
    Left = 0
    Top = 0
    Width = 273
    Height = 341
    Align = alLeft
    Color = 11462907
    DataSource = dsrcStZ
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = popStz
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'SHSTZ'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSTZ'
        Width = 201
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 341
    Width = 657
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      657
      29)
    object bBtnOk: TBitBtn
      Left = 493
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 581
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrStz2: TDBGrid
    Left = 273
    Top = 0
    Width = 384
    Height = 341
    Align = alClient
    Color = 11861218
    DataSource = dsrcStz2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = popStz2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrStz2DblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSTZ2'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHSTZ2'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSTZ2'
        Width = 291
        Visible = True
      end>
  end
  object cdsStZ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    Left = 120
    Top = 160
    object cdsStZKDSTZ: TSmallintField
      FieldName = 'KDSTZ'
    end
    object cdsStZSHSTZ: TStringField
      DisplayLabel = #1050#1045#1050#1042
      FieldName = 'SHSTZ'
      Size = 10
    end
    object cdsStZNMSTZ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1050#1045#1050#1042#39#1072
      FieldName = 'NMSTZ'
      Size = 125
    end
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct s2.KdStZ, s2.shStz , s.NmStZ'
      'from Kd_Stz2 s2'
      'Left Outer Join Kd_StZ s on s.KdStz = s2.KdStZ'
      '')
    Left = 40
    Top = 160
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 80
    Top = 160
  end
  object dsrcStZ: TDataSource
    DataSet = cdsStZ
    Left = 136
    Top = 176
  end
  object qryStz2: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    DataSource = dsrcStZ
    SQL.Strings = (
      'Select * from Kd_Stz2 where KdStz = :KdStz')
    UpdateObject = updStz2
    Left = 392
    Top = 104
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDSTZ'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryStz2NR: TIntegerField
      DisplayWidth = 7
      FieldName = 'NR'
      Origin = 'DbMain.KD_STZ2.NR'
    end
    object qryStz2KDSTZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSTZ'
      Origin = 'DbMain.KD_STZ2.KDSTZ'
    end
    object qryStz2SHSTZ: TStringField
      DisplayWidth = 12
      FieldName = 'SHSTZ'
      Origin = 'DbMain.KD_STZ2.SHSTZ'
      Size = 10
    end
    object qryStz2KDSTZ2: TSmallintField
      DisplayLabel = #1050#1076#1042#1099#1076#1072#1090#1082#1091
      DisplayWidth = 12
      FieldName = 'KDSTZ2'
      Origin = 'DbMain.KD_STZ2.KDSTZ2'
    end
    object qryStz2SHSTZ2: TStringField
      DisplayLabel = #1064#1092#1088#1056#1072#1089#1093#1086#1076#1072
      DisplayWidth = 9
      FieldName = 'SHSTZ2'
      Origin = 'DbMain.KD_STZ2.SHSTZ2'
      FixedChar = True
      Size = 2
    end
    object qryStz2NMSTZ2: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1072
      DisplayWidth = 150
      FieldName = 'NMSTZ2'
      Origin = 'DbMain.KD_STZ2.NMSTZ2'
      Size = 125
    end
  end
  object dsrcStz2: TDataSource
    DataSet = qryStz2
    Left = 408
    Top = 120
  end
  object popStz2: TPopupMenu
    OnPopup = popStz2Popup
    Left = 360
    Top = 216
    object popStz2Head: TMenuItem
      Caption = '== '#1042#1099#1076#1072#1090#1082#1080' '#1087#1086' '#1050#1045#1050#1042' =='
      Enabled = False
    end
    object popStz2Edt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popStz2EdtClick
    end
    object popStz2Add: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popStz2AddClick
    end
    object popStz2Del: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popStz2DelClick
    end
  end
  object popStz: TPopupMenu
    Left = 40
    Top = 216
    object popStzHead: TMenuItem
      Caption = '== '#1050#1045#1050#1042#39#1099', '#1080#1084#1077#1102#1097#1080#1077' '#1074#1083#1086#1078#1077#1085#1085#1099#1077' '#1074#1099#1076#1072#1090#1082#1080' =='
      Enabled = False
    end
    object popStzAddKEKV: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1050#1045#1050#1042
      OnClick = popStzAddKEKVClick
    end
  end
  object updStz2: TUpdateSQL
    ModifySQL.Strings = (
      'update Kd_Stz2'
      'set'
      '  NR = :NR,'
      '  KDSTZ = :KDSTZ,'
      '  SHSTZ = :SHSTZ,'
      '  KDSTZ2 = :KDSTZ2,'
      '  SHSTZ2 = :SHSTZ2,'
      '  NMSTZ2 = :NMSTZ2'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Kd_Stz2'
      '  (NR, KDSTZ, SHSTZ, KDSTZ2, SHSTZ2, NMSTZ2)'
      'values'
      '  (:NR, :KDSTZ, :SHSTZ, :KDSTZ2, :SHSTZ2, :NMSTZ2)')
    DeleteSQL.Strings = (
      'delete from Kd_Stz2'
      'where'
      '  NR = :OLD_NR')
    Left = 424
    Top = 136
  end
end
