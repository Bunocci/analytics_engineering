#.7 Product Sales CTE
WITH product_sales AS (
    SELECT 
        p.product_name, COUNT(o.quantity) AS number_of_orders, SUM(o.quantity) AS total_items, SUM(o.quantity * p.price) AS total_revenue
    FROM products AS p
    INNER JOIN orders AS o
        ON o.product_id = p.product_id
    GROUP BY p.product_name
  
)
    SELECT *
    FROM product_sales
    ORDER BY total_revenue DESC;
    
#. 8 CTEs chaining (2 CTEs )
WITH customer_revenue AS (
    SELECT 
        c.customer_id, c.customer_name, SUM(o.quantity * p.price) AS total_revenue
    FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    INNER JOIN products AS p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name, c.customer_id
    ),
   customer_orders(
    SELECT
       o.customer_id, COUNT(o.order_id) AS number_of_orders
    FROM orders AS o
    GROUP BY o.customer_id
        )    
    SELECT 
        cr.customer_name, cr.total_revenue, co.number_of_orders
    FROM customer_revenue AS cr
    INNER JOIN customer_orders AS co
        ON cr.customer_id = co.customer_id;