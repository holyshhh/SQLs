SELECT 
    employee_id,
    department_id
FROM (SELECT
    employee_id,
    CASE
        WHEN primary_flag = 'Y'
            THEN department_id
            ELSE
                CASE WHEN
                    COUNT(department_id) OVER (PARTITION BY employee_id) = 1
                        THEN department_id
                        ELSE 0
                END
    END AS department_id
FROM
    Employee) a
WHERE department_id > 0