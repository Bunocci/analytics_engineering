SELECT
    COALESCE(
    SUM(
        CASE
        WHEN order_date >= DATE '2026-10-01'
        AND order_date < DATE '2026-11-01' 
        THEN 'o.quantity*p.price'
        ELSE 0
     END),0) AS october_revenue,
     
     COALESCE(
     SUM (
         CASE
         WHEN order_date >= DATE '2026-11-01'
         AND order_date < DATE '2026-12-01'
         THEN 'o.quantity*p.price'
         ELSE 0
     END),0) AS November_revenue
     
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id