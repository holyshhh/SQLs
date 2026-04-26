SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',') AS products
FROM
    (SELECT *
    FROM Activities
    ORDER BY sell_date, product)
GROUP BY sell_date
ORDER BY sell_date