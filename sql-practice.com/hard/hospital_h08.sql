# Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.

SELECT
	ROUND(CAST(SUM(case When gender='M' then 1 ELse 0 END) AS FLOAT) / CAST(COUNT(*) AS FLOAT) * 100, 2) || '%' as percent_of_male_patients
from patients
