(select name as object_name
from person
order by name)
union all
(select menu.pizza_name as object_name
from menu
order by pizza_name);