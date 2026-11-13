object FormEAZpFio: TFormEAZpFio
  Left = 336
  Top = 196
  ActiveControl = dbeNP
  BorderStyle = bsDialog
  Caption = 'FormEAZpFio'
  ClientHeight = 212
  ClientWidth = 270
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
    Left = 52
    Top = 8
    Width = 15
    Height = 13
    Alignment = taRightJustify
    Caption = 'NP'
    FocusControl = dbeNP
  end
  object Label2: TLabel
    Left = 129
    Top = 8
    Width = 43
    Height = 13
    Caption = #1055#1072#1089#1087#1086#1088#1090
    FocusControl = dbePasport
  end
  object Label3: TLabel
    Left = 18
    Top = 30
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = #1060#1072#1084#1080#1083#1080#1103
    FocusControl = dbeFam
  end
  object Label4: TLabel
    Left = 45
    Top = 52
    Width = 22
    Height = 13
    Alignment = taRightJustify
    Caption = #1048#1084#1103
    FocusControl = dbeIma
  end
  object Label5: TLabel
    Left = 20
    Top = 74
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    FocusControl = dbeOtch
  end
  object Label6: TLabel
    Left = 31
    Top = 96
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'S_NAR'
    FocusControl = dbeS_Nar
  end
  object Label7: TLabel
    Left = 152
    Top = 96
    Width = 36
    Height = 13
    Caption = 'S_DOX'
    FocusControl = dbeS_Dox
  end
  object Label8: TLabel
    Left = 25
    Top = 118
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'S_TAXN'
    FocusControl = dbeS_TaxN
  end
  object Label9: TLabel
    Left = 147
    Top = 118
    Width = 41
    Height = 13
    Caption = 'S_TAXP'
    FocusControl = dbeS_TaxP
  end
  object Label10: TLabel
    Left = 15
    Top = 162
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'OZN_DOX'
    FocusControl = dbeOzn_Dox
  end
  object Label11: TLabel
    Left = 3
    Top = 133
    Width = 64
    Height = 30
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
    FocusControl = dbeD_Priyn
    Transparent = True
    WordWrap = True
  end
  object Label12: TLabel
    Left = 169
    Top = 139
    Width = 14
    Height = 13
    Caption = #1091#1074'.'
    FocusControl = dbeD_Zviln
  end
  object Label13: TLabel
    Left = 104
    Top = 162
    Width = 53
    Height = 13
    Caption = 'OZN_PILG'
    FocusControl = dbeOzn_Pilg
  end
  object Label14: TLabel
    Left = 193
    Top = 162
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'OZNAKA'
    FocusControl = dbeOznaka
  end
  object dbeNP: TDBEdit
    Left = 72
    Top = 5
    Width = 49
    Height = 21
    DataField = 'NP'
    DataSource = dsrc_ID
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePasport: TDBEdit
    Left = 176
    Top = 5
    Width = 90
    Height = 21
    Hint = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
    DataField = 'Pasport'
    DataSource = dsrc_ID
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeFam: TDBEdit
    Left = 72
    Top = 27
    Width = 194
    Height = 21
    DataField = 'Fam'
    DataSource = dsrc_ID
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeIma: TDBEdit
    Left = 72
    Top = 49
    Width = 194
    Height = 21
    DataField = 'Ima'
    DataSource = dsrc_ID
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeOtch: TDBEdit
    Left = 72
    Top = 71
    Width = 194
    Height = 21
    DataField = 'Otch'
    DataSource = dsrc_ID
    TabOrder = 4
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeS_Nar: TDBEdit
    Left = 72
    Top = 93
    Width = 70
    Height = 21
    DataField = 'S_NAR'
    DataSource = dsrc_ID
    TabOrder = 5
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeS_Dox: TDBEdit
    Left = 196
    Top = 93
    Width = 70
    Height = 21
    DataField = 'S_DOX'
    DataSource = dsrc_ID
    TabOrder = 6
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeS_TaxN: TDBEdit
    Left = 72
    Top = 115
    Width = 70
    Height = 21
    DataField = 'S_TAXN'
    DataSource = dsrc_ID
    TabOrder = 7
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeS_TaxP: TDBEdit
    Left = 196
    Top = 115
    Width = 70
    Height = 21
    DataField = 'S_TAXP'
    DataSource = dsrc_ID
    TabOrder = 8
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeOzn_Dox: TDBEdit
    Left = 72
    Top = 159
    Width = 25
    Height = 21
    Hint = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1093#1086#1076#1072
    DataField = 'OZN_DOX'
    DataSource = dsrc_ID
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeD_Priyn: TDBEdit
    Left = 72
    Top = 137
    Width = 80
    Height = 21
    Hint = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072' ('#1077#1089#1083#1080' '#1087#1088#1080#1085#1103#1090' '#1074' '#1086#1090#1095#1077#1090#1085#1086#1084' '#1082#1074#1072#1088#1090#1072#1083#1077')'
    DataField = 'D_PRIYN'
    DataSource = dsrc_ID
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeD_Zviln: TDBEdit
    Left = 186
    Top = 137
    Width = 80
    Height = 21
    Hint = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085'. ('#1077#1089#1083#1080' '#1091#1074#1086#1083#1077#1085' '#1074' '#1086#1090#1095#1077#1090#1085#1086#1084' '#1082#1074#1072#1088#1090#1072#1083#1077')'
    DataField = 'D_ZVILN'
    DataSource = dsrc_ID
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeOzn_Pilg: TDBEdit
    Left = 161
    Top = 159
    Width = 25
    Height = 21
    Hint = #1055#1088#1080#1079#1085#1072#1082' '#1083#1100#1075#1086#1090#1099
    DataField = 'OZN_PILG'
    DataSource = dsrc_ID
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeOznaka: TDBEdit
    Left = 241
    Top = 159
    Width = 25
    Height = 21
    DataField = 'OZNAKA'
    DataSource = dsrc_ID
    TabOrder = 13
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 112
    Top = 183
    Width = 75
    Height = 25
    TabOrder = 14
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 192
    Top = 183
    Width = 75
    Height = 25
    TabOrder = 15
    Kind = bkCancel
  end
  object dsrc_ID: TDataSource
    Left = 8
    Top = 178
  end
end
