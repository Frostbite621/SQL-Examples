--Find the highest salary for each department
--Return all employees who share the highest salary in each department
--Use subqueries, aggreate, group by, and joins

SELECT department.name as "Department", employee.name as "Employee", employee.salary as "Salary"
FROM employee 
join department on employee.departmentid = department.id
WHERE (employee.salary,employee.departmentid) IN (
    SELECT MAX(employee.salary), employee.departmentid
    FROM employee
    GROUP BY departmentid
);
