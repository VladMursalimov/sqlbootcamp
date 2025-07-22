select
    visits.name,
    coalesce(visits.count_visit, 0) + coalesce(orders.count_order, 0) as total_count
    from
(SELECT pizzeria.name,
        COUNT(person_order.person_id) AS count_order
 FROM pizzeria
     join menu on pizzeria.id = menu.pizzeria_id
          JOIN person_order ON person_order.menu_id = menu.id
 GROUP BY name) as orders
    full join
(SELECT pizzeria.name,
        COUNT(person_visits.person_id) AS count_visit
 FROM person_visits
          JOIN pizzeria ON pizzeria_id = pizzeria.id
 GROUP BY name) as visits on orders.name = visits.name
order by total_count desc;


