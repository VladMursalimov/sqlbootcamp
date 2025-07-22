
select menu.pizza_name, pizzeria.name as pizzeria_name_1,
    m.pizzeria_name_2, menu.price
from menu
join pizzeria on pizzeria_id = pizzeria.id

join (select pizzeria_id as id2, pizza_name, pizzeria.name as pizzeria_name_2, price
      from menu
          join pizzeria on pizzeria_id = pizzeria.id) as m
    on m.pizza_name = menu.pizza_name and m.price = menu.price
where pizzeria_id > m.id2
order by pizza_name;