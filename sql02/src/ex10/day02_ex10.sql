select  name as name1, name2, address as address from person
join (select name as name2, address as address2, id as id2 from person) as p2 on
        address2 = address and id > id2
order by name, name2, address;