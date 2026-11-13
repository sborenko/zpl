object FrmGetSpan: TFrmGetSpan
  Left = 359
  Top = 317
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 105
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    264
    105)
  PixelsPerInch = 96
  TextHeight = 13
  object GrBoxSpan: TGroupBox
    Left = 8
    Top = 1
    Width = 251
    Height = 70
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1055#1077#1088#1080#1086#1076' '
    TabOrder = 0
    object LblBegin: TLabel
      Left = 64
      Top = 24
      Width = 37
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086
    end
    object LblEnd: TLabel
      Left = 64
      Top = 48
      Width = 55
      Height = 13
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
    end
    object EdtBegin: TMaskEdit
      Left = 140
      Top = 20
      Width = 88
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  -  -    '
    end
    object EdtEnd: TMaskEdit
      Left = 140
      Top = 44
      Width = 89
      Height = 21
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  -  -    '
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 75
    Width = 264
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      264
      30)
    object BtnOk: TBitBtn
      Left = 87
      Top = 2
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      Kind = bkOK
    end
    object BtnCancel: TBitBtn
      Left = 175
      Top = 2
      Width = 83
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
