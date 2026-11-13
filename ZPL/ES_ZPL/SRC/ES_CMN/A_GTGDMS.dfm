object FormVvodGodMes: TFormVvodGodMes
  Left = 395
  Top = 251
  BorderStyle = bsDialog
  Caption = 'FormVvodGodMes'
  ClientHeight = 97
  ClientWidth = 265
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
    Top = 4
    Width = 258
    Height = 62
  end
  object Label1: TLabel
    Left = 27
    Top = 32
    Width = 208
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1075#1086#1076' '#1080' '#1084#1077#1089#1103#1095#1094' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object PanelMY: TPanel
    Left = 10
    Top = 11
    Width = 243
    Height = 20
    BevelOuter = bvLowered
    TabOrder = 0
    object sBtnYMinus: TSpeedButton
      Left = 2
      Top = 2
      Width = 22
      Height = 17
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1075#1086#1076
      Caption = #1043'-'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnYMinusClick
    end
    object sBtnMMinus: TSpeedButton
      Left = 24
      Top = 2
      Width = 22
      Height = 17
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1084#1077#1089#1103#1094
      Caption = #1052'-'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnMMinusClick
    end
    object sBtnMPlus: TSpeedButton
      Left = 198
      Top = 2
      Width = 22
      Height = 17
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1084#1077#1089#1103#1094
      Caption = #1052'+'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnMPlusClick
    end
    object sBtnYPlus: TSpeedButton
      Left = 220
      Top = 2
      Width = 22
      Height = 17
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1075#1086#1076
      Caption = #1043'+'
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnYPlusClick
    end
    object stTextMY: TStaticText
      Left = 45
      Top = 2
      Width = 151
      Height = 17
      Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' - '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1057#1077#1085#1090#1103#1073#1088#1100' 2008'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = stTextMYDblClick
    end
  end
  object BitBtn1: TBitBtn
    Left = 99
    Top = 70
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 187
    Top = 70
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
end
