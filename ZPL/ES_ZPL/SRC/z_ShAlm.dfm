object FormShwAlm: TFormShwAlm
  Left = 301
  Top = 223
  Width = 700
  Height = 355
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwAlm'
  Color = clBtnFace
  Constraints.MaxHeight = 800
  Constraints.MaxWidth = 895
  Constraints.MinHeight = 300
  Constraints.MinWidth = 700
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
    Left = 182
    Top = 30
    Height = 291
    Beveled = True
  end
  object dbgrAlm: TDBGrid
    Left = 0
    Top = 30
    Width = 182
    Height = 291
    Hint = #1041#1083#1077#1076#1085#1099#1084' '#1096#1088#1080#1092#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' '#1091#1074#1086#1083#1077#1085#1085#1099#1077
    Align = alLeft
    DataSource = dsrcAlm
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrAlmDrawColumnCell
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
        Width = 104
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      692
      30)
    object LabelCntAlmRec: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'LabelCntAlmRec'
    end
    object sBtnPrt: TSpeedButton
      Left = 349
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = sBtnPrtClick
    end
    object bBtnExit: TBitBtn
      Left = 614
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkClose
    end
    object rBtnAll: TRadioButton
      Left = 562
      Top = 8
      Width = 40
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1074#1089#1077#1093
      TabOrder = 1
    end
    object rBtnNeUvoln: TRadioButton
      Left = 425
      Top = 8
      Width = 130
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = ' '#1090#1086#1083#1100#1082#1086' '#1053#1077#1059#1074#1086#1083#1077#1085#1085#1099#1093
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object dbgrUdrg: TDBGrid
    Left = 185
    Top = 30
    Width = 507
    Height = 291
    Hint = #1052#1072#1083#1080#1085#1086#1074#1099#1084' '#1094#1074#1077#1090#1086#1084' '#1074#1099#1076#1077#1083#1077#1085#1099' "'#1073#1086#1077#1074#1099#1077'" '#1079#1072#1087#1080#1089#1080
    Align = alClient
    DataSource = dsrcUdrg
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrUdrgDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMVZN'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMDOK'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOMU'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShPst'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrcPsb'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 45
        Visible = True
      end>
  end
  object qryAlm: TQuery
    CachedUpdates = True
    OnCalcFields = qryAlmCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select distinct ud.Tabn, upi.Fam, upi.Ima, upi.Otch, '
      '                       cast(null as char(1)) as uvolen'
      ' from Z_Uderg ud'
      '  Left Outer Join z_Upi upi on upi.TabN = ud.Tabn'
      'where ud.VidN = '#39'6601'#39' and not upi.Fam is null'
      'order by Fam, Ima, Otch'
      ''
      '')
    UpdateObject = updAlm
    Left = 72
    Top = 64
    object qryAlmTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      DisplayWidth = 7
      FieldName = 'TABN'
    end
    object qryAlmFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object qryAlmIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object qryAlmOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object qryAlmFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryAlmUVOLEN: TStringField
      FieldName = 'UVOLEN'
      FixedChar = True
      Size = 1
    end
  end
  object dsrcAlm: TDataSource
    DataSet = qryAlm
    Left = 88
    Top = 80
  end
  object qryUdrg: TQuery
    OnCalcFields = qryUdrgCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcAlm
    SQL.Strings = (
      'Select * from Z_Uderg'
      'where TabN = :TabN and VidN = '#39'6101'#39
      'order by Dt_Beg')
    Left = 240
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TABN'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryUdrgNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryUdrgKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_UDERG.KDSPS'
    end
    object qryUdrgTABN: TIntegerField
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UDERG.TABN'
    end
    object qryUdrgVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_UDERG.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryUdrgOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_UDERG.OLDKDVIDN'
    end
    object qryUdrgSUMDOLG: TFloatField
      FieldName = 'SUMDOLG'
      Origin = 'DbMain.Z_UDERG.SUMDOLG'
    end
    object qryUdrgSUMVZN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMVZN'
      Origin = 'DbMain.Z_UDERG.SUMVZN'
      DisplayFormat = '#.00'
    end
    object qryUdrgSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_UDERG.SPSRSCH'
    end
    object qryUdrgSP: TStringField
      DisplayLabel = #1088'/%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_UDERG.SP'
      Size = 1
    end
    object qryUdrgNOMDOK: TStringField
      DisplayLabel = #8470' '#1076#1086#1082'-'#1090#1072
      FieldName = 'NOMDOK'
      Origin = 'DbMain.Z_UDERG.NOMDOK'
      Size = 10
    end
    object qryUdrgDT_BEG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072#1053#1072#1095#1072#1083#1072
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_UDERG.DT_BEG'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryUdrgDT_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_UDERG.DT_END'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryUdrgKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_UDERG.KDSPZ'
    end
    object qryUdrgKOMU: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'KOMU'
      Origin = 'DbMain.Z_UDERG.KOMU'
      Size = 95
    end
    object qryUdrgADRES: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_UDERG.ADRES'
      Size = 250
    end
    object qryUdrgKDRSSCH: TIntegerField
      FieldName = 'KDRSSCH'
      Origin = 'DbMain.Z_UDERG.KDRSSCH'
    end
    object qryUdrgKDPST: TIntegerField
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_UDERG.KDPST'
    end
    object qryUdrgShPst: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072
      FieldKind = fkCalculated
      FieldName = 'ShPst'
      Size = 10
      Calculated = True
    end
    object qryUdrgPrcPsb: TFloatField
      DisplayLabel = '%'#1087#1057#1073
      FieldKind = fkCalculated
      FieldName = 'PrcPsb'
      Calculated = True
    end
    object qryUdrgPOSTA: TStringField
      FieldName = 'POSTA'
      Origin = 'DbMain.Z_UDERG.POSTA'
      FixedChar = True
      Size = 1
    end
    object qryUdrgNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_UDERG.NOTES'
      Size = 150
    end
    object qryUdrgNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Origin = 'DbMain.Z_UDERG.NOMSBERBANK'
      Size = 15
    end
    object qryUdrgLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Origin = 'DbMain.Z_UDERG.LICSCHET'
      Size = 15
    end
    object qryUdrgRSCHET: TStringField
      FieldName = 'RSCHET'
      Origin = 'DbMain.Z_UDERG.RSCHET'
      Size = 15
    end
    object qryUdrgBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.Z_UDERG.BANK'
      Size = 55
    end
    object qryUdrgOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Origin = 'DbMain.Z_UDERG.OKPOBANKA'
      Size = 15
    end
    object qryUdrgPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
      Origin = 'DbMain.Z_UDERG.PROC_PSB'
    end
    object qryUdrgSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_UDERG.SPEC_NR'
    end
  end
  object dsrcUdrg: TDataSource
    DataSet = qryUdrg
    Left = 256
    Top = 112
  end
  object qryTmp: TQuery
    Left = 224
    Top = 192
  end
  object updAlm: TUpdateSQL
    ModifySQL.Strings = (
      'update Z_Uderg'
      'set'
      '  UVOLEN = :UVOLEN'
      'where'
      '  TABN = :OLD_TABN')
    InsertSQL.Strings = (
      'insert into Z_Uderg'
      '  (UVOLEN)'
      'values'
      '  (:UVOLEN)')
    DeleteSQL.Strings = (
      'delete from Z_Uderg'
      'where'
      '  TABN = :OLD_TABN')
    Left = 104
    Top = 96
  end
end
