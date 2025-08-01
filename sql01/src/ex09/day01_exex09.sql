select * from pizzeria
where pizzeria.id not in
(select pizzeria_id from person_visits);

select * from pizzeria
where not exists(
    select pizzeria_id
    from person_visits
    where person_visits.pizzeria_id = pizzeria.id
);