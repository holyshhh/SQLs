DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM (
        SELECT
            *,
            ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS dup_rank
        FROM Person
    )
    WHERE dup_rank > 1