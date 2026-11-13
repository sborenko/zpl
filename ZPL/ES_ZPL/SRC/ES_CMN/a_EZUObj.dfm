object FormEAUsrObj: TFormEAUsrObj
  Left = 474
  Top = 281
  BorderStyle = bsDialog
  Caption = 'FormEAUsrObj'
  ClientHeight = 133
  ClientWidth = 252
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
    Left = 6
    Top = 11
    Width = 98
    Height = 13
    Caption = #1044#1083#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    FocusControl = dbeKdUsr
  end
  object Label2: TLabel
    Left = 184
    Top = 11
    Width = 39
    Height = 13
    Caption = #1089#1087#1080#1089#1086#1082':'
    FocusControl = dbeKdSps
  end
  object Label3: TLabel
    Left = 13
    Top = 59
    Width = 157
    Height = 13
    Caption = #1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1084#1077#1089#1103#1094#1072':'
    FocusControl = dbeDtBProc
  end
  object Label4: TLabel
    Left = 120
    Top = 83
    Width = 50
    Height = 13
    Caption = #1087#1086' '#1084#1077#1089#1103#1094':'
    FocusControl = dbeDtEProc
  end
  object Label5: TLabel
    Left = 23
    Top = 35
    Width = 81
    Height = 13
    Caption = #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    FocusControl = dbeKdObj
  end
  object sBtnUsr: TSpeedButton
    Left = 164
    Top = 8
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
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
    OnClick = sBtnUsrClick
  end
  object dbeKdUsr: TDBEdit
    Left = 108
    Top = 8
    Width = 55
    Height = 21
    DataField = 'KDUSR'
    DataSource = FormZUsrObj.dsrcUsrObj
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
  object dbeKdSps: TDBEdit
    Left = 224
    Top = 8
    Width = 25
    Height = 21
    DataField = 'KDSPS'
    DataSource = FormZUsrObj.dsrcUsrObj
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
  object dbeDtBProc: TDBEdit
    Left = 173
    Top = 56
    Width = 76
    Height = 21
    Hint = #1042#1074#1086#1076#1080#1090#1100' '#1085#1091#1078#1085#1086' 1-'#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
    DataField = 'DTBPROC'
    DataSource = FormZUsrObj.dsrcUsrObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeDtEProc: TDBEdit
    Left = 173
    Top = 80
    Width = 76
    Height = 21
    Hint = #1042#1074#1086#1076#1080#1090#1100' '#1085#1091#1078#1085#1086' 1-'#1095#1080#1089#1083#1086' '#1084#1077#1089#1103#1094#1072
    DataField = 'DTEPROC'
    DataSource = FormZUsrObj.dsrcUsrObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnEnter = dbeEnter
    OnExit = dbeExit
  end
  object dbeKdObj: TDBEdit
    Left = 108
    Top = 32
    Width = 51
    Height = 21
    DataField = 'KDOBJ'
    DataSource = FormZUsrObj.dsrcUsrObj
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnEnter = dbeEnter
    OnExit = dbeKdObjExit
  end
  object bBtnOk: TBitBtn
    Left = 88
    Top = 104
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 6
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 174
    Top = 104
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 7
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 164
    Top = 32
    Width = 84
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'SHOBJ'
    DataSource = FormZUsrObj.dsrcUsrObj
    ReadOnly = True
    TabOrder = 3
  end
end
