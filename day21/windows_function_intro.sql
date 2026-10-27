#customer's first order

WITH numbered_orders AS(
    SELECT 
        customer_id, order_id, order_date,
        ROW_NUMBER()OVER(PARTITION BY customer_id 
        ORDER BY order_date) AS customer_order_number
    FROM orders
    
  )
SELECT*
FROM numbered_orders
WHERE customer_order_number = 1;
    