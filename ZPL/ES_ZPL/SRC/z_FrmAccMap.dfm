object FrmAccountMap: TFrmAccountMap
  Left = 761
  Top = 359
  BorderStyle = bsDialog
  Caption = #1057#1086#1087#1086#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1086#1074
  ClientHeight = 255
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LblBaseAccNum: TLabel
    Left = 16
    Top = 48
    Width = 118
    Height = 17
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblBaseAccName: TLabel
    Left = 144
    Top = 48
    Width = 345
    Height = 17
    AutoSize = False
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblAccounts: TLabel
    Left = 16
    Top = 80
    Width = 144
    Height = 13
    Caption = #1057#1086#1087#1086#1089#1090#1072#1074#1083#1103#1077#1084#1099#1077' '#1089#1095#1077#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFirstAccount: TLabel
    Left = 155
    Top = 128
    Width = 333
    Height = 13
    AutoSize = False
  end
  object LblSecondAccount: TLabel
    Left = 152
    Top = 184
    Width = 337
    Height = 13
    AutoSize = False
  end
  object BevelHead: TBevel
    Left = 16
    Top = 72
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object BevelFoot: TBevel
    Left = 16
    Top = 216
    Width = 473
    Height = 9
    Shape = bsTopLine
  end
  object LblForPayments: TLabel
    Left = 16
    Top = 160
    Width = 148
    Height = 13
    Caption = #1044#1083#1103' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblForAllowances: TLabel
    Left = 16
    Top = 104
    Width = 143
    Height = 13
    Caption = #1044#1083#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'/'#1091#1076#1077#1088#1078#1072#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblMOName: TLabel
    Left = 16
    Top = 16
    Width = 162
    Height = 16
    Caption = #1052#1077#1084#1086#1088#1080#1072#1083#1100#1085#1099#1081' '#1086#1088#1076#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtFirstAccount: TEdit
    Left = 16
    Top = 128
    Width = 89
    Height = 21
    TabOrder = 1
    OnEnter = EdtFirstAccountEnter
    OnExit = EdtFirstAccountExit
  end
  object EdtSecondAccount: TEdit
    Left = 16
    Top = 184
    Width = 89
    Height = 21
    TabOrder = 3
    OnEnter = EdtSecondAccountEnter
    OnExit = EdtSecondAccountExit
  end
  object BtnOk: TBitBtn
    Left = 320
    Top = 224
    Width = 75
    Height = 25
    Caption = '&'#1055#1088#1080#1085#1103#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BtnOkClick
  end
  object BtnCancel: TBitBtn
    Left = 408
    Top = 224
    Width = 75
    Height = 25
    Caption = '&'#1054#1090#1082#1072#1079#1072#1090#1100#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 7
  end
  object BtnDelete: TBitBtn
    Left = 24
    Top = 224
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnDeleteClick
  end
  object EdtMOName: TEdit
    Left = 184
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    OnEnter = EdtMONameEnter
    OnExit = EdtMONameExit
  end
  object BtnFirstAccount: TBitBtn
    Left = 112
    Top = 128
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = BtnFirstAccountClick
  end
  object BtnSecondAccount: TBitBtn
    Left = 112
    Top = 184
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = BtnSecondAccountClick
  end
end
