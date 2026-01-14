--Return emails in a database that are duplicated among primary keys
--Utilizes GROUP BY 
--and HAVING, and COUNT

SELECT email as "Email"
FROM person
GROUP BY email
HAVING COUNT(email) > 1;
