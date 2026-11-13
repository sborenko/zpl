object FormIspSlg: TFormIspSlg
  Left = 402
  Top = 364
  Width = 730
  Height = 430
  ActiveControl = dbgrIsp
  BorderIcons = [biSystemMenu]
  Caption = 'FormIspSlg'
  Color = clBtnFace
  Constraints.MinHeight = 430
  Constraints.MinWidth = 730
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
    Top = 372
    Width = 722
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      722
      31)
    object LabelCountRec: TLabel
      Left = 16
      Top = 12
      Width = 74
      Height = 13
      Caption = 'LabelCountRec'
    end
    object bBtnOk: TBitBtn
      Left = 522
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 642
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 2
    end
  end
  object dbgrIsp: TDBGrid
    Left = 0
    Top = 0
    Width = 722
    Height = 372
    Align = alClient
    Color = clMoneyGreen
    Ctl3D = True
    DataSource = dsrcIsp
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = pop
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrIspDblClick
    OnEnter = dbgrIspEnter
    OnExit = dbgrIspExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSLG'
        Title.Alignment = taCenter
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSLG'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 211
        Visible = True
      end>
  end
  object qryIsp: TQuery
    CachedUpdates = True
    BeforePost = qryIspBeforePost
    AfterPost = qryIspAfterPost
    AfterDelete = qryIspAfterDelete
    OnNewRecord = qryIspNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_ispslg')
    UpdateObject = updIsp
    Left = 88
    Top = 160
    object qryIspNR: TIntegerField
      DisplayWidth = 11
      FieldName = 'NR'
      Origin = 'DbMain.Z_ISPSLG.NR'
    end
    object qryIspKDSLG: TSmallintField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 11
      FieldName = 'KDSLG'
      Origin = 'DbMain.Z_ISPSLG.KDSLG'
    end
    object qryIspNMSLG: TStringField
      DisplayLabel = #1057#1083#1091#1078#1073#1072
      DisplayWidth = 31
      FieldName = 'NMSLG'
      Origin = 'DbMain.Z_ISPSLG.NMSLG'
      Size = 200
    end
    object qryIspNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 225
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_ISPSLG.NOTES'
      Size = 200
    end
    object qryIspADRES: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 225
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_ISPSLG.ADRES'
      Size = 200
    end
  end
  object updIsp: TUpdateSQL
    ModifySQL.Strings = (
      'update z_ispslg'
      'set'
      '  NR = :NR,'
      '  KDSLG = :KDSLG,'
      '  NMSLG = :NMSLG,'
      '  NOTES = :NOTES,'
      '  ADRES = :ADRES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_ispslg'
      '  (NR, KDSLG, NMSLG, NOTES, ADRES)'
      'values'
      '  (:NR, :KDSLG, :NMSLG, :NOTES, :ADRES)')
    DeleteSQL.Strings = (
      'delete from z_ispslg'
      'where'
      '  NR = :OLD_NR')
    Left = 120
    Top = 192
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 24
    Top = 80
    object popHead: TMenuItem
      Caption = '  = =  '#1054#1087#1077#1088#1072#1094#1080#1080'  = =  '
      Enabled = False
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
  object dsrcIsp: TDataSource
    DataSet = qryIsp
    Left = 104
    Top = 176
  end
  object qryTmp: TQuery
    Left = 256
    Top = 88
  end
end
