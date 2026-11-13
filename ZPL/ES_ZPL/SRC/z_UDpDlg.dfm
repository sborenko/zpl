object FormUpiDopDlg: TFormUpiDopDlg
  Left = 481
  Top = 430
  BorderStyle = bsDialog
  Caption = 'FormUpiDopDlg'
  ClientHeight = 120
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelMsg: TLabel
    Left = 6
    Top = 7
    Width = 257
    Height = 59
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1057#1086#1090#1088#1091#1076#1085#1080#1082' '#1048#1074#1072#1085#1086#1074' '#1048'.'#1048'. '#1090#1072#1073'. '#1085'-'#1088' = 34567 '#1076#1072#1090#1072' '#1087#1088#1080#1077#1084#1072' 01-01-1995, '#1076 +
      #1072#1090#1072' '#1091#1074#1086#1083#1100#1085'. 12-12-1999 '#1087#1086#1076#1082#1083#1102#1095#1072#1077#1090#1089#1103' '#1074' '#1089#1087#1080#1089#1086#1082' '#8470'1 '#1074' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object sBtnObj: TSpeedButton
    Left = 251
    Top = 69
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000E0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7700700000778888870077777777777777007770777777877700770007777888
      7700700000778888870000000008887888007700077778787700770007777888
      770077000777788877007777777777777700}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnObjClick
  end
  object Label1: TLabel
    Left = 7
    Top = 72
    Width = 39
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 11
    Top = 97
    Width = 17
    Height = 17
    Picture.Data = {
      07544269746D617076010000424D760100000000000076000000280000002000
      000010000000010004000000000000010000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000007F7F
      7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF003333000000000000333377777777777733330FFFFFFFFFF033337F3FFF3F
      3FF733330F000F0F00F033337F777373773733330FFFFFFFFFF033337F3FF3FF
      3FF733330F00F00F00F033337F773773773733330FFFFFFFFFF033337FF3333F
      F3F7333300FFFF00F0F03333773FF377F7373330FB00F0F0FFF0333733773737
      F3F7330FB0BF0FB0F0F0337337337337373730FBFBF0FB0FFFF037F333373373
      333730BFBF0FB0FFFFF037F3337337333FF700FBFBFB0FFF000077F333337FF3
      7777E0BFBFB000FF0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F73
      7F73EEE0BFBF00FF00337777FFFF77FF7733EEEE000000000333777777777777
      7333}
    Transparent = True
  end
  object Label2: TLabel
    Left = 32
    Top = 99
    Width = 72
    Height = 13
    Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bBtnOk: TBitBtn
    Left = 112
    Top = 93
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 192
    Top = 93
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 48
    Top = 69
    Width = 202
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Text = 'Edit1'
    OnDblClick = sBtnObjClick
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
end
