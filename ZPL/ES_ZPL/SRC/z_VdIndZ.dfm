object FormIndxZ: TFormIndxZ
  Left = 412
  Top = 237
  Width = 475
  Height = 410
  BorderIcons = [biSystemMenu]
  Caption = 'FormIndxZ'
  Color = clBtnFace
  Constraints.MaxWidth = 525
  Constraints.MinHeight = 410
  Constraints.MinWidth = 475
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 3
    Top = 4
    Width = 315
    Height = 349
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 58
      Width = 219
      Height = 27
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1052#1077#1089#1103#1094', '#1079#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1080#1085#1076#1077#1082#1089#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      WordWrap = True
    end
    object Label1: TLabel
      Left = 6
      Top = 32
      Width = 219
      Height = 29
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1087#1086#1076#1082#1083#1102#1095#1072#1102#1090#1089#1103' '#1082' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103#1084' '#1084#1077#1089#1103#1094#1072
      WordWrap = True
    end
    object LabelSchBU: TLabel
      Left = 8
      Top = 150
      Width = 219
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1095#1077#1090' ('#1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103')'
    end
    object sBtnKdSchBU: TSpeedButton
      Left = 296
      Top = 146
      Width = 15
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1089#1095#1077#1090#1072' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
      Enabled = False
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000E0000000B0000000100
        0400000000005800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7700700000778888870077777777777777007770777777877700770007777888
        7700700000778888870000000008887888007700077778787700770007777888
        770077000777788877007777777777777700}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnKdSchBUClick
    end
    object Label3: TLabel
      Left = 62
      Top = 4
      Width = 248
      Height = 28
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1088#1080#1084#1077#1085#1103#1090#1100' '#1076#1083#1103' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1084#1077#1089#1103#1094#1077#1074', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1080#1102#1083#1103' 2012 '#1075'. !!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 7
      Top = 95
      Width = 277
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1100#1090#1077' '#1080', '#1077#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1074#1074#1077#1076#1080#1090#1077' '#1074' '#1085#1077#1105' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LabelPrc: TLabel
      Left = 7
      Top = 83
      Width = 191
      Height = 13
      Caption = #1057#1087#1088#1072#1074#1072' '#1090#1072#1073#1083#1080#1094#1072' '#1041#1072#1079#1086#1074#1099#1093' '#1052#1077#1089#1103#1094#1077#1074' '#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 286
      Top = 88
      Width = 25
      Height = 24
      Caption = '=>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelIndMes: TLabel
      Left = 202
      Top = 83
      Width = 102
      Height = 13
      Caption = #1089#1077#1085#1090#1103#1073#1088#1100' 2010 '#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object LabelApm2: TLabel
      Left = 11
      Top = 170
      Width = 298
      Height = 39
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1052#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1058#1072#1073'.'#1085'-'#1088#1072' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1095#1090#1086#1073#1099' '#1074#1099#1087#1086#1083#1085#1080#1090#1100' '#1088#1072 +
        #1089#1095#1105#1090' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1085#1080#1084'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 3
      Top = 281
      Width = 300
      Height = 29
      Alignment = taRightJustify
      AutoSize = False
      Caption = 
        #1058#1072#1073'.'#1085'-'#1088#1072' '#1074#1074#1086#1076#1103#1090#1089#1103' '#1073#1077#1079' '#1087#1088#1086#1073#1077#1083#1086#1074' '#1084#1077#1078#1076#1091' '#1085#1080#1084#1080'. '#1056#1072#1079#1076#1077#1083#1103#1090#1100' '#1079#1072#1087#1103#1090#1099#1084#1080'. '#1042 +
        ' '#1082#1086#1085#1094#1077' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1087#1103#1090#1086#1081' '#1073#1099#1090#1100' '#1085#1077' '#1076#1086#1083#1078#1085#1086'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object LabelKdSchBU: TLabel
      Left = 44
      Top = 323
      Width = 47
      Height = 13
      Caption = 'KdSchBU'
      FocusControl = dbeKdSchBU
      Visible = False
    end
    object dbeZaMesGod: TDBEdit
      Left = 231
      Top = 62
      Width = 80
      Height = 21
      Hint = #1042#1074#1077#1076#1080#1090#1077' 1-'#1077' '#1095#1080#1089#1083#1086' '#1090#1088#1077#1073#1091#1077#1084#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
      DataField = 'ZaMesGod'
      DataSource = dsrcIndx
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = DBEditEnter
      OnExit = dbeZaMesGodExit
    end
    object dbeDtProc: TDBEdit
      Left = 231
      Top = 34
      Width = 80
      Height = 21
      TabStop = False
      Color = clMoneyGreen
      DataField = 'DtProc'
      DataSource = dsrcIndx
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 109
      Width = 303
      Height = 33
      Caption = ' '#1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103': '
      TabOrder = 2
      object rBtnByDef: TRadioButton
        Left = 23
        Top = 13
        Width = 103
        Height = 17
        Hint = #1057#1095#1077#1090#1072' '#1074#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1079' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        Caption = '- '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Checked = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        OnClick = rBtnByDefClick
      end
      object rBtnByVub: TRadioButton
        Left = 138
        Top = 13
        Width = 159
        Height = 17
        Hint = #1042#1089#1077#1084' '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1085#1080#1078#1077' '#1089#1095#1077#1090
        Caption = '- '#1074#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = rBtnByVubClick
      end
    end
    object dbeSchBU: TDBEdit
      Left = 231
      Top = 147
      Width = 65
      Height = 21
      Color = clMoneyGreen
      DataField = 'SchBU'
      DataSource = dsrcIndx
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnDblClick = dbeSchBUDblClick
      OnEnter = DBEditEnter
      OnExit = dbeSchBUExit
      OnKeyDown = dbeSchBUKeyDown
    end
    object rBtnSps: TRadioButton
      Left = 10
      Top = 199
      Width = 113
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1089#1087#1080#1089#1086#1082
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = rBtnSpsClick
    end
    object rBtnAll: TRadioButton
      Left = 130
      Top = 199
      Width = 113
      Height = 17
      Caption = #1055#1086#1083#1085#1099#1081' '#1088#1072#1089#1095#1105#1090
      TabOrder = 5
      OnClick = rBtnSpsClick
    end
    object MemoSps: TMemo
      Left = 0
      Top = 215
      Width = 312
      Height = 65
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '470,1239,3271,4146,6618,6627,6876,6936,8126,'
        '8187,8343,12394,17138,19621,21593,22822,4549,'
        '7298,7304,7309,7470,7877,4380,6373,54099,7876,'
        '41195,7997,8200')
      ParentFont = False
      TabOrder = 6
    end
    object dbeKdSchBU: TDBEdit
      Left = 95
      Top = 320
      Width = 46
      Height = 21
      TabStop = False
      DataField = 'KdSchBU'
      DataSource = dsrcIndx
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object bBtnOk: TBitBtn
      Left = 152
      Top = 318
      Width = 75
      Height = 25
      Caption = #1042#1074#1086#1076
      TabOrder = 8
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 236
      Top = 318
      Width = 75
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 9
      Kind = bkCancel
    end
  end
  object PanelRight: TPanel
    Left = 320
    Top = 0
    Width = 147
    Height = 376
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Caption = 'PanelRight'
    TabOrder = 1
    DesignSize = (
      147
      376)
    object dbgrPrc: TDBGrid
      Left = 0
      Top = 0
      Width = 145
      Height = 366
      Hint = #1041#1072#1079#1086#1074#1099#1077' '#1084#1077#1089#1103#1094#1099' '#1080' '#1087#1088#1086#1094#1077#1085#1090#1099' '#1080#1085#1076#1077#1082#1089#1072#1094#1080#1080' '#1076#1083#1103' '#1085#1080#1093
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 9894605
      DataSource = dsrcPrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pop
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'BAZMES'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRCIND'
          Width = 51
          Visible = True
        end>
    end
    object stCntPrcRec: TStaticText
      Left = 0
      Top = 359
      Width = 147
      Height = 17
      Align = alBottom
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'stCntPrcRec'
      TabOrder = 1
    end
  end
  object qryTmp: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_HINDX')
  end
  object dsrcIndx: TDataSource
    DataSet = cdsIndx
    Left = 37
    Top = 6
  end
  object cdsIndx: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DtProc'
        DataType = ftDate
      end
      item
        Name = 'ZaMesGod'
        DataType = ftDate
      end
      item
        Name = 'SmProgMin'
        DataType = ftFloat
      end
      item
        Name = 'InclSovm'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MesChngMinZp'
        DataType = ftDate
      end
      item
        Name = 'DefaultSchBu'
        DataType = ftBoolean
      end
      item
        Name = 'KdSchBU'
        DataType = ftSmallint
      end
      item
        Name = 'SchBU'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    object cdsIndxNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsIndxDtProc: TDateField
      FieldName = 'DtProc'
      DisplayFormat = 'mm/yyyy'
    end
    object cdsIndxZaMesGod: TDateField
      FieldName = 'ZaMesGod'
      OnValidate = cdsIndxZaMesGodValidate
      DisplayFormat = 'mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsIndxSmProgMin: TFloatField
      FieldName = 'SmProgMin'
      DisplayFormat = '#.00'
    end
    object cdsIndxMesChngMinZp: TDateField
      FieldName = 'MesChngMinZp'
      OnValidate = cdsIndxMesChngMinZpValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsIndxInclSovm: TStringField
      FieldName = 'InclSovm'
      Size = 1
    end
    object cdsIndxDefaultSchBu: TBooleanField
      FieldName = 'DefaultSchBu'
    end
    object cdsIndxKdSchBU: TSmallintField
      FieldName = 'KdSchBU'
    end
    object cdsIndxSchBU: TStringField
      FieldName = 'SchBU'
      Size = 10
    end
  end
  object qry_Tmp: TQuery
    Top = 38
  end
  object qryAdd: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrcIndx where IndMes = :dIndMes'
      'order by BazMes'
      '')
    Left = 32
    Top = 38
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dIndMes'
        ParamType = ptInput
        Value = 40269d
      end>
    object qryAddNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRCINDX.NR'
    end
    object qryAddINDMES: TDateTimeField
      FieldName = 'INDMES'
      Origin = 'DbMain.Z_PRCINDX.INDMES'
    end
    object qryAddBAZMES: TDateTimeField
      FieldName = 'BAZMES'
      Origin = 'DbMain.Z_PRCINDX.BAZMES'
    end
    object qryAddPRCIND: TFloatField
      FieldName = 'PRCIND'
      Origin = 'DbMain.Z_PRCINDX.PRCIND'
    end
    object qryAddLASTDTBM: TDateTimeField
      FieldName = 'LASTDTBM'
      Origin = 'DbMain.Z_PRCINDX.LASTDTBM'
    end
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 426
    Top = 32
    object popDelRec: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      OnClick = popDelRecClick
    end
    object popDelAll: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      OnClick = popDelAllClick
    end
    object popAddRecs: TMenuItem
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1084#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072
      OnClick = popAddRecsClick
    end
  end
  object qryPrc: TQuery
    CachedUpdates = True
    BeforeInsert = qryPrcBeforeInsert
    BeforePost = qryPrcBeforePost
    AfterPost = qryPrcAfterPost
    AfterDelete = qryPrcAfterDelete
    OnNewRecord = qryPrcNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrcIndx where IndMes = :dIndMes'
      'order by BazMes')
    UpdateObject = updPrc
    Left = 360
    Top = 82
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dIndMes'
        ParamType = ptInput
        Value = 40269d
      end>
    object qryPrcNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRCINDX.NR'
    end
    object qryPrcINDMES: TDateTimeField
      FieldName = 'INDMES'
      Origin = 'DbMain.Z_PRCINDX.INDMES'
    end
    object qryPrcBAZMES: TDateTimeField
      DisplayLabel = #1041#1072#1079#1086#1074#1099#1081#1052#1077#1089#1103#1094
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
      FieldName = 'LASTDTBM'
      Origin = 'DbMain.Z_PRCINDX.LASTDTBM'
    end
  end
  object dsrcPrc: TDataSource
    DataSet = qryPrc
    Left = 376
    Top = 96
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
    Left = 384
    Top = 104
  end
end
