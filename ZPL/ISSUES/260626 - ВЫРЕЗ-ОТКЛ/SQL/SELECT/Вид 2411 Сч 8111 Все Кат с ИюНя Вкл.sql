--------------------------
-- —чЄт 8111
-- ¬ид 2411
-- ¬се кат.
-- — июЌ€ мес€ца включительно
--------------------------
select o.zamesgod mes,
  substring(s.sch_17 from 1 for 4) sch, 
  o.vidn, v.shvidn,
  o.kdkatp, p.shkatp, 
  o.tabn, u.fam || ' ' || substring(u.ima from 1 for 1) || '.' || 
    substring(u.otch from 1 for 1) fio,
  summa
from z_otkl o
  left join kd_sbu s on s.kdsch = o.kdspz
  left join z_katpers p on p.kdkatp = o.kdkatp
  left join z_kdvidn v on v.vidn = o.vidn
  left join z_upi u on u.tabn = o.tabn
where
  o.zamesgod >= '6/1/2026'
  and o.dtproc = '6/1/2026'
  and o.vidn = '2411'
  and substring(s.sch_17 from 1 for 4) = '8111'
  and not o.tabn in (
   12334
  )
order by o.zamesgod, kdkatp, tabn