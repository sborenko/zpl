object FormSpsNadb: TFormSpsNadb
  Left = 163
  Top = 160
  Width = 940
  Height = 626
  ActiveControl = dbgrGrp
  BorderIcons = [biSystemMenu]
  Caption = 'FormSpsNadb'
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
    Left = 247
    Top = 31
    Height = 568
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 932
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      932
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
      Left = 854
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
  object dbgrDet: TDBGrid
    Left = 250
    Top = 31
    Width = 682
    Height = 568
    Hint = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074', '#1080#1084#1077#1102#1097#1080#1093' '#1085#1072#1076#1073#1072#1074#1082#1091' '#1080#1079' '#1083#1077#1074#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
    Align = alClient
    Color = clCream
    DataSource = dsrcDet
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
        FieldName = 'KDSPS'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMPROC'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPRBEG'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 55
        Visible = True
      end>
  end
  object dbgrGrp: TDBGrid
    Left = 0
    Top = 31
    Width = 247
    Height = 568
    Hint = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1080#1077' '#1085#1072#1076#1073#1072#1074#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
    Align = alLeft
    Color = clInfoBk
    Constraints.MaxWidth = 255
    Constraints.MinWidth = 235
    DataSource = dsrcGrp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
        FieldName = 'VidN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShVidN'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Width = 45
        Visible = True
      end>
  end
  object qryDet: TQuery
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select n.TabN, s.TabN as s_TabN, s.KdSps as s_Sps,'
      ' u.Fam, u.Ima, u.Otch, n.NR, n.KdSps, n.SpsRsch,'
      ' n.VidN, v.ShVidN, n.SP, n.SumProc, n.Dt_Beg, n.Dt_End,'
      ' n.KdObj, n.KdSpZ, sbu.SchBU, sbu.PSCH, n.NrPrBeg, n.Notes'
      ' from z_Nadb n Left outer join z_Sps s on s.TabN = n.TabN and'
      '                                  s.DtProc = "06/01/2007"'
      ' Left Outer Join z_Upi u on u.TabN = n.TabN'
      ' Left Outer Join Kd_Sbu sbu on sbu.KdSch = n.KdSpZ'
      ' Left outer join z_KdVidN v on v.VidN = n.VidN'
      ' where (n.kdSps = 4) and (not n.Dt_Beg is null) and'
      ' (n.Dt_Beg <= "06/30/2007") and'
      ' (n.Dt_End is null or n.Dt_End >= "06/01/2007")'
      'order by n.TabN, n.VidN'
      '')
    Left = 448
    Top = 120
    object qryDetFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryDetTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 7
      FieldName = 'TABN'
    end
    object qryDetFAM: TStringField
      DisplayWidth = 17
      FieldName = 'FAM'
    end
    object qryDetIMA: TStringField
      DisplayWidth = 15
      FieldName = 'IMA'
      Size = 15
    end
    object qryDetOTCH: TStringField
      DisplayWidth = 20
      FieldName = 'OTCH'
    end
    object qryDetNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object qryDetKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089#1082
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object qryDetSPSRSCH: TSmallintField
      DisplayWidth = 12
      FieldName = 'SPSRSCH'
    end
    object qryDetVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryDetSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 18
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryDetSP: TStringField
      DisplayLabel = '%/'#1088
      DisplayWidth = 3
      FieldName = 'SP'
      Size = 1
    end
    object qryDetSUMPROC: TFloatField
      DisplayLabel = #1057#1084#1084'/'#1055#1088#1094
      DisplayWidth = 12
      FieldName = 'SUMPROC'
      DisplayFormat = '0.00'
    end
    object qryDetDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryDetDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      DisplayWidth = 22
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryDetKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088#1079#1076
      FieldName = 'KDOBJ'
    end
    object qryDetKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryDetSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1077#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryDetNRPRBEG: TStringField
      DisplayLabel = #8470#1087#1088#1053#1072#1095#1072#1083#1072
      FieldName = 'NRPRBEG'
      FixedChar = True
      Size = 10
    end
    object qryDetNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTES'
      Size = 25
    end
    object qryDetS_TABN: TIntegerField
      FieldName = 'S_TABN'
    end
    object qryDetPSCH: TStringField
      FieldName = 'PSCH'
      Size = 10
    end
  end
  object dsrcDet: TDataSource
    DataSet = qryDet
    Left = 456
    Top = 136
  end
  object cdsGrp: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'VidN'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ShVidN'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PSCH'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CNT'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 40
    Top = 160
    object cdsGrpNR: TAutoIncField
      FieldName = 'NR'
    end
    object cdsGrpVidN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VidN'
      Size = 4
    end
    object cdsGrpShVidN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'ShVidN'
      Size = 15
    end
    object cdsGrpPSCH: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsGrpSP: TStringField
      DisplayLabel = '%/'#1056
      FieldName = 'SP'
      Size = 1
    end
    object cdsGrpCNT: TSmallintField
      DisplayLabel = #1050'-'#1074#1086
      FieldName = 'CNT'
    end
  end
  object dsrcGrp: TDataSource
    DataSet = cdsGrp
    Left = 56
    Top = 176
  end
  object qryTmp: TQuery
    Left = 16
    Top = 128
  end
end
