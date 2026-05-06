# Show the category_name and the average product unit price for each category rounded to 2 decimal places.

SELECT
    category_name,
    ROUND(AVG(unit_price), 2) AS average_unit_price
FROM products p
JOIN categories c ON c.category_id = p.category_id
group by category_name
