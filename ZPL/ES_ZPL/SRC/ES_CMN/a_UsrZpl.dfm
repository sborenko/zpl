object FormEAUsrZpl: TFormEAUsrZpl
  Left = 318
  Top = 479
  Width = 326
  Height = 127
  Caption = 'FormEAUsrZpl'
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
    Top = 8
    Width = 27
    Height = 13
    Caption = #1070#1079#1077#1088
    FocusControl = dbeKdUsr
  end
  object Label2: TLabel
    Left = 106
    Top = 8
    Width = 37
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082
    FocusControl = dbeKdSps
  end
  object Label3: TLabel
    Left = 5
    Top = 52
    Width = 42
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095'.'
    FocusControl = dbeNotes
  end
  object Label4: TLabel
    Left = 198
    Top = 8
    Width = 42
    Height = 13
    Caption = #1064#1092#1088#1057#1087#1089
    FocusControl = dbeShSps
  end
  object Label5: TLabel
    Left = 5
    Top = 30
    Width = 37
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082
    FocusControl = dbeNmSps
  end
  object sBtnKdSps: TSpeedButton
    Left = 176
    Top = 5
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1057#1087#1080#1089#1082#1080'"'
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
  object dbeKdUsr: TDBEdit
    Left = 50
    Top = 5
    Width = 49
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDUSR'
    DataSource = Form_UsersNew.dsrcUsrZplSps
    ReadOnly = True
    TabOrder = 0
  end
  object dbeKdSps: TDBEdit
    Left = 146
    Top = 5
    Width = 29
    Height = 21
    DataField = 'KDSPS'
    DataSource = Form_UsersNew.dsrcUsrZplSps
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 50
    Top = 49
    Width = 265
    Height = 21
    DataField = 'NOTES'
    DataSource = Form_UsersNew.dsrcUsrZplSps
    TabOrder = 4
  end
  object dbeShSps: TDBEdit
    Left = 244
    Top = 5
    Width = 71
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'SHSPS'
    DataSource = Form_UsersNew.dsrcUsrZplSps
    ReadOnly = True
    TabOrder = 2
  end
  object dbeNmSps: TDBEdit
    Left = 50
    Top = 27
    Width = 265
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'NMSPS'
    DataSource = Form_UsersNew.dsrcUsrZplSps
    ReadOnly = True
    TabOrder = 3
  end
  object bBtnOk: TBitBtn
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 240
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
end
