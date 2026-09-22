#Exercise 1 — Product price category
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 1000000 THEN 'Expensive'
        WHEN price >= 100000 THEN 'Medium'
        ELSE 'Cheap'
        END AS price_category
    FROM products;

#Exercise 2 — Order size

SELECT
    order_id,
    quantity,
    CASE
        WHEN quantity >= 5 THEN 'Large'
        WHEN quantity >= 3 THEN 'Medium'
        ELSE 'Small'
    END AS order_size
FROM orders;

#Exercise 3 — Order value
SELECT
    o.order_id,
    p.product_name,
    p.price*o.quantity AS order_total,
    
    CASE
        WHEN  p.price*o.quantity >= 1000000 THEN 'High Value'
        WHEN  p.price*o.quantity >= 500000 THEN 'Medium Value'
        ELSE 'Low value'
    END AS order_category
FROM orders AS o
    INNER JOIN products AS p
        ON p.product_id = o.product_id;
        
#Exercise 4 — Customer type
SELECT
    o.order_id,
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders,
    
    CASE
        WHEN COUNT(o.order_id) >= 3 THEN 'Frequent'
        WHEN COUNT(o.order_id) >= 2 THEN 'Regular'
        WHEN COUNT(o.order_id) >= 1 THEN 'Occasional'
        ELSE 'No orders'
    END AS customer_type
FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
        
GROUP BY c.customer_name,c.customer_id;
        
#Exercise 5 — Customer spending category

SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_revenue,
    
    CASE
        WHEN SUM(o.quantity * p.price) >= 5000000 THEN 'VIP'
        WHEN SUM(o.quantity * p.price) >= 1000000 THEN 'High Value'
        WHEN SUM(o.quantity * p.price) >= 500000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers AS c
    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id
    INNER JOIN products AS p
        ON p.product_id = o.product_id
        
GROUP BY c.customer_id, c.customer_name;

#challenge 1: Use a LEFT JOIN so that customers with no orders are also included

SELECT
    c.customer_name,
    COALESCE(SUM(o.quantity),0) AS total_items,
    COALESCE(SUM(p.price*o.quantity),0) AS total_revenue,
    
    CASE
        WHEN COALESCE(SUM(p.price*o.quantity),0) >= 5000000 THEN 'VIP'
        WHEN COALESCE(SUM(p.price*o.quantity),0) >= 1000000 THEN 'High Value'
        WHEN COALESCE(SUM(p.price*o.quantity),0) >= 500000 THEN 'Medium Value'
        WHEN COALESCE(SUM(p.price*o.quantity),0)> 0 THEN 'Low Value'
        ELSE 'No purchases'
    END AS customer_segment
FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
        
    LEFT JOIN products AS p
        ON p.product_id = o.product_id
        
GROUP BY
    c.customer_id,
    c.customer_name;
    

        