/*
Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
Check patients, admissions, and doctors tables for required information.
*/

SELECT
	p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
FROM patients p
join admissions a On a.patient_id = p.patient_id
join doctors d ON d.doctor_id = a.attending_doctor_id
where a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';
