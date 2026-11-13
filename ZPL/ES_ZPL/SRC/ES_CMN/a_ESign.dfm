object FormEASign: TFormEASign
  Left = 283
  Top = 161
  BorderStyle = bsDialog
  Caption = 'FormEASign'
  ClientHeight = 275
  ClientWidth = 606
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
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
    FocusControl = dbeDtBeg
  end
  object Label2: TLabel
    Left = 8
    Top = 27
    Width = 131
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
    FocusControl = dbeNmRuk
  end
  object Label3: TLabel
    Left = 305
    Top = 27
    Width = 147
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
    FocusControl = dbeFioRuk
  end
  object Label4: TLabel
    Left = 8
    Top = 67
    Width = 131
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    FocusControl = dbeNmBuh
  end
  object Label5: TLabel
    Left = 305
    Top = 67
    Width = 150
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.  '#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    FocusControl = dbeFioBuh
  end
  object Label6: TLabel
    Left = 305
    Top = 187
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label7: TLabel
    Left = 9
    Top = 106
    Width = 154
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1079#1072#1084'.'#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
    FocusControl = dbeNmZamRuk
  end
  object Label8: TLabel
    Left = 9
    Top = 146
    Width = 154
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100' '#1079#1072#1084'.'#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    FocusControl = dbeNmZamBuh
  end
  object Label9: TLabel
    Left = 305
    Top = 106
    Width = 173
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1079#1072#1084'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
    FocusControl = dbeFioZamRuk
  end
  object Label10: TLabel
    Left = 305
    Top = 146
    Width = 173
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.  '#1079#1072#1084'.'#1075#1083'.'#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
    FocusControl = dbeFioZamBuh
  end
  object dbeDtBeg: TDBEdit
    Left = 80
    Top = 5
    Width = 81
    Height = 21
    DataField = 'DTBEG'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNmRuk: TDBEdit
    Left = 8
    Top = 43
    Width = 293
    Height = 21
    DataField = 'NMRUK'
    DataSource = FormSign.dsrcSign
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
  object dbeFioRuk: TDBEdit
    Left = 305
    Top = 43
    Width = 296
    Height = 21
    DataField = 'FIORUK'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNmBuh: TDBEdit
    Left = 8
    Top = 83
    Width = 294
    Height = 21
    DataField = 'NMBUH'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeFioBuh: TDBEdit
    Left = 305
    Top = 83
    Width = 296
    Height = 21
    DataField = 'FIOBUH'
    DataSource = FormSign.dsrcSign
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
  object dbeNotes: TDBEdit
    Left = 304
    Top = 203
    Width = 296
    Height = 21
    DataField = 'NOTES'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 434
    Top = 232
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 10
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 525
    Top = 232
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 11
    Kind = bkCancel
  end
  object dbeNmZamRuk: TDBEdit
    Left = 9
    Top = 122
    Width = 293
    Height = 21
    DataField = 'NMZAMRUK'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNmZamBuh: TDBEdit
    Left = 9
    Top = 162
    Width = 294
    Height = 21
    DataField = 'NMZAMBUH'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeFioZamRuk: TDBEdit
    Left = 305
    Top = 122
    Width = 296
    Height = 21
    DataField = 'FIOZAMRUK'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeFioZamBuh: TDBEdit
    Left = 305
    Top = 162
    Width = 296
    Height = 21
    DataField = 'FIOZAMBUH'
    DataSource = FormSign.dsrcSign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
end
