object FormEAISP: TFormEAISP
  Left = 494
  Top = 305
  Width = 444
  Height = 248
  Caption = 'FormEAISP'
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
    Left = 18
    Top = 45
    Width = 38
    Height = 13
    Caption = #1057#1083#1091#1078#1073#1072
    FocusControl = dbeNmSlg
  end
  object Label3: TLabel
    Left = 18
    Top = 89
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
    FocusControl = dbeAdres
  end
  object Label4: TLabel
    Left = 18
    Top = 134
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label5: TLabel
    Left = 18
    Top = 6
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object dbeNmSlg: TDBEdit
    Left = 16
    Top = 61
    Width = 400
    Height = 21
    DataField = 'NMSLG'
    DataSource = FormIspSlg.dsrcIsp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeKdSlgEnter
    OnExit = dbeKdSlgExit
  end
  object dbeAdres: TDBEdit
    Left = 16
    Top = 105
    Width = 400
    Height = 21
    DataField = 'ADRES'
    DataSource = FormIspSlg.dsrcIsp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeKdSlgEnter
    OnExit = dbeKdSlgExit
  end
  object dbeNotes: TDBEdit
    Left = 16
    Top = 150
    Width = 400
    Height = 21
    DataField = 'NOTES'
    DataSource = FormIspSlg.dsrcIsp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbeKdSlgEnter
    OnExit = dbeKdSlgExit
  end
  object BitBtn1: TBitBtn
    Left = 253
    Top = 177
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 341
    Top = 177
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object dbeKdSlg: TDBEdit
    Left = 16
    Top = 22
    Width = 63
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'KDSLG'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
