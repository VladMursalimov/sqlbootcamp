select
    address,
    pizzeria.name,
    count(*) as  count_of_orders
from person_order
    join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by pizzeria.name, address
order by address, pizzeria.name;