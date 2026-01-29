-- Analytical Queries
-- Purpose: Answer business questions using validated relational data
-- Author: Tyler Kelley
-- Date: 1/29/26

-- Result: returns a single row with total revenue across all orders
SELECT SUM(order_total) as total_revenue
FROM orders;

--Result: returns revenue on a monthly basis, (Jan has no orders since customer acquisition egan in Feb
SELECT DATE_TRUNC('month', order_date)::DATE AS revenue_month,
SUM(order_total) as monthly_revenue
FROM orders
GROUP BY revenue_month
ORDER BY revenue_month;

--Returns average order total
SELECT DATE_TRUNC('month', order_date)::DATE as order_month,
       ROUND(AVG(order_total),2) as average_order_value
FROM orders
GROUP BY order_month
ORDER BY order_month;

--Result: Return monthly order count
SELECT DATE_TRUNC('month', order_date)::DATE as order_month,
       COUNT(*) as total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;

--Result: Combine the above to show a clean split of orders, order value, and total revenue by month
WITH monthly_metrics AS(
    SELECT
        DATE_TRUNC('month',order_date)::DATE as order_month,
        COUNT(*) as total_orders,
        SUM(order_total) as total_revenue,
        ROUND(AVG(order_total),2) as average_order_value
    FROM orders
    GROUP BY order_month
)
SELECT
    order_month,
    total_orders,
    total_revenue,
    average_order_value
FROM monthly_metrics
ORDER BY order_month;
