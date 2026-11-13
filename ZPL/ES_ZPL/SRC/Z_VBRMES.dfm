object FormVbRMes: TFormVbRMes
  Left = 449
  Top = 251
  Width = 170
  Height = 259
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbRMes'
  Color = clBtnFace
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 170
  Constraints.MinHeight = 259
  Constraints.MinWidth = 170
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrMesNU: TDBGrid
    Left = 0
    Top = 0
    Width = 162
    Height = 192
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcMesNU
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrMesNUDblClick
    OnKeyDown = dbgrMesNUKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'RusMes'
        Width = 127
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 192
    Width = 162
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      162
      33)
    object bBtnOk: TBitBtn
      Left = 5
      Top = 4
      Width = 70
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
      Spacing = 1
    end
    object bBtnCancel: TBitBtn
      Left = 85
      Top = 4
      Width = 70
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
      Spacing = 1
    end
  end
  object dsrcMesNU: TDataSource
    DataSet = DmMain.qryMesSps
    Left = 80
    Top = 144
  end
end
