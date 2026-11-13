object FormFindRSch: TFormFindRSch
  Left = 316
  Top = 271
  Width = 900
  Height = 307
  ActiveControl = dbgrRSch
  BorderIcons = [biSystemMenu]
  Caption = 'FormFindRSch'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrRSch: TDBGrid
    Left = 0
    Top = 0
    Width = 892
    Height = 252
    Align = alClient
    Color = 9764045
    DataSource = dsrcRSch
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrRSchDrawColumnCell
    OnDblClick = dbgrRSchDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KDWHO'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMWHO'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RPA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDRSCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMSCH'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFO'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NMBANK'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSBU'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LDTOPER'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RLDTOPER'
        Width = 35
        Visible = True
      end>
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 252
    Width = 892
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 280
      Height = 26
      Align = alLeft
      AutoSize = False
      Caption = 'Label1'
      WordWrap = True
    end
    object PanelBR: TPanel
      Left = 735
      Top = 1
      Width = 156
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 1
        Top = 1
        Width = 75
        Height = 25
        Caption = #1042#1099#1073#1086#1088
        TabOrder = 0
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 81
        Top = 1
        Width = 75
        Height = 25
        Caption = #1054#1090#1082#1072#1079
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object qryRSch: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select w.NmWho, rs.ShPPdr as RPA, rs.KdWho, rs.KdSbU, w.PA as WP' +
        'A, rs.KdRSch, rs.NmSch,'
      ' rs.RSch, rs.Mfo, rs.Okpo, rs.NmBank, w.LDtOper,'
      ' rs.LDtOper as RLDtOper from Kd_RSch rs'
      
        '                             Left outer Join Kd_Who w on w.KdWho' +
        ' = rs.KdWho'
      ' where rs.RSch = '#39'31257204101204'#39
      'order by w.NmWho, rs.NmSch, rs.RSch, rs.Mfo, rs.Okpo')
    Left = 88
    Top = 104
    object qryRSchNMWHO: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'NMWHO'
      Size = 65
    end
    object qryRSchRPA: TStringField
      DisplayLabel = #1087#1087
      FieldName = 'RPA'
      FixedChar = True
      Size = 1
    end
    object qryRSchKDWHO: TSmallintField
      DisplayLabel = #1050#1076#1050#1083#1080
      FieldName = 'KDWHO'
    end
    object qryRSchKDSBU: TSmallintField
      DisplayLabel = #1050#1076#1057#1073#1091#1056#1057#1095
      FieldName = 'KDSBU'
    end
    object qryRSchWPA: TSmallintField
      FieldName = 'WPA'
    end
    object qryRSchKDRSCH: TSmallintField
      DisplayLabel = #1050#1076#1056#1057#1095
      FieldName = 'KDRSCH'
    end
    object qryRSchNMSCH: TStringField
      DisplayLabel = #1053#1072#1079#1074'. '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      FieldName = 'NMSCH'
      Size = 65
    end
    object qryRSchRSCH: TStringField
      DisplayLabel = #1056#1072#1089#1095#1057#1095#1105#1090
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
    object qryRSchNMBANK: TStringField
      DisplayLabel = #1053#1072#1079#1074'.'#1073#1072#1085#1082#1072
      FieldName = 'NMBANK'
      Size = 65
    end
    object qryRSchLDTOPER: TDateTimeField
      DisplayLabel = 'WLDtOper'
      FieldName = 'LDTOPER'
    end
    object qryRSchRLDTOPER: TDateTimeField
      DisplayLabel = 'RLDtOper'
      FieldName = 'RLDTOPER'
    end
  end
  object dsrcRSch: TDataSource
    DataSet = qryRSch
    Left = 104
    Top = 120
  end
end