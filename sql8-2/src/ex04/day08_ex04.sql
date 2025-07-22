-- s1

set session characteristics as transaction isolation level SERIALIZABLE  ;
--s2
set session characteristics as transaction isolation level SERIALIZABLE  ;
--s1
begin;
--s2
begin;
--s1
select * from pizzeria where name = 'Pizza Hut';

--s2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';

commit;

--s1
select * from pizzeria where name = 'Pizza Hut';
commit;

--s1
select * from pizzeria where name = 'Pizza Hut';
-- s2
select * from pizzeria where name = 'Pizza Hut';
