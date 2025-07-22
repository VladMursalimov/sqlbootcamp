select pizza_name, price, pizzeria.name as pizzeria_name from menu
join pizzeria on pizzeria.id = menu.pizzeria_id
left join person_order on menu.id = person_order.menu_id
where person_order.id is null
order by pizza_name, price, pizzeria.name;

