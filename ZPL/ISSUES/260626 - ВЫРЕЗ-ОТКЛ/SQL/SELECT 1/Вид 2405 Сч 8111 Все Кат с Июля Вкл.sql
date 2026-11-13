--------------------------
-- Счёт 8111
-- Вид 2405
-- Все кат.
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
  and o.vidn = '2405'
  and (
    select substring(sch_17 from 1 for 4) 
    from kd_sbu 
    where kdsch = o.kdspz
  ) = '8111'

'Табельным номерам 6665 и 10546'
'удалённые отклонения уже вернули'
'что равноценно как если бы сделали:'
--  and not o.tabn in (6665, 10546)

order by o.zamesgod, o.kdkatp, o.tabn
