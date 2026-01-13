--Select the second highest distinct salary from the employee table
--demonstrate knowledge of subqueries and aggregation 
--

SELECT distinct MAX(employee.salary) as "SecondHighestSalary"
FROM Employee
WHERE employee.salary < ( 
    SELECT MAX(employee.salary)
    FROM employee
);
