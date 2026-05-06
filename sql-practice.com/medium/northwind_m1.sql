# Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table

SELECT
	product_name,
    company_name,
    category_name
FROM (select supplier_id, category_id, product_name FROM products) p
JOIN (select category_id, category_name FROM categories) c ON c.category_id = p.category_id
JOIN (select supplier_id, company_name FROM suppliers) s ON s.supplier_id = p.supplier_id
