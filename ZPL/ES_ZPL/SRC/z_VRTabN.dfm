object FormVbrResTabN: TFormVbrResTabN
  Left = 378
  Top = 307
  Width = 515
  Height = 230
  ActiveControl = dbgrTmp
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbrResTabN'
  Color = clBtnFace
  Constraints.MaxHeight = 230
  Constraints.MaxWidth = 515
  Constraints.MinHeight = 150
  Constraints.MinWidth = 415
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
    Top = 0
    Width = 507
    Height = 160
    Align = alClient
    Color = clCream
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrTmpDblClick
    OnEnter = dbgrTmpEnter
    OnExit = dbgrTmpExit
    OnKeyDown = dbgrTmpKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Title.Caption = #1057#1087#1089
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Title.Caption = #1050#1076#1055#1076#1088
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOBJ'
        Title.Caption = #1064#1092#1088#1055#1076#1088
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMOBJ'
        Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Width = 70
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 160
    Width = 507
    Height = 36
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      507
      36)
    object Label1: TLabel
      Left = 4
      Top = 13
      Width = 233
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1053#1072#1081#1076#1077#1085#1086' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1077#1081' - '#1074#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1085#1091'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bBtnOk: TBitBtn
      Left = 344
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 424
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsrcTmp: TDataSource
    Left = 40
    Top = 48
  end
end
