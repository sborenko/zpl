object FrmChngPwd: TFrmChngPwd
  Left = 763
  Top = 336
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1083#1086#1075#1080#1085#1072' / '#1087#1072#1088#1086#1083#1103
  ClientHeight = 141
  ClientWidth = 296
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
    296
    141)
  PixelsPerInch = 96
  TextHeight = 13
  object LblUser: TLabel
    Left = 12
    Top = 7
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object LblPerson: TLabel
    Left = 95
    Top = 32
    Width = 190
    Height = 13
    AutoSize = False
  end
  object BtnOk: TBitBtn
    Left = 137
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    ModalResult = 1
    TabOrder = 2
  end
  object BtnCancel: TBitBtn
    Left = 218
    Top = 113
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object EdtLogin: TEdit
    Left = 95
    Top = 7
    Width = 105
    Height = 21
    Enabled = False
    TabOrder = 0
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object Panel1: TPanel
    Left = 3
    Top = 49
    Width = 291
    Height = 61
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object LblNewPwd: TLabel
      Left = 9
      Top = 10
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object LblNewPwd2: TLabel
      Left = 9
      Top = 38
      Width = 76
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1074#1090#1086#1088' '#1087#1072#1088#1086#1083#1103
    end
    object LblShowPwd: TLabel
      Left = 225
      Top = 5
      Width = 59
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
      WordWrap = True
    end
    object EdtNewPwd: TEdit
      Left = 93
      Top = 6
      Width = 105
      Height = 21
      TabOrder = 0
      OnChange = EdtNewPwdChange
      OnEnter = EditEnter
      OnExit = EditExit
      OnKeyDown = EditKeyDown
    end
    object EdtNewPwd2: TEdit
      Left = 93
      Top = 34
      Width = 105
      Height = 21
      TabOrder = 1
      OnEnter = EditEnter
      OnExit = EditExit
      OnKeyDown = EditKeyDown
    end
    object ChBoxShowPwd: TCheckBox
      Left = 211
      Top = 10
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = ChBoxShowPwdClick
      OnKeyDown = EditKeyDown
    end
  end
  object QryUPI: TQuery
    Left = 232
  end
end
