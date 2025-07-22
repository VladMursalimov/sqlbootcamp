select name, count as count_of_vists
from
    (
select count(*) as count,
       name
from person_visits
join public.person p on p.id = person_visits.person_id
group by name) as visits
where count > 3;