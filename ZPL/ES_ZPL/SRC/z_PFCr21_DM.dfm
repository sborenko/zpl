object DMPF21: TDMPF21
  OldCreateOrder = False
  Left = 1231
  Top = 230
  Height = 303
  Width = 402
  object qryNU: TQuery
    DatabaseName = 'DbMain'
    SQL.Strings = (
      'Select Gen_Id(My_Gen_ID, 1) as NR, '
      
        ' n.ZaMesGod, u.Fam, u.Ima, u.Otch, u.ID, n.TabN, n.VidN, n.ShVid' +
        'N, n.Chas, n.Summa, n.KdKatP, '
      ' n.PdN, n.PRR, n.PrPv, n.Kto, n.PrKr, n.Spov, n.Sp_PF, n.Bolnic '
      ' from viNu_Main n Left Outer Join z_Upi u on u.TabN = n.TabN '
      
        ' where n.ZaMesGod >= "01/01/2009" and n.ZaMesGod <= "12/01/2009"' +
        ' and'
      ' ((n.VidN < "5000" and not n.VidN in ("2705","2723","2724")) or'
      ' (n.VidN >= "6401" and n.VidN <= "6415") or'
      ' (n.VidN in ("8611","8612"))) and Summa <> 0 and'
      
        '            (n.TabN in (1,74,146,1036,1239,3271,4146,6618,6627,6' +
        '876,'
      
        '                        6936,8126,8187,8343,12394,17138,19621,21' +
        '593,'
      '                        22822,4549,7298,7304,7309,7470,7877,'
      '                        4380,6373,54099,7876,41195,7997,8200))'
      ' order by n.TabN, n.ZamesGod, n.VidN')
    Left = 12
    Top = 79
  end
  object cdsSpov: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NR'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'PERIOD_M'
        DataType = ftInteger
      end
      item
        Name = 'PERIOD_Y'
        DataType = ftInteger
      end
      item
        Name = 'UKR_GROMAD'
        DataType = ftInteger
      end
      item
        Name = 'ST'
        DataType = ftInteger
      end
      item
        Name = 'NUMIDENT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ZO'
        DataType = ftInteger
      end
      item
        Name = 'PAY_TP'
        DataType = ftInteger
      end
      item
        Name = 'PAY_MNTH'
        DataType = ftInteger
      end
      item
        Name = 'PAY_YEAR'
        DataType = ftInteger
      end
      item
        Name = 'OTK'
        DataType = ftInteger
      end
      item
        Name = 'EXP'
        DataType = ftInteger
      end
      item
        Name = 'NRC'
        DataType = ftInteger
      end
      item
        Name = 'NRM'
        DataType = ftInteger
      end
      item
        Name = 'TabN'
        DataType = ftInteger
      end
      item
        Name = 'DtBegPTV'
        DataType = ftDateTime
      end
      item
        Name = 'DtEndPTV'
        DataType = ftDateTime
      end
      item
        Name = 'State'
        DataType = ftSmallint
      end
      item
        Name = 'Inv'
        DataType = ftSmallint
      end
      item
        Name = 'ZaMG'
        DataType = ftDate
      end
      item
        Name = 'IsWrk'
        DataType = ftBoolean
      end
      item
        Name = 'NPD'
        DataType = ftSmallint
      end
      item
        Name = 'IsBln'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtp'
        DataType = ftBoolean
      end
      item
        Name = 'IsDekr'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtp3'
        DataType = ftBoolean
      end
      item
        Name = 'IsOtp6'
        DataType = ftBoolean
      end
      item
        Name = 'SmCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPmCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmOtpCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmDCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPmDCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmDOtpCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPCmn'
        DataType = ftFloat
      end
      item
        Name = 'svPCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpInvCmn'
        DataType = ftFloat
      end
      item
        Name = 'SmPps'
        DataType = ftFloat
      end
      item
        Name = 'SmPmPps'
        DataType = ftFloat
      end
      item
        Name = 'SmOtpPps'
        DataType = ftFloat
      end
      item
        Name = 'SmDPps'
        DataType = ftFloat
      end
      item
        Name = 'SmPmDPps'
        DataType = ftFloat
      end
      item
        Name = 'SmDOtpPps'
        DataType = ftFloat
      end
      item
        Name = 'SmPPps'
        DataType = ftFloat
      end
      item
        Name = 'svPPps'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpPps'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpInvPps'
        DataType = ftFloat
      end
      item
        Name = 'Kd_Np'
        DataType = ftSmallint
      end
      item
        Name = 'SmBln'
        DataType = ftFloat
      end
      item
        Name = 'SmDBln'
        DataType = ftFloat
      end
      item
        Name = 'SmPBln'
        DataType = ftFloat
      end
      item
        Name = 'svPBln'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpBln'
        DataType = ftFloat
      end
      item
        Name = 'SmDekr'
        DataType = ftFloat
      end
      item
        Name = 'SmDDekr'
        DataType = ftFloat
      end
      item
        Name = 'SmPDekr'
        DataType = ftFloat
      end
      item
        Name = 'svPDekr'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpDekr'
        DataType = ftFloat
      end
      item
        Name = 'DtBDekr'
        DataType = ftDate
      end
      item
        Name = 'DtEDekr'
        DataType = ftDate
      end
      item
        Name = 'DtBegDekr'
        DataType = ftDate
      end
      item
        Name = 'DtEndDekr'
        DataType = ftDate
      end
      item
        Name = 'SmDgv'
        DataType = ftFloat
      end
      item
        Name = 'SmDDgv'
        DataType = ftFloat
      end
      item
        Name = 'SmPDgv'
        DataType = ftFloat
      end
      item
        Name = 'svPDgv'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpDgv'
        DataType = ftFloat
      end
      item
        Name = 'SmVozvr'
        DataType = ftFloat
      end
      item
        Name = 'SmDVozvr'
        DataType = ftFloat
      end
      item
        Name = 'SmPVozvr'
        DataType = ftFloat
      end
      item
        Name = 'SmOtp'
        DataType = ftFloat
      end
      item
        Name = 'SmDOtp'
        DataType = ftFloat
      end
      item
        Name = 'SmPOtp'
        DataType = ftFloat
      end
      item
        Name = 'SmPrpOtp'
        DataType = ftFloat
      end
      item
        Name = 'DPR'
        DataType = ftDate
      end
      item
        Name = 'DZR'
        DataType = ftDate
      end
      item
        Name = 'KdInMes'
        DataType = ftSmallint
      end
      item
        Name = 'KD'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_Nzp'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_PTV'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_VP'
        DataType = ftSmallint
      end
      item
        Name = 'Num_Nak'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Dt_Nak'
        DataType = ftDate
      end
      item
        Name = 'DtBOtp3'
        DataType = ftDate
      end
      item
        Name = 'DtEOtp3'
        DataType = ftDate
      end
      item
        Name = 'DtBOtp6'
        DataType = ftDate
      end
      item
        Name = 'DtEOtp6'
        DataType = ftDate
      end
      item
        Name = 'Sm8711'
        DataType = ftFloat
      end
      item
        Name = 'Sm8712'
        DataType = ftFloat
      end
      item
        Name = 'Sm8713'
        DataType = ftFloat
      end
      item
        Name = 'Sm8715'
        DataType = ftFloat
      end
      item
        Name = 'Sm8716'
        DataType = ftFloat
      end
      item
        Name = 'Sm8717'
        DataType = ftFloat
      end
      item
        Name = 'Sm1210'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'OnZoExp'
        DescFields = 'Exp'
        Fields = 'ZO;Exp;Pay_Tp'
        Options = [ixDescending]
      end>
    IndexName = 'OnZoExp'
    Params = <>
    StoreDefs = True
    Left = 16
    Top = 160
    object cdsSpovNR: TAutoIncField
      FieldName = 'NR'
      ReadOnly = True
    end
    object cdsSpovPERIOD_M: TIntegerField
      FieldName = 'PERIOD_M'
    end
    object cdsSpovPERIOD_Y: TIntegerField
      FieldName = 'PERIOD_Y'
    end
    object cdsSpovUKR_GROMAD: TIntegerField
      FieldName = 'UKR_GROMAD'
    end
    object cdsSpovST: TIntegerField
      FieldName = 'ST'
    end
    object cdsSpovNUMIDENT: TStringField
      FieldName = 'NUMIDENT'
      Size = 0
    end
    object cdsSpovZO: TSmallintField
      FieldName = 'ZO'
    end
    object cdsSpovPAY_TP: TIntegerField
      FieldName = 'PAY_TP'
    end
    object cdsSpovPAY_MNTH: TIntegerField
      FieldName = 'PAY_MNTH'
    end
    object cdsSpovPAY_YEAR: TIntegerField
      FieldName = 'PAY_YEAR'
    end
    object cdsSpovOTK: TSmallintField
      FieldName = 'OTK'
    end
    object cdsSpovExp: TSmallintField
      FieldName = 'Exp'
    end
    object cdsSpovNRC: TIntegerField
      FieldName = 'NRC'
    end
    object cdsSpovNRM: TIntegerField
      FieldName = 'NRM'
    end
    object cdsSpovTabN: TIntegerField
      FieldName = 'TabN'
    end
    object cdsSpovKd_VP: TSmallintField
      FieldName = 'Kd_VP'
    end
    object cdsSpovKd_PTV: TSmallintField
      FieldName = 'Kd_PTV'
    end
    object cdsSpovKd_Nzp: TSmallintField
      FieldName = 'Kd_Nzp'
    end
    object cdsSpovKd_Np: TSmallintField
      FieldName = 'Kd_Np'
    end
    object cdsSpovState: TSmallintField
      FieldName = 'State'
    end
    object cdsSpovInv: TSmallintField
      FieldName = 'Inv'
    end
    object cdsSpovZaMG: TDateField
      FieldName = 'ZaMG'
    end
    object cdsSpovNPD: TSmallintField
      FieldName = 'NPD'
    end
    object cdsSpovIsWrk: TBooleanField
      FieldName = 'IsWrk'
    end
    object cdsSpovIsBln: TBooleanField
      FieldName = 'IsBln'
    end
    object cdsSpovIsOtp: TBooleanField
      FieldName = 'IsOtp'
    end
    object cdsSpovIsDekr: TBooleanField
      FieldName = 'IsDekr'
    end
    object cdsSpovIsOtp3: TBooleanField
      FieldName = 'IsOtp3'
    end
    object cdsSpovIsOtp6: TBooleanField
      FieldName = 'IsOtp6'
    end
    object cdsSpovSm1210: TFloatField
      FieldName = 'Sm1210'
    end
    object cdsSpovSmCmn: TFloatField
      FieldName = 'SmCmn'
    end
    object cdsSpovSmPmCmn: TFloatField
      FieldName = 'SmPmCmn'
    end
    object cdsSpovSmOtpCmn: TFloatField
      FieldName = 'SmOtpCmn'
    end
    object cdsSpovSmDCmn: TFloatField
      FieldName = 'SmDCmn'
    end
    object cdsSpovSmPmDCmn: TFloatField
      FieldName = 'SmPmDCmn'
    end
    object cdsSpovSmDOtpCmn: TFloatField
      FieldName = 'SmDOtpCmn'
    end
    object cdsSpovSmPCmn: TFloatField
      FieldName = 'SmPCmn'
    end
    object cdsSpovsvPCmn: TFloatField
      FieldName = 'svPCmn'
    end
    object cdsSpovSmPrpCmn: TFloatField
      FieldName = 'SmPrpCmn'
    end
    object cdsSpovSmPrpInvCmn: TFloatField
      FieldName = 'SmPrpInvCmn'
    end
    object cdsSpovSmPps: TFloatField
      FieldName = 'SmPps'
    end
    object cdsSpovSmPmPps: TFloatField
      FieldName = 'SmPmPps'
    end
    object cdsSpovSmOtpPps: TFloatField
      FieldName = 'SmOtpPps'
    end
    object cdsSpovSmDPps: TFloatField
      FieldName = 'SmDPps'
    end
    object cdsSpovSmPmDPps: TFloatField
      FieldName = 'SmPmDPps'
    end
    object cdsSpovSmDOtpPps: TFloatField
      FieldName = 'SmDOtpPps'
    end
    object cdsSpovSmPPps: TFloatField
      FieldName = 'SmPPps'
    end
    object cdsSpovsvPPps: TFloatField
      FieldName = 'svPPps'
    end
    object cdsSpovSmPrpPps: TFloatField
      FieldName = 'SmPrpPps'
    end
    object cdsSpovSmPrpInvPps: TFloatField
      FieldName = 'SmPrpInvPps'
    end
    object cdsSpovSmBln: TFloatField
      FieldName = 'SmBln'
    end
    object cdsSpovSmDBln: TFloatField
      FieldName = 'SmDBln'
    end
    object cdsSpovSmPBln: TFloatField
      FieldName = 'SmPBln'
    end
    object cdsSpovsvPBln: TFloatField
      FieldName = 'svPBln'
    end
    object cdsSpovSmPrpBln: TFloatField
      FieldName = 'SmPrpBln'
    end
    object cdsSpovSmDekr: TFloatField
      FieldName = 'SmDekr'
    end
    object cdsSpovSmDDekr: TFloatField
      FieldName = 'SmDDekr'
    end
    object cdsSpovSmPDekr: TFloatField
      FieldName = 'SmPDekr'
    end
    object cdsSpovsvPDekr: TFloatField
      FieldName = 'svPDekr'
    end
    object cdsSpovSmPrpDekr: TFloatField
      FieldName = 'SmPrpDekr'
    end
    object cdsSpovDtBDekr: TDateField
      FieldName = 'DtBDekr'
    end
    object cdsSpovDtEDekr: TDateField
      FieldName = 'DtEDekr'
    end
    object cdsSpovDtBegDekr: TDateField
      FieldName = 'DtBegDekr'
    end
    object cdsSpovDtEndDekr: TDateField
      FieldName = 'DtEndDekr'
    end
    object cdsSpovSmDgv: TFloatField
      FieldName = 'SmDgv'
    end
    object cdsSpovSmDDgv: TFloatField
      FieldName = 'SmDDgv'
    end
    object cdsSpovSmPDgv: TFloatField
      FieldName = 'SmPDgv'
    end
    object cdsSpovsvPDgv: TFloatField
      FieldName = 'svPDgv'
    end
    object cdsSpovSmPrpDgv: TFloatField
      FieldName = 'SmPrpDgv'
    end
    object cdsSpovSmVozvr: TFloatField
      FieldName = 'SmVozvr'
    end
    object cdsSpovSmDVozvr: TFloatField
      FieldName = 'SmDVozvr'
    end
    object cdsSpovSmPVozvr: TFloatField
      FieldName = 'SmPVozvr'
    end
    object cdsSpovSmOtp: TFloatField
      FieldName = 'SmOtp'
    end
    object cdsSpovSmDOtp: TFloatField
      FieldName = 'SmDOtp'
    end
    object cdsSpovSmPOtp: TFloatField
      FieldName = 'SmPOtp'
    end
    object cdsSpovSmPrpOtp: TFloatField
      FieldName = 'SmPrpOtp'
    end
    object cdsSpovDPR: TDateField
      FieldName = 'DPR'
    end
    object cdsSpovDZR: TDateField
      FieldName = 'DZR'
    end
    object cdsSpovKdInMes: TSmallintField
      FieldName = 'KdInMes'
    end
    object cdsSpovKD: TSmallintField
      FieldName = 'KD'
    end
    object cdsSpovNum_Nak: TStringField
      FieldName = 'Num_Nak'
      Size = 8
    end
    object cdsSpovDt_Nak: TDateField
      FieldName = 'Dt_Nak'
    end
    object cdsSpovDtBOtp3: TDateField
      FieldName = 'DtBOtp3'
    end
    object cdsSpovDtEOtp3: TDateField
      FieldName = 'DtEOtp3'
    end
    object cdsSpovDtBOtp6: TDateField
      FieldName = 'DtBOtp6'
    end
    object cdsSpovDtEOtp6: TDateField
      FieldName = 'DtEOtp6'
    end
    object cdsSpovSm8711: TFloatField
      FieldName = 'Sm8711'
    end
    object cdsSpovSm8712: TFloatField
      FieldName = 'Sm8712'
    end
    object cdsSpovSm8713: TFloatField
      FieldName = 'Sm8713'
    end
    object cdsSpovSm8715: TFloatField
      FieldName = 'Sm8715'
    end
    object cdsSpovSm8716: TFloatField
      FieldName = 'Sm8716'
    end
    object cdsSpovSm8717: TFloatField
      FieldName = 'Sm8717'
    end
  end
  object qryPeek: TQuery
    Left = 132
    Top = 89
  end
  object cdsT6: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MySort'
        DataType = ftSmallint
      end
      item
        Name = 'MyType'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MyZaMG'
        DataType = ftDate
      end
      item
        Name = 'Period_M'
        DataType = ftSmallint
      end
      item
        Name = 'Period_Y'
        DataType = ftSmallint
      end
      item
        Name = 'ZO'
        DataType = ftSmallint
      end
      item
        Name = 'Pay_TP'
        DataType = ftSmallint
      end
      item
        Name = 'Pay_Mnth'
        DataType = ftSmallint
      end
      item
        Name = 'Pay_Year'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_Np'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_Nzp'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_PTV'
        DataType = ftSmallint
      end
      item
        Name = 'Kd_VP'
        DataType = ftSmallint
      end
      item
        Name = 'Sum_Total'
        DataType = ftFloat
      end
      item
        Name = 'Sum_Max'
        DataType = ftFloat
      end
      item
        Name = 'Sum_Ins'
        DataType = ftFloat
      end
      item
        Name = 'Sum_Diff'
        DataType = ftFloat
      end
      item
        Name = 'Sum_Narah'
        DataType = ftFloat
      end
      item
        Name = 'OTK'
        DataType = ftSmallint
      end
      item
        Name = 'EXP'
        DataType = ftSmallint
      end
      item
        Name = 'NumIdent'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NRC'
        DataType = ftSmallint
      end
      item
        Name = 'NM'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FTN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'St'
        DataType = ftSmallint
      end
      item
        Name = 'Ukr_Gromad'
        DataType = ftSmallint
      end
      item
        Name = 'NPD'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'OnZaMGSort'
        Fields = 'MyZaMG;MySort'
      end>
    IndexName = 'OnZaMGSort'
    Params = <>
    StoreDefs = True
    Left = 80
    Top = 160
    object cdsT6MySort: TSmallintField
      FieldName = 'MySort'
    end
    object cdsT6MyType: TStringField
      FieldName = 'MyType'
      Size = 10
    end
    object cdsT6MyZaMG: TDateField
      FieldName = 'MyZaMG'
    end
    object cdsT6Period_M: TSmallintField
      FieldName = 'Period_M'
    end
    object cdsT6Period_Y: TSmallintField
      FieldName = 'Period_Y'
    end
    object cdsT6ZO: TSmallintField
      FieldName = 'ZO'
    end
    object cdsT6Pay_TP: TSmallintField
      FieldName = 'Pay_TP'
    end
    object cdsT6Pay_Mnth: TSmallintField
      FieldName = 'Pay_Mnth'
    end
    object cdsT6Pay_Year: TSmallintField
      FieldName = 'Pay_Year'
    end
    object cdsT6Kd_Np: TSmallintField
      FieldName = 'Kd_Np'
    end
    object cdsT6Kd_Nzp: TSmallintField
      FieldName = 'Kd_Nzp'
    end
    object cdsT6Kd_PTV: TSmallintField
      FieldName = 'Kd_PTV'
    end
    object cdsT6Kd_VP: TSmallintField
      FieldName = 'Kd_VP'
    end
    object cdsT6Sum_Total: TFloatField
      FieldName = 'Sum_Total'
    end
    object cdsT6Sum_Max: TFloatField
      FieldName = 'Sum_Max'
    end
    object cdsT6Sum_Ins: TFloatField
      FieldName = 'Sum_Ins'
    end
    object cdsT6Sum_Diff: TFloatField
      FieldName = 'Sum_Diff'
    end
    object cdsT6Sum_Narah: TFloatField
      FieldName = 'Sum_Narah'
    end
    object cdsT6OTK: TSmallintField
      FieldName = 'OTK'
    end
    object cdsT6NPD: TSmallintField
      DisplayLabel = #1053#1087#1044
      FieldName = 'NPD'
    end
    object cdsT6EXP: TSmallintField
      FieldName = 'EXP'
    end
    object cdsT6NumIdent: TStringField
      FieldName = 'NumIdent'
      Size = 10
    end
    object cdsT6LN: TStringField
      FieldName = 'LN'
      Size = 50
    end
    object cdsT6NM: TStringField
      FieldName = 'NM'
      Size = 50
    end
    object cdsT6FTN: TStringField
      FieldName = 'FTN'
      Size = 50
    end
    object cdsT6St: TSmallintField
      FieldName = 'St'
    end
    object cdsT6Ukr_Gromad: TSmallintField
      FieldName = 'Ukr_Gromad'
    end
    object cdsT6NRC: TSmallintField
      FieldName = 'NRC'
    end
  end
  object tbl_05: TTable
    TableType = ttDBase
    Left = 16
    Top = 16
  end
  object tbl_06: TTable
    TableType = ttDBase
    Left = 72
    Top = 16
  end
  object tbl_07: TTable
    TableType = ttDBase
    Left = 128
    Top = 16
  end
end
