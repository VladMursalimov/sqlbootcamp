select name
from
    (select count(*) as count,name
        from person_order
                 join public.person p on p.id = person_order.person_id
        group by name) as orders
where count > 0
order by name;