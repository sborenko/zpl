object FormDpZpr: TFormDpZpr
  Left = 369
  Top = 197
  BorderStyle = bsDialog
  Caption = 'FormDpZpr'
  ClientHeight = 181
  ClientWidth = 186
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
    Left = 5
    Top = 7
    Width = 19
    Height = 13
    Caption = #1042#1080#1076
  end
  object sBtnVidN: TSpeedButton
    Left = 168
    Top = 4
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1074#1080#1076#1086#1074
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000E0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7700700000778888870077777777777777007770777777877700770007777888
      7700700000778888870000000008887888007700077778787700770007777888
      770077000777788877007777777777777700}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnVidNClick
  end
  object Label2: TLabel
    Left = 5
    Top = 30
    Width = 88
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1089#1103#1094':'
  end
  object bBtnOk: TBitBtn
    Left = 23
    Top = 82
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 108
    Top = 82
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 45
    Width = 180
    Height = 34
    Caption = ' '#1050#1072#1082' '#1080#1089#1082#1072#1090#1100'... '
    TabOrder = 3
    object rBtnDtPrc: TRadioButton
      Left = 8
      Top = 13
      Width = 73
      Height = 17
      Hint = #1087#1086' '#1087#1086#1083#1102' "'#1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094'"'
      Caption = #1074' '#1084#1077#1089#1103#1094#1077
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
    object rBtnDtZaMG: TRadioButton
      Left = 100
      Top = 13
      Width = 71
      Height = 17
      Hint = #1087#1086' '#1087#1086#1083#1102' "'#1047#1072#1052#1077#1089#1103#1094#1043#1086#1076'"'
      Caption = #1079#1072' '#1084#1077#1089#1103#1094
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object dbeVidN: TDBEdit
    Left = 34
    Top = 4
    Width = 43
    Height = 21
    DataField = 'VidN'
    DataSource = dsrcTmp
    ReadOnly = True
    TabOrder = 0
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeShVidN: TDBEdit
    Left = 77
    Top = 4
    Width = 90
    Height = 21
    TabStop = False
    DataField = 'ShVidN'
    DataSource = dsrcTmp
    ReadOnly = True
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object DBComboDtMes: TDBComboBox
    Left = 112
    Top = 27
    Width = 71
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1084#1077#1089#1103#1094#1072
    Style = csDropDownList
    DataField = 'DtMes'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 13
    Items.Strings = (
      '01-2003'
      '02-2003'
      '03-2003'
      '04-2003'
      '05-2003'
      '06-2003'
      '07-2003'
      '08-2003'
      '09-2003'
      '10-2003'
      '11-2003'
      '12-2003'
      '01-2004')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnEnter = DBComboDtMesEnter
    OnExit = DBComboDtMesExit
    OnKeyDown = DBComboDtMesKeyDown
  end
  object LbxFilter: TListBox
    Left = 4
    Top = 117
    Width = 102
    Height = 57
    Color = clLime
    ItemHeight = 13
    Items.Strings = (
      '1000-1100 // '#1054#1089#1085'. '#1074#1080#1076#1099
      '1200-1207 // '#1044#1086#1087'.'#1074#1080#1076#1099
      '1400-1500 // '#1053#1072#1076#1073#1072#1074#1082#1080
      '1600-1700 // '#1044#1086#1087#1083#1072#1090#1099
      '1800-1900 // '#1052#1072#1090#1087#1086#1084#1086#1097#1080
      '1900-2000 // '#1055#1086#1089#1086#1073#1080#1103
      '2200-2300 // '#1055#1088#1077#1084#1080#1080
      '5000-5100 // '#1053#1077#1086#1087#1083#1072#1095#1080#1074#1072#1077#1084#1099#1077' '#1074#1080#1076#1099
      '6000-6899 // '#1059#1076#1077#1088#1078#1072#1085#1080#1103
      '7500-7600 // '#1042#1099#1087#1083#1072#1090#1099)
    TabOrder = 6
    Visible = False
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DtMes'
        DataType = ftDate
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 2
    Top = 76
    object cdsTmpVidN: TStringField
      FieldName = 'VidN'
      Size = 4
    end
    object cdsTmpShVidN: TStringField
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsTmpDtMes: TDateField
      FieldName = 'DtMes'
      OnSetText = cdsTmpDtMesSetText
    end
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 18
    Top = 76
  end
end
