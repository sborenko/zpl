object FormEVed: TFormEVed
  Left = 469
  Top = 269
  BorderStyle = bsDialog
  Caption = 'FormEVed'
  ClientHeight = 109
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 29
    Width = 188
    Height = 13
    Caption = #1064#1080#1092#1088' ('#1082#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077') '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    FocusControl = dbedShVed
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 80
    Height = 29
    AutoSize = False
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbedNmVed
    WordWrap = True
  end
  object LabelNmObj: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'LabelNmObj'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbedShVed: TDBEdit
    Left = 238
    Top = 26
    Width = 91
    Height = 21
    DataField = 'SHVED'
    TabOrder = 0
    OnEnter = dbedShVedEnter
    OnExit = dbedShVedExit
  end
  object dbedNmVed: TDBEdit
    Left = 88
    Top = 51
    Width = 241
    Height = 21
    DataField = 'NMVED'
    TabOrder = 1
    OnEnter = dbedShVedEnter
    OnExit = dbedShVedExit
  end
  object bBtnOk: TBitBtn
    Left = 141
    Top = 78
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 254
    Top = 78
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
end
