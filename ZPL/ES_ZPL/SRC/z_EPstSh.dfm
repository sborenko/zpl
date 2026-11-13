object FormEaPstShk: TFormEaPstShk
  Left = 389
  Top = 508
  ActiveControl = dbeSmFrom
  BorderStyle = bsDialog
  Caption = 'FormEaPstShk'
  ClientHeight = 154
  ClientWidth = 283
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
    Left = 151
    Top = 7
    Width = 55
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
    FocusControl = dbeDtBeg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 130
    Width = 28
    Height = 13
    Caption = 'KdPst'
    FocusControl = dbeKdPst
    Visible = False
  end
  object Label3: TLabel
    Left = 4
    Top = 32
    Width = 198
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1089#1091#1084#1084#1099':...................................'
    FocusControl = dbeSmFrom
  end
  object Label4: TLabel
    Left = 4
    Top = 160
    Width = 198
    Height = 13
    Caption = #1044#1086' '#1089#1091#1084#1084#1099' ('#1074#1082#1083#1102#1095#1072#1103'):..............................'
    FocusControl = dbeSmToInc
    Visible = False
  end
  object Label5: TLabel
    Left = 4
    Top = 56
    Width = 206
    Height = 13
    Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1072#1103' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103':.....................'
    FocusControl = dbeSmConst
  end
  object Label6: TLabel
    Left = 4
    Top = 80
    Width = 210
    Height = 13
    Caption = #1055#1083#1102#1089' '#1087#1088#1086#1094#1077#1085#1090':.............................................'
    FocusControl = dbePrc
  end
  object Label7: TLabel
    Left = 4
    Top = 184
    Width = 209
    Height = 13
    Caption = #1053#1072' '#1089#1091#1084#1084#1091', '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1091#1102':.........................'
    FocusControl = dbeSmBolee
    Visible = False
  end
  object Label8: TLabel
    Left = 4
    Top = 104
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object Label9: TLabel
    Left = 212
    Top = 31
    Width = 9
    Height = 16
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 204
    Top = 160
    Width = 17
    Height = 16
    Caption = '<='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object LabelShPst: TLabel
    Left = 8
    Top = 7
    Width = 80
    Height = 16
    Caption = 'LabelShPst'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbeDtBeg: TDBEdit
    Left = 209
    Top = 4
    Width = 71
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'DTBEG'
    DataSource = DmMain.dsrcPstShk
    Enabled = False
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeKdPst: TDBEdit
    Left = 80
    Top = 127
    Width = 33
    Height = 21
    DataField = 'KDPST'
    DataSource = DmMain.dsrcPstShk
    Enabled = False
    TabOrder = 9
    Visible = False
  end
  object dbeSmFrom: TDBEdit
    Left = 225
    Top = 29
    Width = 55
    Height = 21
    DataField = 'SMFROM'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmToInc: TDBEdit
    Left = 225
    Top = 157
    Width = 55
    Height = 21
    DataField = 'SMTOINC'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 2
    Visible = False
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmConst: TDBEdit
    Left = 225
    Top = 53
    Width = 55
    Height = 21
    DataField = 'SMCONST'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbePrc: TDBEdit
    Left = 225
    Top = 77
    Width = 55
    Height = 21
    DataField = 'PRC'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeSmBolee: TDBEdit
    Left = 225
    Top = 181
    Width = 55
    Height = 21
    DataField = 'ONSMBOLEE'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 5
    Visible = False
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 76
    Top = 101
    Width = 204
    Height = 21
    DataField = 'NOTES'
    DataSource = DmMain.dsrcPstShk
    TabOrder = 6
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 124
    Top = 125
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 7
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 205
    Top = 125
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
end
