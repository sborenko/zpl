object FormCopyFlds: TFormCopyFlds
  Left = 401
  Top = 338
  BorderStyle = bsDialog
  Caption = 'FormCopyFlds'
  ClientHeight = 202
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    398
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 398
    Height = 202
    Align = alClient
  end
  object Label1: TLabel
    Left = 220
    Top = 22
    Width = 162
    Height = 63
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1055#1088#1086#1089#1090#1072#1074#1100#1090#1077' "'#1075#1072#1083#1086#1095#1082#1080'" '#1085#1072' '#1087#1086#1083#1103#1093', '#1079#1085#1072#1095#1077#1085#1080#1103' '#1082#1086#1090#1086#1088#1099#1093' '#1076#1086#1083#1078#1085#1099' '#1082#1086#1087#1080#1088#1086#1074#1072#1090 +
      #1100#1089#1103' '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Label2: TLabel
    Left = 213
    Top = 78
    Width = 182
    Height = 95
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1053#1077#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1087#1086#1083#1103' '#1074' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080' '#1073#1091#1076#1091#1090' '#1083#1080#1073#1086' '#1086#1089#1090#1072#1074#1072#1090#1100#1089#1103' '#1087#1091#1089#1090#1099#1084#1080' (' +
      #1058#1072#1073#1053#1088', '#1042#1080#1076', '#1057#1091#1084#1084#1072' ...), '#1083#1080#1073#1086' '#1079#1072#1087#1086#1083#1085#1103#1090#1100#1089#1103' '#1079#1085#1072#1095#1077#1085#1080#1103#1084#1080' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102 +
      ' ('#1055#1086#1076#1088#1072#1079#1076'., '#1050#1072#1090#1077#1075#1086#1088#1080#1103#1055#1077#1088#1089', '#1057#1095#1077#1090#1041#1059' ...)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object chBoxTabN: TCheckBox
    Left = 7
    Top = 5
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    TabOrder = 0
  end
  object chBoxVidN: TCheckBox
    Left = 7
    Top = 21
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1042#1080#1076' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object chBoxZaMG: TCheckBox
    Left = 7
    Top = 37
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1052#1077#1089#1103#1094', '#1079#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1085#1072#1095#1080#1089#1083#1103#1077#1090#1089#1103
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object chBoxDtBeg: TCheckBox
    Left = 7
    Top = 53
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072
    TabOrder = 3
  end
  object chBoxDtEnd: TCheckBox
    Left = 7
    Top = 69
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1072#1090#1099' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    TabOrder = 4
  end
  object chBoxChas: TCheckBox
    Left = 7
    Top = 85
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1063#1072#1089#1099
    TabOrder = 5
  end
  object chBoxSumma: TCheckBox
    Left = 7
    Top = 101
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1057#1091#1084#1084#1072
    TabOrder = 6
  end
  object chBoxPdN: TCheckBox
    Left = 7
    Top = 117
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1055#1086#1083#1077' "'#1055#1053'" ('#1090'.'#1085'. "'#1087#1086#1076#1086#1093#1086#1076#1085#1099#1081'")'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object chBoxKdSpZ: TCheckBox
    Left = 7
    Top = 133
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1089#1095#1077#1090#1072' '#1041#1059
    TabOrder = 8
  end
  object chBoxKdObj: TCheckBox
    Left = 7
    Top = 149
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    TabOrder = 9
  end
  object chBoxKdKatP: TCheckBox
    Left = 7
    Top = 165
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
    TabOrder = 10
  end
  object chBoxNotes: TCheckBox
    Left = 7
    Top = 181
    Width = 200
    Height = 17
    Alignment = taLeftJustify
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    TabOrder = 11
  end
  object bBtnOk: TBitBtn
    Left = 231
    Top = 173
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1042#1074#1086#1076
    TabOrder = 12
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 319
    Top = 173
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 13
    Kind = bkCancel
  end
end
