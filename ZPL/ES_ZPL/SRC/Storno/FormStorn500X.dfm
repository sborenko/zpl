object FrmStorn500x: TFrmStorn500x
  Left = 626
  Top = 406
  BorderStyle = bsSingle
  Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 248
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblVidBeg: TLabel
    Left = 16
    Top = 48
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object LblVidEnd: TLabel
    Left = 272
    Top = 48
    Width = 55
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
  end
  object LblPeriod: TLabel
    Left = 16
    Top = 96
    Width = 134
    Height = 13
    Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1080#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblStornBeg: TLabel
    Left = 16
    Top = 128
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object Bevel: TBevel
    Left = 16
    Top = 80
    Width = 417
    Height = 10
    Shape = bsTopLine
  end
  object LblStornEnd: TLabel
    Left = 272
    Top = 128
    Width = 55
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
  end
  object LblNotes: TLabel
    Left = 16
    Top = 168
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object DBTxtBeg: TDBText
    Left = 64
    Top = 48
    Width = 65
    Height = 17
    DataField = 'DT_BEG'
    DataSource = DataStorn500X.PartsDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBTxtEnd: TDBText
    Left = 336
    Top = 48
    Width = 65
    Height = 17
    DataField = 'DT_END'
    DataSource = DataStorn500X.PartsDSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblVidN: TLabel
    Left = 16
    Top = 16
    Width = 121
    Height = 13
    Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1087#1086' '#1074#1080#1076#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBTxtVidN: TDBText
    Left = 144
    Top = 16
    Width = 65
    Height = 17
    DataField = 'VIDN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PickStornBeg: TDateTimePicker
    Left = 64
    Top = 128
    Width = 97
    Height = 21
    Date = 44011.658293842590000000
    Time = 44011.658293842590000000
    TabOrder = 0
  end
  object PickStornEnd: TDateTimePicker
    Left = 336
    Top = 128
    Width = 97
    Height = 21
    Date = 44011.662966064820000000
    Time = 44011.662966064820000000
    TabOrder = 1
  end
  object BtnOk: TBitBtn
    Left = 280
    Top = 216
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object BtnCancel: TBitBtn
    Left = 360
    Top = 216
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object EdtNotes: TEdit
    Left = 16
    Top = 184
    Width = 417
    Height = 21
    TabOrder = 2
  end
end
