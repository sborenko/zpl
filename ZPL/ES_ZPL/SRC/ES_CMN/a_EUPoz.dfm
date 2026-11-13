object FormEAUPoz: TFormEAUPoz
  Left = 387
  Top = 334
  BorderStyle = bsDialog
  Caption = 'FormEAUPoz'
  ClientHeight = 170
  ClientWidth = 403
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
    Left = 5
    Top = 9
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKPr
  end
  object Label2: TLabel
    Left = 74
    Top = 9
    Width = 121
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1080
    FocusControl = dbeSpecNaim
  end
  object Label3: TLabel
    Left = 5
    Top = 33
    Width = 88
    Height = 13
    Caption = #1056#1072#1089#1095'.'#1089#1095'.'#1074' '#1082#1072#1079#1085#1072#1095'.'
    FocusControl = dbeSchet
  end
  object Label4: TLabel
    Left = 225
    Top = 33
    Width = 100
    Height = 13
    Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1041#1059
    FocusControl = dbeBSchet
  end
  object Label5: TLabel
    Left = 85
    Top = 57
    Width = 61
    Height = 13
    Caption = #1057#1095#1077#1090' '#1047#1072#1090#1088#1072#1090
    FocusControl = dbeZSchet
  end
  object Label6: TLabel
    Left = 256
    Top = 57
    Width = 69
    Height = 13
    Caption = #1057#1095#1077#1090' '#1055#1088#1080#1093#1086#1076#1072
    FocusControl = dbeFSchet
  end
  object Label7: TLabel
    Left = 5
    Top = 82
    Width = 48
    Height = 13
    Caption = #1055#1088#1057#1084#1077#1090#1099
    FocusControl = dbePSmetu
  end
  object Label8: TLabel
    Left = 151
    Top = 82
    Width = 53
    Height = 13
    Caption = #1055#1088#1051#1080#1084#1080#1090#1072
    FocusControl = dbePLimita
  end
  object Label9: TLabel
    Left = 290
    Top = 82
    Width = 35
    Height = 13
    Caption = #1055#1088#1055#1083#1040
    FocusControl = dbePPlana
  end
  object Label10: TLabel
    Left = 5
    Top = 100
    Width = 114
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074'.'#1087#1088#1086#1075#1088#1072#1084#1084#1099
    FocusControl = dbeNmKFK
  end
  object sBtnBSchet: TSpeedButton
    Left = 384
    Top = 30
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
    OnClick = sBtnBSchetClick
  end
  object sBtnFSchet: TSpeedButton
    Left = 384
    Top = 54
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
    OnClick = sBtnFSchetClick
  end
  object sBtnZSchet: TSpeedButton
    Left = 204
    Top = 54
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
    OnClick = sBtnZSchetClick
  end
  object dbeKPr: TDBEdit
    Left = 30
    Top = 6
    Width = 31
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KPR'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeSpecNaim: TDBEdit
    Left = 200
    Top = 6
    Width = 199
    Height = 21
    DataField = 'SPECNAIM'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeSchet: TDBEdit
    Left = 97
    Top = 30
    Width = 122
    Height = 21
    DataField = 'SCHET'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeBSchet: TDBEdit
    Left = 329
    Top = 30
    Width = 55
    Height = 21
    DataField = 'B_SCHET'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeZSchet: TDBEdit
    Left = 153
    Top = 54
    Width = 51
    Height = 21
    DataField = 'Z_SCHET'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeFSchet: TDBEdit
    Left = 329
    Top = 54
    Width = 55
    Height = 21
    DataField = 'F_SCHET'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePSmetu: TDBEdit
    Left = 61
    Top = 79
    Width = 66
    Height = 21
    DataField = 'PSMETU'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePLimita: TDBEdit
    Left = 210
    Top = 79
    Width = 66
    Height = 21
    DataField = 'PLIMITA'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePPlana: TDBEdit
    Left = 329
    Top = 79
    Width = 70
    Height = 21
    DataField = 'PPLANA'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNmKFK: TDBEdit
    Left = 5
    Top = 116
    Width = 394
    Height = 21
    DataField = 'NMKFK'
    DataSource = Form_Dm.dsrcUPoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 237
    Top = 142
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 10
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 324
    Top = 142
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 11
    Kind = bkCancel
  end
end
