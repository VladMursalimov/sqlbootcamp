-- s1

set session characteristics as transaction isolation level READ COMMITTED  ;

-- s2
set session characteristics as transaction isolation level READ COMMITTED  ;
--s1
begin;
--s2
begin;

--s1
select sum(rating) from pizzeria;

--s2
insert into pizzeria
values (10, 'Kazan Pizza', 5.0);
commit;

--s1
select sum(rating) from pizzeria;

commit;

select sum(rating) from pizzeria;

-- s2

select sum(rating) from pizzeria;
