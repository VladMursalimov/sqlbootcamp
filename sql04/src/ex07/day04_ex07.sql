insert into person_visits
values ((select max(id) from person_visits)+1,
    (select id from person where name = 'Dmitriy'),
    3,
    '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
