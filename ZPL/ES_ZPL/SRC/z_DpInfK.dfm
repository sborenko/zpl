object FormDopKssInf: TFormDopKssInf
  Left = 439
  Top = 263
  ActiveControl = dbeVedNr
  BorderStyle = bsDialog
  Caption = 'FormDopKssInf'
  ClientHeight = 96
  ClientWidth = 387
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
    Left = 3
    Top = 5
    Width = 169
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1100#1090#1077' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 210
    Top = 27
    Width = 84
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
  end
  object LabelKssVedNr: TLabel
    Left = 214
    Top = 5
    Width = 131
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1086#1084#1077#1088' '#1087#1077#1088#1074#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
  end
  object Label4: TLabel
    Left = 3
    Top = 32
    Width = 196
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1079#1072#1075#1086#1083#1086#1074#1086#1082') '#1074#1077#1076#1086#1084#1086#1089#1090#1080
  end
  object bBtnOk: TBitBtn
    Left = 223
    Top = 69
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 310
    Top = 69
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object dbeVedDt: TDBEdit
    Left = 300
    Top = 24
    Width = 85
    Height = 21
    Hint = 
      #1048#1079' '#1076#1072#1090#1099' '#1080' '#1085#1086#1084#1077#1088#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1080#1084#1103' '#1092#1072#1081#1083#1072' zDDMMYYn.opu, '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1086 +
      #1075#1086' '#1074' '#1073#1072#1085#1082' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1077' '#1074#1084#1077#1089#1090#1077' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
    DataField = 'VedDt'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbeVedDtEnter
    OnExit = dbeVedDtExit
  end
  object dbeVedNr: TDBEdit
    Left = 352
    Top = 2
    Width = 33
    Height = 21
    Hint = 
      #1048#1079' '#1076#1072#1090#1099' '#1080' '#1085#1086#1084#1077#1088#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1080#1084#1103' '#1092#1072#1081#1083#1072' zDDMMYYn.opu, '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1086 +
      #1075#1086' '#1074' '#1073#1072#1085#1082' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1077' '#1074#1084#1077#1089#1090#1077' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
    DataField = 'VedNr'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnEnter = dbeVedDtEnter
    OnExit = dbeVedDtExit
  end
  object dbeVedNm: TDBEdit
    Left = 3
    Top = 46
    Width = 382
    Height = 21
    Hint = #1042#1087#1077#1095#1072#1090#1099#1074#1072#1077#1090#1089#1103' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1074' '#1087#1086#1083#1077' "'#1053#1072#1079#1074#1072' '#1087#1083#1072#1090#1077#1078#1091'"'
    DataField = 'VedNm'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeVedDtEnter
    OnExit = dbeVedDtExit
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VedNr'
        DataType = ftSmallint
      end
      item
        Name = 'VedDt'
        DataType = ftDate
      end
      item
        Name = 'VedNm'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 102
    Top = 24
    object cdsTmpVedNr: TSmallintField
      FieldName = 'VedNr'
    end
    object cdsTmpVedDt: TDateField
      FieldName = 'VedDt'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsTmpVedNm: TStringField
      FieldName = 'VedNm'
      Size = 45
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 118
    Top = 32
  end
end
