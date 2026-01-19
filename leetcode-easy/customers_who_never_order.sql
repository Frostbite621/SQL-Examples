--Write a query to find customers who do not order anything
--use left join to join tables and filter null values

SELECT name as "Customers"
FROM customers
left join orders on customers.id = orders.customerid
WHERE orders.customerid is null;
