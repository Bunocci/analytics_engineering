# 📅 Day 20 | Analytics Engineering Study Log

## ⏱️ Daily Metrics
* **Time Studied:** [3.5] hours
* **Topic Focus:** SQL Date/Timestamp Manipulation & Analytical Foundations
* **Productivity Score:** [1-5] / 5

---

## 🚀 Today's Objectives
- [x] Master DATE vs TIMESTAMP functions and casting
- [x] Solidify time-based filtering and the "last-N-days" mental model
- [x] Understand row-level vs. group-level execution contexts
- [x] Identify when to deploy Common Table Expressions (CTEs)

---

## 🧠 Knowledge Captured

### Key Concepts Learned
* **DATE vs TIMESTAMP:** Distinguishing between static calendars (`YYYY-MM-DD`) and point-in-time zone-aware precision metrics.
* **CURRENT_DATE / CURRENT_TIMESTAMP:** Utilizing system run-time values for dynamic date processing.
* **EXTRACT() & INTERVAL:** Isolating specific date parts (year, month, day) and applying native date/time arithmetic intervals.
* **Date Filtering & Last-N-Days Mental Model:** Mastering `>= vs <=` logic to prevent off-by-one errors or hidden boundary truncations.
* **Aggregations & Recency:** Building monthly/yearly aggregation buckets and capturing data freshness using time-based conditional aggregation.
* **Row-Level vs. Group-Level Contexts:** Defining the exact architectural boundary where individual transactional items turn into grouped analytical insights.
* **CTE Utility:** Recognizing the exact structural turning point where a Common Table Expression improves pipeline readability and execution logical steps over nested subqueries.

### Syntax & Code Snippets
```sql
-- Example placeholder for timestamp filtering & extraction practices
SELECT
    EXTRACT(MONTH FROM created_at) AS aggregation_month,
    COUNT(CASE WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days' THEN user_id END) AS recent_30_day_active_users
FROM customer_event
WHERE created_at >= '2026-01-01' -- Timestamp filtering best practice
GROUP BY 1;
```

---

## 🚧 Roadblocks & Bugs
* **The Issue:** Navigating the customer analytics challenge and handling time zones or edge case data distributions.
* **The Fix:** Documented structural differences between row-level adjustments and aggregate grouping operations.

---

---

## 📈 Next Steps
- [ ] **Preparation for Day 21:** Window Functions (`ROW_NUMBER()`, `RANK()`, `LEAD()`, `LAG()`)
