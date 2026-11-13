object FormShwFindRec2: TFormShwFindRec2
  Left = 417
  Top = 272
  Width = 575
  Height = 245
  ActiveControl = dbgrKli
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwFindRec2'
  Color = clBtnFace
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 245
  Constraints.MinWidth = 575
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      567
      31)
    object Label1: TLabel
      Left = 4
      Top = 2
      Width = 222
      Height = 29
      AutoSize = False
      Caption = 
        #1053#1072#1081#1076#1077#1085#1086' '#1073#1086#1083#1077#1077' '#1086#1076#1085#1086#1081' '#1079#1072#1087#1080#1089#1080'. '#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082 +
        #1091' "'#1042#1099#1073#1086#1088'".'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object LabelCntRec: TLabel
      Left = 224
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnOk: TBitBtn
      Left = 403
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 491
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
    object DBNavigator1: TDBNavigator
      Left = 300
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcKli
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object dbgrKli: TDBGrid
    Left = 0
    Top = 31
    Width = 567
    Height = 187
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcKli
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrKliDblClick
    OnEnter = dbgrKliEnter
    OnExit = dbgrKliExit
    Columns = <
      item
        Expanded = False
        FieldName = 'NR'
        Title.Caption = #8470' '#1087'/'#1087
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdKli'
        Title.Caption = #1050#1076#1050#1083#1080
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdDgv'
        Title.Caption = #1050#1076#1044#1075#1074
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Title.Caption = #1054#1050#1055#1054
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NmWho'
        Title.Caption = #1050#1083#1080#1077#1085#1090
        Width = 294
        Visible = True
      end>
  end
  object dsrcKli: TDataSource
    DataSet = FormGtKli.cdsKli
    Left = 56
    Top = 128
  end
  object cds_Kli: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 112
  end
end
