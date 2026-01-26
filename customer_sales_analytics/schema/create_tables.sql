--Identify customers
CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
signup_date DATE NOT NULL,
region TEXT  NOT NULL,
customer_segment TEXT NOT NULL
);

--what is being sold
CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name TEXT NOT NULL,
category TEXT NOT NULL,
base_price NUMERIC(10,2) NOT NULL
);

--one row = one transaction
CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL,
order_date DATE NOT NULL,
order_total NUMERIC(10,2) NOT NULL,
CONSTRAINT fk_orders_customer
	FOREIGN KEY (customer_id)
	REFERENCES customers(customer_id)
);

--line item details
CREATE TABLE order_items(
order_item_id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL,
product_id INTEGER NOT NULL,
quantity INTEGER NOT NULL,
unit_price NUMERIC(10,2) NOT NULL,
CONSTRAINT fk_items_order
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id),
CONSTRAINT fk_items_product
	FOREIGN KEY (product_id)
	REFERENCES products(product_id)
);

--negative events
CREATE TABLE returns(
return_id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL,
return_date DATE NOT NULL,
return_amount NUMERIC(10,2) NOT NULL,
CONSTRAINT fk_returns_order
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id)
);

