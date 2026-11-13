--------------------------
-- Ñ÷¸ò 8011
-- Âèä 2405
-- ÏÏÑ
-- Ñ àâãóñòà ìåñÿöà âêëþ÷èòåëüíî
--------------------------

'ÂÎÑÑÒÀÍÎÂËÅÍÎ ÂÑ¨'

update z_otkl o
  set o.dtproc = '7/1/2026'
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