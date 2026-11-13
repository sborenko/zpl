object FormPidZviln: TFormPidZviln
  Left = 694
  Top = 410
  Width = 625
  Height = 460
  BorderIcons = [biSystemMenu]
  Caption = 'FormPidZviln'
  Color = clBtnFace
  Constraints.MaxHeight = 680
  Constraints.MinHeight = 460
  Constraints.MinWidth = 625
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
  object DBText1: TDBText
    Left = 0
    Top = 0
    Width = 617
    Height = 17
    Hint = #1055#1086#1083#1077' "'#1055#1088#1080#1095#1080#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103'"'
    Align = alTop
    DataField = 'NAME'
    DataSource = dsrcPidZv
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 617
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      617
      28)
    object LabelCntRec: TLabel
      Left = 4
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnOk: TBitBtn
      Left = 436
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 1
    end
    object bBtnCancel: TBitBtn
      Left = 540
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 1
    end
    object DBNavigator1: TDBNavigator
      Left = 86
      Top = 2
      Width = 80
      Height = 25
      DataSource = dsrcPidZv
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object dbgrPidZv: TDBGrid
    Left = 0
    Top = 17
    Width = 617
    Height = 388
    Align = alClient
    Color = 11861218
    DataSource = dsrcPidZv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = Pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrPidZvDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REASONS'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 269
        Visible = True
      end>
  end
  object qryPidZv: TQuery
    CachedUpdates = True
    AfterInsert = qryPidZvAfterInsert
    AfterPost = qryPidZvAfterPost
    AfterDelete = qryPidZvAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PidZviln')
    UpdateObject = updPidZv
    Left = 64
    Top = 96
    object qryPidZvNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PIDZVILN.NR'
    end
    object qryPidZvNUM: TStringField
      FieldName = 'NUM'
      Origin = 'DbMain.Z_PIDZVILN.NUM'
    end
    object qryPidZvCODE: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Origin = 'DbMain.Z_PIDZVILN.CODE'
    end
    object qryPidZvREASONS: TStringField
      DisplayLabel = #1064#1080#1092#1088' '#1087#1088#1080#1095#1080#1085#1099' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      FieldName = 'REASONS'
      Origin = 'DbMain.Z_PIDZVILN.REASONS'
      Size = 250
    end
    object qryPidZvNAME: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
      FieldName = 'NAME'
      Origin = 'DbMain.Z_PIDZVILN.NAME'
      Size = 250
    end
  end
  object dsrcPidZv: TDataSource
    DataSet = qryPidZv
    Left = 80
    Top = 112
  end
  object Pop: TPopupMenu
    OnPopup = PopPopup
    Left = 208
    Top = 128
    object popHead: TMenuItem
      Caption = '== '#1055#1088#1080#1095#1080#1085#1099' '#1079#1074'i'#1083#1100#1085#1077#1085#1085#1103' =='
      Enabled = False
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popEDt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEDtClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object updPidZv: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PidZviln'
      'set'
      '  NR = :NR,'
      '  CODE = :CODE,'
      '  NUM = :NUM,'
      '  NAME = :NAME,'
      '  REASONS = :REASONS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PidZviln'
      '  (NR, CODE, NUM, NAME, REASONS)'
      'values'
      '  (:NR, :CODE, :NUM, :NAME, :REASONS)')
    DeleteSQL.Strings = (
      'delete from z_PidZviln'
      'where'
      '  NR = :OLD_NR')
    Left = 96
    Top = 128
  end
end
