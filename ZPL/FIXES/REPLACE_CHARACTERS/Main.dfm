object Form1: TForm1
  Left = 682
  Top = 331
  Width = 561
  Height = 359
  AutoSize = True
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelData: TPanel
    Left = 461
    Top = 0
    Width = 92
    Height = 325
    Align = alRight
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 325
    Align = alClient
    TabOrder = 1
    DesignSize = (
      461
      325)
    object DBGrid1: TDBGrid
      Left = 15
      Top = 13
      Width = 310
      Height = 299
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object radioUPI: TRadioButton
      Left = 349
      Top = 16
      Width = 96
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1060#1072#1084'.'#1048#1084#1103'.'#1054#1090#1095'.'
      TabOrder = 1
      OnClick = radioUPIClick
    end
    object radioDlzhn: TRadioButton
      Left = 349
      Top = 40
      Width = 96
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
      TabOrder = 2
      OnClick = radioDlzhnClick
    end
    object btnStart: TBitBtn
      Left = 352
      Top = 72
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Start'
      TabOrder = 3
      OnClick = btnStartClick
    end
  end
  object Database: TDatabase
    DatabaseName = 'DbMain'
    LoginPrompt = False
    Params.Strings = (
      'user name=SYSDBA')
    SessionName = 'Default'
    Left = 488
    Top = 16
  end
  object Query: TQuery
    CachedUpdates = True
    DatabaseName = 'DbMain'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM Z_UPI')
    Left = 488
    Top = 48
  end
  object UpdateSQL: TUpdateSQL
    Left = 504
    Top = 64
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 488
    Top = 104
  end
end
