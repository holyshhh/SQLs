# Show all of the patients grouped into weight groups.
# Show the total amount of patients in each weight group.
# Order the list by the weight group decending.
# For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

SELECT
	COUNT(weight) as patients_in_group,
    TRUNCATE(weight, -1) AS weight_group
FROM patients
group by weight_group
order by weight_group DESC;
