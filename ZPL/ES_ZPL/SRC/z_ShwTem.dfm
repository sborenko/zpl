object FormShowTemu: TFormShowTemu
  Left = 367
  Top = 279
  Width = 841
  Height = 566
  ActiveControl = dbgrTm
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowTemu'
  Color = clBtnFace
  Constraints.MinHeight = 555
  Constraints.MinWidth = 841
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    833
    539)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 335
    Top = 0
    Height = 539
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 539
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object dbgrGrp: TDBGrid
      Left = 0
      Top = 0
      Width = 335
      Height = 539
      Hint = #1043#1091#1087#1087#1099' '#1090#1077#1084' '#1080' '#1080' '#1072#1088#1093#1080#1074#1086#1074
      Align = alClient
      Color = 7205805
      DataSource = dsrcGrp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrGrpDrawColumnCell
      OnEnter = dbgrTmEnter
      OnExit = dbgrTmExit
      Columns = <
        item
          Expanded = False
          FieldName = 'GRP'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMSCH'
          Width = 176
          Visible = True
        end>
    end
  end
  object PanelRight: TPanel
    Left = 338
    Top = 0
    Width = 495
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 495
      Height = 31
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        495
        31)
      object LabelCntRec: TLabel
        Left = 95
        Top = 8
        Width = 62
        Height = 13
        Caption = 'LabelCntRec'
      end
      object DbNavTm: TDBNavigator
        Left = 7
        Top = 3
        Width = 80
        Height = 25
        DataSource = dsrcTm
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object bBtnCancel: TBitBtn
        Left = 416
        Top = 3
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 1
        Kind = bkCancel
        Spacing = 0
      end
      object bBtnOk: TBitBtn
        Left = 264
        Top = 3
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1086#1088
        TabOrder = 2
        Kind = bkOK
      end
    end
    object dbgrTm: TDBGrid
      Left = 0
      Top = 31
      Width = 495
      Height = 508
      Hint = #1058#1077#1084#1099' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080' '#1083#1077#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pop
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrTmDrawColumnCell
      OnDblClick = dbgrTmDblClick
      OnEnter = dbgrTmEnter
      OnExit = dbgrTmExit
      Columns = <
        item
          Expanded = False
          FieldName = 'GRP'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDTEMU'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMSCH'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH_UMC'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH_KMD'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KDPSCH_ESV'
          Width = 56
          Visible = True
        end>
    end
  end
  object PanelTemuDet: TPanel
    Left = 12
    Top = 395
    Width = 290
    Height = 138
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Visible = False
    DesignSize = (
      290
      138)
    object Label1: TLabel
      Left = 52
      Top = 16
      Width = 27
      Height = 13
      Caption = #1058#1077#1084#1072
    end
    object Label2: TLabel
      Left = 31
      Top = 39
      Width = 48
      Height = 13
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072
    end
    object Label3: TLabel
      Left = 21
      Top = 63
      Width = 58
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
    end
    object Label4: TLabel
      Left = 4
      Top = 87
      Width = 75
      Height = 13
      Caption = #1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1080
    end
    object Label5: TLabel
      Left = 58
      Top = 116
      Width = 21
      Height = 13
      Caption = #1045#1057#1042
    end
    object sbtnCloseTemuDet: TSpeedButton
      Left = 275
      Top = -2
      Width = 15
      Height = 15
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = sbtnCloseTemuDetClick
    end
    object dbeNmSch: TDBEdit
      Left = 142
      Top = 12
      Width = 133
      Height = 21
      DataField = 'NMSCH'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object fbeKdTemu: TDBEdit
      Left = 86
      Top = 12
      Width = 50
      Height = 21
      DataField = 'KDTEMU'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbeKdSchZpl: TDBEdit
      Left = 86
      Top = 35
      Width = 50
      Height = 21
      DataField = 'KDPSCH'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbePsZpl: TDBEdit
      Left = 142
      Top = 35
      Width = 133
      Height = 21
      DataField = 'PS_17'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbeKdSchUmc: TDBEdit
      Left = 86
      Top = 59
      Width = 50
      Height = 21
      DataField = 'KDPSCH_UMC'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbePsUmc: TDBEdit
      Left = 142
      Top = 59
      Width = 133
      Height = 21
      DataField = 'PSCH_UMC'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbeKdSchKmd: TDBEdit
      Left = 86
      Top = 83
      Width = 50
      Height = 21
      DataField = 'KDPSCH_KMD'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object dbePsKmd: TDBEdit
      Left = 142
      Top = 83
      Width = 133
      Height = 21
      DataField = 'PSCH_KMD'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object dbeKdSchEsv: TDBEdit
      Left = 86
      Top = 108
      Width = 50
      Height = 21
      DataField = 'KDPSCH_ESV'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbePsEsv: TDBEdit
      Left = 143
      Top = 108
      Width = 133
      Height = 21
      DataField = 'PSCH_ESV'
      DataSource = dsrcTm
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object qryTm: TQuery
    CachedUpdates = True
    AfterOpen = qryTmAfterOpen
    BeforeClose = qryTmBeforeClose
    BeforeInsert = qryTmBeforeInsert
    AfterPost = qryTmAfterPost
    AfterDelete = qryTmAfterDelete
    OnNewRecord = qryTmNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_Temu order by Grp')
    UpdateObject = updTm
    Left = 408
    Top = 112
    object qryTmNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KD_TEMU.NR'
    end
    object qryTmKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1058#1077#1084#1099
      FieldName = 'KDTEMU'
      Origin = 'DbMain.KD_TEMU.KDTEMU'
    end
    object qryTmKDPSCH: TSmallintField
      DisplayLabel = #1047#1087#1050#1076#1057#1095
      FieldName = 'KDPSCH'
      Origin = 'DbMain.KD_TEMU.KDPSCH'
    end
    object qryTmSCHBU: TStringField
      FieldName = 'SCHBU'
      Origin = 'DbMain.KD_TEMU.SCHBU'
      Size = 15
    end
    object qryTmSCH_17: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SCH_17'
      Origin = 'DbMain.KD_TEMU.SCH_17'
      Size = 15
    end
    object qryTmPSCH: TStringField
      FieldName = 'PSCH'
      Origin = 'DbMain.KD_TEMU.PSCH'
      Size = 15
    end
    object qryTmAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.KD_TEMU.AINDX'
    end
    object qryTmLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.KD_TEMU.LVL'
    end
    object qryTmPS_17: TStringField
      DisplayLabel = #1047#1050#1076#1057#1095
      FieldName = 'PS_17'
      Origin = 'DbMain.KD_TEMU.PS_17'
      Size = 15
    end
    object qryTmNMSCH: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1090#1077#1084#1099
      FieldName = 'NMSCH'
      Origin = 'DbMain.KD_TEMU.NMSCH'
      Size = 65
    end
    object qryTmHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.KD_TEMU.HSCH'
      Size = 1
    end
    object qryTmSORT: TSmallintField
      FieldName = 'SORT'
      Origin = 'DbMain.KD_TEMU.SORT'
    end
    object qryTmGRP: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'GRP'
      Origin = 'DbMain.KD_TEMU.GRP'
    end
    object qryTmARC: TStringField
      DisplayLabel = #1040#1088#1093
      FieldName = 'ARC'
      Origin = 'DbMain.KD_TEMU.ARC'
      Size = 1
    end
    object qryTmKDPSCH_UMC: TSmallintField
      DisplayLabel = #1059#1084#1094#1050#1076#1057#1095
      FieldName = 'KDPSCH_UMC'
      Origin = 'DbMain.KD_TEMU.KDPSCH_UMC'
    end
    object qryTmPSCH_UMC: TStringField
      DisplayLabel = #1059#1084#1094#1055#1057#1095
      FieldName = 'PSCH_UMC'
      Origin = 'DbMain.KD_TEMU.PSCH_UMC'
      FixedChar = True
      Size = 15
    end
    object qryTmKDPSCH_ESV: TSmallintField
      DisplayLabel = #1045#1089#1074#1050#1076#1057#1095
      FieldName = 'KDPSCH_ESV'
      Origin = 'DbMain.KD_TEMU.KDPSCH_ESV'
    end
    object qryTmPSCH_ESV: TStringField
      FieldName = 'PSCH_ESV'
      Origin = 'DbMain.KD_TEMU.PSCH_ESV'
      FixedChar = True
      Size = 15
    end
    object qryTmKDPSCH_KMD: TSmallintField
      DisplayLabel = #1050#1084#1076#1050#1076#1057#1095
      FieldName = 'KDPSCH_KMD'
      Origin = 'DbMain.KD_TEMU.KDPSCH_KMD'
    end
    object qryTmPSCH_KMD: TStringField
      FieldName = 'PSCH_KMD'
      Origin = 'DbMain.KD_TEMU.PSCH_KMD'
      FixedChar = True
      Size = 15
    end
  end
  object dsrcTm: TDataSource
    DataSet = qryTm
    Left = 432
    Top = 128
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 280
    Top = 80
    object popHead: TMenuItem
      Caption = '= =  '#1058#1077#1084#1099' '#1053#1048#1063'  = ='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popToArc: TMenuItem
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100' '#1074' '#1072#1088#1093#1080#1074
      ShortCut = 16449
      OnClick = popToArcClick
    end
    object popFromArc: TMenuItem
      Caption = #1044#1086#1089#1090#1072#1090#1100' '#1080#1079' '#1072#1088#1093#1080#1074#1072
      ShortCut = 49217
      OnClick = popFromArcClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
    object popSep: TMenuItem
      Caption = '-'
    end
    object popFindByKdTemu: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1090#1077#1084#1099' '#1087#1086' '#1082#1086#1076#1091' '#1080#1083#1080' '#1085#1072#1079#1074#1072#1085#1080#1102
      OnClick = popFindByKdTemuClick
    end
    object popTemuDet: TMenuItem
      Caption = #1054' '#1090#1077#1084#1072#1093' '#1087#1086#1076#1088#1086#1073#1085#1077#1077
      OnClick = popTemuDetClick
    end
  end
  object qryTmp: TQuery
    Left = 488
    Top = 112
  end
  object updTm: TUpdateSQL
    ModifySQL.Strings = (
      'update Kd_Temu'
      'set'
      '  NR = :NR,'
      '  GRP = :GRP,'
      '  NMSCH = :NMSCH,'
      '  KDTEMU = :KDTEMU,'
      '  KDPSCH = :KDPSCH,'
      '  SCHBU = :SCHBU,'
      '  SCH_17 = :SCH_17,'
      '  PSCH = :PSCH,'
      '  AINDX = :AINDX,'
      '  LVL = :LVL,'
      '  PS_17 = :PS_17,'
      '  HSCH = :HSCH,'
      '  ARC = :ARC,'
      '  SORT = :SORT,'
      '  KDPSCH_UMC = :KDPSCH_UMC,'
      '  PSCH_UMC = :PSCH_UMC,'
      '  KDPSCH_ESV = :KDPSCH_ESV,'
      '  PSCH_ESV = :PSCH_ESV,'
      '  KDPSCH_KMD = :KDPSCH_KMD,'
      '  PSCH_KMD = :PSCH_KMD'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Kd_Temu'
      
        '  (NR, GRP, NMSCH, KDTEMU, KDPSCH, SCHBU, SCH_17, PSCH, AINDX, L' +
        'VL, PS_17, '
      
        '   HSCH, ARC, SORT, KDPSCH_UMC, PSCH_UMC, KDPSCH_ESV, PSCH_ESV, ' +
        'KDPSCH_KMD, '
      '   PSCH_KMD)'
      'values'
      
        '  (:NR, :GRP, :NMSCH, :KDTEMU, :KDPSCH, :SCHBU, :SCH_17, :PSCH, ' +
        ':AINDX, '
      
        '   :LVL, :PS_17, :HSCH, :ARC, :SORT, :KDPSCH_UMC, :PSCH_UMC, :KD' +
        'PSCH_ESV, '
      '   :PSCH_ESV, :KDPSCH_KMD, :PSCH_KMD)')
    DeleteSQL.Strings = (
      'delete from Kd_Temu'
      'where'
      '  NR = :OLD_NR')
    Left = 448
    Top = 144
  end
  object qryGrp: TQuery
    AfterScroll = qryGrpAfterScroll
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_Temu where Grp in (10,20,30,40,50,60)')
    Left = 88
    Top = 64
    object qryGrpNR: TIntegerField
      FieldName = 'NR'
    end
    object qryGrpKDTEMU: TSmallintField
      DisplayLabel = #1050#1076#1043#1088#1087
      FieldName = 'KDTEMU'
    end
    object qryGrpKDPSCH: TSmallintField
      FieldName = 'KDPSCH'
    end
    object qryGrpSCHBU: TStringField
      FieldName = 'SCHBU'
      Size = 15
    end
    object qryGrpSCH_17: TStringField
      FieldName = 'SCH_17'
      Size = 15
    end
    object qryGrpPSCH: TStringField
      FieldName = 'PSCH'
      Size = 15
    end
    object qryGrpAINDX: TSmallintField
      FieldName = 'AINDX'
    end
    object qryGrpLVL: TSmallintField
      FieldName = 'LVL'
    end
    object qryGrpPS_17: TStringField
      DisplayLabel = #1055#1057#1103#1105#1090
      FieldName = 'PS_17'
      Size = 15
    end
    object qryGrpNMSCH: TStringField
      DisplayLabel = #1053#1072#1079#1074'. '#1075#1088#1091#1087#1087#1099
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryGrpHSCH: TStringField
      FieldName = 'HSCH'
      Size = 1
    end
    object qryGrpARC: TStringField
      FieldName = 'ARC'
      Size = 1
    end
    object qryGrpSORT: TSmallintField
      FieldName = 'SORT'
    end
    object qryGrpGRP: TSmallintField
      DisplayLabel = #1043#1088#1087
      FieldName = 'GRP'
    end
    object qryGrpKDPSCH_UMC: TSmallintField
      FieldName = 'KDPSCH_UMC'
    end
    object qryGrpPSCH_UMC: TStringField
      FieldName = 'PSCH_UMC'
      FixedChar = True
      Size = 15
    end
    object qryGrpKDPSCH_ESV: TSmallintField
      FieldName = 'KDPSCH_ESV'
    end
    object qryGrpPSCH_ESV: TStringField
      FieldName = 'PSCH_ESV'
      FixedChar = True
      Size = 15
    end
    object qryGrpKDPSCH_KMD: TSmallintField
      FieldName = 'KDPSCH_KMD'
    end
    object qryGrpPSCH_KMD: TStringField
      FieldName = 'PSCH_KMD'
      FixedChar = True
      Size = 15
    end
  end
  object dsrcGrp: TDataSource
    DataSet = qryGrp
    Left = 104
    Top = 80
  end
end
