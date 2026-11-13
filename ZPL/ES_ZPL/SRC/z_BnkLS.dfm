object FormBnkLS: TFormBnkLS
  Left = 507
  Top = 436
  Width = 796
  Height = 296
  ActiveControl = dbgrLS
  BorderIcons = [biSystemMenu]
  Caption = 'FormBnkLS'
  Color = clBtnFace
  Constraints.MaxHeight = 470
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 205
  Constraints.MinWidth = 525
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrLS: TDBGrid
    Left = 0
    Top = 0
    Width = 780
    Height = 219
    Hint = 
      #1052#1072#1083#1080#1085#1086#1074#1099#1084' '#1074#1099#1076#1077#1083#1103#1102#1090#1089#1103' "'#1057#1087#1077#1094#1057#1095#1077#1090#1072'" ('#1077#1089#1083#1080' '#1077#1089#1090#1100'). '#1057#1077#1088#1099#1084' '#1092#1086#1085#1086#1084' - '#1079#1072#1082#1088 +
      #1099#1090#1099#1077' '#1089#1095#1077#1090#1072' ('#1077#1089#1083#1080' '#1077#1089#1090#1100').'
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pop
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrLSDrawColumnCell
    OnEnter = dbgrLSEnter
    OnExit = dbgrLSExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DTBEG'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDBNK'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmBnk'
        ReadOnly = True
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICSCH'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLS'
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 219
    Width = 780
    Height = 38
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      780
      38)
    object LabelMsg: TLabel
      Left = 8
      Top = 25
      Width = 359
      Height = 13
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = ' '#1042#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1079#1072#1087#1080#1089#1100',  '#1072#1082#1090#1091#1072#1083#1100#1085#1072#1103' '#1085#1072' '#1076#1072#1090#1091' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' (12-12-2012)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object chBoxSaveValues: TCheckBox
      Left = 11
      Top = -1
      Width = 321
      Height = 28
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 
        #1061#1088#1072#1085#1080#1090#1100' '#1074#1074#1086#1076#1080#1084#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1076#1072#1090#1099' '#1080' '#1073#1072#1085#1082#1072' '#1080' '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1090#1100' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080 +
        #1102' '#1087#1088#1080' '#1085#1086#1074#1086#1084' '#1074#1074#1086#1076#1077' '#1076#1088#1091#1075#1080#1084' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      WordWrap = True
    end
    object bBtnOk: TBitBtn
      Left = 625
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 1
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 705
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      Kind = bkCancel
      Spacing = 0
    end
  end
  object qryLS: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select  ls.* '
      'from Z_BankiLS ls'
      'where ls.TabN = 18425')
    UpdateObject = updLS
    Left = 16
    Top = 136
    object qryLSNR: TIntegerField
      FieldName = 'NR'
    end
    object qryLSTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryLSDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      EditMask = '!99/99/9999;1;_'
    end
    object qryLSLICSCH: TStringField
      DisplayLabel = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
      DisplayWidth = 29
      FieldName = 'LICSCH'
      Size = 29
    end
    object qryLSKDBNK: TSmallintField
      DisplayLabel = #1050#1086#1076#1041#1085#1082
      FieldName = 'KDBNK'
    end
    object qryLSNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryLSNmBnk: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldKind = fkLookup
      FieldName = 'NmBnk'
      LookupDataSet = DmMain.qryBanki
      LookupKeyFields = 'KDBNK'
      LookupResultField = 'NMBNK'
      KeyFields = 'KDBNK'
      Size = 35
      Lookup = True
    end
    object qryLSSPB: TStringField
      DisplayLabel = #1057#1087#1041
      FieldName = 'SPB'
      Origin = 'DbMain.Z_BANKILS.SPB'
      FixedChar = True
      Size = 1
    end
    object qryLSCLS: TStringField
      DisplayLabel = #1047#1082#1088
      FieldName = 'CLS'
      Origin = 'DbMain.Z_BANKILS.CLS'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcLS: TDataSource
    DataSet = qryLS
    Left = 32
    Top = 152
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 88
    Top = 136
    object popHead: TMenuItem
      Caption = '== '#1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072' =='
      Enabled = False
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = popAddClick
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16453
      OnClick = popEdtClick
    end
    object popAddSpB: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' "'#1057#1087#1077#1094#1057#1095#1105#1090'"'
      OnClick = popAddSpBClick
    end
    object popCloseLS: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1089#1095#1105#1090
      ShortCut = 16474
      OnClick = popCloseLSClick
    end
    object popOpenLS: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1082#1088#1099#1090#1099#1081' '#1089#1095#1105#1090
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1088#1072#1085#1077#1077' '#1079#1072#1082#1088#1099#1090#1099#1081' '#1089#1095#1105#1090
      OnClick = popOpenLSClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ShortCut = 16469
      OnClick = popDelClick
    end
  end
  object updLS: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_BankiLS'
      'set'
      '  TABN = :TABN,'
      '  DTBEG = :DTBEG,'
      '  LICSCH = :LICSCH,'
      '  KDBNK = :KDBNK,'
      '  NOTES = :NOTES,'
      '  SPB = :SPB,'
      '  CLS = :CLS'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Z_BankiLS'
      '  (TABN, DTBEG, LICSCH, KDBNK, NOTES, SPB, CLS)'
      'values'
      '  (:TABN, :DTBEG, :LICSCH, :KDBNK, :NOTES, :SPB, :CLS)')
    DeleteSQL.Strings = (
      'delete from Z_BankiLS'
      'where'
      '  NR = :OLD_NR')
    Left = 48
    Top = 168
  end
end
