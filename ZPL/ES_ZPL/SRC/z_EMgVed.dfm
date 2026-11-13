object FormEAMegVed: TFormEAMegVed
  Left = 356
  Top = 373
  BorderStyle = bsDialog
  Caption = 'FormEAMegVed'
  ClientHeight = 231
  ClientWidth = 322
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
  object Label4: TLabel
    Left = 6
    Top = 183
    Width = 42
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095'.'
    FocusControl = dbeNotes
  end
  object dbeNotes: TDBEdit
    Left = 56
    Top = 180
    Width = 262
    Height = 21
    DataField = 'NOTES'
    DataSource = FormMegVed.dsrcVed
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 158
    Top = 204
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 243
    Top = 204
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object PanelBnk: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 89
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label1: TLabel
      Left = 71
      Top = 22
      Width = 91
      Height = 13
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1085#1086#1084#1077#1088
      FocusControl = dbePrtVedNr
    end
    object Label2: TLabel
      Left = 230
      Top = 22
      Width = 11
      Height = 13
      Caption = #1086#1090
      FocusControl = dbePrtVedDate
    end
    object Label3: TLabel
      Left = 6
      Top = 34
      Width = 112
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    end
    object Label5: TLabel
      Left = 49
      Top = 4
      Width = 218
      Height = 13
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' "'#1073#1072#1085#1082#1086#1074#1089#1082#1086#1081'" '#1095#1072#1089#1090#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    end
    object dbePrtVedNr: TDBEdit
      Left = 172
      Top = 19
      Width = 37
      Height = 21
      DataField = 'BNKNRPRDF'
      DataSource = FormMegVed.dsrcVed
      TabOrder = 0
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbePrtVedDate: TDBEdit
      Left = 246
      Top = 19
      Width = 70
      Height = 21
      DataField = 'BNKDTPRDF'
      DataSource = FormMegVed.dsrcVed
      MaxLength = 10
      TabOrder = 1
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbmVedHead: TDBMemo
      Left = 6
      Top = 50
      Width = 310
      Height = 34
      DataField = 'BNKNMPRDF'
      DataSource = FormMegVed.dsrcVed
      MaxLength = 253
      TabOrder = 2
      OnEnter = dbmVedHeadEnter
      OnExit = dbmVedHeadExit
    end
  end
  object PanelKss: TPanel
    Left = 0
    Top = 89
    Width = 322
    Height = 89
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Label6: TLabel
      Left = 71
      Top = 22
      Width = 91
      Height = 13
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1085#1086#1084#1077#1088
      FocusControl = DBEdit1
    end
    object Label7: TLabel
      Left = 230
      Top = 22
      Width = 11
      Height = 13
      Caption = #1086#1090
      FocusControl = DBEdit2
    end
    object Label8: TLabel
      Left = 6
      Top = 34
      Width = 112
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    end
    object Label9: TLabel
      Left = 49
      Top = 4
      Width = 206
      Height = 13
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' "'#1082#1072#1089#1089#1086#1074#1086#1081'" '#1095#1072#1089#1090#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    end
    object DBEdit1: TDBEdit
      Left = 172
      Top = 19
      Width = 37
      Height = 21
      DataField = 'KSSVEDNR'
      DataSource = FormMegVed.dsrcVed
      TabOrder = 0
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object DBEdit2: TDBEdit
      Left = 246
      Top = 19
      Width = 70
      Height = 21
      DataField = 'KSSVEDDT'
      DataSource = FormMegVed.dsrcVed
      MaxLength = 10
      TabOrder = 1
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object DBMemo1: TDBMemo
      Left = 6
      Top = 50
      Width = 310
      Height = 34
      DataField = 'KSSVEDNM'
      DataSource = FormMegVed.dsrcVed
      MaxLength = 253
      TabOrder = 2
      OnEnter = dbmVedHeadEnter
      OnExit = dbmVedHeadExit
    end
  end
end
