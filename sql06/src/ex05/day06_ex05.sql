comment on table person_discounts is 'Personal discount for all persons that used to order pizzas';
comment on column person_discounts.id is 'Primary key';
comment on column person_discounts.person_id is 'Foreign key to person';
comment on column person_discounts.pizzeria_id is 'Foreign key to pizzeria';
comment on column person_discounts.discount is 'Discount in percent from 0 to 100, float number';