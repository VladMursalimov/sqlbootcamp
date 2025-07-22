create unique index idx_person_order_order_date on
    person_order(person_id, menu_id, order_date)
where order_date = '2022-01-01';


set enable_seqscan to off;
explain analyze
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19 and order_date = '2022-01-01';