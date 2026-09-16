#1. Customer revenue
SELECT c.customer_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

#2. Total number of items purchased by each customer
SELECT c.customer_name, SUM(o.quantity) AS total_items
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_items DESC;

#3. Number of orders
SELECT COUNT(o.order_id) AS number_of_orders, c.customer_name
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

#4. customers spending over 1 million
SELECT c.customer_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
HAVING total_revenue > 1000000;

#5.product revenue
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

#6.product quantity sold
SELECT p.product_name, SUM(o.quantity) AS total_items_sold
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_name;

#7.customer + product analytics
SELECT c.customer_name, p.product_name, SUM(o.quantity) AS total_items, SUM(o.quantity * p.price) AS total_revenue  
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name, p.product_name;
    
#8.product that generated the highest revenue
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

#.9 Customer who purchased the largest total number of items
SELECT c.customer_name, SUM(o.quantity) AS total_items
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_items DESC
LIMIT 1;

#.10 Customer who have placed more than one order
SELECT c.customer_name, COUNT(o.order_id) AS number_of_orders
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING number_of_orders >1;

A.Show each customer's name and number of orders, from highest to lowest.
SELECT c.customer_name, COUNT(o.order_id) AS number_of_orders 
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY number_of_orders DESC;

B.Show each product's name and total number of items sold, from highest to lowest.
SELECT p.product_name, SUM(o.quantity) AS total_items
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_items DESC;

C.Show customers whose total number of purchased items is greater than 3.
SELECT c.customer_name, SUM(o.quantity) AS total_items
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING total_items > 3;

D.Show each customer and product combination with its total revenue.
SELECT c.customer_name, p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name, p.product_name;

E.Show the customer who generated the highest revenue and display their total number of orders.
SELECT c.customer_name, SUM(o.quantity * p.price) AS total_revenue, COUNT(o.order_id) AS number_of_orders  
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 1;

