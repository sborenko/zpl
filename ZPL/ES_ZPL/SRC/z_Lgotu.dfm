object FormLgotu: TFormLgotu
  Left = 381
  Top = 308
  Width = 600
  Height = 285
  ActiveControl = dbgrLgt
  BorderIcons = [biSystemMenu]
  Caption = 'FormLgotu'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 220
  Constraints.MinWidth = 500
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
  object dbgrLgt: TDBGrid
    Left = 0
    Top = 31
    Width = 592
    Height = 227
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrLgtDblClick
    OnEnter = dbgrLgtEnter
    OnExit = dbgrLgtExit
    Columns = <
      item
        Expanded = False
        FieldName = 'KDLGT'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OZN_PILG'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHLGT'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEND'
        Width = 69
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'PRCLGT'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRDOC'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTDOC'
        Width = 68
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      592
      31)
    object bBtnCancel: TBitBtn
      Left = 514
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
  object qryLgt: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select KL.ShLgt, KL.Ozn_Pilg, LG.* from Z_Lgotu LG'
      'Left Outer Join Z_KdLgt KL on KL.KdLgt = LG.KdLgt'
      '')
    UpdateObject = updLgt
    Left = 80
    Top = 96
    object qryLgtNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_LGOTU.NR'
    end
    object qryLgtTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_LGOTU.TABN'
    end
    object qryLgtKDLGT: TSmallintField
      DisplayLabel = #1050#1076#1051#1075#1090
      FieldName = 'KDLGT'
      Origin = 'DbMain.Z_LGOTU.KDLGT'
    end
    object qryLgtOZN_PILG: TSmallintField
      FieldName = 'OZN_PILG'
    end
    object qryLgtSHLGT: TStringField
      DisplayLabel = #1064#1092#1088#1051#1075#1090
      FieldName = 'SHLGT'
      Size = 10
    end
    object qryLgtDTBEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DTBEG'
      Origin = 'DbMain.Z_LGOTU.DTBEG'
      OnSetText = qryLgtDTBEGSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryLgtDTEND: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DTEND'
      Origin = 'DbMain.Z_LGOTU.DTEND'
      OnSetText = qryLgtDTBEGSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qryLgtPRCLGT: TFloatField
      DisplayLabel = '% '#1083#1100#1075#1086#1090#1099
      FieldName = 'PRCLGT'
      Origin = 'DbMain.Z_LGOTU.PRCLGT'
      DisplayFormat = '0.00'
    end
    object qryLgtNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'. ('#1048#1084#1103' '#1088#1077#1073#1077#1085#1082#1072')'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_LGOTU.NOTES'
      Size = 65
    end
    object qryLgtNRDOC: TStringField
      DisplayLabel = #8470#1076#1086#1082'-'#1090#1072
      FieldName = 'NRDOC'
      Size = 15
    end
    object qryLgtDTDOC: TDateTimeField
      DisplayLabel = #1044#1090#1044#1086#1082'-'#1090#1072
      FieldName = 'DTDOC'
      OnSetText = qryLgtDTBEGSetText
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcLgt: TDataSource
    DataSet = qryLgt
    Left = 96
    Top = 112
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 16
    Top = 96
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1083#1100#1075#1086#1090#1077
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1083#1100#1075#1086#1090#1077
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1083#1100#1075#1086#1090#1077
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
  object updLgt: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Lgotu'
      'set'
      '  TABN = :TABN,'
      '  KDLGT = :KDLGT,'
      '  DTBEG = :DTBEG,'
      '  DTEND = :DTEND,'
      '  PRCLGT = :PRCLGT,'
      '  NOTES = :NOTES,'
      '  NRDOC = :NRDOC,'
      '  DTDOC = :DTDOC'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_Lgotu'
      '  (TABN, KDLGT, DTBEG, DTEND, PRCLGT, NOTES, NRDOC, DTDOC)'
      'values'
      
        '  (:TABN, :KDLGT, :DTBEG, :DTEND, :PRCLGT, :NOTES, :NRDOC, :DTDO' +
        'C)')
    DeleteSQL.Strings = (
      'delete from Z_Lgotu'
      'where'
      '  NR = :OLD_NR')
    Left = 112
    Top = 128
  end
end
