object FormVbPSch: TFormVbPSch
  Left = 414
  Top = 363
  Width = 240
  Height = 175
  BorderIcons = [biSystemMenu]
  Caption = 'FormVbPSch'
  Color = clBtnFace
  Constraints.MaxHeight = 420
  Constraints.MaxWidth = 240
  Constraints.MinHeight = 175
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    232
    148)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 108
    Width = 222
    Height = 26
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1079' '#1089#1095#1077#1090#1086#1074' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' "'#1042#1074#1086#1076'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object dbgrPSch: TDBGrid
    Left = 0
    Top = 0
    Width = 232
    Height = 108
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcPSch
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 77
    Top = 122
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 156
    Top = 122
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object qryPSch: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select PSCH, count(NR) as CNT, Sum(Summa) as SMM'
      'from vinu_Main where dtProc = "10/01/2006" and VidN < "8000"'
      'group by PSCH')
    Left = 48
    Top = 48
    object qryPSchPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object qryPSchCNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      FieldName = 'CNT'
    end
    object qryPSchSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SMM'
      DisplayFormat = '# ###.00'
    end
  end
  object dsrcPSch: TDataSource
    DataSet = qryPSch
    Left = 64
    Top = 64
  end
end
