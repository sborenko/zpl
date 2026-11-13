object FormFilterBK: TFormFilterBK
  Left = 431
  Top = 194
  Width = 355
  Height = 200
  BorderIcons = [biSystemMenu]
  Caption = 'FormFilterBK'
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 390
  Constraints.MinHeight = 200
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    347
    173)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrFBK: TDBGrid
    Left = 0
    Top = 0
    Width = 347
    Height = 145
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcFBK
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrFBKDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDBNK'
        Title.Caption = #1050#1086#1076
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHBNK'
        Title.Caption = #1064#1080#1092#1088
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBNK'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 210
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 147
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 147
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object dsrcFBK: TDataSource
    Left = 96
    Top = 72
  end
end
