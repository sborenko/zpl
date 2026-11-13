object FormNwVids: TFormNwVids
  Left = 361
  Top = 211
  Width = 552
  Height = 632
  BorderIcons = [biSystemMenu]
  Caption = 'FormNwVids'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    544
    605)
  PixelsPerInch = 96
  TextHeight = 13
  object sBtnNuGo: TSpeedButton
    Left = 4
    Top = 4
    Width = 59
    Height = 25
    Caption = 'Nu Go!'
    OnClick = sBtnNuGoClick
  end
  object sBtnOtklGo: TSpeedButton
    Left = 64
    Top = 4
    Width = 59
    Height = 25
    Caption = 'Otkl Go!'
    OnClick = sBtnOtklGoClick
  end
  object sBtnNadbGo: TSpeedButton
    Left = 124
    Top = 4
    Width = 59
    Height = 25
    Caption = 'Nadb Go!'
    OnClick = sBtnNadbGoClick
  end
  object sBtnUdergGo: TSpeedButton
    Left = 184
    Top = 4
    Width = 59
    Height = 25
    Caption = 'Uderg Go!'
    OnClick = sBtnUdergGoClick
  end
  object sBtnOvvGo: TSpeedButton
    Left = 245
    Top = 4
    Width = 59
    Height = 25
    Caption = 'OVV Go!'
    OnClick = sBtnOvvGoClick
  end
  object SpeedButton1: TSpeedButton
    Left = 305
    Top = 4
    Width = 59
    Height = 25
    Caption = 'VOtp Go!'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 365
    Top = 4
    Width = 59
    Height = 25
    Caption = 'VBln Go!'
    OnClick = SpeedButton2Click
  end
  object dbgrVidN: TDBGrid
    Left = 0
    Top = 32
    Width = 544
    Height = 570
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcVidN
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 467
    Top = 4
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    TabOrder = 1
    Kind = bkCancel
  end
  object qryVidN: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_KdVidN'
      'order by AIndx')
    Left = 112
    Top = 104
  end
  object qryTmp: TQuery
    Left = 272
    Top = 160
  end
  object dsrcVidN: TDataSource
    DataSet = qryVidN
    Left = 128
    Top = 120
  end
end
