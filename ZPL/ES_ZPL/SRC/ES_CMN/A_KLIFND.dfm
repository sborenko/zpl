object FormFindKli: TFormFindKli
  Left = 401
  Top = 402
  Width = 595
  Height = 210
  ActiveControl = dbgrFind
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086#1080#1089#1082#1072
  Color = clBtnFace
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 210
  Constraints.MinWidth = 245
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrFind: TDBGrid
    Left = 0
    Top = 0
    Width = 587
    Height = 156
    Align = alClient
    DataSource = dsrcFind
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrFindDrawColumnCell
    OnDblClick = dbgrFindDblClick
    OnKeyDown = dbgrFindKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDWHO'
        Title.Caption = #1050#1086#1076
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMWHO'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Title.Caption = #1054#1050#1055#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LDTOPER'
        Title.Caption = #1055#1086#1089#1083#1044#1090#1054#1087#1077#1088
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 156
    Width = 587
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      587
      27)
    object bBtnCancel: TBitBtn
      Left = 511
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 0
      Kind = bkCancel
    end
    object bBtnOK: TBitBtn
      Left = 404
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 1
      Kind = bkOK
    end
  end
  object qryFind: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from kd_who where KdWho > 5000')
    Left = 88
    Top = 96
    object qryFindNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KD_WHO.NR'
    end
    object qryFindKDWHO: TSmallintField
      FieldName = 'KDWHO'
      Origin = 'DbMain.KD_WHO.KDWHO'
    end
    object qryFindKDIF: TSmallintField
      FieldName = 'KDIF'
      Origin = 'DbMain.KD_WHO.KDIF'
    end
    object qryFindNMWHO: TStringField
      FieldName = 'NMWHO'
      Origin = 'DbMain.KD_WHO.NMWHO'
      Size = 65
    end
    object qryFindPRWHO: TSmallintField
      FieldName = 'PRWHO'
      Origin = 'DbMain.KD_WHO.PRWHO'
    end
    object qryFindKDSBU: TSmallintField
      FieldName = 'KDSBU'
      Origin = 'DbMain.KD_WHO.KDSBU'
    end
    object qryFindNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'DbMain.KD_WHO.NOTES'
      Size = 254
    end
    object qryFindNMWHOE: TStringField
      FieldName = 'NMWHOE'
      Origin = 'DbMain.KD_WHO.NMWHOE'
      Size = 65
    end
    object qryFindSHFR: TStringField
      FieldName = 'SHFR'
      Origin = 'DbMain.KD_WHO.SHFR'
      Size = 5
    end
    object qryFindKDVALPDR: TSmallintField
      FieldName = 'KDVALPDR'
      Origin = 'DbMain.KD_WHO.KDVALPDR'
    end
    object qryFindOLD_KPR: TSmallintField
      FieldName = 'OLD_KPR'
      Origin = 'DbMain.KD_WHO.OLD_KPR'
    end
    object qryFindOLD_KOBJ: TSmallintField
      FieldName = 'OLD_KOBJ'
      Origin = 'DbMain.KD_WHO.OLD_KOBJ'
    end
    object qryFindORGMNE: TStringField
      FieldName = 'ORGMNE'
      Origin = 'DbMain.KD_WHO.ORGMNE'
      FixedChar = True
      Size = 15
    end
    object qryFindOKPO: TStringField
      FieldName = 'OKPO'
      Origin = 'DbMain.KD_WHO.OKPO'
      Size = 25
    end
    object qryFindADRES: TStringField
      FieldName = 'ADRES'
      Origin = 'DbMain.KD_WHO.ADRES'
      Size = 65
    end
    object qryFindPA: TSmallintField
      FieldName = 'PA'
      Origin = 'DbMain.KD_WHO.PA'
    end
    object qryFindNR_GORD: TStringField
      FieldName = 'NR_GORD'
      Origin = 'DbMain.KD_WHO.NR_GORD'
      Size = 10
    end
    object qryFindNM_GORD: TStringField
      FieldName = 'NM_GORD'
      Origin = 'DbMain.KD_WHO.NM_GORD'
      Size = 65
    end
    object qryFindLDTOPER: TDateTimeField
      FieldName = 'LDTOPER'
      Origin = 'DbMain.KD_WHO.LDTOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object dsrcFind: TDataSource
    DataSet = qryFind
    Left = 120
    Top = 96
  end
end