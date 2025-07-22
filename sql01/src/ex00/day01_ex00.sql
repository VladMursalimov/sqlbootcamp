-- Exercise 09 - Exercise 10 - Global JOIN

/* Пожалуйста, напишите инструкцию SQL, которая возвращает список имен людей, заказавших пиццу в соответствующей пиццерии.
 * Пример результата (с именованными столбцами) приведен ниже, и да ... пожалуйста, оформляйте заказ по 3 столбцам
 * (person_name, pizza_name, pizzeria_name) в порядке возрастания.
*/

SELECT person.name AS person_name,
       menu.pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
         JOIN person ON person_order.person_id = person.id
         JOIN menu ON person_order.menu_id = menu.id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;