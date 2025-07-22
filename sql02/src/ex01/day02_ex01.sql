select gs::date as missing_date
from (select * from person_visits where person_id = 1 or person_id = 2)
right join generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs
on gs = visit_date
where visit_date is null
order by missing_date asc;