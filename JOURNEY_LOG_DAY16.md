# JOURNEY LOG — DAY 16
## SQL JOINs  — Level 3: LEFT JOINs, COALESCE + Aggregation
## SUBQUERIES - Aggregation

### Goal for today
Build confidence  with LEFT JOINs, COALESCE , SUBQUERIES with IN & NOT IN and aggregation for e-commerce analytics.

---



# What I Learned

^LEFT JOIN
^preserve unmatched rows 
^NULL values appear
^aggregates behave differently
^COALESCE when zero is required
^SUBQUERIES
^IN
^NOT IN

# TABLE USED
product_id | product_name | price
-----------+--------------+--------
101        | Laptop       | 3000000
102        | Mouse        | 60000
103        | Keyboard     | 150000



# Day 16 Key Takeaways

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
