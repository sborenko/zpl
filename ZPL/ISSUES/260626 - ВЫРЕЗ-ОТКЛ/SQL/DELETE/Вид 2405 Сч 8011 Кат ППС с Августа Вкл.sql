--------------------------
-- Счёт 8011
-- Вид 2405
-- ППС
-- С августа месяца включительно
--------------------------
schet 1209
--------------------------

delete
from z_otkl o
where
  o.vidn = '2405'
  and o.kdkatp = 1
  and o.kdspz = 1209
  and o.zamesgod >= '8/1/2026'
  and o.dtproc = '6/1/2026'
  and not o.tabn in (
    12000
  )
