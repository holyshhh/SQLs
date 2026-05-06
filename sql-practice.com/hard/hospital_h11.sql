/*
We need a breakdown for the total amount of admissions each doctor has started each year.
Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.
*/

SELECT
	  doctor_id,
    CONCAT(first_name, ' ', last_name) As doctor_name,
    specialty,
    YEAR(admission_date) as selected_year,
    COUNT(YEAR(admission_date)) as total_admissions
FROM admissions a
join doctors d ON a.attending_doctor_id = d.doctor_id
group by doctor_id, doctor_name, specialty, selected_year
