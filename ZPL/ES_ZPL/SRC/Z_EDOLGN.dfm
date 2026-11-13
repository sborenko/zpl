object FormEADolgn: TFormEADolgn
  Left = 449
  Top = 285
  ActiveControl = dbeShDolgn
  BorderStyle = bsDialog
  Caption = 'FormEADolgn'
  ClientHeight = 145
  ClientWidth = 313
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
    Left = 2
    Top = 3
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdDolgn
  end
  object Label2: TLabel
    Left = 137
    Top = 3
    Width = 29
    Height = 13
    Caption = #1064#1080#1092#1088
    FocusControl = dbeShDolgn
  end
  object Label3: TLabel
    Left = 2
    Top = 41
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = dbeNmDolgn
  end
  object Label4: TLabel
    Left = 2
    Top = 79
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object dbeKdDolgn: TDBEdit
    Left = 2
    Top = 19
    Width = 45
    Height = 21
    Hint = #1050#1086#1076' '#1087#1088#1080#1089#1074#1072#1080#1074#1072#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    TabStop = False
    Color = clBtnFace
    DataField = 'KDDOLGN'
    DataSource = DmMain.dsrcDolgn
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    OnEnter = dbeKdDolgnEnter
    OnExit = dbeKdDolgnExit
  end
  object dbeShDolgn: TDBEdit
    Left = 137
    Top = 19
    Width = 174
    Height = 21
    Hint = #1064#1080#1092#1088' ('#1082#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077') '#1076#1086#1083#1078#1085#1086#1089#1090#1080
    DataField = 'SHDOLGN'
    DataSource = DmMain.dsrcDolgn
    TabOrder = 1
    OnEnter = dbeKdDolgnEnter
    OnExit = dbeKdDolgnExit
  end
  object dbeNmDolgn: TDBEdit
    Left = 2
    Top = 57
    Width = 309
    Height = 21
    Hint = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
    DataField = 'NMDOLGN'
    DataSource = DmMain.dsrcDolgn
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeKdDolgnEnter
    OnExit = dbeKdDolgnExit
  end
  object dbeNotes: TDBEdit
    Left = 2
    Top = 95
    Width = 309
    Height = 21
    Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1083#1102#1073#1086#1081' '#1090#1077#1082#1089#1090')'
    DataField = 'NOTES'
    DataSource = DmMain.dsrcDolgn
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbeKdDolgnEnter
    OnExit = dbeKdDolgnExit
  end
  object bBtnOk: TBitBtn
    Left = 156
    Top = 118
    Width = 75
    Height = 25
    Hint = #1047#1072#1087#1080#1089#1100' '#1085#1072' '#1076#1080#1089#1082
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 236
    Top = 118
    Width = 75
    Height = 25
    Hint = #1042#1099#1093#1086#1076' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Kind = bkCancel
  end
end
