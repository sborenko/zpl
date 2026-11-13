object FormSign: TFormSign
  Left = 332
  Top = 296
  Width = 793
  Height = 325
  ActiveControl = dbgrSign
  BorderIcons = [biSystemMenu]
  Caption = 'FormSign'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 950
  Constraints.MinHeight = 325
  Constraints.MinWidth = 600
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
    Top = 0
    Width = 785
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      785
      31)
    object LabelCntRec: TLabel
      Left = 93
      Top = 10
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnCancel: TBitBtn
      Left = 705
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcSign
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrSign: TDBGrid
    Left = 0
    Top = 31
    Width = 785
    Height = 267
    Align = alClient
    Color = 12909534
    DataSource = dsrcSign
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
    OnEnter = dbgrSignEnter
    OnExit = dbgrSignExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMRUK'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIORUK'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBUH'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIOBUH'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMZAMRUK'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIOZAMRUK'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMZAMBUH'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIOZAMBUH'
        Width = 79
        Visible = True
      end>
  end
  object qrySign: TQuery
    CachedUpdates = True
    BeforePost = qrySignBeforePost
    AfterPost = qrySignAfterPost
    AfterDelete = qrySignAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from All_Sign')
    UpdateObject = updSign
    Left = 40
    Top = 112
    object qrySignNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.ALL_SIGN.NR'
    end
    object qrySignFOR_APP: TStringField
      DisplayLabel = #1044#1083#1103#1040#1087#1087#1083
      FieldName = 'FOR_APP'
      Origin = 'DbMain.ALL_SIGN.FOR_APP'
      Size = 10
    end
    object qrySignDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      Origin = 'DbMain.ALL_SIGN.DTBEG'
      OnSetText = qrySignDTBEGSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qrySignNMRUK: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      FieldName = 'NMRUK'
      Origin = 'DbMain.ALL_SIGN.NMRUK'
      Size = 45
    end
    object qrySignFIORUK: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
      FieldName = 'FIORUK'
      Origin = 'DbMain.ALL_SIGN.FIORUK'
      Size = 35
    end
    object qrySignNMBUH: TStringField
      DisplayLabel = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
      FieldName = 'NMBUH'
      Origin = 'DbMain.ALL_SIGN.NMBUH'
      Size = 45
    end
    object qrySignFIOBUH: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.  '#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
      FieldName = 'FIOBUH'
      Origin = 'DbMain.ALL_SIGN.FIOBUH'
      Size = 35
    end
    object qrySignNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.ALL_SIGN.NOTES'
      Size = 45
    end
    object qrySignNMZAMRUK: TStringField
      DisplayLabel = #1047#1072#1084'.'#1088#1091#1082'.'#1076#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'NMZAMRUK'
      Origin = 'DbMain.ALL_SIGN.NMZAMRUK'
      Size = 45
    end
    object qrySignFIOZAMRUK: TStringField
      DisplayLabel = #1047#1072#1084'.'#1088#1091#1082'.'#1060#1048#1054
      FieldName = 'FIOZAMRUK'
      Origin = 'DbMain.ALL_SIGN.FIOZAMRUK'
      Size = 35
    end
    object qrySignNMZAMBUH: TStringField
      DisplayLabel = #1047#1072#1084'.'#1075#1083'.'#1073#1091#1093'.'#1076#1086#1083#1078#1085#1086#1089#1090#1100
      FieldName = 'NMZAMBUH'
      Origin = 'DbMain.ALL_SIGN.NMZAMBUH'
      Size = 45
    end
    object qrySignFIOZAMBUH: TStringField
      DisplayLabel = #1047#1072#1084'.'#1075#1083'.'#1073#1091#1093'.'#1060#1048#1054
      FieldName = 'FIOZAMBUH'
      Origin = 'DbMain.ALL_SIGN.FIOZAMBUH'
      Size = 35
    end
  end
  object dsrcSign: TDataSource
    DataSet = qrySign
    Left = 56
    Top = 128
  end
  object updSign: TUpdateSQL
    ModifySQL.Strings = (
      'update All_Sign'
      'set'
      '  NR = :NR,'
      '  FOR_APP = :FOR_APP,'
      '  DTBEG = :DTBEG,'
      '  NMRUK = :NMRUK,'
      '  FIORUK = :FIORUK,'
      '  NMBUH = :NMBUH,'
      '  FIOBUH = :FIOBUH,'
      '  NOTES = :NOTES,'
      '  NMZAMRUK = :NMZAMRUK,'
      '  FIOZAMRUK = :FIOZAMRUK,'
      '  NMZAMBUH = :NMZAMBUH,'
      '  FIOZAMBUH = :FIOZAMBUH'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into All_Sign'
      
        '  (NR, FOR_APP, DTBEG, NMRUK, FIORUK, NMBUH, FIOBUH, NOTES, NMZA' +
        'MRUK, FIOZAMRUK, '
      '   NMZAMBUH, FIOZAMBUH)'
      'values'
      
        '  (:NR, :FOR_APP, :DTBEG, :NMRUK, :FIORUK, :NMBUH, :FIOBUH, :NOT' +
        'ES, :NMZAMRUK, '
      '   :FIOZAMRUK, :NMZAMBUH, :FIOZAMBUH)')
    DeleteSQL.Strings = (
      'delete from All_Sign'
      'where'
      '  NR = :OLD_NR')
    Left = 72
    Top = 144
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 128
    Top = 112
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
end
