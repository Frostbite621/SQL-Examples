--Write a solution to find employees 
--who make more than their managers
--Utilizes query and join

SELECT e.name as "Employee"
FROM employee e
left join employee m on e.managerid = m.id
WHERE e.salary > m.salary;
