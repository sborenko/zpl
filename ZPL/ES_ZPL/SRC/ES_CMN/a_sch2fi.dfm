object FormSchToFind: TFormSchToFind
  Left = 570
  Top = 306
  BorderStyle = bsDialog
  Caption = 'FormSchToFind'
  ClientHeight = 181
  ClientWidth = 292
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
    Left = 8
    Top = 8
    Width = 83
    Height = 13
    Caption = 'C'#1095#1105#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
    FocusControl = dbeSch_17
  end
  object Label2: TLabel
    Left = 10
    Top = 34
    Width = 167
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1095#1105#1090#1072' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
    FocusControl = dbeNmSch
  end
  object dbeSch_17: TDBEdit
    Left = 200
    Top = 7
    Width = 88
    Height = 21
    DataField = 'sch_17'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dbeSch_17Enter
    OnExit = dbeSch_17Exit
  end
  object bBtnOk: TBitBtn
    Left = 129
    Top = 139
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 212
    Top = 139
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object dbeNmSch: TDBEdit
    Left = 184
    Top = 31
    Width = 104
    Height = 21
    DataField = 'nmSch'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeSch_17Enter
    OnExit = dbeSch_17Exit
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 58
    Width = 277
    Height = 75
    Caption = #1057#1087#1086#1089#1086#1073' '#1087#1086#1080#1089#1082#1072' '#1089#1095#1077#1090#1072
    TabOrder = 2
    object rBtnAny: TRadioButton
      Left = 8
      Top = 21
      Width = 257
      Height = 17
      Caption = '- '#1087#1086' '#1074#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1074' '#1083#1102#1073#1086#1084' '#1084#1077#1089#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rBtnStart: TRadioButton
      Left = 8
      Top = 45
      Width = 252
      Height = 17
      Caption = '- '#1087#1086' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1102' '#1086#1090' '#1085#1072#1095#1072#1083#1072' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
      TabOrder = 1
    end
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'sch_17'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'rbnStart'
        DataType = ftBoolean
      end
      item
        Name = 'rbtnAny'
        DataType = ftBoolean
      end
      item
        Name = 'nmSch'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 136
    object cdsTmpsch_17: TStringField
      FieldName = 'sch_17'
    end
    object cdsTmprbtnStart: TBooleanField
      FieldName = 'rbnStart'
    end
    object cdsTmprbtnAny: TBooleanField
      FieldName = 'rbtnAny'
    end
    object cdsTmpnmSch: TStringField
      FieldName = 'nmSch'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 32
    Top = 136
  end
end
