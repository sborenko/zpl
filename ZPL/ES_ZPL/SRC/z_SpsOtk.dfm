object FormSpsOtkl: TFormSpsOtkl
  Left = 317
  Top = 273
  Width = 750
  Height = 550
  ActiveControl = dbgrGrp
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsOtkl'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 750
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
    Left = 289
    Top = 31
    Height = 492
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      31)
    object sBtnLink: TSpeedButton
      Left = 292
      Top = 3
      Width = 77
      Height = 25
      Hint = #1057#1074#1103#1079#1072#1090#1100' '#1087#1088#1072#1074#1091#1102' '#1090#1072#1073#1083#1080#1094#1091' '#1089' '#1083#1077#1074#1086#1081
      AllowAllUp = True
      GroupIndex = 3
      Down = True
      Caption = #1057#1074#1103#1079#1082#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sBtnLinkClick
    end
    object sBtnSortByTabN: TSpeedButton
      Left = 420
      Top = 3
      Width = 42
      Height = 25
      Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1090#1072#1073#1077#1083#1100#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      GroupIndex = 4
      Down = True
      Caption = #1058#1072#1073#1053
      NumGlyphs = 2
      OnClick = sBtnSortClick
    end
    object sBtnSortByFIO: TSpeedButton
      Left = 464
      Top = 3
      Width = 42
      Height = 25
      Hint = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080', '#1086#1090#1095#1077#1089#1090#1074#1091
      GroupIndex = 4
      Caption = #1060#1048#1054
      OnClick = sBtnSortClick
    end
    object BitBtn1: TBitBtn
      Left = 664
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
  end
  object dbgrGrp: TDBGrid
    Left = 0
    Top = 31
    Width = 289
    Height = 492
    Align = alLeft
    Color = clInfoBk
    Constraints.MaxWidth = 350
    Constraints.MinWidth = 250
    DataSource = dsrcGrp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SMM'
        Width = 73
        Visible = True
      end>
  end
  object dbgrDet: TDBGrid
    Left = 292
    Top = 31
    Width = 450
    Height = 492
    Align = alClient
    Color = clInfoBk
    DataSource = dsrcDet
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrDetDrawColumnCell
    OnEnter = dbGridEnter
    OnExit = dbGridExit
    Columns = <
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 14
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 11
        Visible = True
      end>
  end
  object qryGrp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select DtProc, VidN, ShVidN, PSCH, Count(VidN) as CNT, '
      '           Sum(Summa)  as SMM'
      'from ViOtkl'
      'where DtProc = '#39'04/01/2007'#39' and KdSps = 3 and Summa <> 0'
      'group by DtProc, VidN, ShVidN, PSCH')
    Left = 80
    Top = 144
    object qryGrpDTPROC: TDateTimeField
      DisplayWidth = 12
      FieldName = 'DTPROC'
    end
    object qryGrpVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 6
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryGrpSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 22
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryGrpPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 6
      FieldName = 'PSCH'
      Size = 10
    end
    object qryGrpCNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1080#1089#1077#1081
      DisplayWidth = 9
      FieldName = 'CNT'
    end
    object qryGrpSMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldName = 'SMM'
      DisplayFormat = '0.00'
    end
  end
  object dsrcGrp: TDataSource
    DataSet = qryGrp
    Left = 96
    Top = 160
  end
  object qryDet: TQuery
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcGrp
    SQL.Strings = (
      
        'Select n.NR, n.TabN, u.Fam, u.Ima, u.Otch, n.SchBU, n.ZaMesGod, ' +
        'n.Chas, '
      
        '           n.Summa,  n.Dt_Beg, n.Dt_End, n.KdObj, n.KdKatP, n.Pd' +
        'n, n.Notes'
      ' from viOtkl n Left outer join z_Upi u on u.TabN = n.TabN'
      ' where n.KdSps = 3 and n.DtProc = '#39'04/01/2007'#39' and'
      '           n.VidN = :VidN and n.Summa <> 0'
      'order by n.TabN'
      '')
    Left = 312
    Top = 136
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'VIDN'
        ParamType = ptUnknown
        Size = 5
      end>
    object qryDetTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryDetFAM: TStringField
      FieldName = 'FAM'
    end
    object qryDetIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryDetFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryDetOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryDetSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryDetZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryDetCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      FieldName = 'CHAS'
    end
    object qryDetSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object qryDetDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryDetDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryDetKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
    end
    object qryDetKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1088#1055
      FieldName = 'KDKATP'
    end
    object qryDetPDN: TSmallintField
      DisplayLabel = #1055#1053
      FieldName = 'PDN'
    end
    object qryDetNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Size = 25
    end
    object qryDetNR: TIntegerField
      FieldName = 'NR'
    end
  end
  object dsrcDet: TDataSource
    DataSet = qryDet
    Left = 328
    Top = 152
  end
end
