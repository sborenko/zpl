object FormShPvd: TFormShPvd
  Left = 328
  Top = 226
  Width = 775
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'FormShPvd'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 775
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
  object dbgrPvd: TDBGrid
    Left = 0
    Top = 31
    Width = 767
    Height = 285
    Align = alClient
    DataSource = dsrcPvd
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
        FieldName = 'TABN'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMVZN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPSRSCH'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMDOK'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOMU'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDPST'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 54
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      767
      31)
    object sBtnPrt: TSpeedButton
      Left = 5
      Top = 3
      Width = 75
      Height = 25
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
      Visible = False
      OnClick = sBtnPrtClick
    end
    object Label1: TLabel
      Left = 109
      Top = -1
      Width = 121
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1074#1099#1074#1086#1076#1072' '#1076#1072#1085#1085#1099#1093':'
    end
    object bBtnCancel: TBitBtn
      Left = 690
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
    object rBtnAll6611: TRadioButton
      Left = 105
      Top = 13
      Width = 46
      Height = 17
      Hint = #1042#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1074#1080#1076#1091' 6611 "'#1055#1086#1095#1090#1086#1074#1099#1077' '#1087#1077#1088#1077#1074#1086#1076#1099'"'
      Alignment = taLeftJustify
      Caption = '- '#1074#1089#1077
      Checked = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnClick = rBtnOnlyActualClick
    end
    object rBtnOnlyActual: TRadioButton
      Left = 163
      Top = 13
      Width = 123
      Height = 17
      Hint = #1058#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1080', '#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
      Alignment = taLeftJustify
      Caption = '- '#1090#1086#1083#1100#1082#1086' '#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = rBtnOnlyActualClick
    end
  end
  object qryPvd: TQuery
    OnCalcFields = qryPvdCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'select u.Fam, u.Ima, u.Otch, ud.* '
      'from z_Uderg ud Left Outer Join z_Upi u on u.TabN = ud.TabN'
      'where ud.VidN = '#39'6611'#39
      'order by ud.TabN')
    Left = 80
    Top = 112
    object qryPvdNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_UDERG.NR'
    end
    object qryPvdKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_UDERG.KDSPS'
    end
    object qryPvdTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053
      FieldName = 'TABN'
      Origin = 'DbMain.Z_UDERG.TABN'
    end
    object qryPvdFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryPvdVIDN: TStringField
      FieldName = 'VIDN'
      Origin = 'DbMain.Z_UDERG.VIDN'
      FixedChar = True
      Size = 4
    end
    object qryPvdOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
      Origin = 'DbMain.Z_UDERG.OLDKDVIDN'
    end
    object qryPvdSUMDOLG: TFloatField
      FieldName = 'SUMDOLG'
      Origin = 'DbMain.Z_UDERG.SUMDOLG'
    end
    object qryPvdSUMVZN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072'(%)'
      FieldName = 'SUMVZN'
      Origin = 'DbMain.Z_UDERG.SUMVZN'
    end
    object qryPvdSPSRSCH: TSmallintField
      DisplayLabel = #1040#1083#1075#1056
      FieldName = 'SPSRSCH'
      Origin = 'DbMain.Z_UDERG.SPSRSCH'
    end
    object qryPvdSP: TStringField
      DisplayLabel = '%'
      FieldName = 'SP'
      Origin = 'DbMain.Z_UDERG.SP'
      Size = 1
    end
    object qryPvdNOMDOK: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'NOMDOK'
      Origin = 'DbMain.Z_UDERG.NOMDOK'
      Size = 10
    end
    object qryPvdDT_BEG: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1085#1072#1103' '#1089':'
      FieldName = 'DT_BEG'
      Origin = 'DbMain.Z_UDERG.DT_BEG'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPvdDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      FieldName = 'DT_END'
      Origin = 'DbMain.Z_UDERG.DT_END'
      EditMask = '!99/99/9999;1;_'
    end
    object qryPvdKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
      Origin = 'DbMain.Z_UDERG.KDSPZ'
    end
    object qryPvdKDRSSCH: TIntegerField
      FieldName = 'KDRSSCH'
      Origin = 'DbMain.Z_UDERG.KDRSSCH'
    end
    object qryPvdKOMU: TStringField
      DisplayLabel = #1050#1086#1084#1091
      FieldName = 'KOMU'
      Origin = 'DbMain.Z_UDERG.KOMU'
      Size = 95
    end
    object qryPvdADRES: TStringField
      DisplayLabel = #1055#1086#1095#1090'.'#1072#1076#1088#1077#1089
      FieldName = 'ADRES'
      Origin = 'DbMain.Z_UDERG.ADRES'
      Size = 250
    end
    object qryPvdKDPST: TIntegerField
      DisplayLabel = #1050#1086#1076#1055#1086#1095#1090#1099
      FieldName = 'KDPST'
      Origin = 'DbMain.Z_UDERG.KDPST'
    end
    object qryPvdPOSTA: TStringField
      FieldName = 'POSTA'
      Origin = 'DbMain.Z_UDERG.POSTA'
      FixedChar = True
      Size = 1
    end
    object qryPvdNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_UDERG.NOTES'
      Size = 150
    end
    object qryPvdNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Origin = 'DbMain.Z_UDERG.NOMSBERBANK'
      Size = 15
    end
    object qryPvdLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Origin = 'DbMain.Z_UDERG.LICSCHET'
      Size = 15
    end
    object qryPvdRSCHET: TStringField
      FieldName = 'RSCHET'
      Origin = 'DbMain.Z_UDERG.RSCHET'
      Size = 15
    end
    object qryPvdBANK: TStringField
      FieldName = 'BANK'
      Origin = 'DbMain.Z_UDERG.BANK'
      Size = 55
    end
    object qryPvdOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Origin = 'DbMain.Z_UDERG.OKPOBANKA'
      Size = 15
    end
    object qryPvdPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
      Origin = 'DbMain.Z_UDERG.PROC_PSB'
    end
    object qryPvdSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
      Origin = 'DbMain.Z_UDERG.SPEC_NR'
    end
    object qryPvdFAM: TStringField
      FieldName = 'FAM'
    end
    object qryPvdIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryPvdOTCH: TStringField
      FieldName = 'OTCH'
    end
  end
  object dsrcPvd: TDataSource
    DataSet = qryPvd
    Left = 96
    Top = 128
  end
end
