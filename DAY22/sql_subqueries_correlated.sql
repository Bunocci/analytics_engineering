#Customers with multiple orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
WHERE (
    SELECT COUNT(*)
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
) > 1;