--------------------------
-- —чЄт 8111
-- ¬ид 2406
-- ¬се кат.
-- — июЌ€ мес€ца включительно
--------------------------
select o.zamesgod,
  o.vidn,
  o.kdkatp,
  o.tabn,
  o.summa
from z_otkl o
where
  o.zamesgod >= '6/1/2026'
  and o.dtproc = '6/1/2026'
  and o.vidn = '2406'
  and (
    select substring(sch_17 from 1 for 4) 
    from kd_sbu 
    where kdsch = o.kdspz
  ) = '8111'
  and not o.tabn in (
    12334, 12889, 12526, 12198, 12845, 12155, 10906, 12699
  )
order by o.zamesgod, kdkatp, tabn