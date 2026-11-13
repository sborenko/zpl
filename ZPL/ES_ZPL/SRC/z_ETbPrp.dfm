object FormEaTblPrp: TFormEaTblPrp
  Left = 491
  Top = 338
  ActiveControl = dbeDtBeg
  BorderStyle = bsDialog
  Caption = 'FormEaTblPrp'
  ClientHeight = 114
  ClientWidth = 253
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
    Left = 89
    Top = 9
    Width = 83
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
    FocusControl = dbeDtBeg
  end
  object LabelPrcInv: TLabel
    Left = 4
    Top = 31
    Width = 91
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090': '#1076#1083#1103' '#1080#1085#1074'.'
    FocusControl = dbePrcInv
  end
  object LabelPrcRest: TLabel
    Left = 153
    Top = 31
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = #1076#1083#1103' '#1074#1089#1077#1093
    FocusControl = dbePrcRest
  end
  object Label4: TLabel
    Left = 4
    Top = 48
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object bBtnOk: TBitBtn
    Left = 98
    Top = 86
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 175
    Top = 86
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object dbeDtBeg: TDBEdit
    Left = 175
    Top = 6
    Width = 75
    Height = 21
    Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1085#1086#1088#1084#1099
    DataField = 'DTBEG'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcInv: TDBEdit
    Left = 97
    Top = 28
    Width = 49
    Height = 21
    Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081' '#1076#1083#1103' '#1080#1085#1074#1072#1083#1080#1076#1086#1074
    DataField = 'PRCINV'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrcRest: TDBEdit
    Left = 201
    Top = 28
    Width = 49
    Height = 21
    DataField = 'PRCREST'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 4
    Top = 61
    Width = 246
    Height = 21
    Hint = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091
    DataField = 'NOTES'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dsrcTmp: TDataSource
    Left = 33
    Top = 2
  end
end
