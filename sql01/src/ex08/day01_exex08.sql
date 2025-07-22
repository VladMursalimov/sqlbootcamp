
select person_order.order_date,
       concat_ws('', tperson.name, ' (age:', tperson.age, ')') as person_information
from person_order
natural join (SELECT id AS person_id, name, age FROM person) AS tperson
order by order_date, person_information;