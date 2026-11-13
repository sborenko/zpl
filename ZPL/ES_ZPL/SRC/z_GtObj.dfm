object FormGetObj: TFormGetObj
  Left = 395
  Top = 356
  BorderStyle = bsDialog
  Caption = 'FormGetObj'
  ClientHeight = 63
  ClientWidth = 232
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
    Top = 3
    Width = 158
    Height = 30
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103', '#1085#1072' '#1082#1086#1090#1086#1088#1086#1077' '#1085#1091#1078#1085#1086' '#1087#1077#1088#1077#1081#1090#1080
    FocusControl = dbeKdObj
    WordWrap = True
  end
  object dbeKdObj: TDBEdit
    Left = 170
    Top = 8
    Width = 57
    Height = 21
    DataField = 'KdObj'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    OnEnter = dbeKdObjEnter
    OnExit = dbeKdObjExit
  end
  object bBtnOk: TBitBtn
    Left = 72
    Top = 36
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 152
    Top = 36
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KdObj'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 8
    object cdsTmpKdObj: TSmallintField
      FieldName = 'KdObj'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 16
    Top = 24
  end
  object qryTmp: TQuery
    Left = 48
    Top = 8
  end
end
