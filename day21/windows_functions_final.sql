customers
---------
customer_id
customer_name
city

products
--------
product_id
product_name
price

orders
------
order_id
customer_id
product_id
quantity
order_date

#Finding the last/latest order for every customer
    
WITH arranged_orders AS (
    SELECT
        order_date, customer_id,order_id,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC,order_id DESC) AS order_number
FROM orders
)
SELECT
    customer_id, order_number,order_ date
FROM arranged_orders
WHERE order_number =1;

DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC)


#Exercise 1 — First order per customer
WITH arranged_orders AS(

    SELECT
        order_id, order_date, customer_id,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date, order_id) AS order_number
    FROM orders
)
SELECT*
FROM arranged_orders
WHERE order_number = 1

#2.Latest order per customer
WITH arranged_orders AS(

    SELECT
        order_id, order_date, customer_id,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC, order_id DESC) AS order_number
    FROM orders
)
SELECT*
FROM arranged_orders
WHERE order_number = 1;

#Exercise 3— Rank products by price

SELECT 
    product_id,product_name,price,
    DENSE_RANK() OVER(ORDER BY price DESC) AS product_rank
FROM products;

#Exercise 4— Top products within categories
Assume your products table has a category column

WITH ranked_products AS (
    SELECT
    product_name, category, price,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS product_rank
FROM products
)
SELECT*
FROM ranked_products
WHERE product_rank<=2;

#Exercise 5 — Previous order date
SELECT
     order_id, customer_id, order_date,
     LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date, order_id) AS previous_order_date
FROM orders;

#Exercise 6 — Previous order revenue
    WITH customer_orders AS(
        SELECT
            order_id, customer_id,
            p.price*o.quantity AS current_revenue,
            LAG(p.price*o.quantity) OVER(PARTITION BY customer_id ORDER BY o.order_id, o.order_date) AS previous_revenue
    FROM orders AS o
        INNER JOIN products AS p
            ON o.product_id = p.product_id
            
    )
    SELECT
    order_id,customer_id, current_revenue, previous_revenue
    FROM customer_orders;
    
    
 #Exercise 7 — Revenue change
  WITH customer_revenue AS(
        SELECT
            order_id, customer_id,
            p.price*o.quantity AS current_revenue,
            LAG(p.price*o.quantity) OVER(PARTITION BY customer_id ORDER BY order_id) AS previous_revenue
    FROM orders AS o
        INNER JOIN products AS p
            ON o.product_id = p.product_id
            
    )
    SELECT
    order_id,customer_id, current_revenue, previous_revenue,
    current_revenue - previous_revenue AS revenue_change
    
    FROM customer_revenue;

#Exercise 8 — Revenue trend
 WITH customer_revenue AS(
        SELECT
            o.order_id, c.customer_id,
            p.price*o.quantity AS current_revenue,
            LAG(p.price*o.quantity) OVER(PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id) AS previous_revenue
      FROM orders AS o
        INNER JOIN products AS p
            ON o.product_id = p.product_id
             )
  
    SELECT
    order_id,customer_id, current_revenue, previous_revenue,
    current_revenue - previous revenue AS revenue_change,
      CASE
         WHEN previous_revenue IS NULL THEN 'First order'
         WHEN current_revenue >previous_revenue THEN 'increased'
         WHEN current_revenue < previous_revenue THEN 'decreased'
         ELSE 'unchanged'
     END AS revenue_trend
    FROM customer_revenue;

#Exercise 9 — Next order date
SELECT 
    order_id, customer_id, order_date,
    LEAD(order_date) OVER(PARTITION BY customer_id  ORDER BY  order_date, order_id) AS next_order_date
FROM orders;

#10. Final challenge — Customer purchase analysis

WITH customer_purchase AS(
    SELECT
        c.customer_name, o.order_date, o.order_id,
        o.quantity*p.price AS current_revenue,
        LAG(o.quantity*p.price) OVER(PARTITION BY customer_id ORDER BY order_id) AS previous_revenue,
        LEAD(o.quantity*p.price) OVER(PARTITION BY customer_id ORDER BY order_id) AS next_revenue,
        ROW_NUMBER()OVER(PARTITION BY o.customer_id ORDER BY o.order_id, o.order_date) AS customer_order_number       
    FROM customers AS c
        INNER JOIN orders AS o
            ON o.customer_id = c.customer_id
        INNER JOIN products AS p
            ON p.product_id = o.product_id
)
SELECT
    customer_name, order_id, order_date, current_revenue, previous_revenue, next_revenue, customer_order_number,
    current_revenue - previous_revenue AS revenue_change   
FROM customer_purchase
ORDER BY customer_name, order_date, order_id;