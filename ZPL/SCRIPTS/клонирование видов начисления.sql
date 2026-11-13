select * from z_kdvidn 
where vidn > '2200' and vidn < '2300'
order by vidn;

===============================================

delete from z_kdvidn 
where vidn >= '2215' and vidn <= '2219';

===============================================

insert into z_kdvidn
  select * from z_kdvidn where vidn = '2203';
  
insert into z_kdvidn
  select * from z_kdvidn where vidn = '2204';  
  
insert into z_kdvidn
  select * from z_kdvidn where vidn = '2205';  
  
insert into z_kdvidn
  select * from z_kdvidn where vidn = '2206';  
  
insert into z_kdvidn
  select * from z_kdvidn where vidn = '2208';  

update z_kdvidn 
set vidn = '2215' 
where nr = (select max(nr) from z_kdvidn where vidn = '2203');

update z_kdvidn 
set vidn = '2216' 
where nr = (select max(nr) from z_kdvidn where vidn = '2204');

update z_kdvidn 
set vidn = '2217' 
where nr = (select max(nr) from z_kdvidn where vidn = '2205');

update z_kdvidn 
set vidn = '2218' 
where nr = (select max(nr) from z_kdvidn where vidn = '2206');

update z_kdvidn 
set vidn = '2219' 
where nr = (select max(nr) from z_kdvidn where vidn = '2208');

update z_kdvidn
set shvidn = left(shvidn ||  ' НИЧ', 15),
  nmvidn = left(nmvidn || ' (НИЧ совм)', 64),
  sovm = '1',
  indx = indx + 12,
  aindx = aindx + 12
where vidn >= '2215' and vidn <= '2219';

-- коррекция из-за разрыва между '2206' и '2208'
update z_kdvidn
set aindx = aindx - 1
where vidn = '2219';

-- увеличение на количество добавленных
update z_kdvidn
set aindx = aindx + 5
where vidn > '2219';
