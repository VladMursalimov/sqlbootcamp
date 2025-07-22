create unique index idx_menu_unique on menu(pizzeria_id, pizza_name);


set enable_seqscan to off;
explain analyze
select *
from menu
where pizzeria_id = 2 and pizza_name like '%pizza';