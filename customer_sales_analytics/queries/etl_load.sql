-- ETL Load Script
-- Purpose: Load flat retail analytics dataset into normalized PostgreSQL schema
-- Author: Tyler Kelley
-- Date: 01/27/26


DROP TABLE IF EXISTS staging_retail_flat;

CREATE TABLE staging_retail_flat (
customer_id TEXT,
signup_date TEXT,
region TEXT,
customer_segment TEXT,
order_id TEXT,
order_date TEXT,
order_total TEXT,
product_id TEXT,
product_name TEXT,
category TEXT,
quantity TEXT,
unit_price TEXT,
line_total TEXT
);

TRUNCATE TABLE
    order_items,
    orders,
    products,
    customers
RESTART IDENTITY CASCADE;

-- =========================
-- Load Customers
-- =========================
INSERT INTO customers(customer_id, signup_date, region, customer_segment)
SELECT DISTINCT
    customer_id::INT,
    to_date(signup_date, 'MM/DD/YYYY'),
    region,
    customer_segment
FROM staging_retail_flat;

-- =========================
-- Load Products
-- =========================
INSERT INTO products (product_id, product_name, category, base_price)
SELECT
    product_id::INT,
    product_name,
    category,
    ROUND(AVG(unit_price::NUMERIC),2)AS base_price
FROM staging_retail_flat
GROUP BY product_id, product_name, category;

-- =========================
-- Load Orders
-- =========================
INSERT INTO orders(order_id, customer_id, order_date, order_total)
SELECT DISTINCT
    order_id::INT,
    customer_id::INT,
    TO_DATE(order_date, 'MM/DD/YYYY'),
    order_total::NUMERIC
FROM staging_retail_flat;

-- =========================
-- Load Order Items
-- =========================
INSERT INTO order_items(order_id, product_id, quantity, unit_price)
SELECT
    order_id::INT,
    product_id::INT,
    quantity::INT,
    unit_price::NUMERIC
FROM staging_retail_flat;