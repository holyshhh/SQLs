WITH r1 AS (SELECT
    *,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS ranks
FROM Employee)

SELECT
    CASE WHEN salary IN ((SELECT salary FROM r1 WHERE ranks = 2)) THEN salary ELSE NULL END AS SecondHighestSalary
FROM r1
UNION ALL

SELECT NULL AS SecondHighestSalary
WHERE NOT EXISTS (SELECT
    CASE WHEN salary IN ((SELECT salary FROM r1 WHERE ranks = 2)) THEN salary ELSE NULL END AS SecondHighestSalary
FROM r1
ORDER BY SecondHighestSalary
LIMIT 1)
ORDER BY SecondHighestSalary
LIMIT 1