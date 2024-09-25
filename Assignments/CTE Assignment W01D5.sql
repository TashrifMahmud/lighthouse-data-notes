-- CTE Assignment W01D5
-- northwind database

-- Write a query that retrieves all orders that were made by customers located in the USA. 
-- Make sure to use a CTE first that shows the customer ID, company name, and order date for all orders.
WITH customer_company_order AS (
SELECT customerid, companyname, orderdate, country
FROM customers c
JOIN orders o USING (customerid)
)
SELECT *
FROM customer_company_order
WHERE country = 'USA';
-- Solution
WITH orders_with_customer AS (
SELECT o.customerid, c.companyname, o.orderdate
FROM orders o
JOIN customers c 
ON o.customerid = c.customerid
)
SELECT *
FROM orders_with_customer
WHERE customerid IN (
  SELECT customerid
  FROM customers
  WHERE country = 'USA'
);
-- Write a query that retrieves all employees that were hired after 1990. 
-- Make sure to use a CTE first that shows the employee ID, first name, last name, and hire date for all employees.
WITH employeeid_name_hire AS (
SELECT employeeid, firstname, lastname, hiredate
FROM employees e
)
SELECT *
FROM employeeid_name_hire
WHERE hiredate > '1990-01-01';
-- Write a query that retrieves all products that have a unit price between $10 and $20. 
-- Make sure to use a CTE first that shows the product name, unit price, and category name for all products.
WITH product_price_category AS (
SELECT productname, unitprice, categoryname
FROM products p
JOIN categories c USING (categoryid)
)
SELECT *
FROM product_price_category
WHERE unitprice BETWEEN 10 AND 20;
-- Write a query that retrieves all items where the quantity is greater than or equal to 10. 
-- Make sure to use a CTE first that shows the order ID, product name, and quantity for all items.
WITH order_product_quantity AS (
SELECT orderid, productname, quantity
FROM order_details od
JOIN products p USING (productid)
)
SELECT *
FROM order_product_quantity
WHERE quantity >= 10;
-- Write a query that retrieves all orders that were placed in 1997. 
-- Make sure to use a CTE first that shows the order ID, customer ID, and order date for all orders.
WITH order_customer_date AS (
SELECT orderid, customerid, orderdate
FROM orders
)
SELECT *
FROM order_customer_date
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';

