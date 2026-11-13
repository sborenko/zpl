object FormEAInvDocs: TFormEAInvDocs
  Left = 369
  Top = 267
  BorderStyle = bsDialog
  Caption = 'FormEAInvDocs'
  ClientHeight = 129
  ClientWidth = 316
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
  object Label2: TLabel
    Left = 8
    Top = 6
    Width = 107
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    FocusControl = dbeNmDoc
  end
  object Label3: TLabel
    Left = 227
    Top = 6
    Width = 69
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082'-'#1090#1072
    FocusControl = dbeNrDoc
  end
  object Label4: TLabel
    Left = 8
    Top = 47
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    FocusControl = dbeDtBeg
  end
  object Label5: TLabel
    Left = 168
    Top = 47
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
    FocusControl = dbeDtEnd
  end
  object Label6: TLabel
    Left = 8
    Top = 64
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeNmDoc: TDBEdit
    Left = 8
    Top = 20
    Width = 217
    Height = 21
    DataField = 'NMDOC'
    DataSource = FormInvDocs.dsrcDocs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNrDoc: TDBEdit
    Left = 227
    Top = 20
    Width = 85
    Height = 21
    DataField = 'NRDOC'
    DataSource = FormInvDocs.dsrcDocs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtBeg: TDBEdit
    Left = 78
    Top = 44
    Width = 78
    Height = 21
    Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    DataField = 'DTBEG'
    DataSource = FormInvDocs.dsrcDocs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtEnd: TDBEdit
    Left = 234
    Top = 44
    Width = 78
    Height = 21
    Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    DataField = 'DTEND'
    DataSource = FormInvDocs.dsrcDocs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 8
    Top = 78
    Width = 304
    Height = 21
    DataField = 'NOTES'
    DataSource = FormInvDocs.dsrcDocs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 136
    Top = 102
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 237
    Top = 102
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
end
