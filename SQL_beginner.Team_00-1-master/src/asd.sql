WITH RECURSIVE MinCostPaths AS (
    SELECT point2 AS endpoint, cost AS total_cost, point1, point2, 1 as visited
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL

    SELECT CC.point2 AS endpoint, MCP.total_cost + CC.cost AS total_cost, MCP.point1, MCP.point2, MCP.visited + 1
    FROM MinCostPaths MCP
             JOIN nodes CC ON MCP.endpoint = CC.point1
    WHERE MCP.visited < (SELECT COUNT(DISTINCT point1) FROM nodes WHERE point1 = 'a')
      AND NOT (MCP.point1 = CC.point2 AND MCP.point2 = CC.point1)
)
SELECT *
FROM MinCostPaths
ORDER BY total_cost
    LIMIT 1;