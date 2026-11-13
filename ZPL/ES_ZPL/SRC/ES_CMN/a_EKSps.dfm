object FormEAKdSps: TFormEAKdSps
  Left = 446
  Top = 307
  BorderStyle = bsDialog
  Caption = 'FormEAKdSps'
  ClientHeight = 129
  ClientWidth = 293
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
    Left = 1
    Top = 8
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdSps
  end
  object Label2: TLabel
    Left = 161
    Top = 8
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
    FocusControl = dbeShSps
  end
  object Label3: TLabel
    Left = 1
    Top = 26
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbeNmSps
  end
  object Label4: TLabel
    Left = 1
    Top = 64
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeKdSps: TDBEdit
    Left = 27
    Top = 5
    Width = 37
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDSPS'
    DataSource = Form_Dm.dsrcKdSps
    ReadOnly = True
    TabOrder = 0
    OnEnter = dbeKdSpsEnter
    OnExit = dbeExit
  end
  object dbeShSps: TDBEdit
    Left = 195
    Top = 5
    Width = 97
    Height = 21
    DataField = 'SHSPS'
    DataSource = Form_Dm.dsrcKdSps
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNmSps: TDBEdit
    Left = 1
    Top = 41
    Width = 291
    Height = 21
    DataField = 'NMSPS'
    DataSource = Form_Dm.dsrcKdSps
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 1
    Top = 79
    Width = 291
    Height = 21
    DataField = 'NOTES'
    DataSource = Form_Dm.dsrcKdSps
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 126
    Top = 103
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 217
    Top = 103
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
end
