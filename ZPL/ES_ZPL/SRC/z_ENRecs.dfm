object FormEDtNdbRecs: TFormEDtNdbRecs
  Left = 427
  Top = 291
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1074#1086' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
  ClientHeight = 162
  ClientWidth = 312
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
  object Label8: TLabel
    Left = 1
    Top = 131
    Width = 149
    Height = 27
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1074#1074#1086#1076#1103#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1074' '#1087#1086#1083#1103' '#1089' "'#1075#1072#1083#1086#1095#1082#1072#1084#1080'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object dbeDtBeg: TDBEdit
    Left = 5
    Top = 20
    Width = 88
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
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtEnd: TDBEdit
    Left = 5
    Top = 62
    Width = 88
    Height = 21
    DataField = 'DtEnd'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtPrBeg: TDBEdit
    Left = 93
    Top = 20
    Width = 88
    Height = 21
    DataField = 'DtPrBeg'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNrPrBeg: TDBEdit
    Left = 181
    Top = 20
    Width = 126
    Height = 21
    DataField = 'NrPrBeg'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtPrEnd: TDBEdit
    Left = 93
    Top = 62
    Width = 88
    Height = 21
    DataField = 'DtPrEnd'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNrPrEnd: TDBEdit
    Left = 181
    Top = 62
    Width = 126
    Height = 21
    DataField = 'NrPrEnd'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 5
    Top = 104
    Width = 302
    Height = 21
    DataField = 'Notes'
    DataSource = dsrcTmp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 159
    Top = 132
    Width = 72
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 7
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 235
    Top = 132
    Width = 72
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
  object ChBoxDtBeg: TDBCheckBox
    Left = 5
    Top = 3
    Width = 76
    Height = 17
    TabStop = False
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
    DataField = 'EDtBeg'
    DataSource = dsrcTmp
    TabOrder = 9
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox1: TDBCheckBox
    Left = 93
    Top = 3
    Width = 84
    Height = 17
    TabStop = False
    Caption = #1044#1090' '#1087#1088#1080#1082#1072#1079#1072
    DataField = 'EDtPrBeg'
    DataSource = dsrcTmp
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 181
    Top = 3
    Width = 86
    Height = 17
    TabStop = False
    Caption = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072
    DataField = 'ENrPrBeg'
    DataSource = dsrcTmp
    TabOrder = 11
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 5
    Top = 45
    Width = 70
    Height = 17
    TabStop = False
    Caption = #1044#1090#1054#1082#1086#1085#1095'.'
    DataField = 'EDtEnd'
    DataSource = dsrcTmp
    TabOrder = 12
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox4: TDBCheckBox
    Left = 93
    Top = 45
    Width = 82
    Height = 17
    TabStop = False
    Caption = #1044#1090' '#1087#1088#1080#1082#1072#1079#1072
    DataField = 'EDtPrEnd'
    DataSource = dsrcTmp
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox5: TDBCheckBox
    Left = 181
    Top = 45
    Width = 84
    Height = 17
    TabStop = False
    Caption = #1053'-'#1088' '#1087#1088#1080#1082#1072#1079#1072
    DataField = 'ENrPrEnd'
    DataSource = dsrcTmp
    TabOrder = 14
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox6: TDBCheckBox
    Left = 5
    Top = 87
    Width = 87
    Height = 17
    TabStop = False
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    DataField = 'ENotes'
    DataSource = dsrcTmp
    TabOrder = 15
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object dsrcTmp: TDataSource
    DataSet = FormAddTrSoglInNdb.cdsTmp
    Left = 133
    Top = 92
  end
end
