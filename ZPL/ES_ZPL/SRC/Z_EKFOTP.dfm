object FormAEKoefOtp: TFormAEKoefOtp
  Left = 332
  Top = 223
  BorderStyle = bsDialog
  Caption = 'FormAEKoefOtp'
  ClientHeight = 112
  ClientWidth = 208
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
    Left = 4
    Top = 4
    Width = 54
    Height = 13
    Caption = #1052#1077#1089#1103#1094'-'#1043#1086#1076
  end
  object Label2: TLabel
    Left = 4
    Top = 27
    Width = 125
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1077#1088#1077#1089#1095#1077#1090#1072
  end
  object Label3: TLabel
    Left = 4
    Top = 43
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object dbeMesGod: TDBEdit
    Left = 140
    Top = 1
    Width = 65
    Height = 21
    DataField = 'MESGOD'
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeKoefOtp: TDBEdit
    Left = 140
    Top = 24
    Width = 65
    Height = 21
    DataField = 'KoefOtp'
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 4
    Top = 58
    Width = 201
    Height = 21
    DataField = 'Notes'
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 52
    Top = 84
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 130
    Top = 84
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
end
