WITH dates AS (SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY player_id), next_login AS (
SELECT
    a.player_id,
    first_login,
    event_date
FROM dates d
LEFT OUTER JOIN Activity a ON a.player_id = d.player_id
WHERE event_date = DATE_ADD(first_login, INTERVAL 1 DAY))

SELECT
    ROUND((SELECT COuNT(player_id)
FROM next_login) / COUNT(DISTINCT player_id),2) AS fraction
FROM Activity

# postgresql로 재풀이
SELECT
    ROUND(SUM(CASE WHEN a3.event_date IS NOT NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(f.player_id),2) AS fraction
FROM (SELECT
    a1.player_id AS player_id,
    a1.event_date AS first_date
FROM Activity a1
LEFT OUTER JOIN (SELECT
    player_id,
    MIN(event_date) AS first_date
FROM Activity
GROUP BY player_id) a2 ON a1.event_date = first_date AND a1.player_id = a2.player_id
WHERE a2.player_id IS NOT NULL) f
LEFT OUTER JOIN Activity a3 ON f.first_date + 1= a3.event_date AND f.player_id = a3.player_id