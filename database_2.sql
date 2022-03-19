#First of all, Thanks "Data With Baraa" [Baraa Khatib Salkini] for this beautiful tutorial that he gave.
      #His YouTube Channel: https://www.youtube.com/channel/UCiHH5a248MGc4vaQJHSwWwQ
           #MARCH 2022

-- SQL STATEMENT

-- SELECT first_name, last_name
-- FROM customers
-- WHERE country = 'Italy'
-- AND score <= 500

-- keywords + identifiers +  (operators)

USE db_sql_tutorial

-- SQL TASK: Retrieve all data and columns from customers

SELECT * 
FROM customers

-- SQL TASK: Retrieve only first name and country of all costumers

SELECT 
    first_name,
    country
FROM customers

-- SQL TASK: List all countries of all customers without duplicates

SELECT DISTINCT  -- the keyword use to remove rows that duplicate
    country
FROM customers -- first: there are 2 USA and 2 Germany

-- SQL TASK: Retrieve all customers where the result is sorted by score (smallest first)

SELECT *
FROM customers
ORDER BY score ASC --Ascending or Descending

-- SQL TASK: Retrieve all customers where the resulted is sorted by score (highest first)

SELECT *
FROM customers
ORDER BY score DESC

-- SQL TASK: Retrieve all customers, sorting the result by country (alph) and then by score (highest first)

SELECT *
FROM customers
ORDER BY 
    country ASC, 
    score DESC

-- SQL TASK: List only German customers

SELECT *
FROM customers
WHERE country = 'Germany'

                              -- CONDITION OPERATORS

-- SQL TASK: Find all customers whose score is higher than 500 (or less than 500)

SELECT * 
FROM customers
WHERE score >= 500

-- SQL TASK: Find all customers whose score is less than or equal to 500

SELECT *
FROM customers 
WHERE score < 500 OR score = 500 
    -- WHERE score <= 500 

-- SQL TASK: Find all customers whose score is higher than or equal to 500

SELECT * 
FROM customers
WHERE score >= 500
    -- WHERE score > 500 OR score = 500

-- SQL TASK: Find all non-german customers

SELECT * 
FROM customers
WHERE country != 'Germany'

                              -- LOGICAL OPERATORS

-- SQL TASK: Find all customers who come from Germany and whose score is less than 400

SELECT *
FROM customers
WHERE country = 'Germany' AND score < 400

-- SQL TASK: Find all customers who come from Germany or whose score is less than 400

SELECT * 
FROM customers
WHERE country = 'Germany' OR score < 400

-- SQL TASK: Find all customers whose score is not less than 400

SELECT * 
FROM customers
WHERE NOT score < 400

      -- Between: Return True if a value falls within a specific range
-- SQL TASK: Find all customers whose score falls in the range between 100 and 500

SELECT * 
FROM customers
WHERE score BETWEEN 100 AND 500

-- SQL TASK: Find all customers whose ID is equal to 1,2 or 5

SELECT * 
FROM customers
WHERE customer_id IN (1,2,5)

SELECT *
FROM customers
WHERE customer_id = 1 
      OR customer_id = 2 
      OR customer_id = 5

                        --LIKE--
            -- Percent '%' Matches anything
            -- Underscore '_' matches exactly one character
            -- A name starts with 'm' = m%
            -- A name ends with 'n' = %n
            -- A name containing 'h' = %h%
            -- A name containing the 'g' at 3d position = __g%

-- SQL TASK: Find all customers whose first name starts wih 'M'

SELECT *
FROM customers
WHERE first_name LIKE 'M%'

-- SQL TASK: Find all customers whose first name ends with 'n'

SELECT *
FROM customers
WHERE first_name like '%N'

-- SQL TASK: Find all customers whose first name contains 'r'

SELECT *
FROM customers
WHERE first_name like '%r%'

-- SQL TASK: Find all customers  whose first name contains 'r' in third position

SELECT *
FROM customers
WHERE first_name LIKE '__r%'

-- SQL JOIN

      --SQL ALIASES

      SELECT 
      c.customer_id AS cid
      FROM customers AS c


-- SQL TASK: List customer ID, first name, order ID, quantity, exclude the customers who have not placed any orders

      --SQL INNER JOIN

SELECT 
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id


-- SQL TASK: List customer Id, first name, order ID, quantity. Include the customers who have not placed any orders

SELECT 
c.customer_id,
c.first_name,
o.order_id,
o.quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id

-- SQL TASK: List first name, last name and country of all persons from custoemrs and employees

            -- UNION ALL: Combines the rows without removing duplicates
            -- UNION: Combines the rows and it removes any duplicates   

SELECT 
      first_name AS f_n,
      last_name AS l_n,
      country AS cy
FROM customers
UNION ALL
SELECT 
      first_name,
      last_name,
      emp_country
FROM employees

            -- SQL AGGREGATE FUNCTIONS

-- COUNT() Returns the number of rows in a result set
-- SUM() Returns the sum of values
-- AVG() Returns the average of values
-- MAX() Returns the maximum value
-- MIN() Returns the minimum value

-- SQL TASK: Find the total number of customers

SELECT COUNT(customer_id) AS total_customers
FROM customers

-- SQL TASK: Find the total quantity of all orders

SELECT SUM(orders.quantity) AS Sum_Quantity
FROM orders

-- SQL TASK: Find the average score of all customers

SELECT AVG(customers.score) AS cust_score -- Every nulls are ignored
FROM customers

-- SQL TASK: Find the highest and less score of all customers

SELECT MAX(score) AS max_score , MIN(score) AS min_score
FROM customers


SELECT MAX(score) + MIN(score) AS minplusmax , MAX(score) - MIN(score) AS minminusmax
FROM customers

SELECT MAX(order_date) AS latest_orderdate, MIN(order_date) as first_orderdate, COUNT(order_date) AS total_orderdate
FROM orders

-- SQL TASK: Find the total number of the customers for each country

SELECT 
COUNT(*) as total_nmber,
c.country 
FROM customers AS c
GROUP BY c.country
ORDER BY COUNT(*) ASC

-- SQL TASK: Find the highest score of customers for each country

SELECT
MAX(c.score) AS hghest_score,
c.country
FROM customers AS c
GROUP BY country

-- SQL TASK: Find the total number of customers for each country and only include countries that have more than 1 customer

SELECT 
      COUNT(customer_id),
      c.country
FROM customers as c 
WHERE c.country != 'USA'
GROUP BY c.country           
HAVING(COUNT(customer_id) > 1)
#HAVING works only wşth GROUP BY clause

#SQL TASK: Find all orders placed from customers whose score higher than 500 using the Customer ID

SELECT 
      o.order_id,
      o.customer_id,
      o.order_date,
      o.quantity
FROM orders AS o
RIGHT JOIN customers AS c
ON c.customer_id = o.customer_id
WHERE score > 500

                              --SQL STRING FUNCTIONS

-- CONCAT(): Returns a string by concatenating two or more string values
--LOWER(): Convers a string to lowercase
--UPPER(): Converts a string to uppercase
--TRIM(): Remove leading and trailing spaces from a string 
--LENGTH(): Returns the length of a string
--SUBSTRING(): Returns a substring from strings

-- SQL TASK: List all customer names, where the name is combination of first name and last name

SELECT
 CONCAT(first_name, ' ',last_name) AS Name
FROM customers

-- SQL TASK: List the first name of all customers in uppercase

SELECT 
  UPPER(customers.first_name) AS upper
FROM customers

#or

SELECT  
  LOWER(customers.first_name)
FROM customers

#Note: All functions in the SELECT will not change the data in the database

-- TRIM
      #we can remove "white spaces" in any value
      # " MARIE " as you see, there are spaces in left side and right side
      #Use "LTRIM()" if you want to delete left side's space
      #Use "RTRIM()" if you want to delete right side's space

SELECT
TRIM(last_name)
FROM customers

#DML - DATA MANIPULATION LANGUAGE
      #INSERT - DELETE - UPDATE

#If you want to understand how is structure of any table, use DESCRIBE
DESCRIBE customers

-- SQL TASK: Insert new customer Anna Nixon from UK

INSERT INTO customers
VALUE(DEFAULT,'Anna','Nixon','UK',750)

#DEFAULT: Get the value from table definition

-- SQL TASK: Insert new customer Max Lang

INSERT INTO customers
(first_name, last_name)
VALUE('Max' , 'Lang')


#UPDATE: Modify the values of an existing rows in a table

-- SQL TASK: Change the counrty and first name of customer ID 8 to Germany

UPDATE customers
SET 
country = 'Germany',
first_name = 'Luna'
WHERE customer_id = 8 

-- SQL TASK: Change the score of the customer Anna to 100 and change her country from UK to USA

UPDATE customers as c
SET
      c.score = 100,
      c.country = 'USA'
WHERE customer_id = 6

#DELETE: Delete rows from tables

-- SQL TASK: Delete both new customers Anna and Max from our database 

DELETE FROM customers
WHERE customer_id IN (6,7)

SELECT *
FROM customers

#SQL CREATE, ALTER, DROP - DDL (Data Definition Language)

-- COLUMN DEFINITION 

#COLUMN NAME: COULD BE ANYTHING
#DATA TYPE: INT,VARCHAR,DATE,CHAR
#CONSTRAINTS: PRIMARY KEY, NOT NULL, UNIQUE,DEFAULT
#Constraints: kısıtlama, zorlama (TR)







