#Analytics challenge-customer Sales Report
Customers
customer_id
customer_name
city

Orders
order_id
customer_id
product_id
quantity
order_date

Products
product_id
product_name
price


WITH customer_sales_report AS (
    SELECT
        c.customer_name, COALESCE(SUM(o.quantity),0) AS total_items,
        COUNT(o.order_id) AS total_orders, COALESCE(SUM(o.quantity*p.price),0) AS total_revenue
        COALESCE(
            SUM(
                CASE
                    WHEN o.order_date >= CURRENT_DATE-INTERVAL'30 days'
                    THEN 1
                    ELSE 0
                END),0) AS orders_in_last_30_days,
            
        COALESCE(
            SUM(
                CASE
                    WHEN order_date>= CURRENT_DATE - INTERVAL '30 days'
                    THEN o.quantity*p.price
                    ELSE 0
                END),0) AS revenue_in_last_30_days
                
    FROM customers AS c
        LEFT JOIN orders AS o
            ON o.customer_id = c.customer_id
        LEFT JOIN products AS p
            ON o.product_id = p.product_id
            
    GROUP BY
        c.customer_name, c.customer_id;
            
        COALESCE(
            SUM(
                CASE
                    WHEN total_revenue >= 5000000 THEN 'VIP'
                    WHEN total_revenue >= 1000000 THEN 'High Value'
                    WHEN total_revenue > 0 THEN 'Low Value'
                    ELSE 'No purchases'
            END),0) AS customer_status,
            FROM customer_sales_report
            ORDER BY total_revenue DESC;
  
 
 #Challenge 2
 student                    
----------------
Bruno
Alice
John

student | score
--------+------
Bruno   | 80
Bruno   | 90
Alice   | 60
Alice   | 70
John    | 40

Average >= 80 → Excellent
Average >= 60 → Pass
Otherwise → Fail

WITH students_score AS(

    SELECT 
        student_name, AVG(score) AS average_score
        
    FROM 
        exam_score
    GROUP BY
        student
     
)

    SELECT
        average_score,
        student
        CASE
            WHEN average_score >= 80 THEN 'Excellent'
            WHEN average_score >= 60 THEN 'pass'
            ELSE 'fail'
        END_AS student_status
    FROM students_score
    ORDER BY average_score DESC;
    