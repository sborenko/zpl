object FormEUpi2: TFormEUpi2
  Left = 362
  Top = 497
  BorderStyle = bsDialog
  Caption = 'FormEUpi2'
  ClientHeight = 144
  ClientWidth = 412
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
  object Label13: TLabel
    Left = 4
    Top = 11
    Width = 37
    Height = 13
    Caption = #1058#1072#1073' '#1085'-'#1088
  end
  object Label7: TLabel
    Left = 128
    Top = 11
    Width = 178
    Height = 13
    Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1085#1072#1083#1086#1075#1086#1074#1086#1081' '#1089#1083#1091#1078#1073#1099
    FocusControl = dbeID
  end
  object Label1: TLabel
    Left = 4
    Top = 30
    Width = 49
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
    FocusControl = dbeFam
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 143
    Top = 30
    Width = 22
    Height = 13
    Caption = #1048#1084#1103
    FocusControl = dbeIma
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 253
    Top = 30
    Width = 47
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    FocusControl = dbeOtch
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 166
    Top = 70
    Width = 20
    Height = 13
    Caption = #1055#1086#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 239
    Top = 70
    Width = 79
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    WordWrap = True
  end
  object Label8: TLabel
    Left = 5
    Top = 81
    Width = 63
    Height = 31
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label9: TLabel
    Left = 77
    Top = 94
    Width = 25
    Height = 13
    Caption = #1041#1072#1085#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sBtnKdBnk: TSpeedButton
    Left = 214
    Top = 91
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1041#1072#1085#1082#1080'"'
    Glyph.Data = {
      9E000000424D9E000000000000007600000028000000070000000A0000000100
      0400000000002800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
      0070777077707700077070000070000000007700077077000770770007707777
      7770}
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnKdBnkClick
  end
  object Label10: TLabel
    Left = 234
    Top = 94
    Width = 23
    Height = 13
    Caption = #1057#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 112
    Top = 96
    Width = 32
    Height = 13
    Caption = 'ShBnk'
    FocusControl = dbeShBnk
  end
  object dbeTabNr: TDBEdit
    Left = 51
    Top = 8
    Width = 65
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'TABN'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbeID: TDBEdit
    Left = 312
    Top = 8
    Width = 96
    Height = 21
    DataField = 'ID'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeFam: TDBEdit
    Left = 4
    Top = 43
    Width = 137
    Height = 21
    DataField = 'FAM'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeIma: TDBEdit
    Left = 141
    Top = 43
    Width = 112
    Height = 21
    DataField = 'IMA'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeOtch: TDBEdit
    Left = 253
    Top = 43
    Width = 155
    Height = 21
    DataField = 'OTCH'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbePol: TDBEdit
    Left = 196
    Top = 67
    Width = 33
    Height = 21
    DataField = 'POL'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeDOB: TDBEdit
    Left = 327
    Top = 67
    Width = 81
    Height = 21
    DataField = 'DOB'
    DataSource = FormTUpi.dsrcUpi
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object bBtnOk: TBitBtn
    Left = 248
    Top = 116
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 9
    Kind = bkOK
  end
  object bBtnCacel: TBitBtn
    Left = 333
    Top = 116
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 10
    Kind = bkCancel
  end
  object dbeLicSch: TDBEdit
    Left = 259
    Top = 91
    Width = 149
    Height = 21
    DataField = 'LICSCH'
    DataSource = dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeShBnk: TDBEdit
    Left = 106
    Top = 91
    Width = 107
    Height = 21
    DataField = 'ShBnk'
    DataSource = dsrcLS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnDblClick = sBtnKdBnkClick
    OnEnter = dbeEnter
    OnExit = dbeExit
    OnKeyDown = dbeShBnkKeyDown
  end
  object qryLS: TQuery
    CachedUpdates = True
    OnCalcFields = qryLSCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select first 3 * from z_BankiLS')
    UpdateObject = updLS
    Left = 17
    Top = 88
    object qryLSNR: TIntegerField
      FieldName = 'NR'
    end
    object qryLSTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryLSDTBEG: TDateTimeField
      FieldName = 'DTBEG'
    end
    object qryLSLICSCH: TStringField
      FieldName = 'LICSCH'
      Size = 25
    end
    object qryLSKDBNK: TSmallintField
      FieldName = 'KDBNK'
    end
    object qryLSNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryLSShBnk: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShBnk'
      Size = 10
      Calculated = True
    end
  end
  object dsrcLS: TDataSource
    DataSet = qryLS
    Left = 25
    Top = 96
  end
  object updLS: TUpdateSQL
    ModifySQL.Strings = (
      'update z_BankiLS'
      'set'
      '  TABN = :TABN,'
      '  DTBEG = :DTBEG,'
      '  LICSCH = :LICSCH,'
      '  KDBNK = :KDBNK,'
      '  NOTES = :NOTES'
      'where'
      '  NR = :OLD_NR')
    InsertSQL.Strings = (
      'insert into z_BankiLS'
      '  (TABN, DTBEG, LICSCH, KDBNK, NOTES)'
      'values'
      '  (:TABN, :DTBEG, :LICSCH, :KDBNK, :NOTES)')
    DeleteSQL.Strings = (
      'delete from z_BankiLS'
      'where'
      '  NR = :OLD_NR')
    Left = 33
    Top = 104
  end
end
