
'!!! ДЛЯ ОТЧЁТА СПОВ)'
'Сотрудники, имеющие больше одной начинающейся или заканчивающейся'
'совместительской надбавки в месяце'

select 
  n.tabn, fam, ima, otch, count(*)
from 
  z_nadb n
  left join z_upi u on u.tabn = n.tabn
where 
  not is_pere is null 
  and is_pere = 'Y'
  and dt_beg <= '03/31/2026'
  and (
    dt_end is null
    or dt_end >= '03/01/2026'
  )
group by 
  n.tabn, fam, ima, otch
having 
  count(*) > 1
