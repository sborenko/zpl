object FormETObj: TFormETObj
  Left = 359
  Top = 256
  ActiveControl = dbeKdObj
  BorderStyle = bsDialog
  Caption = 'FormETObj'
  ClientHeight = 139
  ClientWidth = 334
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
  object Label1: TLabel
    Left = 198
    Top = 25
    Width = 29
    Height = 13
    Hint = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Caption = #1064#1080#1092#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 6
    Top = 39
    Width = 80
    Height = 29
    AutoSize = False
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object LabelNmParent: TLabel
    Left = 6
    Top = 4
    Width = 87
    Height = 13
    Caption = 'LabelNmParent'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 84
    Top = 68
    Width = 155
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1095#1077#1090' '#1073#1091#1093'.'#1091#1095#1077#1090#1072' ('#1057#1041#1059')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 6
    Top = 89
    Width = 166
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'. '#1091#1087#1086#1083#1085#1086#1084#1086#1095#1077#1085#1085#1086#1075#1086
  end
  object sBtnSPZ: TSpeedButton
    Left = 314
    Top = 64
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1087#1083#1072#1085#1072' '#1089#1095#1077#1090#1086#1074' ('#1057#1041#1059')'
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
    OnClick = sBtnSPZClick
  end
  object Label3: TLabel
    Left = 6
    Top = 24
    Width = 100
    Height = 13
    Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 115
    Width = 104
    Height = 13
    Hint = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1078#1091#1088#1085#1072#1083#1072'-'#1086#1088#1076#1077#1088#1072' '#1087#1086' '#1101#1090#1086#1084#1091' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102
    Caption = #1053#1086#1084#1077#1088' '#1078#1091#1088#1085'.-'#1086#1088#1076#1077#1088#1072
    ParentShowHint = False
    ShowHint = True
  end
  object bBtnOk: TBitBtn
    Left = 179
    Top = 110
    Width = 74
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 6
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 255
    Top = 110
    Width = 74
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 7
    Kind = bkCancel
  end
  object dbeShObj: TDBEdit
    Left = 231
    Top = 22
    Width = 98
    Height = 21
    Hint = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    DataField = 'SHOBJ'
    DataSource = FormTObj.dsrcObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNmObj: TDBEdit
    Left = 95
    Top = 43
    Width = 234
    Height = 21
    DataField = 'NMOBJ'
    DataSource = FormTObj.dsrcObj
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
  object dbeSpZ: TDBEdit
    Left = 244
    Top = 64
    Width = 70
    Height = 21
    Hint = #1057#1074#1103#1079#1072#1085#1085#1099#1081' '#1089#1095#1077#1090' '#1073#1091#1093'.'#1091#1095#1077#1090#1072
    DataField = 'SPZ'
    DataSource = FormTObj.dsrcObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
    OnKeyDown = dbeSpZKeyDown
  end
  object dbeFioUpoln: TDBEdit
    Left = 179
    Top = 85
    Width = 150
    Height = 21
    DataField = 'FIOUPOLN'
    DataSource = FormTObj.dsrcObj
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
  object dbeKdObj: TDBEdit
    Left = 120
    Top = 22
    Width = 49
    Height = 21
    DataField = 'KDOBJ'
    DataSource = FormTObj.dsrcObj
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
  object dbeNrGO: TDBEdit
    Left = 120
    Top = 112
    Width = 49
    Height = 21
    Hint = #1053#1086#1084#1077#1088' '#1076#1083#1103' '#1078#1091#1088#1085#1072#1083#1072'-'#1086#1088#1076#1077#1088#1072' '#1087#1086' '#1101#1090#1086#1084#1091' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1102
    DataField = 'NR_GORD'
    DataSource = FormTObj.dsrcObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object qryTmp: TQuery
    Left = 8
    Top = 64
  end
end
