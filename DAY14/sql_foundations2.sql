#1. -AND-
SELECT *
FROM orders
WHERE (customer = 'Bruno')
AND quantity >1;

#2. -OR-
SELECT *
FROM orders
WHERE (customer = 'Bruno' OR customer = 'John');

#3. -IN-
SELECT *
FROM orders
WHERE customer IN ('Bruno','John');

#4. -NOT-
SELECT *
FROM orders
WHERE (customer !='Alice');

#5. -BETWEEN-
SELECT product, price
FROM orders
WHERE price BETWEEN 100000 AND 1000000;

#6. -LIKE-
SELECT product, price
FROM orders
WHERE product LIKE '%M';

#7. -LIKE-
SELECT product
FROM orders
WHERE product LIKE '%top%';

#. 8 Combining conditions
SELECT *
FROM orders
WHERE customer IN ('Bruno','Alice')
AND quantity > 2;

#.9 Filtering + Aggregation
SELECT SUM(quantity) AS total_quantity
FROM orders
WHERE (customer = 'Alice');

#10. Analytics challenge
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
HAVING total_quantity>2
GROUP BY customer;


#11. Challenge
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer
ORDER BY total_quantity DESC
LIMIT 1;