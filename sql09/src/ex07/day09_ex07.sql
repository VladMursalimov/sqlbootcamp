CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
    RETURNS numeric
AS
$$
DECLARE
    min_val numeric;
BEGIN
    SELECT min(val) INTO min_val FROM unnest(arr) val;
    RETURN min_val;
END
$$
    LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
