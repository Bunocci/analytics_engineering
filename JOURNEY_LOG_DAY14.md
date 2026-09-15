# JOURNEY_LOG_DAY14.md

# Analytics Engineering Journey — Day 14

## Topic

**SQL Foundations — Filtering, Aggregation, Multiple Conditions & Analytics Queries**

## Status

**COMPLETED **

---

## Today's Goal

Today I continued my SQL journey after finishing the basic `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`, aggregate functions, `GROUP BY`, and `HAVING`.

The main goal was to become comfortable with filtering data using multiple conditions and to understand how SQL can be used to answer real business questions.

I also connected what I was doing in SQL with the Python e-commerce sales analyzer I built earlier.

---

# 1. What I Already Knew Before Today

I had already practiced:

- `SELECT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `DISTINCT`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `GROUP BY`
- `HAVING`
- `AS` for aliases

For example:

```sql
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer
ORDER BY total_quantity DESC
LIMIT 1;
```

This query finds the customer with the highest total quantity purchased.

The result from my sample data was:

```text
Alice | 10
```

---

# 2. AND

I learned that `AND` requires both conditions to be true.

Example:

```sql
SELECT *
FROM orders
WHERE customer = 'Bruno'
AND quantity > 1;
```

This is similar to Python:

```python
if customer == "Bruno" and quantity > 1:
```

---

# 3. OR

`OR` means that at least one condition must be true.

Example:

```sql
SELECT *
FROM orders
WHERE customer = 'Bruno'
OR customer = 'John';
```

This returns orders belonging to either Bruno or John.

---

# 4. IN

I learned that `IN` is a cleaner way of checking whether a value belongs to a list of possible values.

Instead of:

```sql
WHERE customer = 'Bruno'
OR customer = 'John'
```

I can write:

```sql
WHERE customer IN ('Bruno', 'John')
```

This is similar to Python:

```python
if customer in ["Bruno", "John"]:
```

I also learned about:

```sql
WHERE customer NOT IN ('Bruno', 'Alice');
```

---

# 5. NOT / NOT EQUAL

I practiced excluding values.

Example:

```sql
SELECT *
FROM orders
WHERE customer != 'Alice';
```

I also learned that SQL supports:

```sql
customer <> 'Alice'
```

as another way of saying "not equal".

---

# 6. BETWEEN

`BETWEEN` is useful for filtering values within a range.

Example:

```sql
SELECT product, price
FROM orders
WHERE price BETWEEN 100000 AND 1000000;
```

I learned that `BETWEEN` includes the two boundary values.

For example:

```text
BETWEEN 100000 AND 1000000
```

includes both `100000` and `1000000`.

---

# 7. LIKE

I learned that `LIKE` is used for text pattern matching.

The `%` wildcard can represent any number of characters.

Examples:

```sql
LIKE 'M%'
```

means the value starts with `M`.

```sql
LIKE '%M'
```

means the value ends with `M`.

```sql
LIKE '%top%'
```

means the value contains `top`.

This was an important correction for me because I initially wrote:

```sql
WHERE product LIKE '%M';
```

when I actually wanted products beginning with `M`.

The correct version was:

```sql
WHERE product LIKE 'M%';
```

---

# 8. Combining Conditions

I learned how to combine multiple conditions.

Example:

```sql
SELECT *
FROM orders
WHERE customer IN ('Bruno', 'Alice')
AND quantity > 2;
```

One important syntax lesson was that I should not put a semicolon before another condition.

Incorrect:

```sql
WHERE customer IN ('Bruno', 'Alice');
AND quantity > 2;
```

Correct:

```sql
WHERE customer IN ('Bruno', 'Alice')
AND quantity > 2;
```

A semicolon normally marks the end of the SQL statement.

---


```sql
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer
HAVING SUM(quantity) > 4;
```

This first groups orders by customer, calculates the total quantity, and then keeps only customers whose total quantity is greater than 4.

I also learned that I cannot normally use an aggregate alias such as `total_quantity` in `WHERE` because the aggregation happens later.

---

# 10. My Exercises

I completed exercises covering:

- `AND`
- `OR`
- `IN`
- `NOT`
- `BETWEEN`
- `LIKE`
- Combined conditions
- Filtering + aggregation
- Group filtering
- Finding the top customer

Some of my original attempts had syntax mistakes, but I was able to understand why they were wrong and correct the concepts.

---

# 11. My Strongest Query Today

The final challenge was to find the customer who purchased the highest total quantity.

I wrote:

```sql
SELECT customer, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer
ORDER BY total_quantity DESC
LIMIT 1;
```

This worked correctly.

This was especially useful because it is very similar to the Python function I previously built for finding the top customer.

---

# 12. Important Debugging Lessons

Today reminded me that SQL errors are not always logic errors.

Sometimes the idea is correct but the syntax is wrong.

Examples I encountered:

- Extra comma after `customer`
- Typing `oders` instead of `orders`
- Using `products` instead of `product`
- Using `%M` when I needed `M%`
- Putting a semicolon before another condition
- Trying to use an aggregate alias in `WHERE`
- Confusing a row-level filter with a group-level filter

This is useful because I am learning to separate:

```text
Logic problem
```

from:

```text
Syntax problem
```

---

# 13. Connection to My Python E-Commerce Project

Today's SQL work connected directly to the Python mini-project I built.

In Python I used logic like:

```python
customer_totals[customer] = customer_totals.get(customer, 0) + order_total
```

This grouped sales by customer.

In SQL, the equivalent analytical idea is:

```sql
SELECT customer, SUM(quantity)
FROM orders
GROUP BY customer;
```

The important lesson is that the same business question can be solved using different tools.

```text
Python
   ↓
loops + dictionaries + functions

SQL
   ↓
GROUP BY + SUM + ORDER BY
```

This is exactly the kind of connection I want to build for Analytics Engineering.

---



## Day 15 Topics

I will learn:

- Why databases use multiple tables
- Primary keys
- Foreign keys
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN` (briefly)
- Joining two tables
- Joining three tables
- JOIN + `WHERE`
- JOIN + `GROUP BY`
- JOIN + aggregate functions
- Common JOIN mistakes
- Real e-commerce analytics queries

