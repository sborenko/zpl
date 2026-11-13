object FrmOznDoh: TFrmOznDoh
  Left = 616
  Top = 469
  Width = 483
  Height = 172
  ActiveControl = DbgrOznDoh
  Caption = 'FrmOznDoh'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TPanel
    Left = 0
    Top = 115
    Width = 475
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      475
      30)
    object BtnSelect: TBitBtn
      Left = 304
      Top = 4
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object BtnExit: TBitBtn
      Left = 400
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1081#1090#1080
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DbgrOznDoh: TDBGrid
    Left = 0
    Top = 0
    Width = 475
    Height = 115
    Align = alClient
    DataSource = DsrcOznDoh
    PopupMenu = PopMenu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DbgrOznDohDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'OznDoh'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes'
        Visible = True
      end>
  end
  object QryOznDoh: TQuery
    CachedUpdates = True
    AfterPost = QryOznDohAfterPost
    SQL.Strings = (
      'select * from z_OznDoh')
    UpdateObject = UpdOznDoh
    Left = 104
    Top = 16
    object QryOznDohOZN: TIntegerField
      DisplayLabel = #1054#1079#1085#1072#1082#1072
      FieldName = 'OznDoh'
      OnValidate = QryOznDohOZNValidate
    end
    object QryOznDohNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
      FieldName = 'Notes'
      Size = 32
    end
  end
  object UpdOznDoh: TUpdateSQL
    ModifySQL.Strings = (
      'update z_OznDoh'
      'set'
      '  OZNDOH = :OZNDOH,'
      '  NOTES = :NOTES'
      'where'
      '  OZNDOH = :OZNDOH')
    InsertSQL.Strings = (
      'insert into z_OznDoh'
      '  (OZNDOH, NOTES)'
      'values'
      '  (:OZNDOH, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_OznDoh'
      'where'
      '  OZNDOH = :OLD_OZNDOH')
    Left = 128
    Top = 32
  end
  object DsrcOznDoh: TDataSource
    DataSet = QryOznDoh
    OnDataChange = DsrcOznDohDataChange
    Left = 152
    Top = 48
  end
  object QryPeek: TQuery
    Left = 312
    Top = 48
  end
  object PopMenu: TPopupMenu
    Left = 392
    Top = 16
    object NDelete: TMenuItem
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      OnClick = NDeleteClick
    end
  end
end
