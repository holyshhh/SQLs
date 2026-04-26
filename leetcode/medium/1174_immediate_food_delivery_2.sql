WITH first_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order
    FROM
        Delivery
    GROUP BY customer_id
)

SELECT
    ROUND(SUM(CASE WHEN first_order = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(first_order) * 100, 2) AS immediate_percentage
FROM
    first_orders fo
LEFT OUTER JOIN Delivery d ON fo.first_order = d.order_date AND fo.customer_id = d.customer_id
