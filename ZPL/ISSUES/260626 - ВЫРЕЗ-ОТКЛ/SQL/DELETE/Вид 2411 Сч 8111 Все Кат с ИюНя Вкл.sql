--------------------------
-- —чЄт 8111
-- ¬ид 2411
-- ¬се кат.
-- — июЌ€ мес€ца включительно
--------------------------
parent 1332
--------------------------

delete
from z_otkl o
where
  o.vidn = '2411'
  and o.zamesgod >= '6/1/2026'
  and o.dtproc = '6/1/2026'
  and (
    select substring(sch_17 from 1 for 4) 
    from kd_sbu 
    where kdsch = o.kdspz
  ) = '8111'
  and not o.tabn in (
   12334
  )
