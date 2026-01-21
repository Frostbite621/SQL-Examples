-- Uses LEFT JOIN to include products with no sales
-- COALESCE ensures zero is returned instead of NULL

SELECT p.product_id, ROUND(COALESCE(SUM(p.price * us.units) / SUM(us.units), 0),2) as "average_price"
FROM prices p
left join unitssold us on us.product_id = p.product_id AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
