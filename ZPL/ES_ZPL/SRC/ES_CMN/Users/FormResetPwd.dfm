object FrmResetPwd: TFrmResetPwd
  Left = 754
  Top = 515
  BorderStyle = bsDialog
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1086#1089#1090#1091#1087#1086#1084
  ClientHeight = 141
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    287
    141)
  PixelsPerInch = 96
  TextHeight = 13
  object LblUser: TLabel
    Left = 19
    Top = 9
    Width = 73
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object LblLogin: TLabel
    Left = 112
    Top = 9
    Width = 86
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblEmpl: TLabel
    Left = 112
    Top = 30
    Width = 63
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnOk: TBitBtn
    Left = 128
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    ModalResult = 1
    TabOrder = 1
  end
  object BtnCancel: TBitBtn
    Left = 209
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object PanelAccess: TPanel
    Left = 3
    Top = 51
    Width = 282
    Height = 56
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object ChBoxActive: TCheckBox
      Left = 16
      Top = 8
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1077#1085
      TabOrder = 0
    end
    object ChBoxResetPwd: TCheckBox
      Left = 16
      Top = 32
      Width = 121
      Height = 17
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
      TabOrder = 1
    end
  end
  object QryUPI: TQuery
    Left = 232
    Top = 8
  end
end
