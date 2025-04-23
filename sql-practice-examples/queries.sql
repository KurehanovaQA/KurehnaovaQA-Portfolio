--1. SELECT with WHERE
--Get all users older than 21
SELECT * FROM users WHERE age > 21;

-- 2. SELECT with ORDER BY
-- Get all products sorted by price descending
SELECT * FROM products ORDER BY price DESC;

-- 3. COUNT with GROUP BY
-- Count how many orders each user has made
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;

-- 4. AVG with GROUP BY and HAVING
-- Get product categories with average price higher than 50
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 50;

-- 5. INNER JOIN
-- Get a list of orders with user names
SELECT o.id AS order_id, u.name AS user_name
FROM orders o
INNER JOIN users u ON o.user_id = u.id;

-- 6. LEFT JOIN
-- Get all users with their orders (if any)
SELECT u.name, o.id AS order_id
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;

-- 7. Subquery
-- Get users who have made more than 3 orders
SELECT * FROM users
WHERE id IN (
    SELECT user_id
    FROM orders
    GROUP BY user_id
    HAVING COUNT(*) > 3
);

-- 8. INSERT
-- Add a new user
INSERT INTO users (name, email, age)
VALUES ('Tonya', 'tonya@email.com', 24);

-- 9. UPDATE
-- Update email of a specific user
UPDATE users
SET email = 'new_email@example.com'
WHERE name = 'Tonya';

-- 10. DELETE
-- Delete all users younger than 13
DELETE FROM users
WHERE age < 13;
