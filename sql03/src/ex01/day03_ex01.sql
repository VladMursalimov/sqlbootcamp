select menu.id as menu_id from person_order
right join menu on person_order.menu_id = menu.id
where menu_id is null
order by menu_id;