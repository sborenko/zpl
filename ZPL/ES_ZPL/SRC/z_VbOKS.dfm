object FormVbOKS: TFormVbOKS
  Left = 439
  Top = 243
  BorderStyle = bsDialog
  Caption = 'FormVbOKS'
  ClientHeight = 278
  ClientWidth = 368
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
    Left = 254
    Top = 171
    Width = 108
    Height = 75
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 9
    Top = 53
    Width = 206
    Height = 13
    Caption = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' ('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 77
    Width = 239
    Height = 13
    Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1084#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072' ('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 101
    Width = 212
    Height = 13
    Caption = #1042#1099#1073#1086#1088' '#1057#1041#1059' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' ('#1073#1077#1079' '#1074#1099#1073#1086#1088#1072' '#1042#1057#1045')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 11
    Top = 5
    Width = 348
    Height = 46
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1045#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1074#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1077#1088#1089#1086#1085#1072#1083#1072', '#1057#1041#1059', '#1087#1086 +
      ' '#1082#1086#1090#1086#1088#1099#1084' '#1089#1076#1077#1083#1072#1085#1099' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103', '#1076#1083#1103' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1089#1091#1084#1084' '#1074' '#1074#1077 +
      #1076#1086#1084#1086#1089#1090#1080'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object sBtnObj: TSpeedButton
    Left = 257
    Top = 50
    Width = 78
    Height = 23
    Hint = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    Caption = #1042#1099#1073#1088#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnObjClick
  end
  object sBtnKatP: TSpeedButton
    Left = 257
    Top = 74
    Width = 78
    Height = 23
    Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1087#1077#1088#1089#1086#1085#1072#1083#1072', '#1074#1082#1083#1102#1095#1072#1077#1084#1099#1093' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    Caption = #1042#1099#1073#1088#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnKatPClick
  end
  object sBtnSpz: TSpeedButton
    Left = 257
    Top = 98
    Width = 78
    Height = 23
    Hint = #1042#1099#1073#1086#1088' '#1057#1041#1059', '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1074#1082#1083#1102#1095#1072#1102#1090#1089#1103' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    Caption = #1042#1099#1073#1088#1072#1090#1100
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnSpzClick
  end
  object sBtnObjClear: TSpeedButton
    Left = 336
    Top = 50
    Width = 23
    Height = 23
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sBtnObjClearClick
  end
  object sBtnKatPClear: TSpeedButton
    Left = 336
    Top = 74
    Width = 23
    Height = 23
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sBtnKatPClearClick
  end
  object sBtnSpzClear: TSpeedButton
    Left = 336
    Top = 98
    Width = 23
    Height = 23
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sBtnSpzClearClick
  end
  object SpeedButton1: TSpeedButton
    Left = 270
    Top = 180
    Width = 72
    Height = 25
    Hint = #1055#1086#1103#1089#1085#1077#1085#1080#1103' '#1082' '#1088#1072#1073#1086#1090#1077' '#1089' '#1092#1086#1088#1084#1086#1081
    Caption = #1055#1086#1084#1086#1097#1100
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
      33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
      FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
      FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
      FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
      FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
      FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
      3333333773FFFF77333333333FBFBF3333333333377777333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    Spacing = 1
    OnClick = SpeedButton1Click
  end
  object Label6: TLabel
    Left = 256
    Top = 210
    Width = 102
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1053#1072#1078#1084#1080#1090#1077', '#1095#1090#1086#1073#1099' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 7
    Top = 122
    Width = 356
    Height = 41
    Caption = ' '#1054#1090#1085#1086#1096#1077#1085#1080#1077' '#1082' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1100#1089#1090#1074#1091' '
    TabOrder = 2
    object rBtnSovmNo: TRadioButton
      Left = 61
      Top = 17
      Width = 146
      Height = 17
      Hint = #1042#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      Caption = #1090#1086#1083#1100#1082#1086' '#1085#1077#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object rBtnSovmYes: TRadioButton
      Left = 214
      Top = 17
      Width = 134
      Height = 17
      Hint = #1042#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      Caption = #1090#1086#1083#1100#1082#1086' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object rBtnSovmAll: TRadioButton
      Left = 7
      Top = 17
      Width = 44
      Height = 17
      Hint = #1042#1099#1073#1080#1088#1072#1102#1090#1089#1103' '#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080' '#1080' '#1085#1077#1089#1086#1074#1084#1077#1089#1090#1080#1090#1077#1083#1080
      Caption = #1074#1089#1077
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
  end
  object bBtnOk: TBitBtn
    Left = 210
    Top = 249
    Width = 75
    Height = 25
    Hint = #1042#1074#1086#1076' '#1079#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
    Caption = #1042#1074#1086#1076
    Default = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = bBtnOkClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bBtnCancel: TBitBtn
    Left = 288
    Top = 250
    Width = 75
    Height = 25
    Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1074#1074#1086#1076#1072
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Kind = bkCancel
  end
  object lbxObj: TListBox
    Left = 161
    Top = 11
    Width = 53
    Height = 19
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object lbxKatP: TListBox
    Left = 215
    Top = 11
    Width = 53
    Height = 19
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object lbxSpz: TListBox
    Left = 266
    Top = 11
    Width = 53
    Height = 19
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object chBoxProverka: TCheckBox
    Left = 8
    Top = 252
    Width = 189
    Height = 17
    Caption = #1059#1090#1086#1095#1085#1103#1090#1100' '#1079#1072#1076#1072#1085#1080#1077' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object GroupBox4: TGroupBox
    Left = 7
    Top = 166
    Width = 246
    Height = 80
    Caption = ' '#1057#1087#1086#1089#1086#1073' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object rBtnSch01: TRadioButton
      Left = 5
      Top = 17
      Width = 238
      Height = 17
      Caption = #1087#1086' '#1089#1093#1077#1084#1077' "'#1086#1090#1087#1091#1089#1082#1085#1099#1077' + '#1079#1072#1088#1087#1083#1072#1090#1072'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object rBtnSch02: TRadioButton
      Left = 5
      Top = 36
      Width = 238
      Height = 17
      Caption = #1087#1086' '#1089#1093#1077#1084#1077' "'#1095#1072#1089#1090#1080#1095#1085#1099#1077' '#1074#1099#1087#1083#1072#1090#1099'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object rBtnSch03: TRadioButton
      Left = 5
      Top = 55
      Width = 238
      Height = 17
      Caption = #1087#1086' '#1089#1093#1077#1084#1077' "'#1086#1082#1086#1085#1095#1072#1090#1077#1083#1100#1085#1099#1077' '#1074#1099#1087#1083#1072#1090#1099'"'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'F_Int'
        DataType = ftInteger
      end
      item
        Name = 'F_Float'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 65
    Top = 48
    Data = {
      380000009619E0BD010000001800000002000000000003000000380005465F49
      6E74040001000000000007465F466C6F617408000400000000000000}
    object cdsTmpF_Int: TIntegerField
      FieldName = 'F_Int'
    end
    object cdsTmpF_Float: TFloatField
      FieldName = 'F_Float'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 80
    Top = 56
  end
  object qryNU: TQuery
    Left = 207
    Top = 92
  end
end
