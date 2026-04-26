WITH init_sum AS (
    SELECT
        visited_on,
        SUM(amount) AS sum_per_date
    FROM
        Customer
    GROUP BY visited_on
)

SELECT
    visited_on,
    SUM(moving_sum) AS amount,
    ROUND(SUM(moving_sum) / 7.0, 2) AS average_amount
FROM
    (
    SELECT
        visited_on,
        LAG(visited_on, 6) OVER (ORDER BY visited_on) AS moving,
        sum_per_date,
        SUM(sum_per_date) over (ORDER BY visited_on
                        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_sum
    FROM
        init_sum
    )
WHERE moving IS NOT NULL
GROUP BY visited_on
ORDER BY visited_on
