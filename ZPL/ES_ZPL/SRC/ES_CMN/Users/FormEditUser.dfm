object FrmEditUser: TFrmEditUser
  Left = 419
  Top = 303
  ActiveControl = dbeNmUsr
  BorderStyle = bsDialog
  Caption = 'FormEAUsers'
  ClientHeight = 117
  ClientWidth = 243
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
    Left = 7
    Top = 8
    Width = 73
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    FocusControl = dbeNmUsr
  end
  object Label2: TLabel
    Left = 27
    Top = 35
    Width = 53
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
    FocusControl = dbeKdKatUsr
  end
  object Label5: TLabel
    Left = 17
    Top = 64
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = dbeNotes
  end
  object sBtnKdSps: TSpeedButton
    Left = 222
    Top = 32
    Width = 15
    Height = 21
    Hint = #1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' "'#1057#1087#1080#1089#1082#1080'"'
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
    OnClick = sBtnKdSpsClick
  end
  object Label4: TLabel
    Left = 157
    Top = 35
    Width = 37
    Height = 13
    Caption = #1057#1087#1080#1089#1086#1082
  end
  object dbeNmUsr: TDBEdit
    Left = 88
    Top = 5
    Width = 149
    Height = 21
    DataField = 'NmUsr'
    DataSource = Form_UsersNew.dsrcUsers
    TabOrder = 0
    OnEnter = dbeNmUsrEnter
    OnExit = dbeNmUsrExit
  end
  object dbeKdKatUsr: TDBEdit
    Left = 88
    Top = 32
    Width = 29
    Height = 21
    DataField = 'KdKatUsr'
    DataSource = Form_UsersNew.dsrcUsers
    TabOrder = 1
    OnEnter = dbeNmUsrEnter
    OnExit = dbeNmUsrExit
  end
  object dbeNotes: TDBEdit
    Left = 88
    Top = 62
    Width = 149
    Height = 21
    DataField = 'Notes'
    DataSource = Form_UsersNew.dsrcUsers
    TabOrder = 3
    OnEnter = dbeNmUsrEnter
    OnExit = dbeNmUsrExit
  end
  object dbeKdSps: TDBEdit
    Left = 200
    Top = 32
    Width = 24
    Height = 21
    Hint = #1042#1099#1073#1080#1088#1072#1077#1090#1089#1103' '#1089#1090#1088#1086#1075#1086' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    Color = clBtnFace
    DataField = 'KDSPS'
    DataSource = Form_UsersNew.dsrcUsers
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    OnEnter = dbeNmUsrEnter
    OnExit = dbeKdSpsExit
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 89
    Width = 243
    Height = 28
    Align = alBottom
    TabOrder = 4
    object bBtnOk: TBitBtn
      Left = 88
      Top = 3
      Width = 74
      Height = 25
      Caption = #1042#1074#1086#1076
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 163
      Top = 3
      Width = 74
      Height = 25
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
