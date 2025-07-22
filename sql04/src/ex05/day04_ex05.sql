create view v_price_with_discount as
(select person.name, menu.pizza_name, price, cast(price*0.9 as int) as discount_price from person_order
join menu on person_order.menu_id = menu.id
join person on person_order.person_id = person.id
order by 1, 2);