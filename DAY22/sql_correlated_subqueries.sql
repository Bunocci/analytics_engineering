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


#Products more expensive than the average of other products
SELECT
    p1.product_name,
    p1.price
FROM products AS p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products AS p2
    WHERE p2.product_id <> p1.product_id
);