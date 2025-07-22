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

SELECT total_cost_old + nodes.cost as total_cost, array_append(visited_points, 'a') as tour
FROM Path
         join nodes on Path.point2 = nodes.point2 and nodes.point1 = 'a'
where array_length(visited_points, 1) = 4

ORDER BY total_cost, tour;