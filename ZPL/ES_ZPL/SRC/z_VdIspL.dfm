object FormVdIspL: TFormVdIspL
  Left = 237
  Top = 418
  Width = 880
  Height = 350
  BorderIcons = [biSystemMenu]
  Caption = 'FormVdIspL'
  Color = clBtnFace
  Constraints.MaxHeight = 860
  Constraints.MaxWidth = 880
  Constraints.MinHeight = 350
  Constraints.MinWidth = 575
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
    Width = 872
    Height = 31
    Align = alTop
    Anchors = [akTop]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      872
      31)
    object sBtnPrt: TSpeedButton
      Left = 4
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
    object LabelCntRec: TLabel
      Left = 104
      Top = 9
      Width = 62
      Height = 13
      Caption = 'LabelCntRec'
    end
    object bBtnCancel: TBitBtn
      Left = 794
      Top = 3
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
    Width = 872
    Height = 285
    Align = alClient
    DataSource = dsrcVed
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SPEC_NR'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMDOK'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABN'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FamIO'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDN'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPROC'
        Width = 45
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
        FieldName = 'SumForIspL'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMVZN'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SPSRSCH'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMDOLG'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_BEG'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_END'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOMU'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KDPST'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTA'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROC_PSB'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTES_UD'
        Width = 70
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
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LICSCHET'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSCHET'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPOBANKA'
        Width = 35
        Visible = True
      end>
  end
  object QryVed: TQuery
    OnCalcFields = QryVedCalcFields
    DatabaseName = 'DbMain'
    SQL.Strings = (
      
        'select nu.Spec_NR, nu.TabN, nu.VidN, nu.Summa, up.Fam, up.Ima, u' +
        'p.Otch,'
      
        '       ud.SumDolg, ud.SumVzn, ud.SpsRsch, ud.Sp, ud.NomDok, ud.D' +
        't_Beg,'
      '       ud.Dt_End, ud.Komu, ud.Adres, ud.KdPst, ud.Posta,'
      
        '       ud.Notes as Notes_Ud, ud.NomSberbank, ud.LicSchet, ud.RSc' +
        'het,'
      
        '       ud.Bank, ud.OkpoBanka, ud.Proc_Psb, ud.Spec_NR as Spec_NR' +
        '_UD,'
      '       nu.DtProc, nu.ZaMesGod, nu.Notes'
      'from z_nu nu'
      '     Left outer join z_uderg ud on'
      '                 ud.TabN = nu.TabN and ud.Spec_NR = nu.Spec_NR'
      '     Left outer join z_upi up on up.TabN = nu.TabN'
      'where nu.dtProc = "11/01/2006" and nu.vidN in ("6601","6647")'
      'order by nu.TabN, nu.VidN'
      '')
    Left = 104
    Top = 56
    object QryVedSPEC_NR: TIntegerField
      FieldName = 'SPEC_NR'
    end
    object QryVedTABN: TIntegerField
      FieldName = 'TABN'
    end
    object QryVedVIDN: TStringField
      FieldName = 'VIDN'
      FixedChar = True
      Size = 4
    end
    object QryVedSumForIspL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SumForIspL'
      DisplayFormat = '#.00'
      Calculated = True
    end
    object QryVedSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object QryVedFAM: TStringField
      FieldName = 'FAM'
    end
    object QryVedIMA: TStringField
      FieldName = 'IMA'
      Size = 15
    end
    object QryVedOTCH: TStringField
      FieldName = 'OTCH'
    end
    object QryVedFamIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'FamIO'
      Size = 35
      Calculated = True
    end
    object QryVedSUMDOLG: TFloatField
      FieldName = 'SUMDOLG'
    end
    object QryVedSUMVZN: TFloatField
      FieldName = 'SUMVZN'
    end
    object QryVedSPSRSCH: TSmallintField
      FieldName = 'SPSRSCH'
    end
    object QryVedSP: TStringField
      FieldName = 'SP'
      Size = 1
    end
    object QryVedNOMDOK: TStringField
      FieldName = 'NOMDOK'
      Size = 10
    end
    object QryVedDT_BEG: TDateTimeField
      FieldName = 'DT_BEG'
    end
    object QryVedDT_END: TDateTimeField
      FieldName = 'DT_END'
    end
    object QryVedKOMU: TStringField
      FieldName = 'KOMU'
      Size = 95
    end
    object QryVedADRES: TStringField
      FieldName = 'ADRES'
      Size = 250
    end
    object QryVedKDPST: TIntegerField
      FieldName = 'KDPST'
    end
    object QryVedPOSTA: TStringField
      FieldName = 'POSTA'
      FixedChar = True
      Size = 1
    end
    object QryVedNOTES_UD: TStringField
      FieldName = 'NOTES_UD'
      Size = 150
    end
    object QryVedNOMSBERBANK: TStringField
      FieldName = 'NOMSBERBANK'
      Size = 15
    end
    object QryVedLICSCHET: TStringField
      FieldName = 'LICSCHET'
      Size = 15
    end
    object QryVedRSCHET: TStringField
      FieldName = 'RSCHET'
      Size = 15
    end
    object QryVedBANK: TStringField
      FieldName = 'BANK'
      Size = 55
    end
    object QryVedOKPOBANKA: TStringField
      FieldName = 'OKPOBANKA'
      Size = 15
    end
    object QryVedPROC_PSB: TFloatField
      FieldName = 'PROC_PSB'
    end
    object QryVedSPEC_NR_UD: TIntegerField
      FieldName = 'SPEC_NR_UD'
    end
    object QryVedDTPROC: TDateTimeField
      FieldName = 'DTPROC'
      DisplayFormat = 'mm/yy'
    end
    object QryVedZAMESGOD: TDateTimeField
      FieldName = 'ZAMESGOD'
      DisplayFormat = 'mm/yy'
    end
    object QryVedNOTES: TStringField
      FieldName = 'NOTES'
      Size = 25
    end
  end
  object dsrcVed: TDataSource
    DataSet = QryVed
    Left = 120
    Top = 72
  end
  object qryTmp: TQuery
    Left = 232
    Top = 168
  end
end
