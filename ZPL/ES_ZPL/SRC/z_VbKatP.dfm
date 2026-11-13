object FormVbKatP: TFormVbKatP
  Left = 432
  Top = 356
  Width = 430
  Height = 270
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbKatP'
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 485
  Constraints.MinHeight = 270
  Constraints.MinWidth = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    422
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrKatP: TDBGrid
    Left = 0
    Top = 0
    Width = 295
    Height = 243
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcKatP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrKatPDrawColumnCell
    OnDblClick = sBtnF8Click
    OnKeyDown = dbgrKatPKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHKATP'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMKATP'
        Width = 173
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 319
    Top = 188
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 319
    Top = 216
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
    Spacing = 0
  end
  object PanelMsg: TPanel
    Left = 300
    Top = -6
    Width = 121
    Height = 184
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 101
      Height = 71
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1050#1083#1072#1074#1080#1096#1077#1081'  <F8>  '#1080#1083#1080' '#1076#1074#1086#1081#1085#1099#1084' '#1097#1077#1083#1095#1082#1086#1084' '#1084#1099#1096#1082#1080' '#1074#1099#1076#1077#1083#1080#1090#1077' '#1085#1091#1078#1085#1099#1077' '#1082#1072#1090#1077#1075#1086 +
        #1088#1080#1080
      WordWrap = True
    end
    object sBtnF8: TSpeedButton
      Left = 73
      Top = 7
      Width = 26
      Height = 19
      Caption = 'F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sBtnF8Click
    end
    object Label2: TLabel
      Left = 10
      Top = 76
      Width = 101
      Height = 59
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1088#1080' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1080' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1073#1091#1076#1091#1090' '#1074#1099#1073#1080#1088#1072#1090#1100#1089#1103' '#1074#1089#1077
      WordWrap = True
    end
    object sBtnUnSelectAll: TSpeedButton
      Left = 18
      Top = 155
      Width = 86
      Height = 23
      Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1084#1077#1090#1082#1080
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
      Enabled = False
      OnClick = sBtnUnSelectAllClick
    end
    object sBtnSelectAll: TSpeedButton
      Left = 18
      Top = 131
      Width = 86
      Height = 23
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      Caption = #1052#1077#1090#1080#1090#1100' '#1074#1089#1077
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnSelectAllClick
    end
  end
  object qryKatP: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KatPers'
      'order by NmKatP')
    Left = 80
    Top = 48
    object qryKatPNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_KATPERS.NR'
    end
    object qryKatPKDKATP: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDKATP'
      Origin = 'DbMain.Z_KATPERS.KDKATP'
    end
    object qryKatPSHKATP: TStringField
      DisplayLabel = #1064#1080#1092#1088
      FieldName = 'SHKATP'
      Origin = 'DbMain.Z_KATPERS.SHKATP'
      Size = 10
    end
    object qryKatPNMKATP: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
      FieldName = 'NMKATP'
      Origin = 'DbMain.Z_KATPERS.NMKATP'
      Size = 35
    end
  end
  object dsrcKatP: TDataSource
    DataSet = qryKatP
    Left = 88
    Top = 64
  end
end
