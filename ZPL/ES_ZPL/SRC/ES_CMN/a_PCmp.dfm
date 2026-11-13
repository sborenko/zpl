object FormPCmp: TFormPCmp
  Left = 457
  Top = 524
  Width = 350
  Height = 200
  BorderIcons = [biSystemMenu]
  Caption = 'FormPCmp'
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 350
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    342
    173)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrPCmp: TDBGrid
    Left = 0
    Top = 0
    Width = 342
    Height = 142
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcPCmp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPCmpDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SHCMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMCMP'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 96
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 178
    Top = 146
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 266
    Top = 146
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object qryPCmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from zz_PCmp'
      'order by NR')
    Left = 40
    Top = 64
    object qryPCmpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.ZZ_PCMP.NR'
    end
    object qryPCmpSHCMP: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHCMP'
      Origin = 'DbMain.ZZ_PCMP.SHCMP'
      FixedChar = True
      Size = 5
    end
    object qryPCmpNMCMP: TStringField
      DisplayLabel = #1053#1072#1079#1074'. '#1087#1088#1086#1075#1088'. '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1072
      FieldName = 'NMCMP'
      Origin = 'DbMain.ZZ_PCMP.NMCMP'
      Size = 35
    end
    object qryPCmpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.ZZ_PCMP.NOTES'
      FixedChar = True
    end
  end
  object dsrcPCmp: TDataSource
    DataSet = qryPCmp
    Left = 48
    Top = 72
  end
end
