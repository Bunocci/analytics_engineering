#FIRST_VALUE() and LAST_VALUE() — accessing values at particular positions.
CustomerID	PurchaseDate	Amount
101	   		2026-01-10		50
101			2026-02-15		80
101			2026-03-20		30
102			2026-01-05		100
102			2026-02-12		100

WITH order_history AS(
    SELECT
        customer_id, purchase_date, amount,
        FIRST_VALUE(amount) OVER(PARTITION BY customer_id ORDER BY purchase_date ASC) AS first_amount,
        LAST_VALUE(amount)OVER(PARTITION BY customer_id ORDER BY purchase_date, ASC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS latest_amount
    FROM orders
     
    )
    SELECT 
    customer_id,
    purchase_date,
    amount,
    first_amount,
    latest_amount,
    CASE 
        WHEN Amount > FirstAmount THEN 'Higher than first'
        WHEN Amount < FirstAmount THEN 'Lower than first'
        ELSE 'Same as first'
    END AS compare
FROM order_history;