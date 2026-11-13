--------------------------
-- Счёт 8011
-- Вид 1810
-- Все категории
-- С июля месяца включительно
--------------------------
select o.zamesgod,
  o.vidn,
  o.kdkatp,
  o.tabn,
  o.summa
from z_otkl o
where
  o.zamesgod >= '7/1/2026'
  and o.dtproc = '6/1/2026'
  and o.vidn = '1810'
  and o.kdspz = 1209
  and not o.tabn in (
    49165, 17287, 8737, 12000
  )
order by o.zamesgod, o.tabn