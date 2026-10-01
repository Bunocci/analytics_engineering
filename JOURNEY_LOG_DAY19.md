# JOURNEY LOG — DAY 19
## SQL CASE WHEN + Conditional Aggregation

**Learning Track:** Analytics Engineering / Junior Data Engineering  
**Day:** 19  
**Main Topic:** `CASE WHEN` and Conditional Aggregation  
**Database:** PostgreSQL  
**Status:** Completed

---

## 1. Day 19 Objective

Learn and practice:

- `CASE WHEN`
- `ELSE` and `END`
- `SUM(CASE WHEN...)`
- Conditional counting
- Conditional quantity aggregation
- Conditional revenue aggregation
- `COALESCE()` with conditional aggregation
- `CASE` with `GROUP BY`
- `CASE` with `LEFT JOIN`
- CTEs containing aggregated metrics
- Customer segmentation
- Order-value categories

The central goal was learning how to produce multiple business metrics from the same dataset without filtering away the underlying rows.

---

## 2. CASE WHEN Fundamentals

Basic structure:

```sql
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

Example:

```sql
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 2000000 THEN 'Expensive'
        WHEN price >= 1000000 THEN 'Medium'
        ELSE 'Affordable'
    END AS price_category
FROM products;
```

Mental model:

> `CASE` is SQL's conditional logic: if a condition is true, return its result.

Multiple `WHEN` conditions are evaluated in order.

---

## 3. CASE With Aggregated Results

Example:

```sql
SELECT
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders,
    CASE
        WHEN COUNT(o.order_id) >= 3 THEN 'Frequent Customer'
        WHEN COUNT(o.order_id) >= 2 THEN 'Regular Customer'
        ELSE 'Occasional Customer'
    END AS customer_type
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
```

Important lesson:

`CASE` can evaluate an aggregate result such as `COUNT()`.

---

## 4. Customer Segmentation

We practiced classifying customers by revenue:

```sql
SELECT
    c.customer_name,
    COALESCE(SUM(o.quantity), 0) AS total_items,
    COALESCE(SUM(p.price * o.quantity), 0) AS total_revenue,
    CASE
        WHEN COALESCE(SUM(p.price * o.quantity), 0) >= 5000000 THEN 'VIP'
        WHEN COALESCE(SUM(p.price * o.quantity), 0) >= 1000000 THEN 'High Value'
        WHEN COALESCE(SUM(p.price * o.quantity), 0) >= 500000 THEN 'Medium Value'
        WHEN COALESCE(SUM(p.price * o.quantity), 0) > 0 THEN 'Low Value'
        ELSE 'No Purchases'
    END AS customer_segment
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON p.product_id = o.product_id
GROUP BY c.customer_id, c.customer_name;
```

`LEFT JOIN` keeps customers with no orders, while `COALESCE(..., 0)` turns missing numeric results into zero.

---

## 5. CTE + CASE

We separated metric calculation from business classification:

```sql
WITH customer_performance AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS number_of_orders,
        COALESCE(SUM(o.quantity), 0) AS total_items,
        COALESCE(SUM(p.price * o.quantity), 0) AS total_revenue
    FROM customers AS c
    LEFT JOIN orders AS o
        ON o.customer_id = c.customer_id
    LEFT JOIN products AS p
        ON p.product_id = o.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    number_of_orders,
    total_items,
    total_revenue,
    CASE
        WHEN total_revenue >= 5000000 THEN 'VIP'
        WHEN total_revenue >= 1000000 THEN 'High Value'
        WHEN total_revenue >= 500000 THEN 'Medium Value'
        WHEN total_revenue > 0 THEN 'Low Value'
        ELSE 'No Purchase'
    END AS customer_segment,
    CASE
        WHEN number_of_orders >= 3 THEN 'Frequent'
        WHEN number_of_orders >= 2 THEN 'Regular'
        WHEN number_of_orders >= 1 THEN 'Occasional'
        ELSE 'No Orders'
    END AS customer_activity
FROM customer_performance;
```

This demonstrated a useful analytics-engineering pattern:

```text
Calculate metrics → classify/report the metrics
```

---

## 6. Conditional Aggregation

The major concept of Day 19:

```sql
SUM(
    CASE
        WHEN condition THEN value
        ELSE 0
    END
)
```

Mental model:

```text
Each row
   ↓
CASE decides what the row contributes
   ↓
SUM combines those contributions
```

Unlike `WHERE`, conditional aggregation does not remove the other rows from the result.

---

## 7. Conditional Counting

To count rows satisfying a condition:

```sql
SUM(
    CASE
        WHEN condition THEN 1
        ELSE 0
    END
)
```

Example:

```sql
SUM(
    CASE
        WHEN o.quantity >= 3 THEN 1
        ELSE 0
    END
) AS large_order_count
```

Each qualifying order contributes `1`; each other order contributes `0`.

---

## 8. Conditional Quantity Aggregation

To sum quantities only when a condition is true:

```sql
SUM(
    CASE
        WHEN condition THEN o.quantity
        ELSE 0
    END
)
```

Key distinction:

```text
THEN 1          → count qualifying rows
THEN quantity   → sum qualifying items
```

---

## 9. Conditional Revenue Aggregation

To calculate revenue only for qualifying rows:

```sql
SUM(
    CASE
        WHEN condition
        THEN o.quantity * p.price
        ELSE 0
    END
)
```

Example:

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000
        THEN o.quantity * p.price
        ELSE 0
    END
) AS large_order_revenue
```

---

## 10. Large Order Analytics

We built a customer-level report containing total revenue, total orders, total items, large-order count, and large-order revenue:

```sql
SELECT 
    c.customer_name,
    COALESCE(SUM(p.price * o.quantity), 0) AS total_revenue,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.quantity), 0) AS total_items,
    SUM(
        CASE
            WHEN o.quantity * p.price >= 1000000 THEN 1
            ELSE 0
        END
    ) AS large_orders,
    SUM(
        CASE
            WHEN p.price * o.quantity >= 1000000
            THEN p.price * o.quantity
            ELSE 0
        END
    ) AS large_order_revenue
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON p.product_id = o.product_id
GROUP BY c.customer_name, c.customer_id;
```

---

## 11. Order-Value Categories

We practiced three categories:

- **Small:** order value `< 500,000`
- **Medium:** order value `>= 500,000 AND < 1,000,000`
- **Large:** order value `>= 1,000,000`

Conditional counts:

```sql
SUM(
    CASE
        WHEN o.quantity * p.price < 500000 THEN 1
        ELSE 0
    END
) AS small_order_count
```

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 500000
         AND o.quantity * p.price < 1000000
        THEN 1
        ELSE 0
    END
) AS medium_order_count
```

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN 1
        ELSE 0
    END
) AS large_order_count
```

---

## 12. Order Category Revenue

The same categories can calculate revenue:

```sql
SUM(
    CASE
        WHEN o.quantity * p.price < 500000
        THEN o.quantity * p.price
        ELSE 0
    END
) AS small_order_revenue
```

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 500000
         AND o.quantity * p.price < 1000000
        THEN o.quantity * p.price
        ELSE 0
    END
) AS medium_order_revenue
```

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000
        THEN o.quantity * p.price
        ELSE 0
    END
) AS large_order_revenue
```

---

## 13. Full Category Report Pattern

```sql
SELECT
    c.customer_name,

    SUM(
        CASE
            WHEN o.quantity * p.price < 500000 THEN 1
            ELSE 0
        END
    ) AS small_order_count,

    COALESCE(
        SUM(
            CASE
                WHEN o.quantity * p.price < 500000
                THEN o.quantity * p.price
                ELSE 0
            END
        ), 0
    ) AS small_order_revenue,

    SUM(
        CASE
            WHEN o.quantity * p.price >= 500000
             AND o.quantity * p.price < 1000000
            THEN 1
            ELSE 0
        END
    ) AS medium_order_count,

    COALESCE(
        SUM(
            CASE
                WHEN o.quantity * p.price >= 500000
                 AND o.quantity * p.price < 1000000
                THEN o.quantity * p.price
                ELSE 0
            END
        ), 0
    ) AS medium_order_revenue,

    SUM(
        CASE
            WHEN o.quantity * p.price >= 1000000 THEN 1
            ELSE 0
        END
    ) AS large_order_count,

    COALESCE(
        SUM(
            CASE
                WHEN o.quantity * p.price >= 1000000
                THEN o.quantity * p.price
                ELSE 0
            END
        ), 0
    ) AS large_order_revenue

FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name, c.customer_id;
```

---

## 14. Final Day 19 Challenge

The final challenge requested:

- `customer_name`
- `total_revenue`
- `low_value_revenue`
- `high_value_revenue`

Definitions:

```text
Low-value revenue  = order value < 1,000,000
High-value revenue = order value >= 1,000,000
```

Required:

- `customers`
- `orders`
- `products`
- `LEFT JOIN`
- `SUM`
- `CASE`
- `COALESCE`
- `GROUP BY`

Validation rule:

```text
total_revenue
=
low_value_revenue
+
high_value_revenue
```

The submitted query had correct logic:

```sql
SELECT
    c.customer_id,
    COALESCE(SUM(o.quantity * p.price), 0) AS total_revenue,

    COALESCE(
        SUM(
            CASE
                WHEN o.quantity * p.price < 1000000
                THEN o.quantity * p.price
                ELSE 0
            END
        ), 0
    ) AS low_value_revenue,

    COALESCE(
        SUM(
            CASE
                WHEN o.quantity * p.price >= 1000000
                THEN o.quantity * p.price
                ELSE 0
            END
        ), 0
    ) AS high_value_revenue

FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY c.customer_name, c.customer_id;
```

Only the requested output column needed adjustment:

```sql
c.customer_name
```

instead of:

```sql
c.customer_id
```

### Assessment

**SQL logic: 10/10**

**Overall submitted answer: 9.8/10**

The small deduction was only because the requested report asked for `customer_name`.

---

## 15. Mistakes and Lessons

### Mistake 1 — Selecting non-aggregated columns

When using aggregation, ordinary selected columns must be represented in `GROUP BY`.

---

### Mistake 2 — Confusing count with quantity

```sql
THEN 1
```

counts qualifying rows.

```sql
THEN o.quantity
```

sums qualifying items.

---

### Mistake 3 — Wrong table alias

Product fields belong to `products`, for example:

```sql
p.product_name
```

not:

```sql
o.product_name
```

---

### Mistake 4 — Confusing row-level conditions with aggregate conditions

Conditional aggregation normally follows:

```text
row-level condition
      ↓
CASE
      ↓
aggregate
```

Example:

```sql
SUM(
    CASE
        WHEN o.quantity * p.price >= 1000000 THEN 1
        ELSE 0
    END
)
```

---

### Mistake 5 — Confusing WHERE with conditional aggregation

`WHERE` removes rows.

Conditional aggregation keeps the rows and controls what each row contributes.

```sql
WHERE o.quantity >= 3
```

filters rows.

Whereas:

```sql
SUM(
    CASE
        WHEN o.quantity >= 3 THEN 1
        ELSE 0
    END
)
```

counts qualifying rows while retaining the overall dataset.

---

## 16. Key Mental Models

### CASE

```text
IF condition → result
ELSE → alternative
```

### Conditional count

```text
CASE → 1 or 0 → SUM
```

### Conditional quantity

```text
CASE → quantity or 0 → SUM
```

### Conditional revenue

```text
CASE → quantity × price or 0 → SUM
```

### Customer analytics

```text
Customers
   ↓
LEFT JOIN Orders
   ↓
LEFT JOIN Products
   ↓
Calculate row-level order value
   ↓
CASE decides category
   ↓
SUM / COUNT aggregates
   ↓
GROUP BY customer
   ↓
Customer analytics report
```

---

## 17. Day 19 Assessment

| Skill | Result |
|---|---|
| Basic `CASE WHEN` | ✅ Strong |
| `CASE` with aggregates | ✅ Strong |
| Customer segmentation | ✅ Strong |
| CTE + CASE | ✅ Strong |
| Conditional counting | ✅ Strong |
| Conditional quantity aggregation | ✅ Strong |
| Conditional revenue aggregation | ✅ Strong |
| `LEFT JOIN` + conditional aggregation | ✅ Strong |
| `COALESCE` | ✅ Strong |
| Multiple conditional metrics | ✅ Strong |
| Business-oriented analytics query | ✅ Strong |

### Overall Day 19

**COMPLETED SUCCESSFULLY**

The key achievement was learning to translate business questions into row-level conditions and then aggregate those conditions into customer-level metrics.

---

