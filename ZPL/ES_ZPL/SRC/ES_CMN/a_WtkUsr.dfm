object FormWrkUsrs: TFormWrkUsrs
  Left = 354
  Top = 282
  Width = 496
  Height = 200
  BorderIcons = [biSystemMenu]
  Caption = 'FormWrkUsrs'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 200
  Constraints.MinWidth = 450
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
  object dbgrUsrs: TDBGrid
    Left = 0
    Top = 30
    Width = 488
    Height = 143
    Align = alClient
    DataSource = dsrcUsrs
    TabOrder = 0
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
        FieldName = 'DTBEG'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDUSR'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMUSR'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHCMP'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LVL'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMCOMPUTER'
        Width = 112
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      488
      30)
    object BitBtn1: TBitBtn
      Left = 413
      Top = 3
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object qryUsrs: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from zz_wrkUsr'
      'order by dtBeg')
    Left = 80
    Top = 56
    object qryUsrsNR: TIntegerField
      DisplayLabel = #1053#1056
      DisplayWidth = 5
      FieldName = 'NR'
      Origin = 'DbMain.ZZ_WRKUSR.NR'
    end
    object qryUsrsDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1042#1088#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DTBEG'
      Origin = 'DbMain.ZZ_WRKUSR.DTBEG'
    end
    object qryUsrsKDUSR: TSmallintField
      DisplayLabel = #1050#1076#1070#1079#1088
      DisplayWidth = 12
      FieldName = 'KDUSR'
      Origin = 'DbMain.ZZ_WRKUSR.KDUSR'
    end
    object qryUsrsKDCMP: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDCMP'
      Origin = 'DbMain.ZZ_WRKUSR.KDCMP'
    end
    object qryUsrsNMUSR: TStringField
      DisplayLabel = #1070#1079#1077#1088
      DisplayWidth = 30
      FieldName = 'NMUSR'
      Origin = 'DbMain.ZZ_WRKUSR.NMUSR'
      Size = 25
    end
    object qryUsrsSHCMP: TStringField
      DisplayLabel = #1055#1088#1075
      DisplayWidth = 12
      FieldName = 'SHCMP'
      Origin = 'DbMain.ZZ_WRKUSR.SHCMP'
      Size = 10
    end
    object qryUsrsLVL: TSmallintField
      DisplayLabel = #1051#1074#1083
      DisplayWidth = 12
      FieldName = 'LVL'
      Origin = 'DbMain.ZZ_WRKUSR.LVL'
    end
    object qryUsrsNMCOMPUTER: TStringField
      DisplayLabel = #1050#1086#1084#1087#1100#1102#1090#1077#1088
      DisplayWidth = 42
      FieldName = 'NMCOMPUTER'
      Origin = 'DbMain.ZZ_WRKUSR.NMCOMPUTER'
      Size = 35
    end
  end
  object dsrcUsrs: TDataSource
    DataSet = qryUsrs
    Left = 96
    Top = 64
  end
end
