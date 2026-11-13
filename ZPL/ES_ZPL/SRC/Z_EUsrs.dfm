object FormEAUsrs: TFormEAUsrs
  Left = 484
  Top = 206
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'FormEAUsrs'
  ClientHeight = 191
  ClientWidth = 210
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
    Left = 6
    Top = 3
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 6
    Top = 43
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 6
    Top = 83
    Width = 53
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 120
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 6
    Top = 19
    Width = 199
    Height = 21
    DataField = 'NMUSR'
    TabOrder = 0
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object DBEdit2: TDBEdit
    Left = 6
    Top = 59
    Width = 199
    Height = 21
    DataField = 'PSWUSR'
    TabOrder = 1
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object bBtnOk: TBitBtn
    Left = 54
    Top = 163
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 130
    Top = 163
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
  object DBEdit4: TDBEdit
    Left = 6
    Top = 136
    Width = 199
    Height = 21
    DataField = 'NOTES'
    TabOrder = 3
    OnEnter = DBEditEnter
    OnExit = DBEditExit
  end
  object DBCheckBox1: TDBCheckBox
    Left = 6
    Top = 168
    Width = 42
    Height = 17
    Hint = #1056#1072#1079#1088#1077#1096#1080#1090#1100' / '#1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1076#1086#1089#1090#1091#1087
    Alignment = taLeftJustify
    Caption = #1042#1082#1083'.'
    DataField = 'VKL'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 6
    Top = 99
    Width = 199
    Height = 21
    DataField = 'NmKatUsr'
    TabOrder = 2
    OnEnter = DBLookupComboBox1Enter
    OnExit = DBLookupComboBox1Exit
  end
end
