object DmAppx4Grant: TDmAppx4Grant
  OldCreateOrder = False
  Left = 146
  Top = 200
  Height = 540
  Width = 742
  object QryNU: TQuery
    SQL.Strings = (
      'Select u.Fam, u.Ima, u.Otch, u.Id, p.* '
      'from s_ViOut p'
      '   Left Outer Join s_Upi u on u.RegNr = p.RegNR '
      'where p.DtProc >= '#39'01/01/2006'#39' and p.DtProc <= '#39'03/01/2006'#39' and '
      '      (p.VidN < 51 or p.V_Dhd = 1)'
      'order by p.RegNr, p.DtProc, p.VidN')
    Left = 24
    Top = 16
  end
  object TblDBF: TTable
    TableType = ttDBase
    Left = 88
    Top = 16
  end
  object TblZpl: TTable
    TableType = ttDBase
    Left = 152
    Top = 16
  end
  object QryPrmUv: TQuery
    Left = 104
    Top = 112
  end
end
