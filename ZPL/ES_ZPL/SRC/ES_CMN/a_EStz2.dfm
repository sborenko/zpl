object FormEAStz2: TFormEAStz2
  Left = 459
  Top = 290
  ActiveControl = dbeNmStz2
  BorderStyle = bsDialog
  Caption = 'FormEAStz2'
  ClientHeight = 95
  ClientWidth = 361
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
    Left = 6
    Top = 71
    Width = 30
    Height = 13
    Caption = 'KdStZ'
    FocusControl = dbeKdStZ
    Visible = False
  end
  object Label2: TLabel
    Left = 6
    Top = 7
    Width = 28
    Height = 13
    Caption = #1050#1045#1050#1042
    FocusControl = dbeShStZ
  end
  object Label3: TLabel
    Left = 86
    Top = 71
    Width = 34
    Height = 13
    Caption = 'KdStz2'
    FocusControl = dbeKdStz2
    Visible = False
  end
  object Label4: TLabel
    Left = 248
    Top = 7
    Width = 73
    Height = 13
    Caption = #1064#1080#1092#1088' '#1088#1072#1089#1093#1086#1076#1072
    FocusControl = dbeShStz2
  end
  object Label5: TLabel
    Left = 6
    Top = 24
    Width = 120
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1072
    FocusControl = dbeNmStz2
  end
  object dbeKdStZ: TDBEdit
    Left = 41
    Top = 68
    Width = 41
    Height = 21
    TabStop = False
    DataField = 'KDSTZ'
    DataSource = FormStz_2.dsrcStz2
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object dbeShStZ: TDBEdit
    Left = 38
    Top = 4
    Width = 57
    Height = 21
    Hint = #1050#1045#1050#1042', '#1082#1086#1090#1086#1088#1086#1084#1091' '#1076#1086#1073#1072#1074#1083#1103#1102#1090#1089#1103' '#1088#1072#1089#1093#1086#1076#1099
    TabStop = False
    Color = clBtnFace
    DataField = 'SHSTZ'
    DataSource = FormStz_2.dsrcStz2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object dbeKdStz2: TDBEdit
    Left = 126
    Top = 68
    Width = 41
    Height = 21
    TabStop = False
    DataField = 'KDSTZ2'
    DataSource = FormStz_2.dsrcStz2
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object dbeShStz2: TDBEdit
    Left = 328
    Top = 4
    Width = 28
    Height = 21
    Hint = #1052#1072#1083#1072#1103' '#1088#1091#1089#1089#1082#1072#1103' ('#1091#1082#1088#1072#1080#1085#1089#1082#1072#1103') '#1073#1091#1082#1074#1072'. '#1055#1086#1076#1089#1090#1072#1074#1083#1103#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    TabStop = False
    Color = clBtnFace
    DataField = 'SHSTZ2'
    DataSource = FormStz_2.dsrcStz2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object dbeNmStz2: TDBEdit
    Left = 6
    Top = 40
    Width = 350
    Height = 21
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1085#1086#1081' '#1089#1090#1072#1090#1100#1080
    DataField = 'NMSTZ2'
    DataSource = FormStz_2.dsrcStz2
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
  object bBtnOk: TBitBtn
    Left = 190
    Top = 65
    Width = 75
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1044
    Caption = #1042#1074#1086#1076
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 281
    Top = 65
    Width = 75
    Height = 25
    Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1074#1074#1086#1076#1072
    Caption = #1054#1090#1082#1072#1079
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Kind = bkCancel
  end
end
