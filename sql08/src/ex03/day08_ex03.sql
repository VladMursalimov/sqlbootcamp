-- session 1
set session characteristics as transaction isolation level read committed ;

-- session 2
set session characteristics as transaction isolation level read committed ;


-- session 1
begin;

-- session 2
begin;

-- session 1
select  * from pizzeria
where name = 'Pizza Hut';

-- session 2

update pizzeria
set rating = 3.6 where name = 'Pizza Hut';

commit;

-- session 1

select * from pizzeria;
commit;

select * from pizzeria;

-- session 2
select *
from pizzeria;