object FormAEUsrCmp: TFormAEUsrCmp
  Left = 456
  Top = 431
  BorderStyle = bsDialog
  Caption = 'FormAEUsrCmp'
  ClientHeight = 99
  ClientWidth = 257
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
    Left = 4
    Top = 8
    Width = 131
    Height = 13
    Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1099#1081' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
    FocusControl = dbeNmCmp
  end
  object Label2: TLabel
    Left = 4
    Top = 29
    Width = 87
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
    FocusControl = dbeLvl
  end
  object Label3: TLabel
    Left = 4
    Top = 50
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeNmCmp: TDBEdit
    Left = 211
    Top = 5
    Width = 44
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'NMCMP'
    DataSource = Form_UsersNew.dsrcUsrCmp
    ReadOnly = True
    TabOrder = 0
  end
  object dbeLvl: TDBEdit
    Left = 211
    Top = 26
    Width = 44
    Height = 21
    DataField = 'LVL'
    DataSource = Form_UsersNew.dsrcUsrCmp
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeNotes: TDBEdit
    Left = 80
    Top = 47
    Width = 175
    Height = 21
    DataField = 'NOTES'
    DataSource = Form_UsersNew.dsrcUsrCmp
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 71
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 180
    Top = 71
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
end
