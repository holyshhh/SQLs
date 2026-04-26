# 1st
WITH dir_reports AS (
    SELECT
        managerId,
        COUNT(managerId) AS reports_cnt
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)

SELECT
    name
FROM
    Employee e
JOIN dir_reports dr ON e.id = dr.managerId

# 2nd
SELECT
    name
FROM Employee e
JOIN (
    SELECT
        managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5) dr ON dr.managerId = e.id