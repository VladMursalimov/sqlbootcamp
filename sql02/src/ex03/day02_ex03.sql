with days (day)
as (select gs::date
    from generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs
    )
select days.day as missing_date
    from (select * from person_visits
        where person_id = 1 or person_id = 2) as pv
right join days on days.day = visit_date
where pv.visit_date is null
order by missing_date ;