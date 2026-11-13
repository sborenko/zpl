object FormZpMnuPrt: TFormZpMnuPrt
  Left = 370
  Top = 188
  BorderStyle = bsDialog
  Caption = 'FormZpMnuPrt'
  ClientHeight = 203
  ClientWidth = 605
  Color = clBtnFace
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
  object Bevel1: TBevel
    Left = 2
    Top = 24
    Width = 299
    Height = 149
  end
  object sBtnVedZpCurrent: TSpeedButton
    Left = 5
    Top = 27
    Width = 293
    Height = 23
    Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1079#1072#1088#1087#1083#1072#1090#1099' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
    OnClick = sBtnVedZpCurrentClick
  end
  object sBtnSvodPeriod: TSpeedButton
    Left = 5
    Top = 75
    Width = 293
    Height = 23
  end
  object sBtnSvodMes: TSpeedButton
    Left = 5
    Top = 51
    Width = 293
    Height = 23
  end
  object sBtnDr8: TSpeedButton
    Left = 5
    Top = 147
    Width = 293
    Height = 23
    Caption = #1060#1086#1088#1084#1072' '#1044#1056'-8'
    OnClick = sBtnDr8Click
  end
  object sBtnSpiski: TSpeedButton
    Left = 5
    Top = 123
    Width = 293
    Height = 23
  end
  object sBtnSprNOP: TSpeedButton
    Left = 5
    Top = 99
    Width = 293
    Height = 23
  end
  object Bevel2: TBevel
    Left = 304
    Top = 24
    Width = 299
    Height = 149
  end
  object sBtnRaschetMes: TSpeedButton
    Left = 307
    Top = 27
    Width = 293
    Height = 23
  end
  object sBtnSprSostFamily: TSpeedButton
    Left = 307
    Top = 51
    Width = 293
    Height = 23
  end
  object SpeedButton1: TSpeedButton
    Left = 307
    Top = 75
    Width = 293
    Height = 23
  end
  object SpeedButton2: TSpeedButton
    Left = 307
    Top = 99
    Width = 293
    Height = 23
  end
  object SpeedButton3: TSpeedButton
    Left = 307
    Top = 123
    Width = 293
    Height = 23
  end
  object SpeedButton5: TSpeedButton
    Left = 307
    Top = 147
    Width = 293
    Height = 23
  end
  object Label1: TLabel
    Left = 2
    Top = 8
    Width = 299
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = #1043#1088#1091#1087#1087#1086#1074#1099#1077' ('#1089#1074#1086#1076#1085#1099#1077') '#1076#1086#1082#1091#1084#1077#1085#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 304
    Top = 8
    Width = 299
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object bBtnCancel: TBitBtn
    Left = 528
    Top = 176
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 0
    Kind = bkCancel
  end
end
