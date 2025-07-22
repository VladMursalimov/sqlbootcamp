select pizzeria.name,
       count(*) as count_of_orders,
       round(avg(menu.price), 2) as average_price,
       max(menu.price) as max_price,
       min(menu.price) as min_price
from pizzeria
join menu on pizzeria.id = menu.pizzeria_id
join person_order on menu.id = person_order.menu_id
group by pizzeria.name
order by name;