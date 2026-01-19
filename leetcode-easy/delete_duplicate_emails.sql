--delete duplicate records from a table
--joins the tables together and deletes the duplicated value

DELETE p1
FROM person p1 
JOIN person p2 on p1.email = p2.email
WHERE p1.id > p2.id;
