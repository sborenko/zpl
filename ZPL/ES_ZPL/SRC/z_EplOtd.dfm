object FormEPlOtd: TFormEPlOtd
  Left = 362
  Top = 494
  BorderStyle = bsDialog
  Caption = 'FormEPlOtd'
  ClientHeight = 103
  ClientWidth = 236
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
    Left = 5
    Top = 11
    Width = 122
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1085#1072#1095#1072#1083#1072' '#1075#1088#1072#1076#1072#1094#1080#1080
    FocusControl = dbeFrom
  end
  object Label2: TLabel
    Left = 5
    Top = 32
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeFrom: TDBEdit
    Left = 144
    Top = 8
    Width = 89
    Height = 21
    DataField = 'P_FROM'
    DataSource = FormRepPlOtd.dsrcGrad
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 5
    Top = 48
    Width = 228
    Height = 21
    DataField = 'NOTES'
    DataSource = FormRepPlOtd.dsrcGrad
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 64
    Top = 74
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 158
    Top = 74
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
