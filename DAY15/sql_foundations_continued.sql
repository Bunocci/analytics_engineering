#1. basic INNER JOIN
SELECT c.customer_name, o.order_id
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

#2. JOIN + product
SELECT p.product_name, o.order_id, o.quantity
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;
    
#3. Three_table JOIN
SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
    
#4. JOIN + calculation
SELECT o.order_id, c.customer_name, p.product_name, o.quantity,o.quantity * p.price AS order_total 
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
    
#5. JOIN + WHERE
SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE c.customer_name = 'Bruno';

#6. LEFT JOIN
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;

#7. No Orders
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

#8. Analytics
SELECT c.customer_name,SUM(o.quantity * p.price) AS total_revenue 
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name;

#9. Top customer
SELECT c.customer_name,SUM(o.quantity * p.price) AS total_revenue  
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 1;

#10 Customer with highest number of orders
SELECT c.customer_name,SUM(o.quantity)  
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.quantity) DESC;
