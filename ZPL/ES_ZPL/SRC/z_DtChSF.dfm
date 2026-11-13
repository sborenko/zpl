object FormDtChStFltr: TFormDtChStFltr
  Left = 410
  Top = 392
  BorderStyle = bsDialog
  Caption = 'FormDtChStFltr'
  ClientHeight = 77
  ClientWidth = 360
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
    360
    77)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 6
    Width = 164
    Height = 13
    Caption = #1042#1074#1077#1076#1090#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072
    FocusControl = dbeFText
  end
  object dbeFText: TDBEdit
    Left = 3
    Top = 22
    Width = 407
    Height = 21
    DataField = 'FText'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object bBtnOk: TBitBtn
    Left = 171
    Top = 48
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 282
    Top = 48
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'FText'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 24
    object cdsTmpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsTmpFText: TStringField
      FieldName = 'FText'
      Size = 250
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 112
    Top = 40
  end
end
