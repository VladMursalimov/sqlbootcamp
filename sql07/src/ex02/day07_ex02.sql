(select pizzeria.name,
    count(person_visits.person_id) as count,
    'visit' as action_type
from person_visits
join pizzeria on pizzeria_id = pizzeria.id
group by name
order by count desc
limit 3)

union

(select pizzeria.name,
       count(person_order.person_id) as count,
       'order' as action_type
from person_order
         join menu on menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by name
order by count desc
limit 3)
order by action_type, count desc;
