# Show the total amount of orders for each year/month.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(order_date) AS no_of_orders
FROM orders
group by YEAR(order_date), MONTH(order_date)
