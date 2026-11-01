#Exercise 1 — Overall Total
SELECT
    order_id, quantity,
    SUM(quantity) OVER() AS total_items
FROM orders;

#Exercise 2 — Customer Total
SELECT
    order_id, customer_id,
    SUM(quantity) OVER(PARTITION BY customer_id ) AS customer_total_items  
FROM orders;    

#Exercise 3 — Customer Order Number
SELECT
    order_id, customer_id, order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS customer_order_number
FROM orders;

#Exercise 4 — Running Customer Total
SELECT
    order_id, customer_id, order_date,
    SUM(quantity) OVER(PARTITION BY customer_id ORDER BY order_date) AS running_items
FROM orders;

#Exercise 5 — Rank Customers
WITH rank_customers AS (
SELECT
    customer_name, SUM(o.quantity*p.price) AS total_revenue
FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    INNER JOIN products AS p
        ON p.product_id = o.product_id
GROUP BY
    c.customer_name, c.customer_id

)

SELECT
    customer_name, total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM rank_customers;