(select p.name as pizzeria_name
 from pizzeria p
          join menu on p.id = menu.pizzeria_id
        join person_order on menu.id = person_order.menu_id
          join person on person_order.person_id = person.id
 where gender = 'female'

 except

 select p.name as pizzeria_name
 from pizzeria p
          join menu on p.id = menu.pizzeria_id
          join person_order on menu.id = person_order.menu_id
          join person on person_order.person_id = person.id
 where gender = 'male')

union

(select p.name as pizzeria_name
 from pizzeria p
          join menu on p.id = menu.pizzeria_id
          join person_order on menu.id = person_order.menu_id
          join person on person_order.person_id = person.id
 where gender = 'male'

 except

 select p.name as pizzeria_name
 from pizzeria p
          join menu on p.id = menu.pizzeria_id
          join person_order on menu.id = person_order.menu_id
          join person on person_order.person_id = person.id
 where gender = 'female')
order by pizzeria_name;