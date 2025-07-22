
select person.name,
       count(pizzeria_id) as count
from person_visits
         join person on person_visits.person_id = person.id
group by person.name
order by count desc, person.name
limit 4;
