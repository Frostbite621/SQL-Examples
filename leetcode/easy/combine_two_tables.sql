--Combine two tables
--Return the first name, last name and city, state of all persons in the table
--
SELECT person.firstname, person.lastname, address.city, address.state
FROM person
left join address on person.personid = address.personid;
