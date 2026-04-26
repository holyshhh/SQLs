SELECT
    *,
    CASE
        WHEN x < y+z AND y < x+z AND z < x+y THEN 'Yes'
        -- WHEN x >= y AND y >= z AND x < y+z THEN 'Yes'
        -- WHEN y >= x AND x >= z AND y < x+z THEN 'Yes'
        -- WHEN z >= x AND x >= y AND z < x+y THEN 'Yes'
        -- WHEN y >= z AND z >= x AND y < x+z THEN 'Yes'
        -- WHEN x >= z AND z >= y AND x < y+z THEN 'Yes'
        -- WHEN z >= y AND y >= x AND z < x+y THEN 'Yes'
        ELSE 'No' END AS triangle 
FROM Triangle