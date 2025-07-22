select pizzeria.name as pizzeria_name
from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person on person_visits.person_id = person.id
where person.name = 'Andrey'

except

select pizzeria.name as pizzeria_name
from pizzeria
    join menu on pizzeria.id = menu.pizzeria_id
    join person_order on menu.id = person_order.menu_id
    join person on person_order.person_id = person.id
where person.name = 'Andrey'
order by 1;