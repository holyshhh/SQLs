SELECT
    CASE WHEN id % 2 = 0 THEN id - 1
        ELSE
            CASE WHEN id = (SELECT MAX(id) FROM Seat) THEN id
            ELSE id + 1 END
        END AS id,
    student
FROM
    Seat
ORDER BY id