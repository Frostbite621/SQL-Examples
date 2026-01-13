--Report first/last name, city, and state
--of each person in the person table, if no address is 
--present, report null

SELECT person.firstname, person.lastname, address.city, address.state
FROM person
left join address on person.personid = address.personid;
