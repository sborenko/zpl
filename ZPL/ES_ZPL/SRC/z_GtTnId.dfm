object FormGtTnId: TFormGtTnId
  Left = 399
  Top = 218
  Width = 518
  Height = 291
  ActiveControl = dbgrId
  BorderIcons = [biSystemMenu]
  Caption = 'FormGtTnId'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 250
  Constraints.MinWidth = 500
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
  object Splitter1: TSplitter
    Left = 0
    Top = 142
    Width = 510
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object dbgrId: TDBGrid
    Left = 0
    Top = 0
    Width = 510
    Height = 142
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcId
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrIdDblClick
    OnEnter = dbgrIdEnter
    OnExit = dbgrIdExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Title.Caption = #1058#1072#1073#1053#1088
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = #1048#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAM'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMA'
        Title.Caption = #1048#1084#1103
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTCH'
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POL'
        Title.Caption = #1055#1086#1083
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Title.Caption = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1053#1059
        Width = 79
        Visible = True
      end>
  end
  object dbgrPrmUv: TDBGrid
    Left = 0
    Top = 145
    Width = 510
    Height = 91
    Align = alClient
    DataSource = dsrcPrmUv
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbgrIdEnter
    OnExit = dbgrIdExit
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_PRIEM'
        Title.Caption = #1044#1090#1055#1088#1080#1077#1084#1072
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_UVOLN'
        Title.Caption = #1044#1090#1059#1074#1086#1083#1100#1085'.'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRIKAZA'
        Title.Caption = #8470#1055#1088#1055#1088#1084
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRIKAZA'
        Title.Caption = #1044#1090#1055#1088#1055#1088#1084
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_PRUVOLN'
        Title.Caption = #8470#1055#1088#1059#1074#1083#1085
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PRUVOLN'
        Title.Caption = #1044#1090#1055#1088#1059#1074#1083#1085
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Title.Caption = #1055#1088#1080#1084#1077#1095'.'
        Width = 58
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 236
    Width = 510
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      510
      28)
    object LabelMsg: TLabel
      Left = 3
      Top = 8
      Width = 46
      Height = 13
      Caption = 'LabelMsg'
    end
    object bBtnOk: TBitBtn
      Left = 354
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 434
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryId: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'Select u.TabN, u.Id, u.Fam, u.Ima, u.Otch, u.Pol, count(n.NR) as' +
        ' CNT'
      ' from Z_Upi u Left outer join z_NU n on n.TabN = u.TabN '
      'where u.ID = '#39'0934700103'#39
      'group by u.TabN, u.Id, u.Fam, u.Ima, u.Otch, u.Pol')
    Left = 40
    Top = 40
  end
  object qryPrmUv: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select * from z_prmUv'
      'where TabN = :TabN'
      'order by Dt_Priem')
    Left = 32
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object dsrcPrmUv: TDataSource
    DataSet = qryPrmUv
    Left = 56
    Top = 192
  end
  object dsrcId: TDataSource
    DataSet = qryId
    Left = 56
    Top = 56
  end
end
