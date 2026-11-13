object FormEADPere: TFormEADPere
  Left = 707
  Top = 483
  BorderStyle = bsDialog
  Caption = 'FormEADPere'
  ClientHeight = 174
  ClientWidth = 259
  Color = 13234669
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
  object Label1: TLabel
    Left = 5
    Top = 34
    Width = 126
    Height = 13
    Caption = '% '#1086#1090' '#1089#1091#1084#1084#1072#1088#1085#1086#1075#1086' '#1086#1082#1083#1072#1076#1072
    FocusControl = dbePrcOkl
  end
  object Label2: TLabel
    Left = 5
    Top = 51
    Width = 140
    Height = 13
    Caption = #1057#1091#1084#1084#1072', '#1087#1088#1080#1093#1086#1076#1103#1097#1072#1103#1089#1103' '#1085#1072' %'
    FocusControl = dbeOklTrf
  end
  object Label3: TLabel
    Left = 5
    Top = 78
    Width = 166
    Height = 13
    Hint = #1057#1041#1059' ('#1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103')'
    Caption = #1057#1041#1059' ('#1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103')'
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Left = 5
    Top = 123
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object sBtnSPZ: TSpeedButton
    Left = 240
    Top = 75
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
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
    OnClick = sBtnSPZClick
  end
  object Label5: TLabel
    Left = 5
    Top = 64
    Width = 166
    Height = 13
    Caption = '('#1056#1072#1079#1088#1077#1096#1077#1085' '#1074#1074#1086#1076' '#1085#1091#1083#1077#1074#1086#1081' '#1089#1091#1084#1084#1099')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 22
    Top = 3
    Width = 147
    Height = 26
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1054#1090' '#1082#1072#1082#1086#1075#1086' "'#1089#1087#1080#1089#1082#1072'" '#1076#1072#1077#1090#1089#1103' '#1095#1072#1089#1090#1100' '#1086#1082#1083#1072#1076#1072
    FocusControl = dbeShSps
    WordWrap = True
  end
  object sBtnKdSps: TSpeedButton
    Left = 239
    Top = 8
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1089#1087#1080#1089#1082#1086#1074'"'
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
    OnClick = sBtnKdSpsClick
  end
  object Label7: TLabel
    Left = 5
    Top = 100
    Width = 129
    Height = 13
    Caption = #1054#1090' '#1082#1072#1082#1086#1075#1086' '#1087#1086#1076#1088#1072#1079#1077#1083#1077#1085#1080#1103' '
    FocusControl = dbeKdObj
  end
  object sBtnObj: TSpeedButton
    Left = 240
    Top = 97
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
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
  object dbePrcOkl: TDBEdit
    Left = 181
    Top = 31
    Width = 74
    Height = 21
    Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1089#1091#1084#1084#1072#1088#1085#1086#1075#1086' '#1086#1082#1083#1072#1076#1072
    DataField = 'PRCOKL'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbelEnter
    OnExit = dbeExit
  end
  object dbeOklTrf: TDBEdit
    Left = 181
    Top = 53
    Width = 74
    Height = 21
    Hint = 
      #1057#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072', '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1072#1103' '#1087#1088#1086#1094#1077#1085#1090#1091'|'#1057#1091#1084#1084#1072' '#1086#1082#1083#1072#1076#1072', '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091 +
      #1102#1097#1072#1103' '#1087#1088#1086#1094#1077#1085#1090#1091' ('#1044#1083#1103' '#1086#1089#1086#1073#1099#1093' '#1089#1083#1091#1095#1072#1077#1074' '#1088#1072#1079#1088#1077#1096#1072#1077#1090#1089#1103' '#1074#1074#1086#1076' '#1085#1091#1083#1077#1074#1086#1081' '#1089#1091#1084#1084#1099 +
      ')'
    DataField = 'OKLTRF'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbelEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 80
    Top = 120
    Width = 183
    Height = 21
    Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090'-'#1087#1072#1084#1103#1090#1082#1072
    DataField = 'NOTES'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnEnter = dbelEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 80
    Top = 144
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1089' '#1079#1072#1087#1080#1089#1100#1102' '#1085#1072' '#1076#1080#1089#1082
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 188
    Top = 144
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1079#1072#1087#1080#1089#1080' '#1085#1072' '#1076#1080#1089#1082
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Kind = bkCancel
  end
  object dbeSPZ: TDBEdit
    Left = 181
    Top = 75
    Width = 59
    Height = 21
    DataField = 'Spz'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnDblClick = sBtnSPZClick
    OnEnter = dbelEnter
    OnExit = dbeExit
    OnKeyDown = dbeSPZKeyDown
  end
  object dbeShSps: TDBEdit
    Left = 181
    Top = 8
    Width = 57
    Height = 21
    Hint = #1054#1090' '#1082#1072#1082#1086#1075#1086' "'#1089#1087#1080#1089#1082#1072'" '#1074#1074#1086#1076#1080#1090#1089#1103' '#1095#1072#1089#1090#1100' '#1086#1082#1083#1072#1076#1072
    DataField = 'ShSps'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnDblClick = sBtnKdSpsClick
    OnEnter = dbelEnter
    OnExit = dbeExit
    OnKeyDown = dbeShSpsKeyDown
  end
  object dbeKdObj: TDBEdit
    Left = 200
    Top = 97
    Width = 39
    Height = 21
    DataField = 'KDOBJ'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbelEnter
    OnExit = dbeExit
  end
  object dbeShObj: TDBEdit
    Left = 136
    Top = 97
    Width = 63
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'ShObj'
    DataSource = DmMain.dsrcDPere
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
