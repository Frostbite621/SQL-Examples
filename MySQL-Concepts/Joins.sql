--demonstrate knowledge of joins
--join two employee tables together, 1 for employee, 1 for supervisor

SELECT e2.ename as "Executive"
FROM employee e1
join employee e2 on e1.supervisorid = e2.employeeid
WHERE e1.ename = e2.ename;

SELECT e2.ename, e1.ename
FROM employee e1
join employee e2 on e1.supervisorid = e2.employeeid
ORDER BY e2.ename;


