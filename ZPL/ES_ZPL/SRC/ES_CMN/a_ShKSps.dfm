object FormKdSps: TFormKdSps
  Left = 336
  Top = 300
  Width = 415
  Height = 252
  BorderIcons = [biSystemMenu]
  Caption = 'FormKdSps'
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 550
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
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
  object dbgrKdSps: TDBGrid
    Left = 0
    Top = 0
    Width = 399
    Height = 185
    Align = alClient
    Color = clCream
    DataSource = Form_Dm.dsrcKdSps
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrKdSpsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHSPS'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSPS'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 119
        Visible = True
      end>
  end
  object Panel1Buttons: TPanel
    Left = 0
    Top = 185
    Width = 399
    Height = 28
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      399
      28)
    object bBtnOk: TBitBtn
      Left = 242
      Top = 3
      Width = 76
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 323
      Top = 3
      Width = 76
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pop: TPopupMenu
    OnPopup = popPopup
    Left = 80
    Top = 72
    object popHead: TMenuItem
      Caption = '==   '#1057' '#1087' '#1080' '#1089' '#1082' '#1080'   =='
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
