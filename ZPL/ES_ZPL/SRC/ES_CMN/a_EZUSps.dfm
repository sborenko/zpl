object FormEAUsrSps: TFormEAUsrSps
  Left = 342
  Top = 365
  BorderStyle = bsDialog
  Caption = 'FormEAUsrSps'
  ClientHeight = 119
  ClientWidth = 327
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
  object LabelKdUsr: TLabel
    Left = 6
    Top = 94
    Width = 29
    Height = 13
    Caption = 'KdUsr'
    FocusControl = dbeKdUsr
    Visible = False
  end
  object LabelKdSps: TLabel
    Left = 79
    Top = 94
    Width = 31
    Height = 13
    Caption = 'KdSps'
    FocusControl = dbeKdSps
    Visible = False
  end
  object Label3: TLabel
    Left = 38
    Top = 70
    Width = 221
    Height = 13
    Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1090#1072#1073#1077#1083#1100' '#1042#1072#1096#1077#1075#1086' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103':'
    FocusControl = dbeKdObj
  end
  object Label4: TLabel
    Left = 6
    Top = 3
    Width = 33
    Height = 13
    Caption = #1058#1072#1073#1053#1088
    FocusControl = dbeTabN
  end
  object Label5: TLabel
    Left = 6
    Top = 46
    Width = 93
    Height = 13
    Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1084#1077#1089#1103#1094#1072
    FocusControl = dbeDtBProc
  end
  object Label6: TLabel
    Left = 193
    Top = 46
    Width = 47
    Height = 13
    Caption = #1087#1086' '#1084#1077#1089#1103#1094
    FocusControl = dbeDtEProc
  end
  object Label7: TLabel
    Left = 63
    Top = 3
    Width = 74
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
  end
  object sBtnTabN: TSpeedButton
    Left = 307
    Top = 19
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
    OnClick = sBtnTabNClick
  end
  object dbeKdUsr: TDBEdit
    Left = 37
    Top = 91
    Width = 40
    Height = 21
    DataField = 'KDUSR'
    DataSource = FormZUsrObj.dsrcSpsAdd
    Enabled = False
    TabOrder = 5
    Visible = False
  end
  object dbeKdSps: TDBEdit
    Left = 113
    Top = 91
    Width = 27
    Height = 21
    DataField = 'KDSPS'
    DataSource = FormZUsrObj.dsrcSpsAdd
    Enabled = False
    TabOrder = 6
    Visible = False
  end
  object dbeKdObj: TDBEdit
    Left = 265
    Top = 67
    Width = 57
    Height = 21
    DataField = 'KDOBJ'
    DataSource = FormZUsrObj.dsrcSpsAdd
    TabOrder = 4
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeTabN: TDBEdit
    Left = 6
    Top = 19
    Width = 57
    Height = 21
    DataField = 'TABN'
    DataSource = FormZUsrObj.dsrcSpsAdd
    TabOrder = 0
    OnEnter = dbEditEnter
    OnExit = dbeTabNExit
  end
  object dbeDtBProc: TDBEdit
    Left = 106
    Top = 43
    Width = 76
    Height = 21
    DataField = 'DTBPROC'
    DataSource = FormZUsrObj.dsrcSpsAdd
    TabOrder = 2
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object dbeDtEProc: TDBEdit
    Left = 246
    Top = 43
    Width = 76
    Height = 21
    DataField = 'DTEPROC'
    DataSource = FormZUsrObj.dsrcSpsAdd
    TabOrder = 3
    OnEnter = dbEditEnter
    OnExit = dbEditExit
  end
  object EdtFamIO: TEdit
    Left = 63
    Top = 19
    Width = 244
    Height = 21
    TabStop = False
    TabOrder = 1
  end
  object bBtnOk: TBitBtn
    Left = 166
    Top = 91
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 7
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 247
    Top = 91
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 8
    Kind = bkCancel
  end
end
