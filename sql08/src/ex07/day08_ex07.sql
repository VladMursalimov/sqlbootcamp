-- s1

set session characteristics as transaction isolation level READ COMMITTED ;

-- s2
set session characteristics as transaction isolation level READ COMMITTED ;
--s1
begin;
--s2
begin;

--s1
update pizzeria
set rating = 5.0
where id = 1;

--s2
update pizzeria
set rating = 5.0
where id = 2;

--s1

update pizzeria
set rating = 1
where id = 2;


--s2

update pizzeria
set rating = 1
where id = 1;

--s1
commit;
--s2
commit;
