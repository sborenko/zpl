object FormPrBln: TFormPrBln
  Left = 706
  Top = 351
  Width = 430
  Height = 246
  ActiveControl = dbgrPrBln
  BorderIcons = [biSystemMenu]
  Caption = 'FormPrBln'
  Color = clBtnFace
  Constraints.MinHeight = 245
  Constraints.MinWidth = 430
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
    Top = 181
    Width = 422
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      422
      31)
    object bBtnOk: TBitBtn
      Left = 258
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 346
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrPrBln: TDBGrid
    Left = 0
    Top = 0
    Width = 422
    Height = 181
    Align = alClient
    Color = 11861218
    DataSource = dsrcPrBln
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = dbgrPrBlnColEnter
    OnColExit = dbgrPrBlnColExit
    OnDrawColumnCell = dbgrPrBlnDrawColumnCell
    OnDblClick = dbgrPrBlnDblClick
    OnEnter = dbgrPrBlnEnter
    OnExit = dbgrPrBlnExit
    Columns = <
      item
        Expanded = False
        FieldName = 'PRBLN'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMPRBLN'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Digital'
        Visible = False
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'BlnType'
        Title.Caption = #1058#1080#1087
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 83
        Visible = True
      end>
  end
  object qryPrBln: TQuery
    CachedUpdates = True
    BeforePost = qryPrBlnBeforePost
    AfterPost = qryPrBlnAfterPost
    OnNewRecord = qryPrBlnNewRecord
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_PrBln order by PrBln')
    UpdateObject = updPrBln
    Left = 48
    Top = 96
    object qryPrBlnNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_PRBLN.NR'
    end
    object qryPrBlnPRBLN: TSmallintField
      DisplayLabel = #1050#1086#1076#1055#1088#1080#1095#1080#1085#1099
      FieldName = 'PRBLN'
      Origin = 'DbMain.Z_PRBLN.PRBLN'
    end
    object qryPrBlnNMPRBLN: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
      FieldName = 'NMPRBLN'
      Origin = 'DbMain.Z_PRBLN.NMPRBLN'
      Size = 55
    end
    object qryPrBlnDigital: TStringField
      FieldName = 'Digital'
      Visible = False
      Size = 1
    end
    object qryPrBlnNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_PRBLN.NOTES'
      Size = 35
    end
    object qryPrBlnBlnType: TStringField
      FieldKind = fkCalculated
      FieldName = 'BlnType'
      ReadOnly = True
      Size = 6
      Calculated = True
    end
  end
  object dsrcPrBln: TDataSource
    DataSet = qryPrBln
    Left = 64
    Top = 112
  end
  object updPrBln: TUpdateSQL
    ModifySQL.Strings = (
      'update z_PrBln'
      'set'
      '  NR = :NR,'
      '  PRBLN = :PRBLN,'
      '  NMPRBLN = :NMPRBLN,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_PrBln'
      '  (NR, PRBLN, NMPRBLN, NOTES)'
      'values'
      '  (:NR, :PRBLN, :NMPRBLN, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_PrBln'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 128
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 136
    Top = 96
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
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
    Left = 352
    Top = 48
  end
end
