object FrmUsrSelf: TFrmUsrSelf
  Left = 680
  Top = 314
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 115
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
  end
  object Label3: TLabel
    Left = 42
    Top = 37
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
    FocusControl = DBEPwd
  end
  object Label5: TLabel
    Left = 17
    Top = 64
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DBENotes
  end
  object bBtnOk: TBitBtn
    Left = 80
    Top = 88
    Width = 74
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 163
    Top = 88
    Width = 74
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 4
    Kind = bkCancel
  end
  object DBEPwd: TDBEdit
    Left = 88
    Top = 34
    Width = 149
    Height = 21
    DataField = 'PswUsr'
    DataSource = DSrcUsr
    Enabled = False
    PasswordChar = '*'
    TabOrder = 1
    OnEnter = dbeNmUsrEnter
    OnExit = dbeNmUsrExit
  end
  object DBENotes: TDBEdit
    Left = 88
    Top = 62
    Width = 149
    Height = 21
    DataField = 'Notes'
    DataSource = DSrcUsr
    TabOrder = 2
    OnEnter = dbeNmUsrEnter
    OnExit = dbeNmUsrExit
  end
  object DBEUserId: TDBEdit
    Left = 88
    Top = 8
    Width = 149
    Height = 21
    DataField = 'NmUsr'
    DataSource = DSrcUsr
    Enabled = False
    TabOrder = 0
  end
  object QryUsr: TQuery
    CachedUpdates = True
    RequestLive = True
    UpdateObject = UpdSQLUsr
    Top = 24
  end
  object DSrcUsr: TDataSource
    DataSet = QryUsr
    Left = 16
    Top = 40
  end
  object UpdSQLUsr: TUpdateSQL
    ModifySQL.Strings = (
      
        'Update USRS set Notes = :Notes, PswUsr = :PswUsr where KdUsr = :' +
        'KdUsr')
    Left = 32
    Top = 64
  end
end
