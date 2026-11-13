object FormSh_NU: TFormSh_NU
  Left = 256
  Top = 162
  Width = 654
  Height = 440
  ActiveControl = dbgrTmp
  BorderIcons = [biSystemMenu]
  Caption = 'FormSh_NU'
  Color = clBtnFace
  Constraints.MinHeight = 285
  Constraints.MinWidth = 525
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    646
    413)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1
    Top = 385
    Width = 293
    Height = 27
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 
      #1055#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' '#1082#1085#1086#1087#1082#1080' "'#1042#1074#1086#1076'" '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1077#1088#1077#1089#1095#1077#1090#1072' '#1073#1091#1076#1091#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1099' ' +
      #1082' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1084#1077#1089#1103#1094#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 0
    Width = 646
    Height = 382
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrcTmp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ZaMesGod'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdVidN'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdObj'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KdKatP'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PdN'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPZ'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt_Beg'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dt_End'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldCh'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldSm'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chas'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dCh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dSm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end>
  end
  object bBtnCancel: TBitBtn
    Left = 569
    Top = 385
    Width = 76
    Height = 26
    Anchors = [akRight]
    Caption = #1054#1090#1082#1072#1079
    TabOrder = 2
    Kind = bkCancel
  end
  object bBtnOk: TBitBtn
    Left = 492
    Top = 385
    Width = 75
    Height = 25
    Anchors = [akRight]
    Caption = #1042#1074#1086#1076
    TabOrder = 1
    Kind = bkOK
  end
  object dsrcTmp: TDataSource
    DataSet = tblTmp
    Left = 80
    Top = 88
  end
  object tblTmp: TTable
    OnCalcFields = tblTmpCalcFields
    DatabaseName = 'Es_Ind'
    Filter = 'ZaMesGod <> 01-02-2004'
    TableName = 't_ShReRe'
    Left = 56
    Top = 64
    object tblTmpNR: TAutoIncField
      DisplayWidth = 5
      FieldName = 'NR'
      ReadOnly = True
    end
    object tblTmpDtProc: TDateField
      DisplayWidth = 12
      FieldName = 'DtProc'
    end
    object tblTmpZaMesGod: TDateField
      DisplayLabel = #1047#1072#1052#1077#1089
      DisplayWidth = 12
      FieldName = 'ZaMesGod'
      DisplayFormat = 'mm-yyyy'
    end
    object tblTmpKdVidN: TSmallintField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 12
      FieldName = 'KdVidN'
    end
    object tblTmpShVidN: TStringField
      DisplayLabel = #1064#1080#1092#1088#1042#1080#1076#1072
      FieldKind = fkLookup
      FieldName = 'ShVidN'
      LookupKeyFields = 'KDVIDN'
      LookupResultField = 'SHVIDN'
      KeyFields = 'KdVidN'
      Size = 15
      Lookup = True
    end
    object tblTmpKdObj: TSmallintField
      DisplayLabel = #1055#1076#1088
      DisplayWidth = 12
      FieldName = 'KdObj'
    end
    object tblTmpKdKatP: TSmallintField
      DisplayLabel = #1050#1090#1075
      DisplayWidth = 12
      FieldName = 'KdKatP'
    end
    object tblTmpPdN: TSmallintField
      DisplayLabel = #1055#1053
      DisplayWidth = 12
      FieldName = 'PdN'
    end
    object tblTmpSPZ: TStringField
      DisplayLabel = #1064#1055#1047
      DisplayWidth = 12
      FieldName = 'SPZ'
      Size = 10
    end
    object tblTmpPrPV: TSmallintField
      DisplayWidth = 12
      FieldName = 'PrPV'
    end
    object tblTmpDt_Beg: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'Dt_Beg'
      DisplayFormat = 'dd-mm-yy'
    end
    object tblTmpDt_End: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095
      DisplayWidth = 22
      FieldName = 'Dt_End'
      DisplayFormat = 'dd-mm-yy'
    end
    object tblTmpOldCh: TFloatField
      DisplayLabel = #1063#1072#1089#1099#1057#1090#1072#1088
      DisplayWidth = 12
      FieldName = 'OldCh'
      DisplayFormat = '#.##'
    end
    object tblTmpOldSm: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072#1057#1090#1072#1088
      DisplayWidth = 12
      FieldName = 'OldSm'
      DisplayFormat = '0.00'
    end
    object tblTmpChas: TFloatField
      DisplayLabel = #1063#1072#1089#1099#1053#1086#1074
      DisplayWidth = 12
      FieldName = 'Chas'
      DisplayFormat = '#.##'
    end
    object tblTmpSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072#1053#1086#1074
      DisplayWidth = 12
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object tblTmpd_Ch: TFloatField
      DisplayWidth = 12
      FieldName = 'd_Ch'
    end
    object tblTmpd_Sm: TFloatField
      DisplayWidth = 12
      FieldName = 'd_Sm'
    end
    object tblTmpSpec_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'Spec_NR'
    end
    object tblTmpNotes: TStringField
      DisplayWidth = 16
      FieldName = 'Notes'
      Size = 13
    end
    object tblTmpdCh: TFloatField
      DisplayLabel = 'd_'#1063#1072#1089#1086#1074
      FieldKind = fkCalculated
      FieldName = 'dCh'
      DisplayFormat = '#.##'
      Calculated = True
    end
    object tblTmpdSm: TFloatField
      DisplayLabel = 'd_'#1057#1091#1084#1084#1099
      FieldKind = fkCalculated
      FieldName = 'dSm'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
end
