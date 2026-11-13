object Form_ShUpi: TForm_ShUpi
  Left = 354
  Top = 289
  Width = 700
  Height = 493
  BorderIcons = [biSystemMenu]
  Caption = 'Form_ShUpi'
  Color = clBtnFace
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 450
  Constraints.MinWidth = 505
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    692
    466)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelCountRec: TLabel
    Left = 89
    Top = 446
    Width = 74
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'LabelCountRec'
  end
  object dbgrUpi: TDBGrid
    Left = 0
    Top = 0
    Width = 692
    Height = 435
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clCream
    DataSource = Form_Dm.dsrcUpi
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrUpiDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOB'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_UVOLN'
        Width = 63
        Visible = True
      end>
  end
  object bBtnOk: TBitBtn
    Left = 528
    Top = 439
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object bBtnCancel: TBitBtn
    Left = 616
    Top = 439
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object DBNavigator1: TDBNavigator
    Left = 3
    Top = 439
    Width = 80
    Height = 25
    DataSource = Form_DM.dsrcUpi
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object pop: TPopupMenu
    Left = 160
    Top = 184
    object popSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' ...'
      object popSortFIO: TMenuItem
        Caption = '- '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080', '#1086#1090#1095#1077#1089#1090#1074#1091
        OnClick = popSortFIOClick
      end
      object popSortTabN: TMenuItem
        Caption = '- '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        Checked = True
        OnClick = popSortTabNClick
      end
    end
    object popSeek: TMenuItem
      Caption = #1055#1086#1084#1089#1082
      OnClick = popSeekClick
    end
  end
end
