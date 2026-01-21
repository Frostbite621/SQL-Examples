--Determine monthly sales for products

SELECT p.product_name, DATE_TRUNC('month', s.sale_date) as Sale_Month, SUM(s.quantity_sold) AS Monthly_Units_Sold
FROM products p
         join sales s  on p.product_id = s.product_id
GROUP BY p.product_name, Sale_Month

ORDER BY Sale_Month, Monthly_Units_Sold DESC;