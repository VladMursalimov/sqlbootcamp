create sequence seq_person_discounts
start with 1;

select setval('seq_person_discounts', (select coalesce(max(id), 0) + 1 from person_discounts));

alter table person_discounts
alter column id set default nextval('seq_person_discounts');

insert into person_discounts(person_id, pizzeria_id, discount)
values (1,3,1);