object FormFindFam: TFormFindFam
  Left = 345
  Top = 202
  Width = 580
  Height = 719
  BorderIcons = [biSystemMenu]
  Caption = 'FormFindFam'
  Color = clBtnFace
  Constraints.MaxHeight = 850
  Constraints.MaxWidth = 695
  Constraints.MinHeight = 480
  Constraints.MinWidth = 580
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
    Width = 572
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      572
      31)
    object LabelCntRec: TLabel
      Left = 89
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object LabelFCase: TLabel
      Left = 160
      Top = 2
      Width = 165
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelFCase'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object bBtnOk: TBitBtn
      Left = 406
      Top = 4
      Width = 75
      Height = 25
      Hint = #1042#1074#1077#1089#1090#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100' '#1089#1087#1080#1089#1082#1072
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1077#1089#1090#1080
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkOK
      Spacing = 0
    end
    object bBtnCancel: TBitBtn
      Left = 494
      Top = 4
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1073#1077#1079' '#1074#1074#1086#1076#1072' '#1074' '#1089#1087#1080#1089#1086#1082
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 4
      Width = 80
      Height = 25
      DataSource = dsrcSps
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
  end
  object dbgrSps: TDBGrid
    Left = 0
    Top = 31
    Width = 572
    Height = 661
    Align = alClient
    Color = 13696496
    DataSource = dsrcSps
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
    OnDblClick = dbgrSpsDblClick
    OnEnter = dbgrSpsEnter
    OnExit = dbgrSpsExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 84
        Visible = True
      end>
  end
  object qrySps: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select distinct s.TabN, s.KdObj, u.Fam, u.Ima, u.Otch, u.ID from' +
        ' Z_Sps s'
      '          Left Outer Join Z_UPI u on u.TabN = s.TabN'
      
        ' where s.DtProc >= '#39'01/01/2013'#39' and Upper(u.Fam) Containing "'#1041#1054#1056 +
        '"'
      ' order by Fam, Ima, Otch, s.KdObj')
    Left = 72
    Top = 80
    object qrySpsTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qrySpsKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qrySpsFAM: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FAM'
    end
    object qrySpsIMA: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'IMA'
      Size = 15
    end
    object qrySpsOTCH: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'OTCH'
    end
    object qrySpsID: TStringField
      DisplayLabel = #1053#1072#1083#1086#1075#1086#1074#1099#1081' '#1048#1044
      FieldName = 'ID'
      Size = 10
    end
  end
  object dsrcSps: TDataSource
    DataSet = qrySps
    Left = 88
    Top = 96
  end
end
