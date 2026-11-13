
select n.tabn, n.vidn, u.fam, u.ima, u.otch
from z_nadb n
  left join z_upi u on u.tabn = n.tabn
where not is_pere is null and is_pere = 'Y'

-- начавшиеся надбавки
and dt_beg >= '03/01/2026'

-- недавно закончившиеся аналогичные надбавки
and exists (
  select 'x' 
  from z_nadb 
  where tabn = n.tabn 
    and vidn = n.vidn
    and not dt_end is null and dt_end <= n.dt_beg and dt_end >= '02/01/2026'
)
order by n.tabn, vidn