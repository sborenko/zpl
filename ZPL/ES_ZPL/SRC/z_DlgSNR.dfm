object FormDlgSNR: TFormDlgSNR
  Left = 370
  Top = 489
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1072#1090' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1083#1103' "'#1057#1087#1077#1094#1047#1072#1087#1080#1089#1077#1081'"'
  ClientHeight = 127
  ClientWidth = 337
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
  DesignSize = (
    337
    127)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 44
    Width = 177
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072
    FocusControl = bdeDtBeg
  end
  object Label2: TLabel
    Left = 27
    Top = 68
    Width = 195
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072
    FocusControl = dbeDtEnd
  end
  object Label3: TLabel
    Left = 4
    Top = 8
    Width = 331
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1042#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1072#1082#1077#1090#1072' "'#1057#1087#1077#1094#1047#1072#1087#1080#1089#1077#1081'" '#1074' '#1090#1072#1073#1083#1080#1094#1091' "'#1053#1072#1076#1073#1072#1074#1082#1080'" '#1073#1091#1076#1091#1090' '#1087#1086 +
      #1076#1089#1090#1072#1074#1083#1077#1085#1099' '#1074#1074#1077#1076#1105#1085#1085#1099#1077' '#1042#1072#1084#1080' '#1076#1072#1090#1099' '#1085#1072#1095#1072#1083#1072' '#1080' '#1086#1082#1086#1085#1095#1072#1085#1080#1103'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object bdeDtBeg: TDBEdit
    Left = 242
    Top = 41
    Width = 90
    Height = 21
    DataField = 'DtBeg'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = bdeDtBegEnter
    OnExit = bdeDtBegExit
  end
  object dbeDtEnd: TDBEdit
    Left = 242
    Top = 65
    Width = 90
    Height = 21
    DataField = 'DtEnd'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = bdeDtBegEnter
    OnExit = bdeDtBegExit
  end
  object bBtnOk: TBitBtn
    Left = 162
    Top = 98
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 257
    Top = 98
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtBeg'
        DataType = ftDate
      end
      item
        Name = 'DtEnd'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 80
    object cdsTmpDtBeg: TDateField
      FieldName = 'DtBeg'
      OnSetText = DatFldSetText
      OnValidate = cdsTmpDtBegValidate
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtEnd: TDateField
      FieldName = 'DtEnd'
      OnSetText = DatFldSetText
      OnValidate = cdsTmpDtEndValidate
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 8
    Top = 96
  end
end
