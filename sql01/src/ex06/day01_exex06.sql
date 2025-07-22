select distinct order_date as action_date,
                (select name from person where person.id = person_order.person_id) as person_name
from person_order
where order_date in
      (select person_visits.visit_date as action_date
       from person_visits)
order by action_date asc, person_name desc;