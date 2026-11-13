object FormVvDates: TFormVvDates
  Left = 444
  Top = 249
  BorderStyle = bsDialog
  Caption = 'FormVvDates'
  ClientHeight = 77
  ClientWidth = 310
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
  object LabelPrompt: TLabel
    Left = 5
    Top = 5
    Width = 215
    Height = 40
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1072#1090#1099' ('#1086#1073#1077' '#1076#1072#1090#1099' '#1074#1082#1083#1102#1095#1080#1090#1077#1083#1100#1085#1086')'
    FocusControl = dbeDtEnd
    WordWrap = True
  end
  object dbeDtBeg: TDBEdit
    Left = 227
    Top = 3
    Width = 80
    Height = 21
    DataField = 'DtBeg'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeDtEnd: TDBEdit
    Left = 227
    Top = 25
    Width = 80
    Height = 21
    DataField = 'DtEnd'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 145
    Top = 50
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 232
    Top = 50
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 3
    Kind = bkCancel
  end
  object cdsTmp: TClientDataSet
    Active = True
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
    Left = 13
    Top = 35
    Data = {
      360000009619E0BD010000001800000002000000000003000000360005447442
      65670400060000000000054474456E6404000600000000000000}
    object cdsTmpDtBeg: TDateField
      FieldName = 'DtBeg'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtEnd: TDateField
      FieldName = 'DtEnd'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 29
    Top = 43
  end
end
