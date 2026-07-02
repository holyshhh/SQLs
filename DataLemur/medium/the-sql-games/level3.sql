WITH hcest AS (
	SELECT *
	FROM monthly_temperatures
	WHERE avg_temperature = (SELECT MAX(avg_temperature) FROM monthly_temperatures)
	  or avg_temperature = (SELECT MIN(avg_temperature) FROM monthly_temperatures)
)

select
	shape,
	extract(month from date) as month,
	AVG(average_completion_time)
from honeycomb_game hg
where
	date >= CURRENT_DATE - INTERVAL '20 year'
	and extract(month from date) IN (SELECT month from hcest)
GROUP BY shape, extract(month from date)
order by AVG(average_completion_time)
