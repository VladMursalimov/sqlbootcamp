select person_id,
       count(pizzeria_id) as count
from person_visits
group by person_id
order by count desc, person_id;