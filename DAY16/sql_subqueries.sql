#1. Average product price
SELECT product_name, price
FROM products
WHERE price> (
    SELECT AVG(price)
    FROM products);
    
#2. how the product name and price of the most expensive product.   
SELECT product_name, price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
    );
    
#3. Show the product name and price of the cheapest product.
SELECT product_name, price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
    );
    
#4. Show the names of all customers who have placed at least one order.
SELECT customer_name
FROM customers
WHERE customer_id IN(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id)>=1);

#5. show the names of customers who have never placed an order
SELECT customer_name
FROM customers
WHERE customer_id NOT IN(
    SELECT customer_id
    FROM orders);
    
#.6 Show the names of customers who have placed more than one order.
SELECT customer_name
FROM customers
WHERE customer_id IN(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id)>1);
    
#7. Show the names of customers who purchased more than 3 total items
SELECT customer_name
FROM customers
WHERE customer_id IN(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING  SUM(quantity) >3);
    
#8. Show the product name and price of every product that costs more than the average product price.

SELECT product_name,price
FROM products
WHERE price>(
    SELECT AVG(price)
    FROM products);
                    
