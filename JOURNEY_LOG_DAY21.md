# SQL Learning Journey — Day 21

## Topic: Window Functions

### What I learned

Window functions perform calculations across related rows while keeping the individual rows visible.

Unlike `GROUP BY`, which combines rows into groups, window functions add calculated values to each row.

### Main functions covered

- `SUM() OVER()` — calculates a total across the full result set.
- `SUM() OVER(PARTITION BY ...)` — calculates totals separately for each group while retaining individual rows.
- `ROW_NUMBER()` — assigns a unique sequence number within a group.
- `RANK()` — ranks rows and leaves gaps when ranks are tied.
- `DENSE_RANK()` — ranks rows without leaving gaps after ties.
- `LAG()` — accesses a value from a previous row.
- `LEAD()` — accesses a value from a following row.
- `FIRST_VALUE()` — returns the first value in a window.
- `LAST_VALUE()` — returns the last value in a window, with attention to the window frame.

### Important concepts

- `PARTITION BY` divides rows into independent groups for the window calculation.
- The `ORDER BY` inside `OVER()` controls the sequence used by the window function.
- The query-level `ORDER BY` controls the final display order.
- For chronological order, use `ORDER BY order_date, order_id` so ties are handled consistently.
- A window-function result or SELECT alias often needs an outer query or CTE before it can be filtered or reused in another calculation.
- Use `IS NULL` to test for NULL values, not `= NULL`.

### Practical patterns

**Running total per customer**
```sql
SELECT
    order_id,
    customer_id,
    order_date,
    SUM(quantity) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS running_items
FROM orders;
```

**Previous order revenue**
```sql
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.quantity * p.price AS current_revenue,
    LAG(o.quantity * p.price) OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS previous_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id;
```

**Revenue change and trend using a CTE**
```sql
WITH customer_revenue AS (
    SELECT
        o.order_id,
        o.customer_id,
        p.price * o.quantity AS current_revenue,
        LAG(p.price * o.quantity) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date, o.order_id
        ) AS previous_revenue
    FROM orders AS o
    INNER JOIN products AS p
        ON o.product_id = p.product_id
)
SELECT
    order_id,
    customer_id,
    current_revenue,
    previous_revenue,
    current_revenue - previous_revenue AS revenue_change,
    CASE
        WHEN previous_revenue IS NULL THEN 'First order'
        WHEN current_revenue > previous_revenue THEN 'Increased'
        WHEN current_revenue < previous_revenue THEN 'Decreased'
        ELSE 'Unchanged'
    END AS revenue_trend
FROM customer_revenue;
```

### Common mistakes corrected

1. Partitioning by a unique `order_id` when the goal is to compare rows belonging to the same customer. Use `PARTITION BY customer_id`.
2. Using a window `ORDER BY` that does not clearly establish chronological order. Prefer `order_date, order_id`.
3. Referencing a CTE's internal table aliases (`c` or `o`) from the outer query. The outer query uses the columns exposed by the CTE.
4. Referencing a SELECT alias in another expression at the same query level when a CTE or subquery is needed.
5. Misspelling aliases such as `previous_revenue`.
6. Writing `= NULL` instead of `IS NULL`.

### Progress assessment

- Completed exercises on overall totals, customer totals, running totals, ranking, first/latest orders, previous/next order values, and revenue trends.
- Final correction demonstrated the use of `LAG()`, revenue differences, and `CASE` to classify revenue trends.
- Day 21 completed.