select distinct order_date as action_date, person_id
from person_order
where order_date in
      (select person_visits.visit_date as action_date
        from person_visits)
order by action_date asc, person_id desc ;