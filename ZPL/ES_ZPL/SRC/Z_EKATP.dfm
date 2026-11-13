object FormAEKatP: TFormAEKatP
  Left = 563
  Top = 224
  BorderStyle = bsDialog
  Caption = 'FormAEKatP'
  ClientHeight = 114
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = Z_EKatPmClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 3
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdKatP
  end
  object Label2: TLabel
    Left = 117
    Top = 3
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
    FocusControl = dbeShKatP
  end
  object Label3: TLabel
    Left = 5
    Top = 43
    Width = 162
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    FocusControl = dbeNmKatP
  end
  object dbeKdKatP: TDBEdit
    Left = 5
    Top = 19
    Width = 57
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDKATP'
    DataSource = FormKatPers.dsrcKatPers
    ReadOnly = True
    TabOrder = 0
  end
  object dbeShKatP: TDBEdit
    Left = 117
    Top = 19
    Width = 81
    Height = 21
    DataField = 'SHKATP'
    DataSource = FormKatPers.dsrcKatPers
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNmKatP: TDBEdit
    Left = 5
    Top = 59
    Width = 193
    Height = 21
    DataField = 'NMKATP'
    DataSource = FormKatPers.dsrcKatPers
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 45
    Top = 84
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 123
    Top = 84
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
end
