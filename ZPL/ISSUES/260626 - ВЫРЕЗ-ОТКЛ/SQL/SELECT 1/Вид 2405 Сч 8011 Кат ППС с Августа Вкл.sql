--------------------------
-- Счёт 8011
-- Вид 2405
-- ППС
-- С августа месяца включительно
--------------------------
select o.zamesgod,
  o.vidn,
  o.kdkatp,
  o.tabn,
  o.summa
from z_otkl o
where
  o.zamesgod >= '8/1/2026'
  and o.dtproc = '6/1/2026'
  and o.vidn = '2405'
  and o.kdkatp = 1
  and o.kdspz = 1209
  and not o.tabn in (
    12000
  )
order by o.zamesgod