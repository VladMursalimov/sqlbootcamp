select name from person_order
join menu on person_order.menu_id = menu.id
join person on person_order.person_id = person.id
where address in ('Moscow', 'Samara') and pizza_name in ('pepperoni pizza', 'mushroom pizza') and gender = 'male'
order by name desc ;