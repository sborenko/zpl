object FormGetDate: TFormGetDate
  Left = 397
  Top = 234
  BorderStyle = bsDialog
  Caption = 'FormGetDate'
  ClientHeight = 89
  ClientWidth = 184
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
    Left = 3
    Top = 3
    Width = 177
    Height = 52
  end
  object Label1: TLabel
    Left = 14
    Top = 8
    Width = 151
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1076#1072#1090#1091' '#1076#1083#1103' '#1089#1087#1088#1072#1074#1082#1080
  end
  object dtPicDtOper: TDateTimePicker
    Left = 14
    Top = 23
    Width = 154
    Height = 21
    Date = 36629.000000000000000000
    Time = 36629.000000000000000000
    DateFormat = dfLong
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object bBtnOk: TBitBtn
    Left = 26
    Top = 60
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 106
    Top = 60
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
end
