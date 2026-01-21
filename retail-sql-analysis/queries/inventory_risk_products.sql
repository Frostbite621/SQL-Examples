--what products are at risk of selling out?
--check stock quantity vs how many have sold
SELECT p.product_name, SUM(s.quantity_sold) AS "Total Units Sold", i.stock_quantity
FROM products p
         join sales s  on p.product_id = s.product_id
         join inventory i on p.product_id = i.product_id
GROUP BY p.product_name, i.stock_quantity
HAVING i.stock_quantity < 50
ORDER BY "Total Units Sold" DESC;