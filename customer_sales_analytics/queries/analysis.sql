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

--Simulate 10% of orders being returned
INSERT INTO returns(order_id, return_date, return_amount)
SELECT
    o.order_id,
    o.order_date + INTERVAL '7 days' AS return_date,
    ROUND(o.order_total * (0.2 + RANDOM() * 0.6)::NUMERIC, 2 ) AS return_amount
FROM orders o
WHERE RANDOM() < 0.10;


-- =========================
-- Net Revenue (Overall)
-- =========================

SELECT SUM(o.order_total) AS gross_revenue,
 SUM(COALESCE(r.return_amount, 0)) AS total_returns,
 SUM(o.order_total - COALESCE(r.return_amount,0)) AS net_revenue
FROM orders o
LEFT JOIN returns r on o.order_id = r.order_id;


-- =========================
-- Return Rates (Overall)
-- =========================

SELECT
    COUNT(DISTINCT r.order_id) as returned_orders,
    COUNT(DISTINCT o.order_id) as total_orders,
    ROUND(
    COUNT(DISTINCT r.order_id)::NUMERIC / COUNT(DISTINCT  o.order_id) * 100, 2) as order_return_rate_pct
    FROM orders o
LEFT JOIN returns r on o.order_id = r.order_id;

--Revenue return rate
SELECT
    ROUND(
    SUM(COALESCE(r.return_amount,0))
/ SUM(o.order_total) * 100,2) as revenue_return_rate_pct
FROM orders o
LEFT JOIN returns r on o.order_id = r.order_id;


-- =========================
-- Monthly Net Performance Metrics
-- =========================

WITH monthly_net AS (
    SELECT
        DATE_TRUNC('month', o.order_date)::DATE AS order_month,
        COUNT(DISTINCT o.order_id) as total_orders,
        SUM(o.order_total) as gross_revenue,
        SUM(COALESCE(r.return_amount, 0)) as total_returns,
    SUM(o.order_total - COALESCE(r.return_amount,0)) as net_revenue
FROM orders o
LEFT JOIN returns r on o.order_id = r.order_id
GROUP BY order_month
    )
SELECT
    order_month,
    total_orders,
    gross_revenue,
    total_returns,
    net_revenue,
    ROUND(total_returns / gross_revenue * 100,2) AS revenue_return_rate_pct
FROM monthly_net
ORDER BY order_month;
