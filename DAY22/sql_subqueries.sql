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

#Exercise 1 — Customers with orders
SELECT
    c.customer_id, c.customer_name
FROM customers AS c
WHERE EXISTS(
    SELECT 1
    FROM orders AS o
    WHERE c.customer_id=o.customer_id         
);

#Exercise 2 — Customers without orders
SELECT
    c.customer_id, c.customer_name
FROM customers AS c
WHERE NOT EXISTS(
    SELECT 1
    FROM orders AS o
    WHERE c.customer_id=o.customer_id         
);

#Exercise 3 — Products above the average
SELECT
    product_name,
    price
FROM products
WHERE price >(
    SELECT AVG(price)
    FROM products
 );