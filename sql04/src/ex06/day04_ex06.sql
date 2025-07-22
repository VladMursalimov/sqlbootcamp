
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(select pizzeria.name as pizzeria_name
from person_visits
         join person on person_visits.person_id = person.id
         join pizzeria on person_visits.pizzeria_id = pizzeria.id
         join menu on pizzeria.id = menu.pizzeria_id
where visit_date = '2022-01-08' and person.name = 'Dmitriy' and price < 800);
