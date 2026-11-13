object FormGetTin: TFormGetTin
  Left = 468
  Top = 298
  ActiveControl = edTin
  BorderStyle = bsDialog
  Caption = 'FormGetTin'
  ClientHeight = 59
  ClientWidth = 230
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
  object Label1: TLabel
    Left = 5
    Top = 9
    Width = 131
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1058#1048#1053' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
  end
  object BitBtn1: TBitBtn
    Left = 61
    Top = 31
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 31
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object edTin: TEdit
    Left = 146
    Top = 6
    Width = 81
    Height = 21
    MaxLength = 10
    TabOrder = 2
    Text = 'edTin'
    OnEnter = edTinEnter
    OnExit = edTinExit
  end
end
