-- SESION #1

begin;
update pizzeria
set rating = 5
where name = 'Pizza Hut';

select * from pizzeria where name = 'Pizza Hut';

-- SESSION #2
select * from pizzeria where name = 'Pizza Hut';

-- SESSION #1
commit;

-- SESSION #2
select * from pizzeria where name = 'Pizza Hut';

