object FormShwBanks: TFormShwBanks
  Left = 349
  Top = 229
  Width = 540
  Height = 300
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwBanks'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 540
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
  object dbgrBnks: TDBGrid
    Left = 0
    Top = 0
    Width = 532
    Height = 244
    Align = alClient
    DataSource = dsrcBnks
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrBnksDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDBNK'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBANK'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBANK2'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBANKE'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRBANK'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRBANKE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFO'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 244
    Width = 532
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      532
      29)
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 3
      Width = 75
      Height = 25
    end
    object bBtnOk: TBitBtn
      Left = 377
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 456
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryBnks: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from Kd_Bnk')
    UpdateObject = updBnks
    Left = 48
    Top = 64
    object qryBnksNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.B_BNKRKV.NR'
    end
    object qryBnksKDBNK: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDBNK'
      Origin = 'DbMain.B_BNKRKV.KDBNK'
    end
    object qryBnksNMBANK: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      FieldName = 'NMBANK'
      Origin = 'DbMain.B_BNKRKV.NMBANK'
      Size = 65
    end
    object qryBnksNMBANK2: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' (2-'#1103' '#1089#1090#1088#1086#1082#1072')'
      FieldName = 'NMBANK2'
      Size = 65
    end
    object qryBnksNMBANKE: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086' '#1072#1085#1075#1083'.'
      FieldName = 'NMBANKE'
      Origin = 'DbMain.B_BNKRKV.NMBANKE'
      Size = 65
    end
    object qryBnksADRBANK: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072
      FieldName = 'ADRBANK'
      Origin = 'DbMain.B_BNKRKV.ADRBANK'
      Size = 65
    end
    object qryBnksADRBANKE: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1087#1086' '#1072#1085#1075#1083'.'
      FieldName = 'ADRBANKE'
      Origin = 'DbMain.B_BNKRKV.ADRBANKE'
      Size = 65
    end
    object qryBnksRSCH: TStringField
      DisplayLabel = #1056'/'#1089#1095'. '#1073#1072#1085#1082#1072
      FieldName = 'RSCH'
      Origin = 'DbMain.B_BNKRKV.RSCH'
      Size = 35
    end
    object qryBnksMFO: TStringField
      DisplayLabel = #1052#1060#1054' '#1073#1072#1085#1082#1072
      FieldName = 'MFO'
      Origin = 'DbMain.B_BNKRKV.MFO'
      Size = 35
    end
    object qryBnksOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054' '#1073#1072#1085#1082#1072
      FieldName = 'OKPO'
      Origin = 'DbMain.B_BNKRKV.OKPO'
      Size = 35
    end
    object qryBnksNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.B_BNKRKV.NOTES'
      Size = 65
    end
    object qryBnksSWIFT: TStringField
      FieldName = 'SWIFT'
      Origin = 'DbMain.B_BNKRKV.SWIFT'
      FixedChar = True
      Size = 25
    end
  end
  object dsrcBnks: TDataSource
    DataSet = qryBnks
    Left = 64
    Top = 80
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 128
    Top = 80
    object popHead: TMenuItem
      Caption = '== '#1041' '#1072' '#1085' '#1082' '#1080' =='
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
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
  object updBnks: TUpdateSQL
    ModifySQL.Strings = (
      'update b_BnkRkv'
      'set'
      '  KDBNK = :KDBNK,'
      '  NMBANK = :NMBANK,'
      '  NMBANK2 = :NMBANK2,'
      '  NMBANKE = :NMBANKE,'
      '  ADRBANK = :ADRBANK,'
      '  ADRBANKE = :ADRBANKE,'
      '  RSCH = :RSCH,'
      '  MFO = :MFO,'
      '  OKPO = :OKPO,'
      '  NOTES = :NOTES,'
      '  SWIFT = :SWIFT'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into b_BnkRkv'
      
        '  (KDBNK, NMBANK, NMBANK2, NMBANKE, ADRBANK, ADRBANKE, RSCH, MFO' +
        ', OKPO, '
      '   NOTES, SWIFT)'
      'values'
      
        '  (:KDBNK, :NMBANK, :NMBANK2, :NMBANKE, :ADRBANK, :ADRBANKE, :RS' +
        'CH, :MFO, '
      '   :OKPO, :NOTES, :SWIFT)')
    DeleteSQL.Strings = (
      'delete from b_BnkRkv'
      'where'
      '  NR = :OLD_NR')
    Left = 80
    Top = 96
  end
  object qryTmp: TQuery
    Left = 216
    Top = 80
  end
end
