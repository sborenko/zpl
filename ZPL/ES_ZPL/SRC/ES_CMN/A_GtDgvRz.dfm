object FormDgvRazdelu: TFormDgvRazdelu
  Left = 442
  Top = 309
  Width = 245
  Height = 236
  BorderIcons = [biSystemMenu]
  Caption = 'FormDgvRazdelu'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 450
  Constraints.MinHeight = 200
  Constraints.MinWidth = 245
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    237
    209)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrDgvRazd: TDBGrid
    Left = 3
    Top = 0
    Width = 231
    Height = 176
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcDgvRazd
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KDRAZD'
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMRAZD'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1079#1076#1077#1083#1072
        Width = 162
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 76
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1086#1088
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 159
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object dsrcDgvRazd: TDataSource
    DataSet = FormDm.qryDgvRazdLu
    Left = 56
    Top = 80
  end
end
