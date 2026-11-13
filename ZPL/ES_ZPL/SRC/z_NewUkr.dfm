object FormMyNewUkr: TFormMyNewUkr
  Left = 354
  Top = 134
  Width = 683
  Height = 640
  Caption = 'FormMyNewUkr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    Caption = #1047#1072#1084#1077#1085#1072' '#1083#1072#1090#1080#1085#1089#1082#1080#1093' "I" '#1085#1072' '#1091#1082#1088#1072#1080#1085#1089#1082#1080#1077' "'#1030'"'
    TabOrder = 0
    DesignSize = (
      675
      31)
    object SpeedButton1: TSpeedButton
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Go !!!'
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 597
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrUpi: TDBGrid
    Left = 0
    Top = 31
    Width = 675
    Height = 582
    Align = alClient
    DataSource = dsrcUpi
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qryUpi: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_Upi')
    Left = 88
    Top = 56
  end
  object dsrcUpi: TDataSource
    DataSet = qryUpi
    Left = 104
    Top = 72
  end
  object qryTmp: TQuery
    Left = 96
    Top = 152
  end
end
