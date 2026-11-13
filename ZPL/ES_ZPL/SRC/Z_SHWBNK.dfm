object FormShwBanki: TFormShwBanki
  Left = 399
  Top = 212
  Width = 300
  Height = 252
  ActiveControl = dbgrBnk
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwBanki'
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
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
  object dbgrBnk: TDBGrid
    Left = 0
    Top = 0
    Width = 284
    Height = 187
    Align = alClient
    DataSource = DmMain.dsrcBanki
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = popMnu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrBnkDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDBNK'
        Title.Caption = #1050#1086#1076
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHBNK'
        Title.Caption = #1064#1080#1092#1088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBNK'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 50
        Visible = True
      end>
  end
  object PanelButtons: TPanel
    Left = 0
    Top = 187
    Width = 284
    Height = 26
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      284
      26)
    object bBtnOk: TBitBtn
      Left = 129
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 209
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object popMnu: TPopupMenu
    Left = 80
    Top = 72
    object popHead: TMenuItem
      Caption = '== '#1054#1073#1089#1083#1091#1078#1080#1074#1072#1102#1097#1080#1077' '#1073#1072#1085#1082#1080' =='
      Enabled = False
    end
    object popEdt: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = popEdtClick
    end
    object popAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = popAddClick
    end
    object popDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = popDelClick
    end
  end
end
