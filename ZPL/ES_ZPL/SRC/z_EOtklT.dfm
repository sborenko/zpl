object FormEOtklTools: TFormEOtklTools
  Left = 424
  Top = 283
  BorderStyle = bsDialog
  Caption = 'FormEOtklTools'
  ClientHeight = 308
  ClientWidth = 406
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
    Left = 8
    Top = 277
    Width = 166
    Height = 26
    AutoSize = False
    Caption = #1052#1072#1083#1080#1085#1086#1074#1099#1084' '#1094#1074#1077#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084#1099#1077' '#1091#1089#1090#1072#1085#1086#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object grBoxVidN: TGroupBox
    Left = 5
    Top = 3
    Width = 396
    Height = 33
    Caption = ' "'#1042#1080#1076'" '
    TabOrder = 0
    object rBtnVidNPred: TRadioButton
      Left = 183
      Top = 11
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object rBtnVidNEmpty: TRadioButton
      Left = 322
      Top = 11
      Width = 58
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object grBoxObj: TGroupBox
    Left = 5
    Top = 37
    Width = 396
    Height = 33
    Caption = ' "'#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'" '#1080' "'#1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1072'" '
    TabOrder = 1
    object rBtnObjEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 62
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      TabOrder = 2
    end
    object rBtnObjPred: TRadioButton
      Left = 183
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      TabOrder = 1
    end
    object rBtnObjPere: TRadioButton
      Left = 61
      Top = 12
      Width = 111
      Height = 17
      Caption = #1080#1079' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object grBoxSpZ: TGroupBox
    Left = 5
    Top = 71
    Width = 396
    Height = 33
    Caption = ' "'#1057#1095#1077#1090'" '
    TabOrder = 2
    object rBtnSpZEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 59
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      TabOrder = 2
    end
    object rBtnSpZPred: TRadioButton
      Left = 183
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      TabOrder = 1
    end
    object rBtnSpZPere: TRadioButton
      Left = 61
      Top = 12
      Width = 109
      Height = 17
      Caption = #1080#1079' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object grBoxZaMG: TGroupBox
    Left = 5
    Top = 105
    Width = 396
    Height = 33
    Caption = ' "'#1047#1072' '#1084#1077#1089#1103#1094'" '
    TabOrder = 3
    object rBtnZaMGCurrent: TRadioButton
      Left = 281
      Top = 12
      Width = 103
      Height = 17
      Caption = #1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object rBtnZaMGPred: TRadioButton
      Left = 143
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object grBoxNotes: TGroupBox
    Left = 5
    Top = 241
    Width = 396
    Height = 33
    Caption = ' "'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'" '
    TabOrder = 7
    object rBtnNotesEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 59
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      TabOrder = 1
    end
    object rBtnNotesPred: TRadioButton
      Left = 191
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object bBtnOk: TBitBtn
    Left = 246
    Top = 279
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 8
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 326
    Top = 279
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 9
    Kind = bkCancel
  end
  object grBoxSumma: TGroupBox
    Left = 5
    Top = 207
    Width = 396
    Height = 33
    Caption = ' "'#1057#1091#1084#1084#1072'" '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object rBtnSummaEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 59
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object rBtnSummaPred: TRadioButton
      Left = 191
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      TabOrder = 0
    end
  end
  object grBoxDtBeg: TGroupBox
    Left = 5
    Top = 139
    Width = 396
    Height = 33
    Caption = ' "'#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072'" '#1080' "'#1044#1072#1090#1072' '#1086#1082#1086#1085#1095'." '
    TabOrder = 4
    object rBtnDatesEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 59
      Height = 17
      Caption = #1087#1091#1089#1090#1099#1077
      TabOrder = 2
    end
    object rBtnDatesPred: TRadioButton
      Left = 191
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      TabOrder = 1
    end
    object rBtnDatesPeriod: TRadioButton
      Left = 34
      Top = 12
      Width = 148
      Height = 17
      Caption = #1085#1072#1095#1072#1083#1086' '#1080' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 173
    Width = 396
    Height = 33
    Caption = ' "'#1063#1072#1089#1099'" '
    TabOrder = 5
    object rBtnChasuEmpty: TRadioButton
      Left = 322
      Top = 12
      Width = 59
      Height = 17
      Caption = #1087#1091#1089#1090#1086#1077
      TabOrder = 2
    end
    object rBtnChasuPred: TRadioButton
      Left = 191
      Top = 12
      Width = 127
      Height = 17
      Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1075#1086' '#1074#1074#1086#1076#1072
      TabOrder = 1
    end
    object rBtnChasuCalc: TRadioButton
      Left = 34
      Top = 12
      Width = 132
      Height = 17
      Caption = #1074#1099#1095#1080#1089#1083#1103#1090#1100' '#1087#1086' '#1076#1072#1090#1072#1084
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
end
