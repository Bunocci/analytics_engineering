# JOURNEY LOG — DAY 15
## SQL JOINs — Level 2: Multiple JOINs + Aggregation

### Goal for today
Build confidence combining relational tables with JOINs and then using aggregation for e-commerce analytics.

---

## Tables Used

### customers
| customer_id | customer_name | city |
|---:|---|---|
| 1 | Bruno | Kampala |
| 2 | Alice | Entebbe |
| 3 | John | Jinja |
| 4 | David | Mbarara |

### products
| product_id | product_name | price |
|---:|---|---:|
| 101 | Laptop | 3000000 |
| 102 | Mouse | 60000 |
| 103 | Keyboard | 150000 |

### orders
| order_id | customer_id | product_id | quantity |
|---:|---:|---:|---:|
| 2001 | 1 | 101 | 2 |
| 2002 | 2 | 102 | 5 |
| 2003 | 3 | 103 | 2 |
| 2004 | 1 | 103 | 2 |

---

# What I Learned

## 1. Multiple JOINs

A query can connect more than two tables:

```sql
SELECT ...
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

This allows order, customer, and product information to be analyzed together.

## 2. JOIN + Calculation

Revenue can be calculated with:

```sql
o.quantity * p.price
```

Total revenue uses:

```sql
SUM(o.quantity * p.price)
```

## 3. SUM vs COUNT

A major distinction reinforced today:

```sql
SUM(o.quantity)
```

means total number of items purchased/sold.

```sql
COUNT(o.order_id)
```

means number of order records.

An `order_id` is an identifier, so `SUM(o.order_id)` does not count orders.

## 4. GROUP BY

Customer analysis:

```sql
GROUP BY c.customer_name
```

Product analysis:

```sql
GROUP BY p.product_name
```

Customer + product analysis:

```sql
GROUP BY c.customer_name, p.product_name
```

Multiple columns create groups at the combined level.

## 5. HAVING

`WHERE` filters individual rows.

`HAVING` filters groups after aggregation.

Example:

```sql
HAVING SUM(o.quantity * p.price) > 1000000
```

---

# Exercise Review

## Exercise 1 — Customer revenue
**Status: CORRECT**

Used multiple JOINs, `SUM(quantity * price)`, `GROUP BY`, and descending ordering.

## Exercise 2 — Total items per customer
**Status: CORRECT**

Used `SUM(o.quantity)` grouped by customer.

## Exercise 3 — Number of orders
**Status: CORRECTED**

Initial mistake:

```sql
SUM(o.order_id)
```

Correction:

```sql
COUNT(o.order_id)
```

Lesson: `COUNT(order_id)` counts order records; `SUM(quantity)` totals items.

## Exercise 4 — Customers spending over 1 million
**Status: CONCEPT CORRECT; SQL REFINED**

Preferred form:

```sql
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
HAVING SUM(o.quantity * p.price) > 1000000;
```

## Exercise 5 — Product revenue
**Status: CORRECT**

Used `SUM(o.quantity * p.price)` grouped by product.

## Exercise 6 — Product quantity sold
**Status: CORRECT**

Used `SUM(o.quantity)` grouped by product.

## Exercise 7 — Customer + product analytics
**Status: CORRECTED**

Initial query missed `FROM` and `GROUP BY`.

Correct structure:

```sql
SELECT
    c.customer_name,
    p.product_name,
    SUM(o.quantity) AS total_items,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name, p.product_name;
```

## Exercise 8 — Highest-revenue product
**Status: CORRECT**

Used `GROUP BY`, `ORDER BY ... DESC`, and `LIMIT 1`.

## Exercise 9 — Customer with largest total number of items
**Status: CONCEPT CORRECT; table-name typo corrected**

Initial mistake:

```sql
INNER JOIN customer AS c
```

Correct:

```sql
INNER JOIN customers AS c
```

The `SUM(o.quantity)` logic was correct.

## Exercise 10 — Customers with more than one order
**Status: CORRECTED**

Initial query had a missing `FROM`, singular table name, an unnecessary `LIMIT 1`, and a semicolon before `LIMIT`.

Correct structure:

```sql
SELECT
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;
```

---

# Reinforcement A–E

## A — Customer order count
Initial attempt grouped by customer **and product**. That changes the question to customer-product order counts.

For customer order count, group only by:

```sql
GROUP BY c.customer_name
```

No products table is needed.

## B — Product quantity
**Status: CORRECT**

Used `SUM(o.quantity)` grouped by product and sorted descending.

## C — Customers with more than 3 items
**Status: CONCEPT CORRECT**

Used `SUM(o.quantity)` and `HAVING`. Preferred PostgreSQL form:

```sql
HAVING SUM(o.quantity) > 3
```

## D — Customer + product revenue
**Status: CONCEPT CORRECT; punctuation corrected**

The trailing comma after the selected revenue expression was invalid:

```sql
SUM(o.quantity * p.price) AS total_revenue,
```

Remove that comma before `FROM`.

## E — Highest-revenue customer + number of orders
**Status: CORRECTED**

Both metrics belong to the customer grouping level:

```sql
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_revenue,
    COUNT(o.order_id) AS number_of_orders
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 1;
```

Important lesson: `SUM()` and `COUNT()` can be calculated together when they use the same grouping level.

---

# Day 15 Key Takeaways

1. JOIN connects related tables.
2. Multiple JOINs allow analysis across several tables.
3. `SUM(quantity)` = total items.
4. `COUNT(order_id)` = number of orders.
5. `SUM(quantity * price)` = revenue.
6. `GROUP BY` determines the level of analysis.
7. Multiple columns can be used in `GROUP BY`.
8. `HAVING` filters aggregated groups.
9. `ORDER BY ... DESC LIMIT 1` can identify the highest aggregated result.
10. Check which table owns a column before using its alias.
11. Remember the SQL clause structure:
   `SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT`

---

# Progress Note

The main mistakes today were mostly structural rather than conceptual:
- `SUM` versus `COUNT`
- grouping at the correct level
- remembering `FROM`
- exact table names
- aggregate filtering with `HAVING`
- small punctuation and semicolon errors

The next step is to apply JOINs to realistic analytical situations involving unmatched records and NULL values.

---

# End of Day 15

Next: **Day 16 — JOIN Level 3**
- LEFT JOIN in analytical scenarios
- NULL values after LEFT JOIN
- finding customers with no orders
- finding products with no sales
- `IS NULL` and `IS NOT NULL`
- counting safely with LEFT JOIN
- understanding how JOIN choice changes analytical results
