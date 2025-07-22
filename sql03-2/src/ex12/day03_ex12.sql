insert into person_order (id, person_id, menu_id, order_date)

select ((select max(id) from person_order) + row_number() over ()),
       person.id,
       (select id from menu where pizza_name = 'greek pizza'),
       '2022-02-25'
from person;