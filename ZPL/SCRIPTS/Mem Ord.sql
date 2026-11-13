select numident
from j0510110.dbf j1
where zo in (2, 32, 36, 43)
  and exists (
    select 'x' 
    from j0510110.dbf
    where numident = j1.numident
      and not zo in (2, 32, 36, 43)
  )


select zo 
from j0510110.dbf
where numident in ('1951201330', '2830724995')
order by numident


select tabn, prr, round(sum(summa), 2) 
from z_nu 
where dtproc = '03/01/2025' and vidn <= '6000' and prr in (3, 4, 7)
group by tabn, prr
order by tabn, prr


select round(sum(summa), 2) 
from z_nu 
where dtproc = '03/01/2025' and vidn <= '6000' and (prr is null or not prr in (3, 4, 7))

-- ПО ТАБЕЛЬНЫМ НОМЕРАМ

select n.kdspz, s.sch_17, n.tabn, 
  -- v.vidn, 
  s.nmsch, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
  -- left join z_kdvidn v on v.vidn = n.vidn
where dtproc = '03/01/2025' 
  and vidn <= '6000' and (prr is null or not prr in (3, 4, 7))
group by n.kdspz, s.sch_17, n.tabn, 
  -- v.vidn, 
  s.nmsch
  
-- ПО СЧЕТАМ

select n.kdspz, s.sch_17, s.nmsch, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000' 
  -- and (prr is null or not prr in (3, 4, 7))
group by n.kdspz, s.sch_17, s.nmsch

select n.kdspz, s.sch_17, s.nmsch, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  -- and (prr is null or not prr in (3, 4, 7))
group by n.kdspz, s.sch_17, s.nmsch

-- ПО ВИДАМ

select n.kdspz, s.sch_17, n.vidn, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000'
group by n.kdspz, s.sch_17, n.vidn
order by kdspz, vidn

----------------------------------------------
-- СУММЫ ДЛЯ ЕСВ
----------------------------------------------

-- ОБЩИХ

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000' and not (vidn >= '2600' and vidn <= '2700') and not vidn in ('1005', '1006', '1008')
  and (prr is null or not prr in (3, 4, 7))
  and n.kdkatp <> 1
group by n.kdspz, s.sch_17
order by kdspz

-- ППС

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000' and not (vidn >= '2600' and vidn <= '2700') and not vidn in ('1005', '1006', '1008')
  and (prr is null or not prr in (3, 4, 7))
  and n.kdkatp = 1
group by n.kdspz, s.sch_17
order by kdspz

-- ОБЩИХ ИНВ.

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000' and not (vidn >= '2600' and vidn <= '2700') and not vidn in ('1005', '1006', '1008')
  and not prr is null and prr in (3, 4, 7)
  and n.kdkatp <> 1
group by n.kdspz, s.sch_17
order by kdspz

-- ППС ИНВ.

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn < '6000' and not (vidn >= '2600' and vidn <= '2700') and not vidn in ('1005', '1006', '1008')
  and not prr is null and prr in (3, 4, 7)
  and n.kdkatp = 1
group by n.kdspz, s.sch_17
order by kdspz

-- ГПД

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn in ('1005', '1006', '1008')
group by n.kdspz, s.sch_17
order by kdspz

----------------------------------------------
-- СУММА БОЛЬНИЧНЫХ, ДЕКРЕТНЫХ ДЛЯ ЕСВ
----------------------------------------------

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn >= '2600' and vidn <= '2700'
  and (prr is null or not prr in (3, 4, 7))
group by n.kdspz, s.sch_17
order by kdspz

-- ИНВ.

select n.kdspz, s.sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn >= '2600' and vidn <= '2700'
  and not prr is null and prr in (3, 4, 7)
group by n.kdspz, s.sch_17
order by kdspz

----------------------------------------------
-- СУММЫ ЕСВ
----------------------------------------------

select n.kdspz, s.sch_17, n.vidn, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025' 
  and vidn >= '8681' and vidn <= '8691'
group by n.kdspz, s.sch_17, n.vidn
order by s.sch_17, n.vidn

----------------------------------------------
-- ВИДЫ 8111/01-XX
----------------------------------------------
04
05
06
07
08
14
95
сг

select sch_17, round(sum(summa), 2)
from z_nu n
  left join kd_sbu s on s.kdsch = n.kdspz
where dtproc = '03/01/2025'
  and kdkatp in (2, 3, 4)
  and not prr in (3, 4, 7)
  and vidn < '6000'
  and not (vidn >= '2600' and vidn <= '2700')
  and kdspz in (
    select kdsch 
    from kd_sbu 
    where sch_17 in (
      '8111/01-04',
      '8111/01-05',
      '8111/01-06',
      '8111/01-07',
      '8111/01-08',
      '8111/01-14',
      '8111/01-95',
      '8111/01-��'
    )
  )
group by sch_17
order by sch_17