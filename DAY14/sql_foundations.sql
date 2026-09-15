#1. Sorting
SELECT product, price
FROM orders
ORDER BY price DESC;

#2. Top 3 products by price
SELECT customer, product, price
FROM orders
ORDER BY price DESC
LIMIT 3;

#3. Unique customers 
SELECT DISTINCT customer
FROM orders;

#4. Total number of orders
SELECT COUNT(*)
FROM orders;

#5. Total quantity
SELECT SUM(quantity)
FROM orders;

#6. Average
SELECT AVG(price)
FROM orders;

#7. Customer orders 
SELECT customer, COUNT(*)
FROM orders
GROUP BY customer;

#8. Customer quantity
SELECT customer, SUM(quantity)
FROM orders
GROUP BY customer;

#9. Filtering groups
SELECT customer, SUM(quantity)
FROM orders
GROUP BY customer
HAVING SUM(quantity)>4;

#10. Analytics challenge 
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer
ORDER BY total_quantity DESC
LIMIT 1;