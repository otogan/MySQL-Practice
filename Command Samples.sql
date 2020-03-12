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
