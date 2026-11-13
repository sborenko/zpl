object FormInvDocs: TFormInvDocs
  Left = 388
  Top = 425
  Width = 485
  Height = 200
  ActiveControl = dbgrDocs
  BorderIcons = [biSystemMenu]
  Caption = 'FormInvDocs'
  Color = clBtnFace
  Constraints.MaxHeight = 535
  Constraints.MaxWidth = 595
  Constraints.MinHeight = 200
  Constraints.MinWidth = 485
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
    Width = 477
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      477
      31)
    object bBtnCancel: TBitBtn
      Left = 399
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrDocs: TDBGrid
    Left = 0
    Top = 31
    Width = 477
    Height = 142
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcDocs
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
    OnDblClick = popEdtClick
    OnEnter = dbgrDocsEnter
    OnExit = dbgrDocsExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMDOC'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRDOC'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEND'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 105
        Visible = True
      end>
  end
  object qryDocs: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_InvDocs')
    UpdateObject = updDocs
    Left = 56
    Top = 80
    object qryDocsNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_INVDOCS.NR'
    end
    object qryDocsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
      Origin = 'DbMain.Z_INVDOCS.TABN'
    end
    object qryDocsNMDOC: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'NMDOC'
      Origin = 'DbMain.Z_INVDOCS.NMDOC'
      Size = 25
    end
    object qryDocsNRDOC: TStringField
      DisplayLabel = #8470' '#1076#1086#1082'-'#1090#1072
      FieldName = 'NRDOC'
      Origin = 'DbMain.Z_INVDOCS.NRDOC'
      Size = 15
    end
    object qryDocsDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_INVDOCS.DTBEG'
      OnSetText = qryDocsDTBEGSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryDocsDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_INVDOCS.DTEND'
      OnSetText = DateFieldSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryDocsNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_INVDOCS.NOTES'
      Size = 35
    end
  end
  object dsrcDocs: TDataSource
    DataSet = qryDocs
    Left = 72
    Top = 96
  end
  object updDocs: TUpdateSQL
    ModifySQL.Strings = (
      'update z_InvDocs'
      'set'
      '  TABN = :TABN,'
      '  NMDOC = :NMDOC,'
      '  NRDOC = :NRDOC,'
      '  DTBEG = :DTBEG,'
      '  DTEND = :DTEND,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_InvDocs'
      '  (TABN, NMDOC, NRDOC, DTBEG, DTEND, NOTES)'
      'values'
      '  (:TABN, :NMDOC, :NRDOC, :DTBEG, :DTEND, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_InvDocs'
      'where'
      '  NR = :OLD_NR')
    Left = 88
    Top = 112
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 8
    Top = 80
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
    object popSep: TMenuItem
      Caption = '-'
    end
    object popSets: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100
      object popSetFont: TMenuItem
        Caption = '- '#1096#1088#1080#1092#1090' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = popSetFontClick
      end
      object popSetFon: TMenuItem
        Caption = '- '#1092#1086#1085' '#1090#1072#1073#1083#1080#1094#1099
        OnClick = popSetFonClick
      end
    end
  end
end
