-- session 1
begin;
select * from pizzeria where name = 'Pizza Hut';

-- session 2
begin;
select * from pizzeria where name = 'Pizza Hut';

-- session 1
update pizzeria set rating = 4 where name = 'Pizza Hut';

-- session 2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';

-- session 1
commit;

-- session 2
commit;

-- session 1
select * from pizzeria where name = 'Pizza Hut';

-- session 2
select * from pizzeria where name = 'Pizza Hut';

