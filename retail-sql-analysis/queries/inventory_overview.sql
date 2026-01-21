--what inventory do we currently have for each product?
--Join products to inventory to determine quantity on hand
SELECT p.product_id, p.product_name, i.stock_quantity
FROM inventory i
         join products p on i.product_id = p.product_id
ORDER BY i.stock_quantity;

--what products sell the most?

SELECT p.product_name, SUM(s.quantity_sold) AS "Total Units Sold"
FROM products p
         join sales s  on p.product_id = s.product_id
         join inventory i on p.product_id = i.product_id
GROUP BY p.product_name, i.stock_quantity
ORDER BY "Total Units Sold" DESC;