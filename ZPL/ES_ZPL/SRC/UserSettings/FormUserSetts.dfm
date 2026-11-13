object FrmUsrSetts: TFrmUsrSetts
  Left = 736
  Top = 545
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 170
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    235
    170)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 8
    Top = 128
    Width = 217
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object BtnOk: TBitBtn
    Left = 151
    Top = 140
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1085#1103#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object GroupBoxEmplSrch: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 73
    Caption = ' '#1044#1080#1072#1083#1086#1075' '#1087#1086#1080#1089#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '
    TabOrder = 1
    object ChBoxNewEmplSrchDlg: TCheckBox
      Left = 40
      Top = 24
      Width = 161
      Height = 17
      Alignment = taLeftJustify
      Caption = #1054#1073#1085#1086#1074#1083#1105#1085#1085#1099#1081' '#1076#1080#1072#1083#1086#1075
      TabOrder = 0
      OnClick = ChBoxNewEmplSrchDlgClick
    end
    object ChBoxOneStepEmplSrch: TCheckBox
      Left = 40
      Top = 48
      Width = 161
      Height = 17
      Alignment = taLeftJustify
      Caption = #1054#1076#1085#1086#1096#1072#1075#1086#1074#1099#1081' '#1087#1086#1080#1089#1082
      TabOrder = 1
    end
  end
  object ChBoxSepVacatDetails: TCheckBox
    Left = 8
    Top = 96
    Width = 201
    Height = 17
    Hint = 
      #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1072#1079#1076#1077#1083#1100#1085#1086' '#1086#1089#1085#1086#1074#1085#1099#1077' '#1080' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1082#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1088#1080' ' +
      #1088#1072#1089#1095#1105#1090#1077' '#1086#1090#1087#1091#1089#1082#1085#1099#1093
    Alignment = taLeftJustify
    Caption = #1056#1072#1079#1076#1077#1083'. '#1087#1086#1076#1088#1086#1073#1085'. '#1088#1072#1089#1095#1105#1090#1072' '#1086#1090#1087#1091#1089#1082#1085'.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
end
