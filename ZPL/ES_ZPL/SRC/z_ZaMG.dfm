object FormZaMG: TFormZaMG
  Left = 584
  Top = 322
  Width = 140
  Height = 312
  ActiveControl = dbgrZaMG
  BorderIcons = [biSystemMenu]
  Caption = 'FormZaMG'
  Color = clBtnFace
  Constraints.MaxHeight = 425
  Constraints.MaxWidth = 205
  Constraints.MinHeight = 180
  Constraints.MinWidth = 140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    132
    285)
  PixelsPerInch = 96
  TextHeight = 13
  object bBtnOk: TBitBtn
    Left = 0
    Top = 260
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 0
    Kind = bkOK
    Spacing = 0
  end
  object bBtnCancel: TBitBtn
    Left = 67
    Top = 260
    Width = 65
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 1
    Kind = bkCancel
    Spacing = 0
  end
  object dbgrZaMG: TDBGrid
    Left = 0
    Top = 0
    Width = 132
    Height = 259
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    DataSource = dsrcZaMG
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrZaMGDblClick
    OnKeyDown = dbgrZaMGKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'MesGod'
        Title.Caption = #1052#1077#1089#1103#1094
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RusMG'
        Title.Caption = #1052#1077#1089#1103#1094
        Width = 53
        Visible = True
      end>
  end
  object dsrcZaMG: TDataSource
    Left = 32
    Top = 64
  end
end
