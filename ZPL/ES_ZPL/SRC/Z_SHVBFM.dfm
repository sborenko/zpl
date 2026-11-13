object FormShowVubFams: TFormShowVubFams
  Left = 698
  Top = 384
  Width = 650
  Height = 340
  BorderIcons = [biSystemMenu]
  Caption = 'FormShowVubFams'
  Color = clBtnFace
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 250
  Constraints.MinWidth = 415
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 0
    Width = 642
    Height = 272
    Hint = 
      '"'#1041#1083#1077#1076#1085#1099#1077'" '#1077#1089#1090#1100' '#1074' '#1089#1087#1088#1074#1086#1095#1085#1080#1082#1077' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'", '#1085#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090' '#1074' '#1089#1087#1080#1089#1082 +
      #1077' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
    Align = alClient
    Color = 12779233
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrTmpDrawColumnCell
    OnDblClick = dbgrTmpDblClick
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 272
    Width = 642
    Height = 34
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      642
      34)
    object Label1: TLabel
      Left = 11
      Top = 11
      Width = 237
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1053#1072#1081#1076#1077#1085#1086' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1092#1072#1084#1080#1083#1080#1081' - '#1074#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1085#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bBtnOk: TBitBtn
      Left = 472
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 2
    end
    object bBtnCancel: TBitBtn
      Left = 559
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 2
    end
  end
  object dsrcTmp: TDataSource
    Left = 64
    Top = 104
  end
end
