object formEAPidZV: TformEAPidZV
  Left = 551
  Top = 290
  BorderStyle = bsDialog
  Caption = 'formEAPidZV'
  ClientHeight = 230
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    345
    230)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 11
    Height = 13
    Caption = #8470
    FocusControl = dbeNum
  end
  object Label2: TLabel
    Left = 32
    Top = 48
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeCode
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 137
    Height = 13
    Caption = #1064#1080#1092#1088' '#1087#1088#1080#1095#1080#1085#1099' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
    FocusControl = dbeREASONS
  end
  object Label4: TLabel
    Left = 32
    Top = 136
    Width = 105
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
    FocusControl = dbeName
  end
  object dbeNum: TDBEdit
    Left = 32
    Top = 24
    Width = 100
    Height = 21
    DataField = 'NUM'
    DataSource = FormPidZviln.dsrcPidZv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dbeNumEnter
    OnExit = dbeNumExit
  end
  object dbeCode: TDBEdit
    Left = 32
    Top = 64
    Width = 100
    Height = 21
    DataField = 'CODE'
    DataSource = FormPidZviln.dsrcPidZv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeNumEnter
    OnExit = dbeNumExit
  end
  object dbeREASONS: TDBEdit
    Left = 32
    Top = 112
    Width = 300
    Height = 21
    DataField = 'REASONS'
    DataSource = FormPidZviln.dsrcPidZv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeNumEnter
    OnExit = dbeNumExit
  end
  object dbeName: TDBEdit
    Left = 32
    Top = 152
    Width = 300
    Height = 21
    DataField = 'NAME'
    DataSource = FormPidZviln.dsrcPidZv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbeNumEnter
    OnExit = dbeNumExit
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 191
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 191
    Width = 73
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
    Spacing = 0
  end
  object Table1: TTable
    Left = 288
    Top = 24
  end
end
