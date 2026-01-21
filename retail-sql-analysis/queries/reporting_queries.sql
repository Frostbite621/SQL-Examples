--Sales Reporting Queries
--Focus: store performance, product performance, and sales trends

--Aggregate total units sold and revenue by store

SELECT stores.store_name, SUM(sales.quantity_sold) as "Total Units Sold", SUM(sales.quantity_sold * price) as "Total Revenue"
FROM stores
         join sales on sales.store_id = stores.store_id
         join products on products.product_id = sales.product_id
group by stores.store_name;

--Returns each product and how many have been sold of each
SELECT products.product_name, SUM(quantity_sold) AS "Total Units Sold"
FROM products
         join sales on sales.product_id = products.product_id
group by products.product_id;




--Identifies the top 5 highest selling products by units sold
SELECT products.product_name, SUM(quantity_sold) AS "Total Units Sold"
FROM products
         join sales on sales.product_id = products.product_id
group by products.product_name
ORDER BY "Total Units Sold" DESC
    LIMIT 5;

--I wanted to see the sales data by month, so this query returns total products sold each month
SELECT date_trunc('month', sales.sale_date) AS sale_month, SUM(sales.quantity_sold) AS total_units_sold
FROM sales
GROUP BY sale_month
ORDER BY sale_month;






--Determine monthly sales for products

SELECT p.product_name, DATE_TRUNC('month', s.sale_date) as Sale_Month, SUM(s.quantity_sold) AS Monthly_Units_Sold
FROM products p
         join sales s  on p.product_id = s.product_id
GROUP BY p.product_name, Sale_Month

ORDER BY Sale_Month, Monthly_Units_Sold DESC;


