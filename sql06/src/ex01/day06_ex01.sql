truncate table person_discounts;

insert into person_discounts(id, person_id, pizzeria_id, discount)
select ((select coalesce(max(id), 0) from person_discounts) + row_number() over ()),
       person_id,
       menu.pizzeria_id,
       case
           when count(person_id) = 1 then 10.5
           when count(person_id) = 2 then 22
           else 30
           end as discount
from person_order join menu on person_order.menu_id = menu.id
group by person_id, menu.pizzeria_id;
