SELECT DISTINCT
    p.product_id,
    COALESCE(ids.new_price,10) AS price
FROM Products p
LEFT OUTER JOIN 
    (
        SELECT
            *,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS latest_price
        FROM Products p
        WHERE change_date <= DATE('2019-08-16')
    ) ids
ON p.product_id = ids.product_id
WHERE latest_price = 1 OR latest_price IS NULL
