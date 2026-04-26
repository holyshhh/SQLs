SELECT
    Department,
    Employee,
    Salary
FROM
    (SELECT
        e.name AS Employee,
        salary AS Salary,
        d.name AS Department,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY salary DESC) AS higher
    FROM Employee e
    LEFT OUTER JOIN Department d
    ON d.id = e.departmentId)
WHERE higher <= 3