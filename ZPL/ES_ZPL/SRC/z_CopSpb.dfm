object FormGetCopySpb: TFormGetCopySpb
  Left = 314
  Top = 341
  Width = 900
  Height = 430
  BorderIcons = [biSystemMenu]
  Caption = 'FormGetCopySpb'
  Color = clBtnFace
  Constraints.MaxHeight = 735
  Constraints.MaxWidth = 1020
  Constraints.MinHeight = 430
  Constraints.MinWidth = 900
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
    Left = 271
    Top = 31
    Height = 372
    Beveled = True
    Color = clTeal
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      892
      31)
    object bBtnOk: TBitBtn
      Left = 719
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088
      TabOrder = 0
      Kind = bkOK
    end
    object bBtnCancel: TBitBtn
      Left = 815
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1072#1079
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 31
    Width = 271
    Height = 372
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object dbgrVed: TDBGrid
      Left = 0
      Top = 0
      Width = 271
      Height = 372
      Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1080'"'
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsrcVed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrVedDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DTPROC'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMUSR'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEDNR'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VEDDATE'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOTES'
          Width = 40
          Visible = True
        end>
    end
  end
  object dbgrOtkl: TDBGrid
    Left = 274
    Top = 31
    Width = 618
    Height = 372
    Hint = #1058#1072#1073#1083#1080#1094#1072' "'#1054#1090#1082#1083#1086#1085#1077#1085#1080#1103'" '#1087#1086' '#1090#1077#1082#1091#1097#1077#1081' "'#1057#1087#1077#1094#1042#1077#1076#1086#1084#1086#1089#1090#1080'"'
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsrcOtkl
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrOtklDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDSPS'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 82
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
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDBNK'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICSCH'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDOBJ'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDKATP'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHBU'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSCH'
        Width = 38
        Visible = True
      end>
  end
  object qryVed: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select us.NmUsr, v.* '
      'from z_VedNR v '
      'Left Outer Join Usrs us on us.KdUsr =v.KdUsr'
      ' where v.typeVed = '#39'VedSpB'#39
      '')
    Left = 208
    Top = 183
    object qryVedNR: TIntegerField
      FieldName = 'NR'
      Origin = 'DbMain.Z_VEDNR.NR'
    end
    object qryVedDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      Origin = 'DbMain.Z_VEDNR.DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryVedKDUSR: TSmallintField
      FieldName = 'KDUSR'
      Origin = 'DbMain.Z_VEDNR.KDUSR'
    end
    object qryVedNMUSR: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'NMUSR'
      Size = 25
    end
    object qryVedKDSPS: TSmallintField
      FieldName = 'KDSPS'
      Origin = 'DbMain.Z_VEDNR.KDSPS'
    end
    object qryVedTYPEVED: TStringField
      FieldName = 'TYPEVED'
      Origin = 'DbMain.Z_VEDNR.TYPEVED'
      FixedChar = True
      Size = 12
    end
    object qryVedVEDNR: TIntegerField
      DisplayLabel = #1042#1077#1076#1053#1088
      FieldName = 'VEDNR'
      Origin = 'DbMain.Z_VEDNR.VEDNR'
    end
    object qryVedVEDDATE: TDateTimeField
      DisplayLabel = #1042#1077#1076#1044#1090
      FieldName = 'VEDDATE'
      Origin = 'DbMain.Z_VEDNR.VEDDATE'
      DisplayFormat = 'dd/mm/yy'
    end
    object qryVedNOTES: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095'.'
      FieldName = 'NOTES'
      Origin = 'DbMain.Z_VEDNR.NOTES'
      Size = 35
    end
    object qryVedPRPODKL: TSmallintField
      FieldName = 'PRPODKL'
      Origin = 'DbMain.Z_VEDNR.PRPODKL'
    end
    object qryVedBNKNRPRDF: TSmallintField
      FieldName = 'BNKNRPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNRPRDF'
    end
    object qryVedBNKDTPRDF: TDateTimeField
      FieldName = 'BNKDTPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKDTPRDF'
    end
    object qryVedBNKNMPRDF: TStringField
      FieldName = 'BNKNMPRDF'
      Origin = 'DbMain.Z_VEDNR.BNKNMPRDF'
      Size = 65
    end
    object qryVedKSSVEDNR: TSmallintField
      FieldName = 'KSSVEDNR'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNR'
    end
    object qryVedKSSVEDDT: TDateTimeField
      FieldName = 'KSSVEDDT'
      Origin = 'DbMain.Z_VEDNR.KSSVEDDT'
    end
    object qryVedKSSVEDNM: TStringField
      FieldName = 'KSSVEDNM'
      Origin = 'DbMain.Z_VEDNR.KSSVEDNM'
      Size = 65
    end
  end
  object qryOtkl: TQuery
    OnCalcFields = qryOtklCalcFields
    DatabaseName = 'DbMain'
    DataSource = dsrcVed
    SQL.Strings = (
      'Select bl.KdBnk, bl.LicSch, bl.SpB, bl.DtBeg, '
      ' u.Fam, u.Ima, u.Otch, o.* from ViOtkl o '
      ' Left outer join z_Upi u on u.TabN = o.TabN '
      ' Left outer join Z_BankiLS bl on bl.TabN = o.TabN and '
      '                  bl.KdBnk = o.KdBnk and (bl.SpB = "Y") '
      ' where o.DtProc = :DtProc and '
      
        '         o.NrVdPv = :VedNr and o.VidN > "7500" and o.VidN < "752' +
        '0" ')
    Left = 304
    Top = 184
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DTPROC'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'VEDNR'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryOtklKDBNK: TSmallintField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'KDBNK'
    end
    object qryOtklLICSCH: TStringField
      DisplayLabel = #1051#1057
      FieldName = 'LICSCH'
      Size = 25
    end
    object qryOtklSPB: TStringField
      FieldName = 'SPB'
      FixedChar = True
      Size = 1
    end
    object qryOtklDTBEG: TDateTimeField
      FieldName = 'DTBEG'
    end
    object qryOtklFAM: TStringField
      FieldName = 'FAM'
    end
    object qryOtklIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryOtklOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryOtklFamIO: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103' '#1048'.'#1054'.'
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 45
      Calculated = True
    end
    object qryOtklNR: TIntegerField
      FieldName = 'NR'
    end
    object qryOtklKDSPS: TSmallintField
      DisplayLabel = #1057#1087#1089
      FieldName = 'KDSPS'
    end
    object qryOtklDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object qryOtklTABN: TIntegerField
      DisplayLabel = #1058#1072#1073#1053#1088
      FieldName = 'TABN'
    end
    object qryOtklVIDN: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryOtklSHVIDN: TStringField
      DisplayLabel = #1064#1092#1088#1042#1080#1076#1072
      FieldName = 'SHVIDN'
      Size = 15
    end
    object qryOtklSTORN: TStringField
      FieldName = 'STORN'
      FixedChar = True
      Size = 1
    end
    object qryOtklOLDKDVIDN: TSmallintField
      FieldName = 'OLDKDVIDN'
    end
    object qryOtklCHAS: TFloatField
      FieldName = 'CHAS'
    end
    object qryOtklSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object qryOtklKDOBJ: TSmallintField
      DisplayLabel = #1055#1076#1088
      FieldName = 'KDOBJ'
    end
    object qryOtklKDKATP: TSmallintField
      DisplayLabel = #1050#1090#1075#1055#1077#1088#1089
      FieldName = 'KDKATP'
    end
    object qryOtklDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryOtklDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryOtklPDN: TSmallintField
      FieldName = 'PDN'
    end
    object qryOtklKDSPZ: TSmallintField
      FieldName = 'KDSPZ'
    end
    object qryOtklSCHBU: TStringField
      DisplayLabel = #1057#1091#1073#1057#1095#1105#1090
      FieldName = 'SCHBU'
      Size = 10
    end
    object qryOtklPSCH: TStringField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'PSCH'
      Size = 10
    end
    object qryOtklNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryOtklPRR: TSmallintField
      FieldName = 'PRR'
    end
    object qryOtklPRPV: TSmallintField
      FieldName = 'PRPV'
    end
    object qryOtklKTO: TSmallintField
      FieldName = 'KTO'
    end
    object qryOtklPRKR: TSmallintField
      FieldName = 'PRKR'
    end
    object qryOtklSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryOtklDTVDPV: TDateTimeField
      FieldName = 'DTVDPV'
    end
    object qryOtklNRVDPV: TIntegerField
      FieldName = 'NRVDPV'
    end
    object qryOtklMYNOTES: TStringField
      FieldName = 'MYNOTES'
      Size = 25
    end
    object qryOtklSPECPS: TIntegerField
      FieldName = 'SPECPS'
    end
    object qryOtklPBNK: TSmallintField
      FieldName = 'PBNK'
    end
    object qryOtklKDBNK_1: TSmallintField
      FieldName = 'KDBNK_1'
    end
  end
  object dsrcVed: TDataSource
    DataSet = qryVed
    Left = 224
    Top = 200
  end
  object dsrcOtkl: TDataSource
    DataSet = qryOtkl
    Left = 320
    Top = 200
  end
end
