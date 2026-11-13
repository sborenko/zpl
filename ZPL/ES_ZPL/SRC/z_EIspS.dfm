object formNameIspSlg: TformNameIspSlg
  Left = 462
  Top = 310
  Width = 442
  Height = 254
  Caption = 'formEAIspSlg'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 62
    Height = 13
    Caption = #1050#1086#1076' '#1057#1083#1091#1078#1073#1099
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 119
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1057#1083#1091#1078#1073#1099
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 74
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1057#1083#1091#1078#1073#1099
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 16
    Top = 136
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 24
    Width = 147
    Height = 21
    DataField = 'KDSLG'
    DataSource = formIspSlg.dsrcIsp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 64
    Width = 400
    Height = 21
    DataField = 'NMSLG'
    DataSource = formIspSlg.dsrcIsp
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 104
    Width = 400
    Height = 21
    DataField = 'ADRES'
    DataSource = formIspSlg.dsrcIsp
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 16
    Top = 152
    Width = 400
    Height = 21
    DataField = 'NOTES'
    DataSource = formIspSlg.dsrcIsp
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = #1042#1074#1086#1076
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 336
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 5
    Kind = bkCancel
  end
end
