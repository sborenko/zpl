
select n.ZaMesGod, 
  substring(s.Sch_17 from 1 for 4), n.KdKatP, p.ShKatP, 
  Sum(n.Summa)
from z_nu n
  left join Kd_SBU s on s.KdSch = n.KdSPZ
  left join z_KatPers p on p.KdKatP = n.KdKatP
where n.VidN = '2405'
  and n.DtProc = '6/1/2026'
  and n.ZaMesGod >= '7/1/2026'
group by n.ZaMesGod, 
  substring(s.Sch_17 from 1 for 4), p.ShKatP, n.KdKatP 