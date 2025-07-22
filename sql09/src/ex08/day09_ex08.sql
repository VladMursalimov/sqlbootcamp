create or replace function fnc_fibonacci(in pstop integer default 10)
    returns table (n integer)
    as $$
    declare a integer := 0;
        b integer := 1;
        next_fib integer;
    begin
        while b <= pstop loop
            return query select b;
            next_fib := a + b;
            a := b;
            b := next_fib;
        end loop;
        end;
    $$ language plpgsql;


select * from fnc_fibonacci(13);
