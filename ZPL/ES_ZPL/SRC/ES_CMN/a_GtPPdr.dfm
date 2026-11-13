object FormGetPPdr: TFormGetPPdr
  Left = 506
  Top = 302
  Width = 602
  Height = 273
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetPPdr'
  Color = clBtnFace
  Constraints.MaxHeight = 420
  Constraints.MaxWidth = 650
  Constraints.MinHeight = 185
  Constraints.MinWidth = 600
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
    Top = 217
    Width = 594
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      594
      29)
    object bBtnOk: TBitBtn
      Left = 438
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 518
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgrRSch: TDBGrid
    Left = 0
    Top = 0
    Width = 594
    Height = 217
    Align = alClient
    Color = clCream
    DataSource = dsrcRSch
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
    OnDblClick = dbgrRSchDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SCHBU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFO'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 245
        Visible = True
      end>
  end
  object qryRSch: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select r.KdSbu, s.SchBU, r.ShPPdr, r.KdRSch, r.NmSch, r.NmBank, '
      '           r.RSch, r.MFO, r.OKPO, r.Notes '
      'from Kd_RSch r'
      '  Left Outer Join Kd_Sbu s on s.KdSch = r.KdSbu'
      'where r.KdWho = 6')
    Left = 40
    Top = 56
    object qryRSchKDSBU: TSmallintField
      FieldName = 'KDSBU'
    end
    object qryRSchSCHBU: TStringField
      DisplayLabel = #1057#1095#1077#1090#1041#1059
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryRSchSHPPDR: TStringField
      FieldName = 'SHPPDR'
      FixedChar = True
      Size = 1
    end
    object qryRSchKDRSCH: TSmallintField
      FieldName = 'KDRSCH'
    end
    object qryRSchNMSCH: TStringField
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryRSchNMBANK: TStringField
      FieldName = 'NMBANK'
      Size = 65
    end
    object qryRSchRSCH: TStringField
      DisplayLabel = #1056#1072#1089#1095' '#1057#1095#1077#1090
      FieldName = 'RSCH'
      Size = 25
    end
    object qryRSchMFO: TStringField
      DisplayLabel = #1052#1060#1054
      FieldName = 'MFO'
      Size = 25
    end
    object qryRSchOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 25
    end
    object qryRSchNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      FixedChar = True
      Size = 35
    end
  end
  object dsrcRSch: TDataSource
    DataSet = qryRSch
    Left = 56
    Top = 72
  end
end
