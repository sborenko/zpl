object Form_TStZ: TForm_TStZ
  Left = 352
  Top = 136
  Width = 400
  Height = 581
  ActiveControl = TV
  BorderIcons = [biSystemMenu]
  Caption = 'Form_TStZ'
  Color = clBtnFace
  Constraints.MaxWidth = 475
  Constraints.MinHeight = 350
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
  object LabelPopMsg: TLabel
    Left = 0
    Top = 0
    Width = 392
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1099#1079#1099#1074#1072#1081#1090#1077' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1077#1077' '#1084#1077#1085#1102' '#1087#1088#1072#1074#1086#1081' '#1082#1083#1072#1074#1080#1096#1077#1081' '#1084#1099#1096#1082#1080
    Color = clAqua
    ParentColor = False
    Visible = False
  end
  object LabelNotFound: TLabel
    Left = 0
    Top = 13
    Width = 392
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1072#1103' '#1089#1090#1072#1090#1100#1103' '#1079#1072#1090#1088#1072#1090' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelIsSborny: TLabel
    Left = 0
    Top = 26
    Width = 392
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1042#1074#1077#1076#1077#1085#1085#1072#1103' '#1089#1090#1072#1090#1100#1103' - '#1089#1073#1086#1088#1085#1072#1103'. '#1053#1072' '#1085#1077#1077' '#1086#1090#1085#1086#1089#1080#1090#1100' '#1085#1077#1083#1100#1079#1103'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object LabelErr3: TLabel
    Left = 0
    Top = 39
    Width = 392
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = #1057#1076#1077#1083#1072#1081#1090#1077' '#1087#1088#1072#1074#1080#1083#1100#1085#1099#1081' '#1074#1099#1073#1086#1088' '#1080#1079' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1089#1090#1072#1090#1077#1081' '#1079#1072#1090#1088#1072#1090'.'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 524
    Width = 392
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      392
      30)
    object bBtnOk: TBitBtn
      Left = 228
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 316
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 392
    Height = 472
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object TV: TTreeView
      Left = 0
      Top = 0
      Width = 392
      Height = 360
      Align = alClient
      Color = clCream
      Indent = 19
      PopupMenu = popTree
      ReadOnly = True
      RightClickSelect = True
      TabOrder = 0
      OnChange = TVChange
    end
    object dbgrStZ: TDBGrid
      Left = 0
      Top = 360
      Width = 392
      Height = 112
      Align = alBottom
      Color = clBtnFace
      DataSource = dsrcStZ
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'KDSTZ'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHSTZ'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMSTZ'
          Width = 153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AINDX'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PINDX'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LVL'
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INDX'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HSCH'
          Width = 14
          Visible = True
        end>
    end
  end
  object qryStZ: TQuery
    CachedUpdates = True
    BeforePost = qryStZBeforePost
    AfterPost = qryStZAfterPost
    AfterDelete = qryStZAfterPost
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from Kd_StZ'
      '  order by AIndx, Lvl, PIndx'
      '')
    UpdateObject = updStZ
    Left = 24
    Top = 192
    object qryStZNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.KD_STZ.NR'
    end
    object qryStZKDSTZ: TSmallintField
      FieldName = 'KDSTZ'
      Origin = 'DbMain.KD_STZ.KDSTZ'
    end
    object qryStZSHSTZ: TStringField
      FieldName = 'SHSTZ'
      Origin = 'DbMain.KD_STZ.SHSTZ'
      EditMask = '####'
      Size = 10
    end
    object qryStZNMSTZ: TStringField
      FieldName = 'NMSTZ'
      Origin = 'DbMain.KD_STZ.NMSTZ'
      Size = 125
    end
    object qryStZAINDX: TSmallintField
      FieldName = 'AINDX'
      Origin = 'DbMain.KD_STZ.AINDX'
    end
    object qryStZPINDX: TSmallintField
      FieldName = 'PINDX'
      Origin = 'DbMain.KD_STZ.PINDX'
    end
    object qryStZLVL: TSmallintField
      FieldName = 'LVL'
      Origin = 'DbMain.KD_STZ.LVL'
    end
    object qryStZINDX: TSmallintField
      FieldName = 'INDX'
      Origin = 'DbMain.KD_STZ.INDX'
    end
    object qryStZHSCH: TStringField
      FieldName = 'HSCH'
      Origin = 'DbMain.KD_STZ.HSCH'
      FixedChar = True
      Size = 1
    end
    object qryStZPVNUTR: TStringField
      FieldName = 'PVNUTR'
      Origin = 'DbMain.KD_STZ.PVNUTR'
      FixedChar = True
      Size = 1
    end
    object qryStZSH_STZ: TSmallintField
      FieldName = 'SH_STZ'
      Origin = 'DbMain.KD_STZ.SH_STZ'
    end
  end
  object dsrcStZ: TDataSource
    DataSet = qryStZ
    Left = 38
    Top = 210
  end
  object updStZ: TUpdateSQL
    ModifySQL.Strings = (
      'update Kd_StZ'
      'set'
      '  KDSTZ = :KDSTZ,'
      '  SHSTZ = :SHSTZ,'
      '  NMSTZ = :NMSTZ,'
      '  AINDX = :AINDX,'
      '  PINDX = :PINDX,'
      '  LVL = :LVL,'
      '  INDX = :INDX,'
      '  HSCH = :HSCH,'
      '  PVNUTR = :PVNUTR,'
      '  SH_STZ = :SH_STZ'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Kd_StZ'
      
        '  (KDSTZ, SHSTZ, NMSTZ, AINDX, PINDX, LVL, INDX, HSCH, PVNUTR, S' +
        'H_STZ)'
      'values'
      
        '  (:KDSTZ, :SHSTZ, :NMSTZ, :AINDX, :PINDX, :LVL, :INDX, :HSCH, :' +
        'PVNUTR, '
      '   :SH_STZ)')
    DeleteSQL.Strings = (
      'delete from Kd_StZ'
      'where'
      '  NR = :OLD_NR')
    Left = 54
    Top = 226
  end
  object qryTmp: TQuery
    Left = 304
    Top = 148
  end
  object popTree: TPopupMenu
    OnPopup = popTreePopup
    Left = 248
    Top = 152
    object popTreeVubor: TMenuItem
      Caption = #1042#1099#1073#1086#1088
      OnClick = popTreeVuborClick
    end
    object popTreeFullExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullExpandClick
    end
    object popTreeFullCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = popTreeFullCollapseClick
    end
    object popTreeExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
    end
    object popTreeSep1: TMenuItem
      Caption = '-'
    end
    object popTreeEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popTreeEdtClick
    end
    object popTreeAddInRoot: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1088#1077#1085#1100
      Hint = #1053#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1074' '#1082#1086#1088#1077#1085#1100' '#1087#1086#1083#1077#1076#1085#1080#1084
      OnClick = popTreeAddInRootClick
    end
    object popTreeAddFirstInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1074#1099#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      OnClick = popTreeAddFirstInCurrentClick
    end
    object popTreeAddLastInCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      OnClick = popTreeAddLastInCurrentClick
    end
    object popTreeInsertBeforeCurrent: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1074#1087#1077#1088#1077#1076#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      OnClick = popTreeInsertBeforeCurrentClick
    end
    object popTreeAddInNode: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1085#1091#1090#1088#1100' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1091#1079#1083#1072
      OnClick = popTreeAddInNodeClick
    end
    object popTreeMoveInTo: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1085#1091#1090#1088#1100' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      OnClick = popTreeMoveInToClick
    end
    object popTreeMoveTo: TMenuItem
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1087#1077#1088#1077#1076#1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1091#1079#1083#1072
      OnClick = popTreeMoveToClick
    end
    object popTreeDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popTreeDelClick
    end
    object popTreeSep2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object popTreeSaveToTable: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1091' '#1041#1044
      Hint = 
        #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1089#1095#1077#1090#1086#1074' '#1074' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu '#1080' Sbu_Txt ('#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077 +
        ' '#1079#1072#1087#1080#1089#1080' '#1091#1076#1072#1083#1103#1102#1090#1089#1103')'
      Visible = False
      OnClick = popTreeSaveToTableClick
    end
    object popTreeLoadFromTable: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' '#1041#1044
      Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1077#1088#1077#1074#1072' '#1080#1079' '#1090#1072#1073#1083#1080#1094#1099' Kd_Sbu'
      Visible = False
      OnClick = popTreeLoadFromTableClick
    end
  end
end
