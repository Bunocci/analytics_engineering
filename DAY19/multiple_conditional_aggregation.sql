#Exercise 1:
customer_name
small_order_count
medium_order_count
large_order_count

SELECT
    c.customer_name, COUNT(o.order_id) AS total_order,
    SUM(
    CASE
        WHEN o.quantity * p.price < 500000 THEN 1
        ELSE 0
        END) AS small_order_count,
        
     SUM(
    CASE
        WHEN o.quantity * p.price >= 500000 AND 
        o.quantity * p.price < 1000000  THEN 1
        ELSE 0
        END) AS medium_order_count
        
    SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN 1
        ELSE 0
        END) AS large_order_count,    
        
FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN products AS p
        ON o.product_id = p.product_id
        
GROUP BY
    c.customer_name, c.customer_id
    
    
# Exercise 2: 
customer_name
small_order_count
small_order_revenue
medium_order_count
medium_order_revenue
large_order_count
large_order_revenue

SELECT
    c.customer_name, 
    SUM(
    CASE
        WHEN o.quantity * p.price < 500000 THEN 1
        ELSE 0
        END) AS small_order_count,
        
    COALESCE(
    SUM(
    CASE
        WHEN o.quantity * p.price < 500000 THEN o.quantity * p.price
        ELSE 0
        END),0) AS small_order_revenue,
        
    
     SUM(
    CASE
        WHEN o.quantity * p.price >= 500000 AND 
        o.quantity * p.price < 1000000  THEN 1
        ELSE 0
        END) AS medium_order_count, 
        
    COALESCE(
    SUM(
    CASE
        WHEN o.quantity * p.price >= 500000 AND 
        o.quantity * p.price < 1000000  THEN o.quantity * p.price
        ELSE 0
        END),0) AS medium_order_revenue, 
    
    SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN 1
        ELSE 0
        END) AS large_order_count,    

    COALESCE(
    SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN o.quantity * p.price
        ELSE 0
        END),0) AS large_order_revenue

FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN products AS p
        ON o.product_id = p.product_id
        
GROUP BY
    c.customer_name, c.customer_id;

#Exercise 3:
customer_name
total_revenue
low_value_revenue
high_value_revenue

SELECT
    c.customer_name, COALESCE(SUM(o.quantity*p.price),0) AS total_revenue,
    
    COALESCE(
    SUM(
    CASE
        WHEN o.quantity * p.price < 1000000 THEN o.quantity * p.price
        ELSE 0
        END),0) AS low_value_revenue,
        
  
    COALESCE(
    SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN o.quantity * p.price
        ELSE 0
        END),0) AS high_value_revenue
        
FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN products AS p
        ON o.product_id = p.product_id
        
GROUP BY
    c.customer_name, c.customer_id;