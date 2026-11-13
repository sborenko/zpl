object FormShwZprRes: TFormShwZprRes
  Left = 311
  Top = 128
  Width = 700
  Height = 470
  BorderIcons = [biSystemMenu]
  Caption = 'FormShwZprRes'
  Color = clBtnFace
  Constraints.MaxWidth = 840
  Constraints.MinHeight = 470
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      692
      31)
    object sBtnPrt: TSpeedButton
      Left = 3
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
      OnClick = sBtnPrtClick
    end
    object LabelInf: TLabel
      Left = 176
      Top = 10
      Width = 255
      Height = 13
      Caption = #1047#1072#1087#1080#1089#1077#1081' 5500, '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' 5000. '#1057#1091#1084#1084#1072' 67567.00'
    end
    object BitBtn1: TBitBtn
      Left = 613
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      Kind = bkCancel
      Spacing = 0
    end
    object DBNavigator1: TDBNavigator
      Left = 81
      Top = 3
      Width = 80
      Height = 25
      DataSource = dsrcTmp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
  end
  object dbgrTmp: TDBGrid
    Left = 0
    Top = 31
    Width = 692
    Height = 412
    Align = alClient
    DataSource = dsrcTmp
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDKDVIDN'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHVIDN'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHAS'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PDN'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 36
        Visible = True
      end>
  end
  object qryTmp: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, nu.* '
      'from viNu4 nu'
      '  Left Outer join z_Upi u on u.TabN = nu.TabN '
      'where nu.DtProc = '#39'06/01/2006'#39' and nu.VidN = '#39'1003'#39)
    Left = 24
    Top = 120
  end
  object cdsTmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTmp'
    OnCalcFields = cdsTmpCalcFields
    Left = 24
    Top = 168
    object cdsTmpFAM: TStringField
      DisplayWidth = 24
      FieldName = 'FAM'
    end
    object cdsTmpIMA: TStringField
      DisplayWidth = 18
      FieldName = 'IMA'
      Size = 15
    end
    object cdsTmpOTCH: TStringField
      DisplayWidth = 24
      FieldName = 'OTCH'
    end
    object cdsTmpFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object cdsTmpPSCH: TStringField
      DisplayLabel = #1057#1080#1085#1090#1057#1095
      DisplayWidth = 12
      FieldName = 'PSCH'
      Size = 10
    end
    object cdsTmpSCHBU: TStringField
      DisplayLabel = #1057#1095#1041#1059
      DisplayWidth = 12
      FieldName = 'SCHBU'
      Size = 10
    end
    object cdsTmpNMSCH: TStringField
      DisplayWidth = 78
      FieldName = 'NMSCH'
      Size = 65
    end
    object cdsTmpSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      DisplayWidth = 18
      FieldName = 'SHVIDN'
      Size = 15
    end
    object cdsTmpNMVIDN: TStringField
      DisplayWidth = 77
      FieldName = 'NMVIDN'
      Size = 64
    end
    object cdsTmpOLDKDVIDN: TSmallintField
      DisplayLabel = #1057#1090#1042#1080#1076
      DisplayWidth = 13
      FieldName = 'OLDKDVIDN'
    end
    object cdsTmpVID_KDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'VID_KDSPZ'
    end
    object cdsTmpKEKV: TStringField
      DisplayWidth = 6
      FieldName = 'KEKV'
      FixedChar = True
      Size = 4
    end
    object cdsTmpNR: TIntegerField
      DisplayWidth = 12
      FieldName = 'NR'
    end
    object cdsTmpDTPROC: TDateTimeField
      DisplayLabel = #1056'.'#1052#1077#1089
      DisplayWidth = 22
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object cdsTmpZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1077#1089#1043#1086#1076
      DisplayWidth = 22
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object cdsTmpTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      DisplayWidth = 12
      FieldName = 'TABN'
    end
    object cdsTmpVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 5
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object cdsTmpCHAS: TFloatField
      DisplayLabel = #1063#1072#1089#1099
      DisplayWidth = 12
      FieldName = 'CHAS'
    end
    object cdsTmpSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SUMMA'
      DisplayFormat = '#.00'
    end
    object cdsTmpDT_BEG: TDateTimeField
      DisplayLabel = #1044#1090#1053#1072#1095#1072#1083#1072
      DisplayWidth = 22
      FieldName = 'DT_BEG'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsTmpDT_END: TDateTimeField
      DisplayLabel = #1044#1090#1054#1082#1086#1085#1095'.'
      DisplayWidth = 22
      FieldName = 'DT_END'
      DisplayFormat = 'dd/mm/yy'
    end
    object cdsTmpKDSPS: TSmallintField
      DisplayLabel = #1050#1076#1057#1087#1089
      DisplayWidth = 12
      FieldName = 'KDSPS'
    end
    object cdsTmpKDOBJ: TSmallintField
      DisplayLabel = #1050#1076#1055#1076#1088
      DisplayWidth = 12
      FieldName = 'KDOBJ'
    end
    object cdsTmpKDKATP: TSmallintField
      DisplayLabel = #1050#1076#1050#1090#1075#1088#1055#1077#1088#1089
      DisplayWidth = 12
      FieldName = 'KDKATP'
    end
    object cdsTmpKDSPZ: TSmallintField
      DisplayWidth = 12
      FieldName = 'KDSPZ'
    end
    object cdsTmpPDN: TSmallintField
      DisplayLabel = #1055#1053
      DisplayWidth = 12
      FieldName = 'PDN'
    end
    object cdsTmpNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      DisplayWidth = 30
      FieldName = 'NOTES'
      Size = 25
    end
    object cdsTmpPRR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRR'
    end
    object cdsTmpPRPV: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRPV'
    end
    object cdsTmpKTO: TSmallintField
      DisplayWidth = 12
      FieldName = 'KTO'
    end
    object cdsTmpPRKR: TSmallintField
      DisplayWidth = 12
      FieldName = 'PRKR'
    end
    object cdsTmpMYNOTES: TStringField
      DisplayWidth = 30
      FieldName = 'MYNOTES'
      Size = 25
    end
    object cdsTmpSPECPS: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPECPS'
    end
    object cdsTmpSPEC_NR: TIntegerField
      DisplayWidth = 12
      FieldName = 'SPEC_NR'
    end
    object cdsTmpOLDKDOBJ: TSmallintField
      DisplayWidth = 12
      FieldName = 'OLDKDOBJ'
    end
  end
  object dspTmp: TDataSetProvider
    DataSet = qryTmp
    Left = 64
    Top = 120
  end
  object dsrcTmp: TDataSource
    DataSet = cdsTmp
    Left = 40
    Top = 176
  end
end
