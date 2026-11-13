object FormVdIspL2: TFormVdIspL2
  Left = 437
  Top = 178
  Width = 817
  Height = 455
  BorderIcons = [biSystemMenu]
  Caption = 'FormVdIspL2'
  Color = clBtnFace
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
    Width = 801
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      801
      31)
    object sBtnPrt: TSpeedButton
      Left = 4
      Top = 4
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
    object LabelCntRec: TLabel
      Left = 123
      Top = 8
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnCancel: TBitBtn
      Left = 732
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object dbgrVed: TDBGrid
    Left = 0
    Top = 31
    Width = 801
    Height = 385
    Align = alClient
    Color = 12779233
    DataSource = dsrcVed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
        FieldName = 'KDSLG'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 48
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
        FieldName = 'NOTES'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRPOST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPOST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTDOK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZAMESGOD'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumForIspL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMVZN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumNalog'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPSRSCH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMDOLG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOMU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDPST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROC_PSB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES_UD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPEC_NR_UD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMSBERBANK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICSCHET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCHET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPOBANKA'
        Visible = True
      end>
  end
  object qryVed: TQuery
    OnCalcFields = QryVedCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select nu.Spec_NR, nu.KdSps, nu.TabN, nu.VidN, nu.Summa,'
      ' up.Fam, up.Ima, up.Otch,'
      ' ud.KdSlg, ud.SumDolg, ud.SumVzn,'
      
        ' ud.SpsRsch, ud.Sp, ud.NomDok, ud.DtDok, ud.NrPost,  ud.DtPost, ' +
        'ud.Dt_Beg,'
      ' ud.Dt_End, ud.Komu, ud.Adres, ud.KdPst, ud.Posta,'
      ' ud.Notes as Notes_Ud, ud.NomSberbank, ud.LicSchet,'
      ' ud.RSchet, ud.Bank, ud.OkpoBanka, ud.Proc_Psb,'
      ' ud.Spec_NR as Spec_NR_UD, nu.DtProc, nu.ZaMesGod, nu.Notes'
      ' from z_nu nu Left outer join z_uderg ud on '
      ' ud.TabN = nu.TabN and ud.Spec_NR = nu.Spec_NR'
      ' Left outer join z_upi up on up.TabN = nu.TabN'
      
        ' where nu.DtProc >= '#39'01/01/2019'#39' and nu.DtProc <= '#39'01/31/2019'#39' a' +
        'nd '
      ' nu.VidN in ("6601","6647")'
      ' order by nu.Spec_NR, nu.VidN')
    Left = 40
    Top = 216
    object qryVedKDSLG: TSmallintField
      FieldName = 'KDSLG'
    end
    object qryVedSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object qryVedTABN: TIntegerField
      FieldName = 'TABN'
    end
    object qryVedVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object qryVedSumForIspL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SumForIspL'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryVedSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object qryVedSumNalog: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SumNalog'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object qryVedFAM: TStringField
      FieldName = 'FAM'
    end
    object qryVedIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object qryVedOTCH: TStringField
      FieldName = 'OTCH'
    end
    object qryVedFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object qryVedSUMDOLG: TFloatField
      FieldName = 'SUMDOLG'
    end
    object qryVedSUMVZN: TFloatField
      FieldName = 'SUMVZN'
    end
    object qryVedSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object qryVedSP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object qryVedNOMDOK: TStringField
      FieldName = 'NOMDOK'
      Size = 10
    end
    object qryVedDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object qryVedDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object qryVedKOMU: TStringField
      FieldName = 'KOMU'
      Size = 95
    end
    object qryVedADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object qryVedKDPST: TIntegerField
      FieldName = 'KDPST'
    end
    object qryVedPOSTA: TStringField
      FieldName = 'POSTA'
      FixedChar = True
      Size = 1
    end
    object qryVedNOTES_UD: TStringField
      FieldName = 'NOTES_UD'
      Size = 150
    end
    object qryVedNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Size = 15
    end
    object qryVedLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Size = 15
    end
    object qryVedRSCHET: TStringField
      FieldName = 'RSCHET'
      Size = 15
    end
    object qryVedBANK: TStringField
      FieldName = 'BANK'
      Size = 55
    end
    object qryVedOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Size = 15
    end
    object qryVedPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
    end
    object qryVedSPEC_NR_UD: TIntegerField
      FieldName = 'SPEC_NR_UD'
    end
    object qryVedDTPROC: TDateTimeField
      DisplayLabel = #1056#1052#1077#1089
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yyyy'
    end
    object qryVedZAMESGOD: TDateTimeField
      DisplayLabel = #1047#1072#1052#1043
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yyyy'
    end
    object qryVedNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
    object qryVedKDSPS: TSmallintField
      FieldName = 'KDSPS'
    end
    object qryVedNRPOST: TStringField
      FieldName = 'NRPOST'
      Size = 15
    end
    object qryVedDTPOST: TDateTimeField
      FieldName = 'DTPOST'
    end
    object qryVedDTDOK: TDateTimeField
      FieldName = 'DTDOK'
    end
  end
  object dsrcVed: TDataSource
    DataSet = qryVed
    Left = 56
    Top = 232
  end
  object qryTmp: TQuery
    Left = 184
    Top = 200
  end
end
