# Show how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places

SELECT
	YEAR(o.order_date) AS order_year,
    ROUND(SUM(od.discount*p.unit_price*od.quantity), 2) AS discount_amount
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY YEAR(o.order_date)
order by order_date DESC
