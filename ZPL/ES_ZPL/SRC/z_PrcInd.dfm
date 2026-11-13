object FormPrcIndx: TFormPrcIndx
  Left = 308
  Top = 55
  Width = 438
  Height = 576
  ActiveControl = dbgrMes
  BorderIcons = [biSystemMenu]
  Caption = 'FormPrcIndx'
  Color = clBtnFace
  Constraints.MaxWidth = 580
  Constraints.MinHeight = 450
  Constraints.MinWidth = 260
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 113
    Top = 31
    Height = 518
    Beveled = True
    Color = clTeal
    ParentColor = False
    OnMoved = Splitter1Moved
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      430
      31)
    object LabelCntPrcRec: TLabel
      Left = 122
      Top = 9
      Width = 78
      Height = 13
      Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1087#1088#1086#1094#1077#1085#1090#1086#1074
      Anchors = [akTop, akRight]
      Caption = 'LabelCntPrcRec'
      ParentShowHint = False
      ShowHint = True
    end
    object bBtnCancel: TBitBtn
      Left = 352
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
    object bBtnOK: TBitBtn
      Left = 270
      Top = 3
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
  end
  object dbgrMes: TDBGrid
    Left = 0
    Top = 31
    Width = 113
    Height = 518
    Hint = #1048#1085#1076#1077#1082#1089#1080#1088#1091#1077#1084#1099#1081' '#1084#1077#1089#1103#1094
    Align = alLeft
    Color = 8250615
    DataSource = dsrcMes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrMesDblClick
    OnEnter = dbGridEnter
    OnExit = dbGridExit
  end
  object dbgrPrc: TDBGrid
    Left = 116
    Top = 31
    Width = 314
    Height = 518
    Hint = #1055#1088#1086#1094#1077#1085#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
    Align = alClient
    Color = 9894605
    Constraints.MinWidth = 312
    DataSource = dcrcPrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrPrcDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'INDMES'
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAZMES'
        ReadOnly = True
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRCIND'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTDTBM'
        ReadOnly = True
        Width = 1
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR'
        ReadOnly = True
        Width = 1
        Visible = True
      end>
  end
  object qryMes: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct IndMes from z_PrcIndx')
    Left = 24
    Top = 128
    object qryMesINDMES: TDateTimeField
      DisplayLabel = #1052#1077#1089#1103#1094
      DisplayWidth = 11
      FieldName = 'INDMES'
      DisplayFormat = 'mm/yyyy'
    end
    object qryMesCntRec: TSmallintField
      FieldName = 'CntRec'
    end
  end
  object dsrcMes: TDataSource
    DataSet = cdsMes
    Left = 64
    Top = 192
  end
  object qryPrc: TQuery
    CachedUpdates = True
    BeforeInsert = qryPrcBeforeInsert
    BeforePost = qryPrcBeforePost
    AfterPost = qryPrcAfterPost
    AfterDelete = qryPrcAfterDelete
    OnNewRecord = qryPrcNewRecord
    DatabaseName = 'DbMain'
    DataSource = dsrcMes
    SQL.Strings = (
      'Select * from z_PrcIndx where IndMes = :IndMes')
    UpdateObject = updPrc
    Left = 208
    Top = 184
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'INDMES'
        ParamType = ptUnknown
        Size = 8
      end>
    object qryPrcNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRCINDX.NR'
    end
    object qryPrcINDMES: TDateTimeField
      DisplayLabel = #1048#1085#1076#1052#1077#1089#1103#1094
      FieldName = 'INDMES'
      Origin = 'DbMain.Z_PRCINDX.INDMES'
      DisplayFormat = 'mm/yyyy'
    end
    object qryPrcBAZMES: TDateTimeField
      DisplayLabel = #1041#1072#1079#1086#1074#1099#1081' '#1084#1077#1089#1103#1094
      FieldName = 'BAZMES'
      Origin = 'DbMain.Z_PRCINDX.BAZMES'
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPrcPRCIND: TFloatField
      DisplayLabel = '% '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080
      FieldName = 'PRCIND'
      Origin = 'DbMain.Z_PRCINDX.PRCIND'
    end
    object qryPrcLASTDTBM: TDateTimeField
      DisplayLabel = 'LastDtBM'
      FieldName = 'LASTDTBM'
      Origin = 'DbMain.Z_PRCINDX.LASTDTBM'
    end
  end
  object dcrcPrc: TDataSource
    DataSet = qryPrc
    Left = 224
    Top = 192
  end
  object updPrc: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PrcIndx'
      'set'
      '  NR = :NR,'
      '  INDMES = :INDMES,'
      '  BAZMES = :BAZMES,'
      '  PRCIND = :PRCIND,'
      '  LASTDTBM = :LASTDTBM'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PrcIndx'
      '  (NR, INDMES, BAZMES, PRCIND, LASTDTBM)'
      'values'
      '  (:NR, :INDMES, :BAZMES, :PRCIND, :LASTDTBM)')
    DeleteSQL.Strings = (
      'delete from z_PrcIndx'
      'where'
      '  NR = :OLD_NR')
    Left = 240
    Top = 200
  end
  object qryTmp: TQuery
    Left = 40
    Top = 272
  end
  object cdsMes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IndMes'
        DataType = ftDate
      end
      item
        Name = 'CntRec'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsMesAfterScroll
    Left = 48
    Top = 176
    Data = {
      380000009619E0BD010000001800000002000000000003000000380006496E64
      4D6573040006000000000006436E7452656302000100000000000000}
    object cdsMesIndMes: TDateField
      DisplayLabel = #1048#1085#1076#1052#1077#1089#1103#1094
      DisplayWidth = 9
      FieldName = 'IndMes'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsMesCntRec: TSmallintField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 5
      FieldName = 'CntRec'
    end
  end
end
