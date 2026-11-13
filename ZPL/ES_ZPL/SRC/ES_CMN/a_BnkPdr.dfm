object FormGtBnkPdr: TFormGtBnkPdr
  Left = 423
  Top = 239
  Width = 428
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtBnkPdr'
  Color = clBtnFace
  Constraints.MaxWidth = 470
  Constraints.MinHeight = 315
  Constraints.MinWidth = 365
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
    Top = 293
    Width = 420
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      420
      30)
    object sBtnAdd: TSpeedButton
      Left = 119
      Top = 4
      Width = 121
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088' '#1073#1077#1079' '#1074#1099#1093#1086#1076#1072
      OnClick = sBtnAddClick
    end
    object bBtnOk: TBitBtn
      Left = 255
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 343
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgrBnkWho: TDBGrid
    Left = 0
    Top = 0
    Width = 420
    Height = 293
    Align = alClient
    DataSource = dsrcBnkWho
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
    Columns = <
      item
        Expanded = False
        FieldName = 'KDWHO'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMWHO'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMVALSOKR'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Width = 105
        Visible = True
      end>
  end
  object qryBnkWho: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select w.KdWho, w.NmWho, w.KdSbu, s.SchBU, w.KdValPdr, v.NmValSo' +
        'kr, rs.RSch'
      'from kd_Who w '
      '     Left outer join kd_RSCH rs on rs.KdWho = w.KdWho'
      '     Left outer join kd_SBU s on s.KdSch = w.KdSbu'
      '     Left outer join kd_Val v on v.KdVal = w.KdValPdr'
      'where w.PrWho = 1 and w.Shfr = '#39'bnk'#39' '
      'order by w.KdWho'
      '      ')
    Left = 96
    Top = 144
    object qryBnkWhoKDWHO: TSmallintField
      DisplayLabel = #1050#1086#1076
      FieldName = 'KDWHO'
    end
    object qryBnkWhoNMWHO: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NMWHO'
      Size = 65
    end
    object qryBnkWhoKDSBU: TSmallintField
      FieldName = 'KDSBU'
    end
    object qryBnkWhoSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryBnkWhoKDVALPDR: TSmallintField
      FieldName = 'KDVALPDR'
    end
    object qryBnkWhoNMVALSOKR: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'NMVALSOKR'
      Size = 6
    end
    object qryBnkWhoRSCH: TStringField
      DisplayLabel = #1056#1057#1095#1077#1090
      FieldName = 'RSCH'
      Size = 25
    end
  end
  object dsrcBnkWho: TDataSource
    DataSet = qryBnkWho
    Left = 112
    Top = 160
  end
end
