object FormGtDates: TFormGtDates
  Left = 545
  Top = 451
  BorderStyle = bsDialog
  Caption = 'FormGtDates'
  ClientHeight = 113
  ClientWidth = 594
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
    Left = 344
    Top = 3
    Width = 215
    Height = 13
    Caption = #1042#1099#1073#1080#1088#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1102' '#1085' '#1072' :'
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 347
    Top = 24
    Width = 78
    Height = 21
    DataField = 'StartDtPere'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object panelMain: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 113
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      329
      113)
    object Label3: TLabel
      Left = 11
      Top = 14
      Width = 219
      Height = 13
      Caption = #1042#1099#1073#1080#1088#1072#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1087#1088#1080#1085#1103#1090#1099#1093' '#1076#1086' ('#1074#1082#1083'.):'
    end
    object Label2: TLabel
      Left = 16
      Top = 36
      Width = 210
      Height = 31
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1080' '#1085#1077' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1074#1086#1086#1073#1097#1077' '#1080#1083#1080' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1087#1086#1089#1083#1077':'
      FocusControl = dbeDtUvln
      WordWrap = True
    end
    object dbeDtPrm: TDBEdit
      Left = 243
      Top = 11
      Width = 76
      Height = 21
      DataField = 'DtPrm'
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
    object dbeDtUvln: TDBEdit
      Left = 243
      Top = 41
      Width = 76
      Height = 21
      DataField = 'DtUvln'
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
      Left = 153
      Top = 81
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1042#1074#1086#1076
      TabOrder = 2
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 240
      Top = 81
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 3
      Kind = bkCancel
    end
  end
  object cdsTmp: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DtPrm'
        DataType = ftDate
      end
      item
        Name = 'DtUvln'
        DataType = ftDate
      end
      item
        Name = 'StartDtPere'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 485
    Top = 27
    Data = {
      4B0000009619E0BD0100000018000000030000000000030000004B0005447450
      726D040006000000000006447455766C6E04000600000000000B537461727444
      745065726504000600000000000000}
    object cdsTmpDtPrm: TDateField
      FieldName = 'DtPrm'
      OnSetText = cdsTmpDtSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpDtUvln: TDateField
      FieldName = 'DtUvln'
      OnSetText = cdsTmpDtSetText
      EditMask = '!99/99/9999;1;_'
    end
    object cdsTmpStartDtPere: TDateField
      FieldName = 'StartDtPere'
      OnSetText = cdsTmpDtSetText
      EditMask = '!99/99/9999;1;_'
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 501
    Top = 35
  end
end
