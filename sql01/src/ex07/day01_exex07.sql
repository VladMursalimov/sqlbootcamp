
select person_order.order_date,
       concat_ws('', person.name, ' (age:', person.age, ')') as person_information
from person_order
inner join person on person_order.person_id = person.id
order by order_date, person_information;