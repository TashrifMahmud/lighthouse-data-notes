-- Unions Assignment W01D5
-- northwind database

-- 1. List the cities where there are business activities, that is, customers or suppliers.
SELECT DISTINCT(city), Type
FROM (SELECT city, 'Customer' AS Type
FROM customers
UNION ALL
SELECT city, 'Supplier' As Type
FROM suppliers) AS virtual_table
ORDER BY city;
-- Solution
SELECT city
FROM customers
UNION
SELECT city
FROM suppliers
-- 2. Review the above list and add the cities where employees are located. 
-- Has the result changed? Are there more cities listed?
SELECT city
FROM customers
UNION 
SELECT city
FROM suppliers
UNION
SELECT city
FROM employees;
-- There are two more cities.
-- 3. Review the above list by keeping only cities in the USA for customers, suppliers, and employees.
SELECT city
FROM 	(SELECT city, country
FROM customers
UNION 
SELECT city, country
FROM suppliers
UNION
SELECT city, country
FROM employees) AS virutal_table
WHERE country = 'USA';
--
SELECT city
FROM customers
WHERE country='USA'
UNION
SELECT city
FROM suppliers
WHERE country='USA'
UNION
SELECT city
FROM employees
WHERE country='USA'
-- 4. List the titles for employees and customers.
SELECT  DISTINCT (contacttitle) AS contacttitle_or_title
FROM customers
UNION ALL
SELECT DISTINCT (title)
FROM employees;
-- 
SELECT contacttitle AS positiontitle
FROM customers
UNION
SELECT title AS positiontitle
FROM employees
-- 5. List all suppliers and shippers company names. 
-- To distinguish shippers from suppliers, create an additional column named ‘partnertype’.
SELECT companyname, 'Supplier' AS partnertype
FROM suppliers
UNION ALL
SELECT companyname, 'Shipper' As partnertype
FROM shippers;
--
SELECT 'Shipper' AS partnertype, companyname
FROM shippers
UNION
SELECT 'Supplier' As partnertype, companyname
FROM suppliers
-- 6. Review the above list and add the customers' company names.
SELECT companyname, 'Supplier' AS partnertype
FROM suppliers
UNION
SELECT companyname, 'Shipper' As partnertype
FROM shippers
UNION
SELECT companyname, 'Customer' AS partnertype
FROM customers;
-- 7. Validate if there is a company that is a shipper partner and a supplier partner by including duplicates. 
-- Review the above list that extracts all suppliers and shippers company names. 
-- To distinguish shippers from suppliers, create an additional column named ‘partnertype’. 
-- Has the result changed? Are there more partners listed?
SELECT companyname, 'Supplier' AS partnertype
FROM suppliers
UNION ALL
SELECT companyname, 'Shipper' As partnertype
FROM shippers;
-- The result hasn’t changed.