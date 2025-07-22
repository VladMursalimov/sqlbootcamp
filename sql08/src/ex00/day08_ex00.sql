-- SESION #1

begin;
update pizzeria
set rating = 4.6
where name = 'Pizza Hut';

select * from pizzeria;

-- SESSION #2
select * from pizzeria;

-- SESSION #1
commit;

-- SESSION #2
select * from pizzeria;
