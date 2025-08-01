

create function fnc_trg_person_update_audit() returns trigger as
    $trg_person_update_audit$
    begin
    if (TG_OP = 'UPDATE') then
        insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'U', old.*;
    end if;
    return null;
    end
    $trg_person_update_audit$ language plpgsql;


create trigger trg_person_update_audit
    after update
    on person
    for each row
    execute function fnc_trg_person_update_audit();



UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

select * from person_audit


--drop trigger trg_person_update_audit on person;
--drop function fnc_trg_person_update_audit();
