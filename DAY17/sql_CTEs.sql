#. 1 Create a CTE called product_revenue that calculates: product name,total revenue
Then select everything from the CTE.
WITH product_revenue AS(
    SELECT 
        p.product_name, SUM(o.quantity * p.price) AS total_revenue
    FROM Products AS p
    INNER JOIN orders AS o
        ON o.product_id = p.product_id
    GROUP BY p.product_name
)
SELECT *
FROM product_revenue;

#. 2 Show products whose total revenue is greater than 500,000 UGX
WITH product_revenue AS(
    SELECT 
        p.product_name, SUM(o.quantity * p.price) AS total_revenue
    FROM Products AS p
    INNER JOIN orders AS o
        ON o.product_id = p.product_id
    GROUP BY p.product_name
    
)
SELECT *
FROM product_revenue
WHERE total_revenue > 500000;

#3. Customer Revenue CTE
WITH customer_revenue AS (
    SELECT
        c.customer_name, SUM(o.quantity * p.price) AS total_revenue
    FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    INNER JOIN products AS p
        ON p.product_id = o.product_id
    GROUP BY c.customer_name
      
)
SELECT*
FROM customer_revenue;


#4. only customers whose total revenue is greater than 1,000,000 UGX.
WITH customer_revenue AS (
    SELECT
        c.customer_name, SUM(o.quantity * p.price) AS total_revenue
    FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    INNER JOIN products AS p
        ON p.product_id = o.product_id
    GROUP BY c.customer_name    
)
SELECT*
FROM customer_revenue
WHERE total_revenue > 1000000;

#5. Customer item totals
WITH customer_item_totals AS (
    SELECT
        c.customer_name, SUM(o.quantity) AS total_items_purchased
    FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_name
      
)
SELECT*
FROM customer_item_totals;

#6.Show customers who purchased more than 3 items.
WITH customer_item_totals AS (
    SELECT
        c.customer_name, SUM(o.quantity) AS total_items_purchased
    FROM customers AS c
    INNER JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_name
      
)
SELECT*
FROM customer_item_totals
WHERE total_items_purchased>3;