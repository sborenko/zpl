object FormShwLog: TFormShwLog
  Left = 397
  Top = 459
  Width = 763
  Height = 390
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormShwLog'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object LabelFIO: TLabel
    Left = 0
    Top = 350
    Width = 755
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'LabelFIO'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      755
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 3
      Width = 107
      Height = 25
      Hint = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
      Caption = #1055#1077#1088#1077#1086#1090#1082#1088#1099#1090#1100
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object sBtnStayOnTop: TSpeedButton
      Left = 195
      Top = 3
      Width = 25
      Height = 25
      Hint = #1042#1089#1077#1075#1076#1072' '#1087#1086#1074#1077#1088#1093' '#1074#1089#1077#1093' '#1086#1082#1086#1085
      AllowAllUp = True
      GroupIndex = 7
      Down = True
      Caption = '!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnStayOnTopClick
    end
    object LabelFilterMsg: TLabel
      Left = 228
      Top = 16
      Width = 68
      Height = 13
      Caption = 'LabelFilterMsg'
    end
    object LabelSortMsg: TLabel
      Left = 228
      Top = 2
      Width = 65
      Height = 13
      Caption = 'LabelSortMsg'
    end
    object LabelCntRec: TLabel
      Left = 613
      Top = 10
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'LabelCntRec'
    end
    object bBtnClose: TBitBtn
      Left = 677
      Top = 3
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkClose
    end
    object DBNavigator1: TDBNavigator
      Left = 113
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcLog
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #1042' '#1085#1072#1095#1072#1083#1086' '#1090#1072#1073#1083#1080#1094#1099
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103
        #1057#1083#1077#1076#1091#1102#1097#1072#1103
        #1042' '#1082#1086#1085#1077#1094' '#1090#1072#1073#1083#1080#1094#1099
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object dbgrLog: TDBGrid
    Left = 0
    Top = 31
    Width = 755
    Height = 282
    Align = alClient
    Color = clCream
    DataSource = dsrcLog
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDUSR'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMUSR'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEVNT'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMEVNT'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMTBL'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 83
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 313
    Width = 755
    Height = 37
    Hint = #1055#1086#1076#1088#1086#1073#1085#1086#1089#1090#1080
    Align = alBottom
    Alignment = taCenter
    Color = clYellow
    DataField = 'NOTES'
    DataSource = dsrcLog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
  end
  object qryLog: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from dbLog'
      'order by NR')
    Left = 48
    Top = 136
    object qryLogNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.DBLOG.NR'
    end
    object qryLogKDUSR: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDUSR'
      Origin = 'DbMain.DBLOG.KDUSR'
    end
    object qryLogNMUSR: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'NMUSR'
      Origin = 'DbMain.DBLOG.NMUSR'
      Size = 15
    end
    object qryLogTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.DBLOG.TABN'
    end
    object qryLogKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.DBLOG.KDSPS'
    end
    object qryLogDTEVNT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1042#1088#1077#1084#1103
      FieldName = 'DTEVNT'
      Origin = 'DbMain.DBLOG.DTEVNT'
    end
    object qryLogNMEVNT: TStringField
      DisplayLabel = #1057#1086#1073#1099#1090#1080#1077
      FieldName = 'NMEVNT'
      Origin = 'DbMain.DBLOG.NMEVNT'
      Size = 25
    end
    object qryLogNMTBL: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'NMTBL'
      Origin = 'DbMain.DBLOG.NMTBL'
      Size = 15
    end
    object qryLogNOTES: TStringField
      DisplayLabel = #1055#1086#1076#1088#1086#1073#1085#1086
      FieldName = 'NOTES'
      Origin = 'DbMain.DBLOG.NOTES'
      Size = 250
    end
  end
  object dsrcLog: TDataSource
    DataSet = cdsLog
    OnDataChange = dsrcLogDataChange
    Left = 72
    Top = 232
  end
  object cdsLog: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpLog'
    Left = 56
    Top = 216
    object cdsLogNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.DBLOG.NR'
    end
    object cdsLogKDUSR: TSmallintField
      DisplayLabel = #1050#1086#1076#1055#1086#1083#1100#1079
      FieldName = 'KDUSR'
      Origin = 'DbMain.DBLOG.KDUSR'
    end
    object cdsLogNMUSR: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'NMUSR'
      Origin = 'DbMain.DBLOG.NMUSR'
      Size = 15
    end
    object cdsLogTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.DBLOG.TABN'
    end
    object cdsLogKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.DBLOG.KDSPS'
    end
    object cdsLogDTEVNT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1042#1088#1077#1084#1103
      FieldName = 'DTEVNT'
      Origin = 'DbMain.DBLOG.DTEVNT'
    end
    object cdsLogNMEVNT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldName = 'NMEVNT'
      Origin = 'DbMain.DBLOG.NMEVNT'
      Size = 25
    end
    object cdsLogNMTBL: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'NMTBL'
      Origin = 'DbMain.DBLOG.NMTBL'
      Size = 15
    end
    object cdsLogNOTES: TStringField
      DisplayLabel = #1055#1086#1076#1088#1086#1073#1085#1086#1089#1090#1080
      FieldName = 'NOTES'
      Origin = 'DbMain.DBLOG.NOTES'
      Size = 250
    end
  end
  object dtpLog: TDataSetProvider
    DataSet = qryLog
    Left = 48
    Top = 176
  end
  object pop: TPopupMenu
    Left = 112
    Top = 80
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSortNR: TMenuItem
        Caption = '- '#1074' '#1087#1086#1088#1103#1076#1082#1077' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1089#1086#1073#1099#1090#1080#1081
        Checked = True
        Hint = '('#1090'.'#1077'. '#1073#1077#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080')'
        OnClick = popSortNRClick
      end
      object popSortTabN: TMenuItem
        Caption = '- '#1058#1072#1073'.'#1053#1088', '#1044#1072#1090#1072#1042#1088#1077#1084#1103
        OnClick = popSortTabNClick
      end
      object popSortUsr: TMenuItem
        Caption = '- '#1082#1086#1076' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103', '#1044#1072#1090#1072#1042#1088#1077#1084#1103
        OnClick = popSortUsrClick
      end
    end
    object popFilter: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' ...'
      object popFilterOff: TMenuItem
        Caption = '- '#1073#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        Checked = True
        OnClick = popFilterOffClick
      end
      object popFilterTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        OnClick = popFilterTabNClick
      end
      object popFilterUsr: TMenuItem
        Caption = '- '#1087#1086' '#1082#1086#1076#1091' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        OnClick = popFilterUsrClick
      end
    end
  end
end
