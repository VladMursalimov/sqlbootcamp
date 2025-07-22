(select p.name as pizzeria_name
from pizzeria p
         join person_visits on p.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where gender = 'male'

except all

select p.name as pizzeria_name
from pizzeria p
         join person_visits on p.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where gender = 'female')

union all

(select p.name as pizzeria_name
from pizzeria p
         join person_visits on p.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where gender = 'female'

except all

select p.name as pizzeria_name
from pizzeria p
         join person_visits on p.id = person_visits.pizzeria_id
         join person on person_visits.person_id = person.id
where gender = 'male')
order by pizzeria_name;




/*
select pizzeria_name
from (
select pizzeria.name as pizzeria_name,
        sum(case when person.gender = 'female' then 1 else 0 end) as female,
        sum(case when person.gender = 'male' then 1 else 0 end) as male
    from pizzeria
        join person_visits on pizzeria.id = person_visits.pizzeria_id
        join person on person_visits.person_id = person.id
    group by pizzeria.name) as pv
where pv.female != pv.male
order by pizzeria_name;*/



