select p.name as name, m.pizza_name, price,
       price * (100 - discount) / 100 as discount_price, pz.name as pizzeria_name
from person_order
         join menu m on person_order.menu_id = m.id
         join person p on person_order.person_id = p.id
         join pizzeria pz on m.pizzeria_id = pz.id
         join person_discounts on person_order.person_id = person_discounts.person_id
    and pz.id = person_discounts.pizzeria_id
order by p.name, pizza_name;