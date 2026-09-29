#Exercise 1:The total number of items purchased from orders where quantity is at least 3
SELECT
    SUM(
    CASE
        WHEN quantity >= 3 THEN quantity
        ELSE 0
        END ) AS total_number_of_items
FROM orders;
            
#Exercise 2: The number of orders where quantity is at least 3

SELECT
SUM (
CASE
    WHEN quantity >= 3 THEN 1
    ELSE 0
    END ) AS number_of_orders
    
FROM orders;

#Exercise 3: Customer analysis
SELECT 
    c.customer_name,c.customer_id, 
    SUM(
    CASE
        WHEN o.quantity >= 3 THEN 1
            ELSE 0
        END ) AS large_order_count
FROM customers AS c
    LEFT JOIN orders AS o
        ON o.customer_id = c.customer_id
GROUP BY c.customer_name, c.customer_id;  

#Exercise 4 Product analysis: Build a customer performance query showing
customer_name
total_orders
total_items
total_revenue
large_orders
large_order_revenue

SELECT 
    p.product_name,p.product_id, 
    SUM(
    CASE
        WHEN o.quantity >= 3 THEN o.quantity
            ELSE 0
        END ) AS large_order_items
FROM products AS p
    INNER JOIN orders AS o
        ON o.product_id = p.product_id
GROUP BY p.product_name, p.product_id;

#Exercise 5: Real Analytics Engineer challenge
SELECT 
    c.customer_name, COALESCE(SUM(p.price*o.quantity),0) AS total_revenue, COUNT(o.order_id) AS total_orders, COALESCE(SUM(o.quantity),0) AS total_items,
    SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN 1
        ELSE 0
        END) AS large_orders,
        
    SUM(
    CASE
        WHEN p.price*o.quantity >= 1000000 THEN p.price*o.quantity
        ELSE 0
        END) AS large_order_revenue
FROM customers AS c
     LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
     LEFT JOIN products AS p
        ON p.product_id = o.product_id