SELECT
    order_id,
    order_date,

    CASE
        WHEN order_date < DATE '2026-10-01'
            THEN 'Before October'

        WHEN order_date < DATE '2026-11-01'
            THEN 'October'

        ELSE 'November or Later'
    END AS order_period

FROM orders;

#Exercise 11 — Extract Year
SELECT
    order_id, order_date, EXTRACT (YEAR FROM order_date) AS order_year
FROM orders;

#Exercise 12 — Monthly Order Count
SELECT
    EXTRACT (YEAR FROM order_date) AS order_year,
    EXTRACT (MONTH FROM order_date) AS order_month,
    COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY
    EXTRACT (YEAR FROM order_date),
    EXTRACT (MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;

#Exercise 13 — Monthly Revenue
SELECT
    EXTRACT (YEAR FROM order_date) AS order_year,
    EXTRACT (MONTH FROM order_date) AS order_month,
    SUM(o.quantity*p.price) AS monthly_revenue
FROM orders AS o
    INNER JOIN products as p
        ON o.product_id=p.product_id
GROUP BY
    EXTRACT (YEAR FROM order_date),
    EXTRACT (MONTH FROM order_date) 
ORDER BY
     order_year,
     order_month;
  
#Exercise 14 — Last 30 Days
SELECT*
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

#Exercise 15 — Recency
SELECT 
    order_id, order_date,
    CURRENT_DATE - order_date AS days_since_order
FROM orders;

#Create a customer-level report
SELECT
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders,
    COALESCE(SUM(o.quantity),0) AS total_items,
    COALESCE(SUM(o.quantity*p.price),0) AS total_revenue,
    CASE
        WHEN COUNT(o.order_id) >=3 THEN 'Frequent'
        WHEN COUNT(o.order_id) >=2 THEN 'Regular'
        WHEN COUNT(o.order_id) >=1 THEN 'Occasional'
        ELSE 'No orders'
    END AS customer_activity
    
FROM customers AS c
    LEFT JOIN orders AS o
        ON o.customer_id = c.customer_id
    LEFT JOIN products AS p
        ON p.product_id=o.product_id
        
GROUP BY
    c.customer_name, c.customer_id;

 