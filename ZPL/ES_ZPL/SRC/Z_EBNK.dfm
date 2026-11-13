object FormEABnk: TFormEABnk
  Left = 503
  Top = 252
  Width = 213
  Height = 154
  ActiveControl = dbeShBnk
  Caption = 'FormEABnk'
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
  object Label1: TLabel
    Left = 3
    Top = 8
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdBnk
  end
  object Label2: TLabel
    Left = 74
    Top = 8
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
    FocusControl = dbeShBnk
  end
  object Label3: TLabel
    Left = 3
    Top = 26
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbeNmBnk
  end
  object Label4: TLabel
    Left = 3
    Top = 62
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
    FocusControl = dbeNotes
  end
  object dbeKdBnk: TDBEdit
    Left = 27
    Top = 5
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDBNK'
    ReadOnly = True
    TabOrder = 0
  end
  object dbeShBnk: TDBEdit
    Left = 107
    Top = 5
    Width = 94
    Height = 21
    DataField = 'SHBNK'
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNmBnk: TDBEdit
    Left = 3
    Top = 40
    Width = 200
    Height = 21
    DataField = 'NMBNK'
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 3
    Top = 76
    Width = 200
    Height = 21
    DataField = 'NOTES'
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 48
    Top = 100
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 128
    Top = 100
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
end
