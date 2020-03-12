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
