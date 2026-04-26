SELECT
    id,
    COUNT(friends) AS num
FROM
    (SELECT
        requester_id AS id,
        accepter_id AS friends
    FROM
        RequestAccepted
    UNION
    SELECT
        accepter_id AS id,
        requester_id AS friends
    FROM RequestAccepted)
GROUP BY id
ORDER BY num DESC
LIMIT 1
