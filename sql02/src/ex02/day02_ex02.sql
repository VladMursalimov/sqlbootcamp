select
    COALESCE(person.name, '-') as person_name,
    visit_date AS visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
from person_visits
right join generate_series('2022-01-01', '2022-01-3', interval '1 day') as gs
on visit_date = gs
full join person on person_visits.person_id = person.id
full join pizzeria on person_visits.pizzeria_id = pizzeria.id
order by person_name, visit_date, pizzeria_name;