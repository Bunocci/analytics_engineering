#1.All customers
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id=c.customer_id

#2. customers with no orders
SELECT c.customer_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id=c.customer_id
WHERE o.order_id IS NULL;

#3. 
SELECT c.customer_name, COUNT(o.order_id) AS number_of_orders
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id=c.customer_id
GROUP BY c.customer_name
ORDER BY number_of_orders DESC;

#4. customers with zero purchases
SELECT c.customer_name, COALESCE(SUM(o.quantity),0) AS total_items
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id=c.customer_id
GROUP BY c.customer_name
HAVING COALESCE(SUM(o.quantity),0)=0;

#5. all products
SELECT p.product_name, o.order_id
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id;

#6. products with no sales
SELECT p.product_name
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL


#7. Product sales count
SELECT p.product_name, COUNT(o.order_id) AS number_of_orders
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY number_of_orders DESC;

#8. customer revenue including zero
SELECT c.customer_name, COALESCE(SUM(o.quantity * p.price),0) AS total_revenue
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customer_id=c.customer_id
LEFT JOIN products AS p
    ON o.product_id=p.product_id
GROUP BY c.customer_name;

#9.product revenue including zero
SELECT p.product_name, COALESCE(SUM(o.quantity * p.price),0) AS total_revenue
FROM products AS p
LEFT JOIN orders AS o
    ON p.product_id = o.product_id
GROUP BY p.product_name;

#10.
SELECT c.customer_name, COALESCE(SUM(o.quantity),0) AS total_items, COUNT(o.order_id) AS number_of_orders, COALESCE(SUM(o.quantity * p.price),0) AS total_revenue
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON o.product_id=p.product_id
GROUP BY c.customer_name;


SELECT c.customer_name, COALESCE(SUM(o.quantity),0) AS total_items_purchased, COUNT(o.order_id) AS number_of_orders, COALESCE(SUM(o.quantity * p.price),0) AS total_revenue
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON o.product_id=p.product_id
GROUP BY c.customer_name;