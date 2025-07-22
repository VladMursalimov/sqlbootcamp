select name, rating from person_visits
right join pizzeria on person_visits.pizzeria_id = pizzeria.id
where pizzeria_id is null;