object FormKdLgt: TFormKdLgt
  Left = 476
  Top = 498
  Width = 425
  Height = 220
  ActiveControl = dbgrKdLgt
  BorderIcons = [biSystemMenu]
  Caption = 'FormKdLgt'
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 580
  Constraints.MinHeight = 220
  Constraints.MinWidth = 425
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
  object Panel1: TPanel
    Left = 0
    Top = 162
    Width = 417
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      417
      31)
    object bBtnOk: TBitBtn
      Left = 252
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 340
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrKdLgt: TDBGrid
    Left = 0
    Top = 0
    Width = 417
    Height = 162
    Align = alClient
    Color = 15990494
    DataSource = dsrcKdLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrKdLgtDblClick
    OnEnter = dbgrKdLgtEnter
    OnExit = dbgrKdLgtExit
    OnKeyDown = dbgrKdLgtKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDLGT'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHLGT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMLGT'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 71
        Visible = True
      end>
  end
  object qryKdLgt: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KdLgt')
    UpdateObject = updKdLgt
    Left = 64
    Top = 64
    object qryKdLgtNR: TIntegerField
      DisplayWidth = 5
      FieldName = 'NR'
      Origin = 'DbMain.Z_KDLGT.NR'
    end
    object qryKdLgtKDLGT: TSmallintField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'KDLGT'
      Origin = 'DbMain.Z_KDLGT.KDLGT'
    end
    object qryKdLgtOZN_PILG: TSmallintField
      DisplayLabel = #1054#1079#1085#1055#1110#1083#1100#1075
      FieldName = 'OZN_PILG'
      Origin = 'DbMain.Z_KDLGT.OZN_PILG'
    end
    object qryKdLgtSHLGT: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 12
      FieldName = 'SHLGT'
      Origin = 'DbMain.Z_KDLGT.SHLGT'
      Size = 10
    end
    object qryKdLgtNMLGT: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 78
      FieldName = 'NMLGT'
      Origin = 'DbMain.Z_KDLGT.NMLGT'
      Size = 65
    end
    object qryKdLgtNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 78
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_KDLGT.NOTES'
      Size = 65
    end
  end
  object dsrcKdLgt: TDataSource
    DataSet = qryKdLgt
    Left = 80
    Top = 80
  end
  object updKdLgt: TUpdateSQL
    ModifySQL.Strings = (
      'update z_KdLgt'
      'set'
      '  KDLGT = :KDLGT,'
      '  OZN_PILG = :OZN_PILG,'
      '  SHLGT = :SHLGT,'
      '  NMLGT = :NMLGT,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_KdLgt'
      '  (KDLGT, OZN_PILG, SHLGT, NMLGT, NOTES)'
      'values'
      '  (:KDLGT, :OZN_PILG, :SHLGT, :NMLGT, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_KdLgt'
      'where'
      '  NR = :OLD_NR')
    Left = 96
    Top = 96
  end
  object pop: TPopupMenu
    Left = 32
    Top = 64
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object qryTmp: TQuery
    Left = 192
    Top = 64
  end
end
