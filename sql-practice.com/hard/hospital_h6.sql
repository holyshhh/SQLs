# Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

SELECT
	province_name
FROM province_names pv
JOIN patients p ON pv.province_id = p.province_id
group by province_name
having COUNT(CAse when gender='M' THEN 1 END) > count(CAse When gender='F' THEN 1 END)
