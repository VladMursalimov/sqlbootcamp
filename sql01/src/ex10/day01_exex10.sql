
select person.name, pizza_name, pizzeria.name from person_order
inner join person on person_order.person_id = person.id
inner join menu on person_order.menu_id = menu.id
inner join pizzeria on menu.pizzeria_id = pizzeria.id
order by person.name, pizza_name, pizzeria.name;