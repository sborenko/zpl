object FormBnkDopInf: TFormBnkDopInf
  Left = 439
  Top = 263
  BorderStyle = bsDialog
  Caption = 'FormBnkDopInf'
  ClientHeight = 139
  ClientWidth = 389
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
    Left = 10
    Top = 4
    Width = 373
    Height = 13
    Caption = 
      #1042#1074#1077#1076#1080#1090#1077' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080' '#1082' '#1074#1077#1076#1086#1084#1086#1089#1090#1080', '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1086#1081' '#1074' '#1073#1072#1085 +
      #1082
  end
  object Label2: TLabel
    Left = 185
    Top = 46
    Width = 111
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1092#1072#1081#1083#1072
  end
  object Label3: TLabel
    Left = 158
    Top = 69
    Width = 191
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1092#1072#1081#1083#1072', '#1089' '#1082#1086#1090#1086#1088#1099#1084' '#1087#1077#1088#1077#1076#1072#1077#1090#1089#1103
  end
  object Label4: TLabel
    Left = 5
    Top = 75
    Width = 122
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
  end
  object Label5: TLabel
    Left = 5
    Top = 23
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdBnk
  end
  object Label6: TLabel
    Left = 82
    Top = 23
    Width = 25
    Height = 13
    Caption = #1041#1072#1085#1082
    FocusControl = dbeNmBnk
  end
  object bBtnOk: TBitBtn
    Left = 225
    Top = 112
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 5
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 312
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 6
    Kind = bkCancel
  end
  object dbeKdBnk: TDBEdit
    Left = 29
    Top = 20
    Width = 41
    Height = 21
    Hint = #1050#1086#1076' '#1073#1072#1085#1082#1072' '#1080#1079' '#1089#1087#1088'-'#1082#1072' '#1073#1072#1085#1082#1086#1074
    TabStop = False
    Color = clBtnFace
    DataField = 'KdBnk'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
  end
  object dbeNmBnk: TDBEdit
    Left = 112
    Top = 20
    Width = 275
    Height = 21
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
    TabStop = False
    Color = clBtnFace
    DataField = 'NmBnk'
    DataSource = dsrcTmp
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object dbeDtPrdFile: TDBEdit
    Left = 302
    Top = 43
    Width = 85
    Height = 21
    Hint = 
      #1048#1079' '#1076#1072#1090#1099' '#1080' '#1085#1086#1084#1077#1088#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1080#1084#1103' '#1092#1072#1081#1083#1072' zDDMMYYn.opu, '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1086 +
      #1075#1086' '#1074' '#1073#1072#1085#1082' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1077' '#1074#1084#1077#1089#1090#1077' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
    DataField = 'DtPrdFile'
    DataSource = dsrcTmp
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeDtPrdFileEnter
    OnExit = dbeDtPrdFileExit
  end
  object dbeNrPrdFile: TDBEdit
    Left = 354
    Top = 66
    Width = 33
    Height = 21
    Hint = 
      #1048#1079' '#1076#1072#1090#1099' '#1080' '#1085#1086#1084#1077#1088#1072' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1080#1084#1103' '#1092#1072#1081#1083#1072' zDDMMYYn.opu, '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1086 +
      #1075#1086' '#1074' '#1073#1072#1085#1082' '#1085#1072' '#1076#1080#1089#1082#1077#1090#1077' '#1074#1084#1077#1089#1090#1077' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1100#1102
    DataField = 'NrPrdFile'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbeDtPrdFileEnter
    OnExit = dbeDtPrdFileExit
  end
  object dbeNmPrdDoc: TDBEdit
    Left = 5
    Top = 89
    Width = 382
    Height = 21
    Hint = #1042#1087#1077#1095#1072#1090#1099#1074#1072#1077#1090#1089#1103' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1074' '#1087#1086#1083#1077' "'#1053#1072#1079#1074#1072' '#1087#1083#1072#1090#1077#1078#1091'"'
    DataField = 'NmPrdDoc'
    DataSource = dsrcTmp
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnEnter = dbeDtPrdFileEnter
    OnExit = dbeDtPrdFileExit
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdBnk'
        DataType = ftSmallint
      end
      item
        Name = 'NmBnk'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'DtPrdFile'
        DataType = ftDate
      end
      item
        Name = 'NrPrdFile'
        DataType = ftSmallint
      end
      item
        Name = 'NmPrdDoc'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 40
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D00054B6442
      6E6B0200010000000000054E6D426E6B01004900000001000557494454480200
      02002D0009447450726446696C650400060000000000094E7250726446696C65
      0200010000000000084E6D507264446F63010049000000010005574944544802
      0002002D00054E6F7465730100490000000100055749445448020002002D0000
      00}
    object cdsTmpKdBnk: TSmallintField
      FieldName = 'KdBnk'
    end
    object cdsTmpNmBnk: TStringField
      FieldName = 'NmBnk'
      Size = 45
    end
    object cdsTmpDtPrdFile: TDateField
      FieldName = 'DtPrdFile'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsTmpNrPrdFile: TSmallintField
      FieldName = 'NrPrdFile'
    end
    object cdsTmpNmPrdDoc: TStringField
      FieldName = 'NmPrdDoc'
      Size = 45
    end
    object cdsTmpNotes: TStringField
      FieldName = 'Notes'
      Size = 45
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 24
    Top = 48
  end
end
