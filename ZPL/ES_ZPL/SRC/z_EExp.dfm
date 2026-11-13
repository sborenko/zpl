object FormEAExpFSS: TFormEAExpFSS
  Left = 527
  Top = 336
  ActiveControl = dbeTabN
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FormEAExpFSS'
  ClientHeight = 368
  ClientWidth = 435
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
    435
    368)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 8
    Width = 74
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
  end
  object Label2: TLabel
    Left = 330
    Top = 8
    Width = 24
    Height = 13
    Caption = #1048#1053#1053
  end
  object Label3: TLabel
    Left = 79
    Top = 8
    Width = 36
    Height = 13
    Caption = #1058#1072#1073#1053'-'#1088
  end
  object Label10: TLabel
    Left = 18
    Top = 8
    Width = 39
    Height = 13
    Hint = #1054#1090#1095#1105#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
    Caption = #1054#1090#1095#1052#1077#1089
    ParentShowHint = False
    ShowHint = True
  end
  object Label12: TLabel
    Left = 332
    Top = 52
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label13: TLabel
    Left = 161
    Top = 52
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object Label14: TLabel
    Left = 216
    Top = 52
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object sBtnUpi: TSpeedButton
    Left = 131
    Top = 24
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
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
    OnClick = sBtnUpiClick
  end
  object Label9: TLabel
    Left = 48
    Top = 62
    Width = 81
    Height = 30
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1086' '#1089#1084#1077#1088#1090#1080
    WordWrap = True
  end
  object Label8: TLabel
    Left = 279
    Top = 110
    Width = 34
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object grBoxZ: TGroupBox
    Left = 3
    Top = 206
    Width = 422
    Height = 124
    Caption = '  '#1044#1072#1085#1085#1099#1077' '#1079#1072#1103#1074#1080#1090#1077#1083#1103'  '
    TabOrder = 9
    Visible = False
    object Label5: TLabel
      Left = 8
      Top = 32
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label6: TLabel
      Left = 158
      Top = 32
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label7: TLabel
      Left = 282
      Top = 32
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object Label4: TLabel
      Left = 10
      Top = 76
      Width = 24
      Height = 13
      Caption = #1048#1053#1053
    end
    object dbeIdP: TDBEdit
      Left = 8
      Top = 91
      Width = 121
      Height = 21
      DataField = 'IDP'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
    object dbeFamP: TDBEdit
      Left = 8
      Top = 49
      Width = 147
      Height = 21
      DataField = 'FAMP'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
    object dbeImaP: TDBEdit
      Left = 156
      Top = 49
      Width = 109
      Height = 21
      DataField = 'IMAP'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
    object dbeOtchP: TDBEdit
      Left = 277
      Top = 49
      Width = 132
      Height = 21
      DataField = 'OTCHP'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 337
    Width = 435
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
    DesignSize = (
      435
      31)
    object bBtnCancel: TBitBtn
      Left = 357
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 206
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
  object dbeTabN: TDBEdit
    Left = 79
    Top = 24
    Width = 53
    Height = 21
    DataField = 'TABN'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
  object dbeFamIO: TDBEdit
    Left = 152
    Top = 24
    Width = 170
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'FamIO'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbeID: TDBEdit
    Left = 330
    Top = 24
    Width = 82
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'ID'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object dbeDtDoc: TDBEdit
    Left = 332
    Top = 69
    Width = 80
    Height = 21
    DataField = 'DTDOC'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
  object dbeSerDoc: TDBEdit
    Left = 161
    Top = 69
    Width = 38
    Height = 21
    DataField = 'SERDOC'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
  object dbeNDoc: TDBEdit
    Left = 216
    Top = 70
    Width = 97
    Height = 21
    DataField = 'NDOC'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
  object dbeDtProc: TDBEdit
    Left = 17
    Top = 24
    Width = 51
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'DTPROC'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object grboxA: TGroupBox
    Left = 3
    Top = 137
    Width = 422
    Height = 55
    Caption = '  '#1040#1082#1090' '#1086' '#1085#1077#1089#1095#1072#1089#1090#1085#1086#1084' '#1089#1083#1091#1095#1072#1077' '#1080#1083#1080' '#1087#1088#1086#1092#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1080'  '
    TabOrder = 8
    Visible = False
    object Label11: TLabel
      Left = 16
      Top = 23
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label15: TLabel
      Left = 301
      Top = 23
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object dbeNrAct: TDBEdit
      Left = 73
      Top = 20
      Width = 99
      Height = 21
      DataField = 'NRACT'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
    object dbeDtAct: TDBEdit
      Left = 331
      Top = 20
      Width = 78
      Height = 21
      DataField = 'DTACT'
      DataSource = FormShowBln.dsrcPgr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = dbeTabNEnter
      OnExit = dbeTabNExit
    end
  end
  object dbeSumma: TDBEdit
    Left = 328
    Top = 107
    Width = 84
    Height = 21
    DataField = 'SUMMA'
    DataSource = FormShowBln.dsrcPgr
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnEnter = dbeTabNEnter
    OnExit = dbeTabNExit
  end
end
