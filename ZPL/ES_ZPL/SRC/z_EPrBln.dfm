object FormEAPrBln: TFormEAPrBln
  Left = 613
  Top = 324
  ActiveControl = dbeNmPrBln
  BorderStyle = bsDialog
  Caption = 'FormEAPrBln'
  ClientHeight = 131
  ClientWidth = 267
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
    Left = 10
    Top = 7
    Width = 64
    Height = 13
    Caption = #1050#1086#1076#1055#1088#1080#1095#1080#1085#1099
    FocusControl = dbePrBln
  end
  object Label2: TLabel
    Left = 83
    Top = 9
    Width = 151
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1085#1077#1090#1088#1091#1076#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080
    FocusControl = dbeNmPrBln
  end
  object Label3: TLabel
    Left = 8
    Top = 47
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbePrBln: TDBEdit
    Left = 10
    Top = 23
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'PRBLN'
    DataSource = FormPrBln.dsrcPrBln
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeNmPrBln: TDBEdit
    Left = 40
    Top = 23
    Width = 219
    Height = 21
    DataField = 'NMPRBLN'
    DataSource = FormPrBln.dsrcPrBln
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeDtEnter
    OnExit = dbeDtExit
  end
  object dbeNotes: TDBEdit
    Left = 8
    Top = 63
    Width = 252
    Height = 21
    DataField = 'NOTES'
    DataSource = FormPrBln.dsrcPrBln
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeDtEnter
    OnExit = dbeDtExit
  end
  object bBtnOk: TBitBtn
    Left = 99
    Top = 97
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    OnClick = bBtnOkClick
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 179
    Top = 97
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
end
