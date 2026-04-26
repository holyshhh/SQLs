SELECT
    ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM (SELECT
    pid,
    tiv_2016,
    COUNT(tiv_2015) OVER (PARTITION BY tiv_2015) AS cnt_2015,
    COUNT((lat, lon)) OVER (PARTITION BY (lat, lon)) AS cnt_city
FROM
    Insurance)
WHERE cnt_2015 > 1 AND cnt_city = 1