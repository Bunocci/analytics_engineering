SELECT
    order_id, order_date
    EXTRACT (YEAR FROM DATE '2026-10-01');
    EXTRACT (YEAR FROM order_date) AS order_year
FROM orders
WHERE order_date>= DATE '2026-09-01'
    AND order_date<= DATE '2026-09-01'

DATE_PART('month', order_date)
SELECT DATE '2026-10-06' - INTERVAL '7 days'


#Exercise 1 — Current date
SELECT CURRENT_DATE;

#Exercise 2 — Current timestamp
SELECT CURRENT_TIMESTAMP;

#Exercise 3 — Extract Year 
SELECT
    EXTRACT (YEAR FROM DATE '2026-10-01');

#Exercise 4 — Extract Month
SELECT
    EXTRACT (MONTH FROM DATE '2026-10-01');
    
#Exercise 5 — Extract Day
SELECT
    EXTRACT (DAY FROM DATE '2026-10-01');
    
#6. Add days

SELECT DATE '2026-10-01' + INTERVAL '15 days';

#7. Subtract days
SELECT DATE '2026-10-01' - INTERVAL '10 days';

#8. Add one month
SELECT DATE '2026-10-01' + INTERVAL '1 month';

#9. Last 30 days
SELECT*
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

#10. filter dates
SELECT*
FROM orders
WHERE order_date BETWEEN DATE '2026-09-01' AND DATE '2026-09-30';


B

B

SELECT *
FROM orders
WHERE order_date >= DATE '2026-10-01';

SELECT*
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '7days';

SELELCT*
FROM orders
WHERE oder_date BETWEEN DATE'2026-10-01' AND DATE'2026-10-30';

>= means "this date or later."
<= means "this date or earlier."