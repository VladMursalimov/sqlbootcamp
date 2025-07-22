create function fnc_person_visits_and_eats_on_date
    (in pperson varchar default 'Dmitriy',
     in pprice numeric default 500,
     in pdate date default '2022-01-08')
returns table(pizzeria_name varchar)
as $$
    begin
        return query
(select pizzeria.name
 from person_visits
          join person on person_visits.person_id = person.id
          join pizzeria on pizzeria.id = person_visits.pizzeria_id
          join menu on pizzeria.id = menu.pizzeria_id
 where person.name = pperson
   and menu.price < pprice
   and visit_date = pdate);
end;
$$
    language plpgsql;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');