SELECT
    person.address,
    round(max(person.age) - min(person.age) / max(person.age::numeric), 2) as formula,
    round(avg(person.age), 2) as average,
    case when (max(person.age) - min(person.age) / max(person.age::numeric)) > avg(person.age) then 'true' else 'false' end as comparison
FROM person
GROUP BY person.address
ORDER BY person.address;