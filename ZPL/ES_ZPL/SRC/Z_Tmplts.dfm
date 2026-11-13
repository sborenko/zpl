object FormTemplates: TFormTemplates
  Left = 701
  Top = 385
  Width = 320
  Height = 436
  BorderIcons = [biSystemMenu]
  Caption = 'FormTemplates'
  Color = clBtnFace
  Constraints.MaxWidth = 750
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 33
    Width = 304
    Height = 364
    Align = alClient
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
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 99
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 33
    Align = alTop
    TabOrder = 1
    DesignSize = (
      304
      33)
    object sBtnLoadTmpl: TSpeedButton
      Left = 1
      Top = 2
      Width = 63
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1096#1072#1073#1083#1086#1085#1072' '#1074' '#1087#1086#1083#1077' "'#1064#1072#1073#1083#1086#1085'" '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnLoadTmplClick
    end
    object sBtnCopyTmplTo: TSpeedButton
      Left = 67
      Top = 2
      Width = 63
      Height = 25
      Hint = 
        #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1072' '#1080#1079' '#1087#1086#1083#1103' "'#1064#1072#1073#1083#1086#1085'" '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080' '#1074' '#1079#1072#1076#1072#1085#1085#1086#1077' '#1084 +
        #1077#1089#1090#1086' '#1080' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1080#1084#1077#1085#1077#1084
      Caption = #1048#1079#1074#1083#1077#1095#1100
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnCopyTmplToClick
    end
    object bBtnCancel: TBitBtn
      Left = 229
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object qryTmp: TQuery
    CachedUpdates = True
    AfterEdit = qryTmpAfterEdit
    AfterPost = qryTmpAfterPost
    AfterDelete = qryTmpAfterDelete
    OnNewRecord = qryTmpNewRecord
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
    object qryTmpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Origin = 'DbMain.EX_TMPLTS.NOTES'
      Size = 65
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
      '  NOTES = :NOTES,'
      '  FVID = :FVID'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into ex_Tmplts'
      '  (KDTMPL, NMTMPL, NOTES, FVID)'
      'values'
      '  (:KDTMPL, :NMTMPL, :NOTES, :FVID)')
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
