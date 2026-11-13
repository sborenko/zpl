object FrmSpov: TFrmSpov
  Left = 440
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1082#1072' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' "M.E.Doc"'
  ClientHeight = 329
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    424
    329)
  PixelsPerInch = 96
  TextHeight = 13
  object GrBoxPeriod: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 57
    Caption = ' '#1054#1090#1095#1105#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076' '
    TabOrder = 0
    DesignSize = (
      409
      57)
    object LblYear: TLabel
      Left = 120
      Top = 28
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1043#1086#1076
    end
    object LblQuart: TLabel
      Left = 8
      Top = 28
      Width = 42
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1072#1083
      Visible = False
    end
    object LblMnth: TLabel
      Left = 272
      Top = 28
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object EdtYear: TEdit
      Left = 152
      Top = 24
      Width = 41
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '2022'
    end
    object UpDownYear: TUpDown
      Left = 193
      Top = 24
      Width = 16
      Height = 21
      Associate = EdtYear
      Min = 2021
      Max = 2100
      Position = 2022
      TabOrder = 1
      Thousands = False
    end
    object EdtQuart: TEdit
      Left = 64
      Top = 24
      Width = 25
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '3'
      Visible = False
    end
    object UpDownQuart: TUpDown
      Left = 89
      Top = 24
      Width = 16
      Height = 21
      Associate = EdtQuart
      Min = 1
      Max = 4
      Position = 3
      TabOrder = 3
      Visible = False
    end
    object EdtMnth: TEdit
      Left = 320
      Top = 24
      Width = 25
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '3'
    end
    object UpDownMnth: TUpDown
      Left = 345
      Top = 24
      Width = 16
      Height = 21
      Associate = EdtMnth
      Min = 1
      Max = 12
      Position = 3
      TabOrder = 5
    end
  end
  object GrBoxAppx: TGroupBox
    Left = 8
    Top = 72
    Width = 409
    Height = 57
    Caption = ' '#1055#1088#1080#1083#1086#1078#1077#1085#1080#1103' '
    TabOrder = 1
    object ChBoxAppx4: TCheckBox
      Left = 200
      Top = 24
      Width = 97
      Height = 17
      Caption = #1055#1088#1080#1083'. 4 '#1047#1072#1088#1087#1083'.'
      TabOrder = 0
    end
    object ChBoxAppx5: TCheckBox
      Left = 24
      Top = 24
      Width = 65
      Height = 17
      Caption = #1055#1088#1080#1083'. 5'
      TabOrder = 1
    end
    object ChBoxAppx1And6: TCheckBox
      Left = 104
      Top = 24
      Width = 73
      Height = 17
      Caption = #1055#1088#1080#1083'. 1, 6'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object ChBoxAppx4Grants: TCheckBox
      Left = 312
      Top = 24
      Width = 81
      Height = 17
      Caption = '+ '#1057#1090#1080#1087#1077#1085#1076#1080#1103
      TabOrder = 3
      OnClick = ChBoxAppx4GrantsClick
    end
  end
  object GrBoxEmpl: TGroupBox
    Left = 8
    Top = 136
    Width = 409
    Height = 153
    Caption = ' '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '
    TabOrder = 2
    DesignSize = (
      409
      153)
    object LblEmplId: TLabel
      Left = 8
      Top = 52
      Width = 385
      Height = 29
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1058#1072#1073#1077#1083#1100#1085#1099#1077' '#1085#1086#1084#1077#1088#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1086#1090#1095#1105#1090', '#1088#1072#1079#1076#1077#1083#1105#1085#1085#1099#1077' '#1079#1072 +
        #1087#1103#1090#1099#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object RadioListOnly: TRadioButton
      Left = 66
      Top = 24
      Width = 113
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1089#1087#1080#1089#1086#1082
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioAllEmpls: TRadioButton
      Left = 234
      Top = 24
      Width = 113
      Height = 17
      Caption = #1055#1086#1083#1085#1099#1081' '#1086#1090#1095#1077#1090
      TabOrder = 1
    end
    object MemoEmplIds: TMemo
      Left = 8
      Top = 88
      Width = 393
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = MemoEmplIdsEnter
    end
  end
  object BtnStart: TBitBtn
    Left = 338
    Top = 297
    Width = 75
    Height = 25
    Anchors = [akRight]
    Caption = #1047#1072#1087#1091#1089#1082
    TabOrder = 3
    OnClick = BtnStartClick
  end
end
