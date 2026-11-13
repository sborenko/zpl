object FormEALgt: TFormEALgt
  Left = 350
  Top = 327
  BorderStyle = bsDialog
  Caption = 'FormEALgt'
  ClientHeight = 182
  ClientWidth = 299
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
    Left = 8
    Top = 4
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    FocusControl = dbeKdLgt
  end
  object Label2: TLabel
    Left = 144
    Top = 4
    Width = 68
    Height = 13
    Caption = #1064#1080#1092#1088' '#1083#1100#1075#1086#1090#1099
    FocusControl = dbeShLgt
  end
  object Label3: TLabel
    Left = 8
    Top = 44
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    FocusControl = dbeDtBeg
  end
  object Label4: TLabel
    Left = 156
    Top = 44
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095'.'
    FocusControl = dbeDtEnd
  end
  object Label5: TLabel
    Left = 128
    Top = 68
    Width = 82
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099
    FocusControl = dbePrcLgt
  end
  object Label6: TLabel
    Left = 8
    Top = 92
    Width = 46
    Height = 13
    Caption = #8470' '#1076#1086#1082'-'#1090#1072
    FocusControl = dbeNrDoc
  end
  object Label7: TLabel
    Left = 151
    Top = 92
    Width = 61
    Height = 13
    Caption = #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072
    FocusControl = dbeDtDoc
  end
  object Label8: TLabel
    Left = 8
    Top = 113
    Width = 139
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1048#1084#1103' '#1088#1077#1073#1077#1085#1082#1072')'
    FocusControl = dbeNotes
  end
  object sBtnKdLgt: TSpeedButton
    Left = 279
    Top = 17
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1083#1100#1075#1086#1090
    Glyph.Data = {
      9E000000424D9E000000000000007600000028000000070000000A0000000100
      0400000000002800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777707000
      0070777077707700077070000070000000007700077077000770770007707777
      7770}
    ParentShowHint = False
    ShowHint = True
    OnClick = sBtnKdLgtClick
  end
  object Label9: TLabel
    Left = 64
    Top = 4
    Width = 38
    Height = 13
    Hint = #1054#1079#1085#1072#1082#1072' '#1087#1110#1083#1100#1075#1080' ('#1076#1083#1103' 1'#1044#1060')'
    Caption = #1054#1079#1085#1072#1082#1072
    FocusControl = dbeOznPilg
    ParentShowHint = False
    ShowHint = True
  end
  object dbeKdLgt: TDBEdit
    Left = 8
    Top = 17
    Width = 33
    Height = 21
    Hint = #1050#1086#1076' '#1083#1100#1075#1086#1090#1099
    DataField = 'KDLGT'
    DataSource = FormLgotu.dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = dbeKdLgtDblClick
    OnEnter = dbEditEnter
    OnExit = dbeKdLgtExit
    OnKeyDown = dbeKdLgtKeyDown
  end
  object dbeShLgt: TDBEdit
    Left = 144
    Top = 17
    Width = 134
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'SHLGT'
    DataSource = FormLgotu.dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    OnDblClick = dbeKdLgtDblClick
    OnKeyDown = dbeKdLgtKeyDown
  end
  object dbeDtBeg: TDBEdit
    Left = 77
    Top = 41
    Width = 75
    Height = 21
    Hint = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1083#1100#1075#1086#1090#1099
    DataField = 'DTBEG'
    DataSource = FormLgotu.dsrcLgt
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
  object dbeDtEnd: TDBEdit
    Left = 219
    Top = 41
    Width = 75
    Height = 21
    Hint = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1083#1100#1075#1086#1090#1099
    DataField = 'DTEND'
    DataSource = FormLgotu.dsrcLgt
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
  object dbePrcLgt: TDBEdit
    Left = 226
    Top = 65
    Width = 68
    Height = 21
    Hint = #1055#1088#1086#1094#1077#1085#1090' '#1083#1100#1075#1086#1090#1099
    DataField = 'PRCLGT'
    DataSource = FormLgotu.dsrcLgt
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
  object dbeNrDoc: TDBEdit
    Left = 64
    Top = 89
    Width = 83
    Height = 21
    Hint = #1053'-'#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
    DataField = 'NRDOC'
    DataSource = FormLgotu.dsrcLgt
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
  object dbeDtDoc: TDBEdit
    Left = 219
    Top = 89
    Width = 75
    Height = 21
    Hint = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
    DataField = 'DTDOC'
    DataSource = FormLgotu.dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeNotes: TDBEdit
    Left = 8
    Top = 129
    Width = 286
    Height = 21
    Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1089#1074#1086#1073#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090')'
    DataField = 'NOTES'
    DataSource = FormLgotu.dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object bBtnOk: TBitBtn
    Left = 136
    Top = 153
    Width = 75
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1041#1044
    Caption = #1042#1074#1086#1076
    TabOrder = 9
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 219
    Top = 153
    Width = 75
    Height = 25
    Hint = #1054#1090#1082#1072#1079' '#1086#1090' '#1074#1074#1086#1076#1072
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 10
    Kind = bkCancel
  end
  object dbeOznPilg: TDBEdit
    Left = 64
    Top = 17
    Width = 33
    Height = 21
    Hint = #1054#1079#1085#1072#1082#1072' '#1087#1110#1083#1100#1075#1080' ('#1076#1083#1103' 1'#1044#1060')'
    TabStop = False
    Color = clBtnFace
    DataField = 'OZN_PILG'
    DataSource = FormLgotu.dsrcLgt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    OnDblClick = dbeKdLgtDblClick
    OnKeyDown = dbeKdLgtKeyDown
  end
end
