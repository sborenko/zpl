object FormEAPst: TFormEAPst
  Left = 992
  Top = 112
  BorderStyle = bsDialog
  Caption = 'FormEAPst'
  ClientHeight = 172
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 14
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdPst
  end
  object Label2: TLabel
    Left = 98
    Top = 14
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
    FocusControl = dbeShPst
  end
  object Label3: TLabel
    Left = 11
    Top = 40
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbeNmPst
  end
  object Label4: TLabel
    Left = 11
    Top = 104
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label5: TLabel
    Left = 11
    Top = 72
    Width = 30
    Height = 13
    Caption = #1055#1086#1095#1090#1072
  end
  object dbeKdPst: TDBEdit
    Left = 43
    Top = 11
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDPST'
    DataSource = DmMain.dsrcPst
    Enabled = False
    TabOrder = 0
  end
  object dbeShPst: TDBEdit
    Left = 138
    Top = 11
    Width = 82
    Height = 21
    DataField = 'SHPST'
    DataSource = DmMain.dsrcPst
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNmPst: TDBEdit
    Left = 99
    Top = 40
    Width = 217
    Height = 21
    DataField = 'NMPST'
    DataSource = DmMain.dsrcPst
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 99
    Top = 108
    Width = 217
    Height = 21
    DataField = 'NOTES'
    DataSource = DmMain.dsrcPst
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 146
    Top = 140
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 241
    Top = 140
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
  object DBCheckBoxIsPost: TDBCheckBox
    Left = 99
    Top = 72
    Width = 14
    Height = 17
    DataField = 'IS_PST'
    DataSource = DmMain.dsrcPst
    TabOrder = 3
    ValueChecked = 'Y'
    ValueUnchecked = ' '
    OnEnter = DBCheckBoxIsPostEnter
    OnExit = DBCheckBoxIsPostExit
  end
end
