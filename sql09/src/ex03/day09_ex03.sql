create function fnc_trg_person_audit() returns trigger as
    $trg_person_audit$
begin
    if (TG_OP = 'INSERT') then
       insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'I', new.*;
elsif (TG_OP = 'UPDATE') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'U', old.*;
elsif (TG_OP = 'DELETE') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'D', old.*;
end if;
return null;
end
    $trg_person_audit$ language plpgsql;

CREATE TRIGGER trg_person_audit
    after INSERT or update or delete
    ON person
    FOR EACH ROW
    EXECUTE function fnc_trg_person_audit();


drop trigger trg_person_insert_audit on person;
drop function fnc_trg_person_insert_audit();

drop trigger trg_person_update_audit on person;
drop function fnc_trg_person_update_audit();

drop trigger trg_person_delete_audit on person;
drop function fnc_trg_person_delete_audit();

truncate table person_audit;

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

select * from person_audit
