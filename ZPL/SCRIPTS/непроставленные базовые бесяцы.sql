
---------------------------------------
'Ќ≈ѕ–ќ—“ј¬Ћ≈ЌЌџ≈ Ѕј«ќ¬џ≈ ћ≈—я÷џ'
---------------------------------------

select p.tabn, p.kdobj, u.fam, u.ima, u.otch, p.bm, p.dtbm, p.kdkatp, p.sovm
from z_pere p
  left join z_upi u on u.tabn = p.tabn
where p.dt_beg between '01/01/2026' and '01/31/2026'
  -- не проставлен базовый мес€ц или проставлен старый
  and (
    p.bm is null 
    or p.bm <> 'Y' 
    or p.bm = 'Y' and not p.dtbm between '01/01/2026' and '01/31/2026'
  )
  -- рассматриваем только основных или внутренных совместителей
  and p.sovm in (0, 3)
  -- исключаем хоздоговорн€ков
  and p.kdkatp <> 13
  -- и не существует других €нварских записей с правильным базовым мес€цем
  and not exists (
    select 'x'
    from z_pere where tabn = p.tabn
      and dt_beg between '01/01/2026' and '01/31/2026'
      and bm = 'Y' and dtbm between '01/01/2026' and '01/31/2026'
  )
order by p.kdobj, u.fam, u.ima, u.otch


---------------------------------------
'ѕ–ќ—“ј¬Ћя≈ћ'
---------------------------------------

update 
  z_pere p
set 
  BM = 'Y', 
  DTBM = '01/01/2026'
where 
  p.dt_beg between '01/01/2026' and '01/31/2026'
  -- не проставлен базовый мес€ц или проставлен старый
  and (
    p.bm is null 
    or p.bm <> 'Y' 
    or p.bm = 'Y' and not p.dtbm between '01/01/2026' and '01/31/2026'
  )
  -- рассматриваем только основных или внутренных совместителей
  and p.sovm in (0, 3)
  -- исключаем хоздоговорн€ков
  and p.kdkatp <> 13
  -- и не существует других €нварских записей с правильным базовым мес€цем
  and not exists (
    select 'x'
    from z_pere where tabn = p.tabn
      and dt_beg between '01/01/2026' and '01/31/2026'
      and bm = 'Y' and dtbm between '01/01/2026' and '01/31/2026'
  )
