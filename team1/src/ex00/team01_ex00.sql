SELECT
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    b.type,
    sum(b.money) as volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    coalesce(rate_to_usd, 1) as rate_to_usd,
    sum(b.money) * coalesce(rate_to_usd, 1) as volume_usd
FROM
    balance b
        LEFT JOIN (SELECT id, name, rate_to_usd, updated
        FROM currency c1
        WHERE c1.updated = (SELECT MAX(c2.updated)
                FROM currency c2
                WHERE c1.id = c2.id)
    ) c ON b.currency_id = c.id
full join "user" u on u.id = b.user_id
group by u.name, u.lastname, c.name, b.type, rate_to_usd
order by
    case when u.name is null then 0 else 1 end desc,
    case when u.lastname is null then 0 else 1 end, b.type;