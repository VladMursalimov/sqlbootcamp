-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH ranked_balances AS (
    SELECT
        user_id,
        currency_id,
        money * rate_to_usd AS currency_in_usd,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, b.updated, money, type, currency_id
            ORDER BY ABS(EXTRACT(EPOCH FROM b.updated) - EXTRACT(EPOCH FROM c.updated))
        ) AS rn
    FROM balance b
    JOIN currency c ON b.currency_id = c.id
)
SELECT
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    (SELECT name FROM currency c WHERE rb.currency_id = c.id LIMIT 1) as currency_name,
    rb.currency_in_usd
FROM ranked_balances rb
LEFT JOIN "user" u on u.id =  rb.user_id
WHERE rn = 1
ORDER BY 1 DESC, 2 ASC, 3 ASC;
