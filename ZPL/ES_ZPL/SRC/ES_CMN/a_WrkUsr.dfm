object FormWrkUsrs: TFormWrkUsrs
  Left = 380
  Top = 264
  Width = 600
  Height = 369
  BorderIcons = [biSystemMenu]
  Caption = 'FormWrkUsrs'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 200
  Constraints.MinWidth = 400
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
    Top = 33
    Width = 584
    Height = 297
    Align = alClient
    Color = clCream
    DataSource = dsrcUsrs
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
  object PanelButtons: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 33
    Align = alTop
    TabOrder = 1
    DesignSize = (
      584
      33)
    object sBtnRefresh: TSpeedButton
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnRefreshClick
    end
    object LabelCntUsrs: TLabel
      Left = 88
      Top = 10
      Width = 63
      Height = 13
      Caption = 'LabelCntUsrs'
    end
    object BitBtn1: TBitBtn
      Left = 506
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
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
      DisplayLabel = #1044#1072#1090#1072#1042#1088#1077#1084#1103#1053#1072#1095#1072#1083#1072
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
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'NMUSR'
      Origin = 'DbMain.ZZ_WRKUSR.NMUSR'
      Size = 25
    end
    object qryUsrsSHCMP: TStringField
      DisplayLabel = #1055#1088#1086#1075#1088#1072#1084#1084#1072
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
