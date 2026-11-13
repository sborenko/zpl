object FormGtDate: TFormGtDate
  Left = 444
  Top = 249
  BorderStyle = bsDialog
  Caption = 'FormGtDate'
  ClientHeight = 58
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
    Left = 19
    Top = 0
    Width = 198
    Height = 26
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1089' '#1076#1072#1090#1072#1084#1080' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103' '#1084#1077#1085#1100#1096#1077' '
    WordWrap = True
  end
  object dbeTDate: TDBEdit
    Left = 227
    Top = 3
    Width = 78
    Height = 21
    DataField = 'TDate'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 145
    Top = 29
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 232
    Top = 29
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
        Name = 'TDate'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 13
    Top = 19
    object cdsTmpTDate: TDateField
      FieldName = 'TDate'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 29
    Top = 27
  end
end
