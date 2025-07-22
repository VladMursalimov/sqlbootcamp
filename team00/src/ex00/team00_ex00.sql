create table nodes(
    point1 varchar(2),
    point2 varchar(2),
    cost integer
);

insert into nodes
values
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'c', 30);


WITH RECURSIVE Path AS (
    SELECT point1, point2, cost AS total_cost_old,
           ARRAY[point1, point2] AS visited_points
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL

    SELECT n.point1, n.point2,
           p.total_cost_old + n.cost,
           (p.visited_points || n.point2)::character varying(2)[]
    FROM nodes n
             JOIN Path p ON n.point1 = p.point2
    WHERE NOT n.point2 = ANY(p.visited_points)
)

SELECT total_cost_old + nodes.cost AS total_cost, array_append(visited_points, 'a') AS tour
FROM Path
         JOIN nodes ON Path.point2 = nodes.point2 AND nodes.point1 = 'a'
WHERE array_length(visited_points, 1) = 4
  AND total_cost_old + nodes.cost = (
    SELECT MIN(total_cost)
    FROM (
             SELECT total_cost_old + nodes.cost AS total_cost
             FROM Path
                      JOIN nodes ON Path.point2 = nodes.point2 AND nodes.point1 = 'a'
             WHERE array_length(visited_points, 1) = 4
         ) AS min_costs
)
ORDER BY total_cost, tour;