-- s1

set session characteristics as transaction isolation level REPEATABLE READ  ;

-- s2
set session characteristics as transaction isolation level REPEATABLE READ  ;
--s1
begin;
--s2
begin;

--s1
select sum(rating) from pizzeria;

--s2
insert into pizzeria
values (11, 'Kazan Pizza 2', 4.0);
commit;

--s1
select sum(rating) from pizzeria;

commit;

select sum(rating) from pizzeria;

-- s2

select sum(rating) from pizzeria;
