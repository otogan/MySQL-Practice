USE sql_store;

SELECT 'name', unit_price, unit_price * 1.1 as new_price
FROM products;

-- Use of LIKE
-- % any number of characters
-- _ single character

-- Use of REGEXP
-- ^ beginning
-- $ end
-- | logical or
-- [abcd] any character in the series
-- [a-f] character range

-- Use of LIMIT
SELECT *
FROM customers
LIMIT 6, 3;
-- 6 offset
-- 3 number of records

-- Use of INNER JOIN
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
-- Exersice
SELECT oi.order_id, oi.product_id, p.name as product_name, oi.quantity, oi.unit_price
FROM sql_store.order_items oi
JOIN products p ON oi.product_id = p.product_id;
-- Self Join
USE sql_hr;
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m ON e.reports_to = m.employee_id;
-- Join Multiple Tables
USE sql_store;
SELECT 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_statuses os ON o.status = os.order_status_id;
-- Exercise
USE sql_invoicing;
SELECT 
	p.payment_id,
    p.client_id,
    c.name AS client_name,
    p.invoice_id,
    p.date,
    p.amount,
    pm.name AS payment_method
FROM payments p
JOIN clients c ON c.client_id = p.client_id
JOIN payment_methods pm ON pm.payment_method_id = p.payment_method;
-- LEFT JOIN
SELECT 
	p.product_id,
    p.name,
    oi.quantity AS ordered_quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
-- LEFT JOIN Multiple Tables
SELECT
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;
-- Exercise
USE sql_store;
SELECT
	o.order_id,
    o.order_date,
    c.first_name AS customer,
    s.name AS shipper,
    os.name AS status
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN shippers s ON o.shipper_id = s.shipper_id
LEFT JOIN order_statuses os ON o.status = os.order_status_id;