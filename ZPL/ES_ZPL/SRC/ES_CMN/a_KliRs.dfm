object FormKliRS: TFormKliRS
  Left = 304
  Top = 100
  Width = 692
  Height = 607
  BorderIcons = [biSystemMenu]
  Caption = 'FormKliRS'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 461
    Width = 684
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      684
      31)
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 3
      Width = 75
      Height = 25
    end
    object LabelCntRecKli: TLabel
      Left = 89
      Top = 1
      Width = 73
      Height = 13
      Caption = 'LabelCntRecKli'
    end
    object LabelCntRecRS: TLabel
      Left = 89
      Top = 15
      Width = 77
      Height = 13
      Caption = 'LabelCntRecRS'
    end
    object LabelKliOrder: TLabel
      Left = 216
      Top = 9
      Width = 63
      Height = 13
      Caption = 'LabelKliOrder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object bBtnCancel: TBitBtn
      Left = 606
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrKli: TDBGrid
    Left = 0
    Top = 31
    Width = 684
    Height = 430
    Align = alTop
    Color = clCream
    DataSource = dsrcKli
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = popKli
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDKLI'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKLI'
        Width = 484
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 8
        Visible = True
      end>
  end
  object dbgrRS: TDBGrid
    Left = 0
    Top = 464
    Width = 684
    Height = 116
    Align = alClient
    Color = clCream
    DataSource = dsrcRS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDKLI'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDRSCH'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFO'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKLI'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBNK'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 2
        Visible = True
      end>
  end
  object qryKli: TQuery
    AfterScroll = qryKliAfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from b_Kli order by OKPO, KdKli')
    Left = 40
    Top = 408
    object qryKliNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.B_KLI.NR'
    end
    object qryKliKDKLI: TSmallintField
      DisplayLabel = #1050#1086#1076#1050#1083#1080
      FieldName = 'KDKLI'
      Origin = 'DbMain.B_KLI.KDKLI'
    end
    object qryKliOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Origin = 'DbMain.B_KLI.OKPO'
      Size = 25
    end
    object qryKliNMKLI: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'NMKLI'
      Origin = 'DbMain.B_KLI.NMKLI'
      Size = 65
    end
    object qryKliNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.B_KLI.NOTES'
      Size = 65
    end
    object qryKliWYEAR: TSmallintField
      FieldName = 'WYEAR'
      Origin = 'DbMain.B_KLI.WYEAR'
    end
  end
  object qryRS: TQuery
    DatabaseName = 'DbMain'
    DataSource = dsrcKli
    SQL.Strings = (
      'Select * from B_RSCH where KdKli = :KdKli'
      'order by mfo, RSCH')
    Left = 40
    Top = 504
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDKLI'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryRSNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.B_RSCH.NR'
    end
    object qryRSKDKLI: TSmallintField
      DisplayLabel = #1050#1086#1076#1050#1083#1080
      FieldName = 'KDKLI'
      Origin = 'DbMain.B_RSCH.KDKLI'
    end
    object qryRSKDRSCH: TSmallintField
      DisplayLabel = #1050#1086#1076#1056#1057#1095
      FieldName = 'KDRSCH'
      Origin = 'DbMain.B_RSCH.KDRSCH'
    end
    object qryRSMFO: TIntegerField
      DisplayLabel = #1052#1060#1054
      FieldName = 'MFO'
      Origin = 'DbMain.B_RSCH.MFO'
    end
    object qryRSRSCH: TStringField
      DisplayLabel = #1056#1072#1089#1095'.'#1089#1095#1077#1090
      FieldName = 'RSCH'
      Origin = 'DbMain.B_RSCH.RSCH'
      Size = 25
    end
    object qryRSNMKLI: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074' '#1087#1083#1072#1076'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      FieldName = 'NMKLI'
      Origin = 'DbMain.B_RSCH.NMKLI'
      Size = 65
    end
    object qryRSNMBNK: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      FieldName = 'NMBNK'
      Origin = 'DbMain.B_RSCH.NMBNK'
      Size = 65
    end
    object qryRSNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.B_RSCH.NOTES'
      Size = 65
    end
    object qryRSISVAL: TStringField
      FieldName = 'ISVAL'
      Origin = 'DbMain.B_RSCH.ISVAL'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcKli: TDataSource
    DataSet = qryKli
    OnDataChange = dsrcKliDataChange
    Left = 56
    Top = 424
  end
  object dsrcRS: TDataSource
    DataSet = qryRS
    Left = 56
    Top = 520
  end
  object popKli: TPopupMenu
    Left = 160
    Top = 128
    object popKliHead: TMenuItem
      Caption = '== '#1050' '#1083' '#1080' '#1077' '#1085' '#1090' '#1099' =='
      Enabled = False
    end
    object popKliEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    end
    object popKliAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object popKliDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object popKliSep1: TMenuItem
      Caption = '-'
    end
    object popKliOrder: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object popKliOrderByNmKli: TMenuItem
        Caption = '- '#1087#1086' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
        Checked = True
        OnClick = popKliOrderByNmKliClick
      end
      object popKliOrderByOkpo: TMenuItem
        Caption = '- '#1087#1086' '#1054#1050#1055#1054
        OnClick = popKliOrderByOkpoClick
      end
    end
    object popKliPlategiCurKli: TMenuItem
      Caption = #1055#1083#1072#1090#1077#1078#1080' '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1082#1083#1080#1077#1085#1090#1091
      OnClick = popKliPlategiCurKliClick
    end
  end
end
