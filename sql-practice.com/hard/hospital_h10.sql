# Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.

SELECT province_name
from province_names
order by CASE WHEN province_name="Ontario" THEN 1 ELSe 2 END, province_name
