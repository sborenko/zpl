object FormVbDirZd: TFormVbDirZd
  Left = 381
  Top = 218
  BorderStyle = bsDialog
  Caption = 'FormVbDirZd'
  ClientHeight = 334
  ClientWidth = 446
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
  object sBtnMoveUpi: TSpeedButton
    Left = 206
    Top = 6
    Width = 236
    Height = 22
    Hint = #1057#1074#1077#1076#1077#1085#1080#1103' '#1080#1079' '#1059#1055#1048' '#1080' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1074' '#1085#1086#1074#1099#1077' '#1059#1055#1048', '#1055#1088#1084#1059#1074#1086#1083#1085', '#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
    GroupIndex = 5
    Caption = 'upi.dbf '#1080' Pere.dbf '#1074' z_UPI, z_Prm_Uv, z_Pere'
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveNadb: TSpeedButton
    Left = 206
    Top = 52
    Width = 236
    Height = 22
    Hint = #1053#1072#1076#1073#1072#1074#1082#1080' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1047#1055#1051' '#1074' '#1085#1086#1074#1091#1102
    GroupIndex = 5
    Caption = 'Nadb.dbf -> Z_Nadb'
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveUdrg: TSpeedButton
    Left = 206
    Top = 75
    Width = 236
    Height = 22
    Hint = #1040#1083#1080#1084#1077#1085#1090#1099' '#1080' '#1076#1088#1091#1075#1080#1077' '#1091#1076#1077#1088#1078#1072#1085#1080#1103' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1047#1055#1051' '#1074' '#1085#1086#1074#1091#1102
    GroupIndex = 5
    Caption = 'Alimenty '#1080' '#1076#1088'. -> Z_Uderg'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveSps: TSpeedButton
    Left = 206
    Top = 98
    Width = 236
    Height = 22
    Hint = #1060#1072#1081#1083#1099' SpsMMYY.dbf '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1088#1087#1083#1072#1090#1091
    GroupIndex = 5
    Down = True
    Caption = 'Sps -> Z_Sps'
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveNU: TSpeedButton
    Left = 206
    Top = 121
    Width = 236
    Height = 22
    Hint = #1060#1072#1081#1083#1099' NuMMYY.dbf '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1088#1087#1083#1072#1090#1091
    GroupIndex = 5
    Caption = 'Nu -> Z_NU'
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveOtkl: TSpeedButton
    Left = 206
    Top = 144
    Width = 236
    Height = 22
    Hint = #1060#1072#1081#1083#1099' OtklMMYY.dbf '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1088#1087#1083#1072#1090#1091
    GroupIndex = 5
    Caption = 'Otkl -> Z_Otkl'
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object sBtnMoveOtp: TSpeedButton
    Left = 206
    Top = 167
    Width = 236
    Height = 22
    Hint = #1043#1088#1072#1092#1080#1082' '#1086#1090#1087#1091#1089#1082#1086#1074' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1047#1055#1051' '#1074' '#1085#1086#1074#1091#1102
    GroupIndex = 5
    Caption = 'Graf_Otp => Z_VOtp'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object Label3: TLabel
    Left = 4
    Top = 199
    Width = 193
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 206
    Top = 199
    Width = 236
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1077#1081#1089#1090#1074#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 225
    Width = 254
    Height = 13
    Alignment = taCenter
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102' '#1080' '#1076#1077#1081#1089#1090#1074#1080#1077' '#1080' '#1085#1072#1078#1072#1090#1100' "'#1042#1074#1086#1076'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sBtnMovePere2: TSpeedButton
    Left = 206
    Top = 29
    Width = 236
    Height = 22
    Hint = #1053#1072#1076#1073#1072#1074#1082#1080' '#1080#1079' '#1089#1090#1072#1088#1086#1081' '#1047#1055#1051' '#1074' '#1085#1086#1074#1091#1102
    GroupIndex = 5
    Caption = 'Pere.dbf -> Z_Pere ('#1087#1086#1074#1090#1086#1088#1085#1086')'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnMoveUpiClick
  end
  object LbxDirOldZp: TListBox
    Left = 5
    Top = 7
    Width = 193
    Height = 181
    ItemHeight = 13
    Items.Strings = (
      'D_01.   zp_z 110 '#1041#1102#1076#1078#1077#1090
      'D_02.   zp_z 106 '#1050#1086#1085#1090#1088#1072#1082#1090#1099
      'D_03.   zp_z 316 '#1053#1048#1063
      'D_04.   zp_z 106/2 '#1056#1058#1041
      'D_05.   zp_z 104 '#1051#1077#1085#1072
      'D_06    zp_z 106 '#1053#1060' ')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 286
    Top = 219
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 367
    Top = 219
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object Memo1: TMemo
    Left = 0
    Top = 256
    Width = 446
    Height = 78
    Align = alBottom
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
