object FormStorn: TFormStorn
  Left = 307
  Top = 177
  BorderStyle = bsSingle
  Caption = #1057#1090#1086#1088#1085#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 255
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblVidBegin: TLabel
    Left = 16
    Top = 48
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object lblVidEnd: TLabel
    Left = 272
    Top = 48
    Width = 55
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
  end
  object lblPeriod: TLabel
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
  object lblStornoBegin: TLabel
    Left = 16
    Top = 128
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object bevel: TBevel
    Left = 16
    Top = 80
    Width = 417
    Height = 10
    Shape = bsTopLine
  end
  object lblStornoEnd: TLabel
    Left = 272
    Top = 128
    Width = 55
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
  end
  object lblNotes: TLabel
    Left = 16
    Top = 168
    Width = 63
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object dbtxtBegin: TDBText
    Left = 64
    Top = 48
    Width = 65
    Height = 17
    DataField = 'DT_BEG'
    DataSource = FormStorn500X.dsrcStorn
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtxtEnd: TDBText
    Left = 336
    Top = 48
    Width = 65
    Height = 17
    DataField = 'DT_END'
    DataSource = FormStorn500X.dsrcStorn
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVidN: TLabel
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
  object dbtxtVidN: TDBText
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
  object pickStornoBegin: TDateTimePicker
    Left = 64
    Top = 128
    Width = 97
    Height = 21
    Date = 44011.658293842590000000
    Time = 44011.658293842590000000
    TabOrder = 0
  end
  object pickStornoEnd: TDateTimePicker
    Left = 336
    Top = 128
    Width = 97
    Height = 21
    Date = 44011.662966064820000000
    Time = 44011.662966064820000000
    TabOrder = 1
  end
  object btnOk: TBitBtn
    Left = 256
    Top = 216
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Default = True
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 360
    Top = 216
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object edtNotes: TEdit
    Left = 16
    Top = 184
    Width = 417
    Height = 21
    TabOrder = 4
  end
end
