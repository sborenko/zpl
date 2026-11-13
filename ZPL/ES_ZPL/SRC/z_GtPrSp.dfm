object FormGtPredSps: TFormGtPredSps
  Left = 554
  Top = 247
  Width = 245
  Height = 226
  ActiveControl = dbgrYear
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtPredSps'
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 285
  Constraints.MinHeight = 200
  Constraints.MinWidth = 245
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    237
    199)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrYear: TDBGrid
    Left = 3
    Top = 4
    Width = 232
    Height = 131
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcYear
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrYearDblClick
    OnEnter = dbgrYearEnter
    OnExit = dbgrYearExit
    Columns = <
      item
        Expanded = False
        FieldName = 'YearStr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CntRec'
        Width = 47
        Visible = True
      end>
  end
  object rBtnCopyPred: TRadioButton
    Left = 2
    Top = 138
    Width = 169
    Height = 17
    Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1075#1086#1076#1072
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1075#1086#1076
    Checked = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = True
  end
  object rBtnCreFromPred: TRadioButton
    Left = 2
    Top = 154
    Width = 217
    Height = 17
    Hint = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079' '#1076#1072#1085#1085#1099#1093' '#1087#1086' '#1074#1080#1076#1091' 1005  '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079' '#1076#1072#1085#1085#1099#1093' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object bBtnOk: TBitBtn
    Left = 64
    Top = 172
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 160
    Top = 172
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object dsrcYear: TDataSource
    DataSet = FormPredSps.cdsYear
    OnDataChange = dsrcYearDataChange
    Left = 16
    Top = 48
  end
  object qryTmp: TQuery
    Left = 184
    Top = 48
  end
end
