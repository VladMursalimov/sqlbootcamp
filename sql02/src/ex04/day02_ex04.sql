select pizza_name, pizzeria.name as pizzeria_name, price
from menu
join pizzeria on pizzeria_id = pizzeria.id
where menu.pizza_name = 'mushroom pizza' or menu.pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name;
