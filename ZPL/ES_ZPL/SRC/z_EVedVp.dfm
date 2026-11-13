object FormEAMegVed: TFormEAMegVed
  Left = 640
  Top = 429
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
    Hint = #1051#1102#1073#1086#1081' '#1090#1077#1082#1089#1090' "'#1085#1072' '#1079#1072#1084#1077#1090#1082#1091'"'
    DataField = 'NOTES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
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
      FocusControl = dbeBnkNrPrdF
    end
    object Label2: TLabel
      Left = 230
      Top = 22
      Width = 11
      Height = 13
      Caption = #1086#1090
      FocusControl = dbeBnkDtPrdF
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
    object dbeBnkNrPrdF: TDBEdit
      Left = 172
      Top = 19
      Width = 37
      Height = 21
      Hint = 
        #1048#1079' '#1085#1086#1084#1077#1088#1072' '#1080' '#1076#1072#1090#1099' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1080#1084#1103' '#1092#1072#1081#1083#1072' .opu, '#1087#1077#1088#1077#1076#1072#1074#1072#1077 +
        #1084#1086#1075#1086' '#1074' '#1073#1072#1085#1082
      DataField = 'BNKNRPRDF'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbeBnkDtPrdF: TDBEdit
      Left = 246
      Top = 19
      Width = 70
      Height = 21
      DataField = 'BNKDTPRDF'
      MaxLength = 10
      TabOrder = 1
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbmBnkNmPrdF: TDBMemo
      Left = 6
      Top = 50
      Width = 310
      Height = 34
      DataField = 'BNKNMPRDF'
      MaxLength = 253
      TabOrder = 2
      OnEnter = dbMemoEnter
      OnExit = dbMemoExit
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
      FocusControl = dbeKssVedNr
    end
    object Label7: TLabel
      Left = 214
      Top = 22
      Width = 11
      Height = 13
      Caption = #1086#1090
      FocusControl = dbeKssVedDt
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
    object dbeKssVedNr: TDBEdit
      Left = 172
      Top = 19
      Width = 37
      Height = 21
      Hint = 
        #1053#1086#1084#1077#1088' 1-'#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1074' '#1088#1077#1077#1089#1090#1088#1077' '#1087#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' '#1087#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083 +
        #1077#1085#1080#1103#1084
      DataField = 'KSSVEDNR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbeKssVedDt: TDBEdit
      Left = 232
      Top = 19
      Width = 84
      Height = 21
      DataField = 'KSSVEDDT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      OnEnter = dbEditEnter
      OnExit = dbEditExit
    end
    object dbmKssVedNm: TDBMemo
      Left = 6
      Top = 50
      Width = 310
      Height = 34
      Hint = 
        #1057#1083#1086#1074#1086' "'#1042#1077#1076#1086#1084#1086#1089#1090#1100'" '#1080' '#1085#1086#1084#1077#1088' '#1087#1088#1080#1089#1074#1072#1080#1074#1072#1102#1090#1089#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1086', '#1086#1089#1090#1072#1083#1100#1085#1086#1077' '#1074#1074 +
        #1077#1076#1080#1090#1077
      DataField = 'KSSVEDNM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 253
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnEnter = dbMemoEnter
      OnExit = dbMemoExit
    end
  end
end
