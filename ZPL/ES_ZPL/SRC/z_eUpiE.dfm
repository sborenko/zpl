object FormUpiEdt: TFormUpiEdt
  Left = 404
  Top = 248
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
  ClientHeight = 229
  ClientWidth = 448
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
    448
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object PanelButtons: TPanel
    Left = 0
    Top = 200
    Width = 448
    Height = 29
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      448
      29)
    object bBtnOk: TBitBtn
      Left = 280
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCacel: TBitBtn
      Left = 365
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PanelMain: TPanel
    Left = 8
    Top = 2
    Width = 433
    Height = 71
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      433
      71)
    object Label13: TLabel
      Left = 4
      Top = 8
      Width = 36
      Height = 13
      Caption = #1058#1072#1073'. '#8470
    end
    object Label7: TLabel
      Left = 149
      Top = 8
      Width = 168
      Height = 13
      Caption = #1048#1076#1077#1085#1090#1080#1092'. '#8470' '#1085#1072#1083#1086#1075#1086#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FocusControl = dbeID
    end
    object Label1: TLabel
      Left = 4
      Top = 31
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
      Left = 149
      Top = 31
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
      Left = 269
      Top = 31
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
    object dbeTabNr: TDBEdit
      Left = 51
      Top = 5
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
      Left = 328
      Top = 5
      Width = 100
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
      Top = 46
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
      Left = 149
      Top = 46
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
      Left = 269
      Top = 46
      Width = 160
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
  end
  object PanelExtra: TPanel
    Left = 8
    Top = 78
    Width = 433
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      433
      53)
    object Label12: TLabel
      Left = 150
      Top = 8
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
      Left = 255
      Top = 8
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      WordWrap = True
    end
    object Label5: TLabel
      Left = 4
      Top = 32
      Width = 63
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object DBCheckBox1: TDBCheckBox
      Left = 4
      Top = 7
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = #1043#1088#1072#1078#1076'.'#1059#1082#1088#1072#1080#1085#1099
      DataField = 'UkrCitiz'
      DataSource = FormTUpi.dsrcUpi
      TabOrder = 0
      ValueChecked = 'Y'
      ValueUnchecked = ' '
      OnEnter = DBCheckBox1Enter
      OnExit = DBCheckBox1Exit
    end
    object dbePol: TDBEdit
      Left = 180
      Top = 5
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
      TabOrder = 1
      OnEnter = dbeEnter
      OnExit = dbeExit
    end
    object dbeDOB: TDBEdit
      Left = 343
      Top = 5
      Width = 86
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DOB'
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
    object dbeMyNotes: TDBEdit
      Left = 96
      Top = 28
      Width = 332
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MYNOTES'
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
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 132
    Width = 433
    Height = 65
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1077#1090' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      433
      65)
    object Label9: TLabel
      Left = 21
      Top = 20
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
    object Label10: TLabel
      Left = 274
      Top = 20
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
    object Label6: TLabel
      Left = 21
      Top = 42
      Width = 83
      Height = 13
      Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1076#1072#1090#1099':'
      FocusControl = dbeDtBeg
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sBtnELS: TSpeedButton
      Left = 218
      Top = 39
      Width = 15
      Height = 21
      Hint = 
        #1058#1072#1073#1083#1080#1094#1072' "'#1048#1089#1090#1086#1088#1080#1103' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074'" ('#1042#1074#1077#1076#1077#1085#1085#1099#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1051#1057' '#1089#1086#1093#1088#1072#1085#1103 +
        #1102#1090#1089#1103' '#1076#1072#1078#1077', '#1077#1089#1083#1080' '#1073#1091#1076#1077#1090' '#1079#1072#1090#1077#1084' '#1085#1072#1078#1072#1090#1072' '#1082#1085#1086#1087#1082#1072' "'#1054#1090#1082#1072#1079'")'
      Glyph.Data = {
        9E000000424D9E000000000000007600000028000000070000000A0000000100
        0400000000002800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
        0070777077707700077070000070000000007700077077000770770007707777
        7770}
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnELSClick
    end
    object dbeShBnk: TDBEdit
      Left = 117
      Top = 16
      Width = 116
      Height = 21
      DataField = 'ShBnk'
      DataSource = dsrcLS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnDblClick = sBtnELSClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShBnkKeyDown
    end
    object dbeLicSch: TDBEdit
      Left = 305
      Top = 16
      Width = 123
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'LICSCH'
      DataSource = dsrcLS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 14
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnDblClick = sBtnELSClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShBnkKeyDown
    end
    object dbeDtBeg: TDBEdit
      Left = 117
      Top = 39
      Width = 100
      Height = 21
      DataField = 'DTBEG'
      DataSource = dsrcLS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnDblClick = sBtnELSClick
      OnEnter = dbeEnter
      OnExit = dbeExit
      OnKeyDown = dbeShBnkKeyDown
    end
  end
  object qryLS: TQuery
    OnCalcFields = qryLSCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select * from z_Get_BnkLS(1239,'#39'04/13/2009'#39')')
    Left = 9
    Top = 192
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
    object qryLSShBnk: TStringField
      FieldName = 'SHBNK'
      Size = 10
    end
    object qryLSNMBNK: TStringField
      FieldName = 'NMBNK'
      Size = 25
    end
    object qryLSNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
  end
  object dsrcLS: TDataSource
    DataSet = qryLS
    Left = 17
    Top = 200
  end
end
