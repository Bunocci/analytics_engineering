------------------------------------------------
order_id | customer_id | product_id | quantity | order_date
------------------------------------------------
2001     | 1           | 101        | 2        | 2026-10-03
2002     | 2           | 102        | 5        | 2026-10-05
2003     | 3           | 103        | 2        | 2026-10-15
2004     | 1           | 104        | 2        | 2026-10-20
2005     | 2           | 105        | 5        | 2026-11-02


SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(o.quantity * p.price) AS Monthly_revenue,
    SUM(o.quantity) AS total_items,
    COUNT(o.order_id) AS Number_of_orders
FROM orders AS o
    INNER JOIN products AS p
       ON o.product_id = p.product_id
GROUP BY
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
ORDER BY
    order_year,
    order_month;
    

   