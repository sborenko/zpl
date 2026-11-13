object FormTemplates: TFormTemplates
  Left = 436
  Top = 245
  Width = 280
  Height = 275
  BorderIcons = [biSystemMenu]
  Caption = 'FormTemplates'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 320
  Constraints.MinHeight = 275
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    272
    248)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnLoadTmpl: TSpeedButton
    Left = 1
    Top = 2
    Width = 63
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    OnClick = sBtnLoadTmplClick
  end
  object sBtnCopyTmplTo: TSpeedButton
    Left = 67
    Top = 2
    Width = 63
    Height = 25
    Caption = #1048#1079#1074#1083#1077#1095#1100
    OnClick = sBtnCopyTmplToClick
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 29
    Width = 272
    Height = 219
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDTMPL'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMTMPL'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FVID'
        Width = 24
        Visible = True
      end>
  end
  object bBtnCancel: TBitBtn
    Left = 195
    Top = 2
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    Kind = bkCancel
    Spacing = 0
  end
  object qryTmp: TQuery
    CachedUpdates = True
    AfterEdit = qryTmpAfterEdit
    AfterPost = qryTmpAfterPost
    AfterDelete = qryTmpAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from ex_Tmplts')
    UpdateObject = updTmp
    Left = 56
    Top = 136
    object qryTmpNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.EX_TMPLTS.NR'
    end
    object qryTmpKDTMPL: TSmallintField
      DisplayLabel = #1050#1086#1076#1064#1073#1083
      FieldName = 'KDTMPL'
      Origin = 'DbMain.EX_TMPLTS.KDTMPL'
    end
    object qryTmpNMTMPL: TStringField
      DisplayLabel = #1064#1080#1092#1088' '#1096#1072#1073#1083#1086#1085#1072
      FieldName = 'NMTMPL'
      Origin = 'DbMain.EX_TMPLTS.NMTMPL'
      FixedChar = True
      Size = 15
    end
    object qryTmpFVID: TBlobField
      DisplayLabel = #1064#1072#1073#1083#1086#1085
      FieldName = 'FVID'
      Origin = 'DbMain.EX_TMPLTS.FVID'
      Size = 1
    end
  end
  object dsrcTmp: TDataSource
    DataSet = qryTmp
    Left = 72
    Top = 152
  end
  object updTmp: TUpdateSQL
    ModifySQL.Strings = (
      'update ex_Tmplts'
      'set'
      '  KDTMPL = :KDTMPL,'
      '  NMTMPL = :NMTMPL,'
      '  FVID = :FVID'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ex_Tmplts'
      '  (KDTMPL, NMTMPL, FVID)'
      'values'
      '  (:KDTMPL, :NMTMPL, :FVID)')
    DeleteSQL.Strings = (
      'delete from ex_Tmplts'
      'where'
      '  NR = :OLD_NR')
    Left = 88
    Top = 168
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '.dbf, *.xls'
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*|'#1051#1080#1089#1090#1099' Excel|*.xls|'#1060#1072#1081#1083#1099' dBase|*.dbf'
    Left = 112
    Top = 72
  end
  object SaveDialog: TSaveDialog
    Left = 144
    Top = 72
  end
  object qryDop: TQuery
    Left = 144
    Top = 144
  end
end
