object FormKdVal: TFormKdVal
  Left = 412
  Top = 210
  Width = 382
  Height = 314
  BorderIcons = [biSystemMenu]
  Caption = #1042#1072#1083#1102#1090#1099' '#1080' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1080#1093' '#1082#1091#1088#1089#1086#1074
  Color = clBtnFace
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 250
  Constraints.MinWidth = 296
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
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 287
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 130
      Width = 314
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clAqua
      ParentColor = False
    end
    object dbgrKdVal: TDBGrid
      Left = 1
      Top = 1
      Width = 314
      Height = 129
      Hint = #1058#1072#1073#1083#1080#1094#1072' '#1074#1072#1083#1102#1090
      Align = alTop
      DataSource = dsrcKdVal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popMnuVal
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrKdValDblClick
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      OnKeyDown = dbgrKdValKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'KDVAL'
          Title.Caption = #1050#1086#1076
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMVALSOKR'
          Title.Caption = #1064#1080#1092#1088
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMVALIM'
          Title.Caption = #1042#1072#1083#1102#1090#1072
          Width = 120
          Visible = True
        end>
    end
    object dbgrMovVal: TDBGrid
      Left = 1
      Top = 133
      Width = 314
      Height = 153
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1082#1091#1088#1089#1072' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1072#1083#1102#1090#1099
      Align = alClient
      DataSource = dsrcMovVal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = popMnuMov
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = dbGridEnter
      OnExit = dbGridExit
      Columns = <
        item
          Expanded = False
          FieldName = 'DTBEG'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZANEDBV'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KURS'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZANEDUE'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KURSTOUE'
          Width = 56
          Visible = True
        end>
    end
  end
  object PanelRight: TPanel
    Left = 316
    Top = 0
    Width = 58
    Height = 287
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      58
      287)
    object bBtnOK: TBitBtn
      Left = 3
      Top = 194
      Width = 54
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Layout = blGlyphTop
      Spacing = 1
    end
    object bBtnCancel: TBitBtn
      Left = 3
      Top = 243
      Width = 54
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Layout = blGlyphTop
      Spacing = 1
    end
  end
  object dsrcKdVal: TDataSource
    DataSet = qryKdVal
    OnDataChange = dsrcKdValDataChange
    Left = 40
    Top = 72
  end
  object dsrcMovVal: TDataSource
    DataSet = qryMovVal
    Left = 40
    Top = 208
  end
  object popMnuVal: TPopupMenu
    OnPopup = popMnuValPopup
    Left = 144
    Top = 56
    object PopMnuValHead: TMenuItem
      Caption = '== '#1042' '#1072' '#1083' '#1102' '#1090' '#1099' =='
      Enabled = False
    end
    object PopMnuValEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = PopMnuValEdtClick
    end
    object popMnuValAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popMnuValAddClick
    end
    object popMnuValDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuValDelClick
    end
  end
  object qryKdVal: TQuery
    CachedUpdates = True
    BeforePost = qryKdValBeforePost
    AfterPost = qryKdValAfterPost
    AfterDelete = qryKdValAfterDelete
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from kd_Val '
      'order by NmValSokr')
    UpdateObject = updKdVal
    Left = 24
    Top = 56
  end
  object popMnuMov: TPopupMenu
    OnPopup = popMnuMovPopup
    Left = 144
    Top = 160
    object popMnuMovHead: TMenuItem
      Caption = '== '#1050' '#1091' '#1088' '#1089' '#1099' =='
      Enabled = False
    end
    object popMnuMovEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popMnuMovEdtClick
    end
    object popMnuMovAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popMnuMovAddClick
    end
    object popMnuMovDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popMnuMovDelClick
    end
  end
  object qryTmp: TQuery
    Left = 200
    Top = 56
  end
  object qryMovVal: TQuery
    CachedUpdates = True
    BeforePost = qryMovValBeforePost
    AfterPost = qryMovValAfterPost
    AfterDelete = qryMovValAfterDelete
    DatabaseName = 'DbMain'
    DataSource = dsrcKdVal
    SQL.Strings = (
      'select * from Mov_Val'
      'where KdVal = :KdVal'
      'order by DtBeg')
    UpdateObject = updMovVal
    Left = 24
    Top = 192
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'KDVAL'
        ParamType = ptUnknown
        Size = 2
      end>
    object qryMovValNR: TSmallintField
      FieldName = 'NR'
    end
    object qryMovValKDVAL: TSmallintField
      FieldName = 'KDVAL'
    end
    object qryMovValDTBEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DTBEG'
      DisplayFormat = 'dd-mm-yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qryMovValZANEDBV: TFloatField
      DisplayLabel = #1052#1072#1089#1096#1090#1072#1073
      FieldName = 'ZANEDBV'
    end
    object qryMovValKURS: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'KURS'
    end
    object qryMovValZANEDUE: TFloatField
      DisplayLabel = #1052#1072#1089#1096#1059#1045
      FieldName = 'ZANEDUE'
    end
    object qryMovValKURSTOUE: TFloatField
      DisplayLabel = #1050#1091#1088#1089'_'#1082#1059#1045
      FieldName = 'KURSTOUE'
    end
  end
  object updMovVal: TUpdateSQL
    ModifySQL.Strings = (
      'update Mov_Val'
      'set'
      '  KDVAL = :KDVAL,'
      '  DTBEG = :DTBEG,'
      '  KURS = :KURS,'
      '  KURSTOUE = :KURSTOUE,'
      '  ZANEDBV = :ZANEDBV,'
      '  ZANEDUE = :ZANEDUE'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into Mov_Val'
      '  (KDVAL, DTBEG, KURS, KURSTOUE, ZANEDBV, ZANEDUE)'
      'values'
      '  (:KDVAL, :DTBEG, :KURS, :KURSTOUE, :ZANEDBV, :ZANEDUE)')
    DeleteSQL.Strings = (
      'delete from Mov_Val'
      'where'
      '  NR = :OLD_NR')
    Left = 56
    Top = 224
  end
  object updKdVal: TUpdateSQL
    ModifySQL.Strings = (
      'update kd_Val'
      'set'
      '  KDVAL = :KDVAL,'
      '  NMVALSOKR = :NMVALSOKR,'
      '  NMVALIM = :NMVALIM,'
      '  NMVALROD = :NMVALROD,'
      '  NMVALDAT = :NMVALDAT,'
      '  R1U = :R1U,'
      '  R1R = :R1R,'
      '  R1E = :R1E,'
      '  R2U = :R2U,'
      '  R2R = :R2R,'
      '  R2E = :R2E,'
      '  R5U = :R5U,'
      '  R5R = :R5R,'
      '  R5E = :R5E,'
      '  RSU = :RSU,'
      '  RSR = :RSR,'
      '  RSE = :RSE,'
      '  K1U = :K1U,'
      '  K1R = :K1R,'
      '  K1E = :K1E,'
      '  K2U = :K2U,'
      '  K2R = :K2R,'
      '  K2E = :K2E,'
      '  K5U = :K5U,'
      '  K5R = :K5R,'
      '  K5E = :K5E,'
      '  KSU = :KSU,'
      '  KSR = :KSR,'
      '  KSE = :KSE,'
      '  SEXR = :SEXR'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into kd_Val'
      
        '  (KDVAL, NMVALSOKR, NMVALIM, NMVALROD, NMVALDAT, R1U, R1R, R1E,' +
        ' '
      'R2U, R2R, '
      
        '   R2E, R5U, R5R, R5E, RSU, RSR, RSE, K1U, K1R, K1E, K2U, K2R, K' +
        '2E, K5U, '
      '   K5R, K5E, KSU, KSR, KSE, SEXR)'
      'values'
      
        '  (:KDVAL, :NMVALSOKR, :NMVALIM, :NMVALROD, :NMVALDAT, :R1U, :R1' +
        'R, '
      ':R1E, '
      
        '   :R2U, :R2R, :R2E, :R5U, :R5R, :R5E, :RSU, :RSR, :RSE, :K1U, :' +
        'K1R, :K1E, '
      '   :K2U, :K2R, :K2E, :K5U, :K5R, :K5E, :KSU, :KSR, :KSE, :SEXR)')
    DeleteSQL.Strings = (
      'delete from kd_Val'
      'where'
      '  NR = :OLD_NR')
    Left = 56
    Top = 88
  end
end