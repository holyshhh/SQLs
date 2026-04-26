WITH structure AS (SELECT
    UNNEST(ARRAY['Low Salary',
    'High Salary',
    'Average Salary']) AS category
)

SELECT
    s.category,
    COUNT(a.category) AS accounts_count
FROM structure s
LEFT OUTER JOIN (SELECT
    account_id,
    CASE WHEN income < 20000 THEN 'Low Salary'
     WHEN income > 50000 THEN 'High Salary'
     WHEN income >= 20000 AND income <= 50000 THEN  'Average Salary' END AS category
FROM Accounts) a
ON s.category = a.category
GROUP BY s.category