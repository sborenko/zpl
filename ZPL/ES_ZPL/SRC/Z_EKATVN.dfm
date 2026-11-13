object FormAEKatVn: TFormAEKatVn
  Left = 415
  Top = 297
  BorderStyle = bsDialog
  Caption = 'FormAEKatVn'
  ClientHeight = 157
  ClientWidth = 335
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
    Left = 3
    Top = 4
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbeNmKatVn
  end
  object Label2: TLabel
    Left = 3
    Top = 43
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object dbeNmKatVn: TDBEdit
    Left = 3
    Top = 20
    Width = 329
    Height = 21
    DataField = 'NMKATVN'
    TabOrder = 0
    OnEnter = dbeNmKatVnEnter
    OnExit = dbeNmKatVnExit
  end
  object dbmNotes: TDBMemo
    Left = 3
    Top = 59
    Width = 329
    Height = 68
    DataField = 'NOTES'
    MaxLength = 250
    TabOrder = 1
    OnEnter = dbmNotesEnter
    OnExit = dbmNotesExit
  end
  object bBtnOk: TBitBtn
    Left = 179
    Top = 130
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 257
    Top = 130
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
end
