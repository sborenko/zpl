object FormMyDbg: TFormMyDbg
  Left = 395
  Top = 237
  Width = 385
  Height = 241
  ActiveControl = DBEdit1
  BorderIcons = [biSystemMenu]
  Caption = 'FormMyDbg'
  Color = clBtnFace
  Constraints.MaxHeight = 241
  Constraints.MaxWidth = 475
  Constraints.MinHeight = 241
  Constraints.MinWidth = 385
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    377
    214)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 27
    Width = 368
    Height = 13
    Caption = 
      #1057#1102#1076#1072' '#1074#1074#1077#1089#1090#1080' '#1083#1102#1073#1086#1077' '#1095#1080#1089#1083#1086' ('#1085#1077' '#1073#1086#1083#1077#1077' 2 599 999 999.99) '#1080' '#1085#1072#1078#1072#1090#1100' "'#1044#1072 +
      #1083#1077#1077'"'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 5
    Top = 68
    Width = 238
    Height = 13
    Caption = #1057#1102#1076#1072' '#1074#1099#1074#1086#1076#1080#1090#1089#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1092#1091#1085#1082#1094#1080#1080' SumPropis'
  end
  object Label3: TLabel
    Left = 5
    Top = 140
    Width = 212
    Height = 13
    Caption = #1040' '#1089#1102#1076#1072' - '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1092#1091#1085#1082#1094#1080#1080' UkrSumPropis'
  end
  object Label4: TLabel
    Left = 5
    Top = 8
    Width = 317
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1073#1086#1090#1099' '#1092#1091#1085#1082#1094#1080#1081' SumPropis '#1080' UkrSumPropis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 101
    Top = 43
    Width = 134
    Height = 21
    DataField = 'MyFld'
    DataSource = dsrcMyDbg
    TabOrder = 0
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object MemoRus: TMemo
    Left = 5
    Top = 84
    Width = 369
    Height = 53
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'MemoRus')
    ReadOnly = True
    TabOrder = 2
  end
  object MemoUkr: TMemo
    Left = 5
    Top = 156
    Width = 369
    Height = 53
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'MemoUkr')
    ReadOnly = True
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 293
    Top = 43
    Width = 75
    Height = 25
    Caption = #1044#1072#1083#1077#1077
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object cdsMyDbg: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MyFld'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 85
    Top = 87
    Data = {
      280000009619E0BD0100000018000000010000000000030000002800054D7946
      6C6408000400000000000000}
    object cdsMyDbgMyFld: TFloatField
      FieldName = 'MyFld'
    end
  end
  object dsrcMyDbg: TDataSource
    DataSet = cdsMyDbg
    Left = 101
    Top = 103
  end
end
