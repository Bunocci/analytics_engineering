
#Customer Performance Report with output columns:;
customer_name
number_of_orders
total_items
total_revenue
customer_segment:
    5,000,000+ → VIP
    1,000,000+ → High Value
    500,000+   → Medium Value
    0+         → Low Value
    0          → No Purchases
customer_activity:
    3+ → Frequent
    2+ → Regular
    1+ → Occasional
    0  → No Orders

WITH customer_performance AS (
    SELECT
        c.customer_id, c.customer_name, COALESCE(COUNT(o.order_id),0) AS number_of_orders, COALESCE(SUM(o.quantity),0) AS total_items,
        COALESCE(SUM(p.price*o.quantity),0) AS total_revenue
     FROM customers AS c
     LEFT JOIN orders AS o
         ON o.customer_id = c.customer_id
     LEFT JOIN products AS p
         ON p.product_id = o.product_id
         
      
      GROUP BY c.customer_id, c.customer_name  
    )
    SELECT 
        customer_name, customer_id, total_revenue,total_items,
    CASE
        WHEN total_revenue >=5000000 THEN 'VIP'
        WHEN total_revenue >=1000000 THEN 'High Value'
        WHEN total_revenue >=500000 THEN 'Medium Value'
        WHEN total_revenue > 0 THEN 'Low Value'
        ELSE 'No purchase'
    END AS customer_segment,
       
    
    CASE
        WHEN number_of_orders >= 3 THEN 'Frequent'
        WHEN number_of_orders >= 2 THEN 'Regular'
        WHEN number_of_orders >= 1 THEN 'Occasional'
        ELSE 'No orders'
        END AS customer_activity
    FROM customer_performance; 