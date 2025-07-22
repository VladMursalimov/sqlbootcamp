CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER default 10,
    gender VARCHAR default 'female',
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

create function fnc_trg_person_insert_audit() returns trigger as
    $trg_person_insert_audit$
    begin
    if (TG_OP = 'INSERT') then
       insert into person_audit select current_timestamp at time zone 'Europe/Moscow', 'I',
                                       NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
    end if;
    return null;
    end
    $trg_person_insert_audit$ language plpgsql;

CREATE TRIGGER trg_person_insert_audit
    after INSERT
    ON person
    FOR EACH ROW
    EXECUTE function fnc_trg_person_insert_audit()


INSERT INTO person(id, name, age, gender, address)
        VALUES (10,'Damir', 22, 'male', 'Irkutsk');

select * from person_audit
