# For each day display the total amount of admissions on that day. Display the amount changed from the previous date.

SELECT
	admission_date,
    COUNT(admission_date),
    COUNT(patient_id) - LAG(COUNT(patient_id)) OVER (order BY admission_date)
FROM
	admissions
group by admission_date
