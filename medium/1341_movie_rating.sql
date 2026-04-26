WITH user1 AS (
    SELECT
        r.user_id,
        u.name,
        COUNT(r.user_id)
    FROM MovieRating r
    LEFT OUTER JOIN Users u using (user_id)
    GROUP BY r.user_id, u.name
    ORDER BY COUNT(r.user_id) DESC, u.name
    LIMIT 1
), mv1 AS (
    SELECT
        r.movie_id,
        m.title,
        AVG(rating)
    FROM MovieRating r
    LEFT OUTER JOIN Movies m using (movie_id)
    WHERE created_at BETWEEN DATE('2020-02-01') AND DATE('2020-02-29')
    GROUP BY r.movie_id, m.title
    ORDER BY AVG(rating) DESC, m.title
    LIMIT 1
)

SELECT
    name AS results
FROM user1
UNION ALL
SELECT
    title AS results
FROM mv1