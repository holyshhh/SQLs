# Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken,
# and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date,
# "Late" if the order shipped late, "Not Shipped" if shipped_date is null.
# Order by employee last_name, then by first_name, and then descending by number of orders.

SELECT
    first_name,
    last_name,
    COUNT(order_id) AS num_orders,
    CASE WHEN shipped_date <= required_date THEN "On Time"
    WHEN shipped_date > required_date THEN "Late"
    WHEN shipped_date IS NULL THEN "Not Shipped" END AS Shipped
FROM orders o
LEFT OUTER JOIN employees e ON o.employee_id = e.employee_id
group by first_name, last_name, Shipped
order by last_name, first_name, num_orders desc
