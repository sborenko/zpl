--------------------------
-- Счёт 8111
-- Вид 1810
-- Все кат.
-- С июля месяца включительно
--------------------------
parent 1332
--------------------------

delete
from z_otkl o
where
  o.vidn = '1810'
  and o.zamesgod >= '6/1/2026'
  and o.dtproc = '6/1/2026'
  and (
    select substring(sch_17 from 1 for 4) 
    from kd_sbu 
    where kdsch = o.kdspz
  ) = '8111'
  and not o.tabn in (
   9522
  )
