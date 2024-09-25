-- Views Assignment W01D5
-- northwind database

-- 1. Create a view that shows the product ID, product name, and unit price for all products that have been discontinued.
CREATE VIEW discontinued_view AS
SELECT productid, productname, unitprice
FROM products
WHERE discontinued = 1;
--
CREATE OR REPLACE VIEW discontinued_products AS
SELECT productid, productname, unitprice
FROM products
WHERE discontinued = 1
-- 2. Write a query that retrieves the different discontinued products using the view created in the previous step.
SELECT DISTINCT (productname)
FROM discontinued_view;
-- 3. Create a view that shows the product name, unit price, and supplier company name for all products.
CREATE VIEW products_view AS
SELECT productname, unitprice, companyname
FROM products p
JOIN suppliers s 
ON p.supplierid = s.supplierid;
-- 4. Write a query that retrieves all products using the view created in the previous step that have a unit price greater than $50.
SELECT productname
FROM products_view
WHERE unitprice > 50;
-- 
SELECT *
FROM products_with_supplier
WHERE unitprice > 50
-- 5. Create a view that shows the customer ID, company name, and total order amount by product.
CREATE VIEW total_order_amount AS
SELECT c.customerid, c.companyname, COUNT (o.orderid) AS total_order
FROM customers c
JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.customerid;
-- Solution
CREATE OR REPLACE VIEW customer_order_totals_by_product AS
SELECT c.customerid, c.companyname, od.productid,
(od.unitprice * od.quantity * (1 - od.discount)) AS total_order_amount_by_product
FROM customers c
JOIN orders o 
ON c.customerid = o.customerid
JOIN order_details od 
ON o.orderid = od.orderid
-- 6. Write a query that retrieves the top five order highest amount by product using the view created in the previous step. 
-- Tip: you can use the ORDER and LIMIT clauses. 
-- You can always review the Order of Execution reading or the Anatomy of a Query walkthrough.
SELECT *
FROM customer_order_totals_by_product
ORDER BY total_order_amount_by_product DESC
LIMIT 5;
-- Write a query that drops the view created (customerordertotalsbyproduct).
DROP VIEW customer_order_totals_by_product;
--