select name from person_order
                     join menu on person_order.menu_id = menu.id
                     join person on person_order.person_id = person.id
where pizza_name = 'pepperoni pizza' and person.gender = 'female'
intersect
select name from person_order
                  join menu on person_order.menu_id = menu.id
                  join person on person_order.person_id = person.id
where pizza_name = 'cheese pizza' and person.gender = 'female'
order by name;
