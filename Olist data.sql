/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (5) [seller_id]
      ,[seller_zip_code_prefix]
      ,[seller_city]
      ,[seller_state]
  FROM olist_sellers_dataset
  

  SELECT TOP (5) [customer_id]
      ,[customer_unique_id]
      ,[customer_zip_code_prefix]
      ,[customer_city]
      ,[customer_state]
  FROM olist_customers_dataset
  

   SELECT TOP (5) [geolocation_zip_code_prefix]
      ,[geolocation_lat]
      ,[geolocation_lng]
      ,[geolocation_city]
      ,[geolocation_state]
  FROM olist_geolocation_dataset
  

  SELECT TOP (5) [order_id]
      ,[payment_sequential]
      ,[payment_type]
      ,[payment_installments]
      ,[payment_value]
  FROM olist_order_payments_dataset
  

  SELECT TOP (5) [review_id]
      ,[order_id]
      ,[review_score]
      ,[review_comment_title]
      ,[review_comment_message]
      ,[review_creation_date]
      ,[review_answer_timestamp]
  FROM olist_order_reviews_dataset
  

  SELECT TOP (5) [order_id]
      ,[customer_id]
      ,[order_status]
      ,[order_purchase_timestamp]
      ,[order_approved_at]
      ,[order_delivered_carrier_date]
      ,[order_delivered_customer_date]
      ,[order_estimated_delivery_date]
  FROM olist_orders_dataset
  

  SELECT TOP (5) [product_id]
      ,[product_category_name]
      ,[product_name_lenght]
      ,[product_description_lenght]
      ,[product_photos_qty]
      ,[product_weight_g]
      ,[product_length_cm]
      ,[product_height_cm]
      ,[product_width_cm]
  FROM olist_products_dataset
  

  SELECT TOP (5) [column1]
      ,[column2]
  FROM product_category_name_translation
  

 SELECT TOP (5) [order_id]
      ,[order_item_id]
      ,[product_id]
      ,[seller_id]
      ,[shipping_limit_date]
      ,[price]
      ,[freight_value]
  FROM olist_order_items_dataset
  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DATA CLEANING OF THE TABLES
 
-- Geolocation TABLE
 -- viewing the geolocation dataset
  SELECT *
  FROM olist_geolocation_dataset


-- Checking for the inconsistency in the geolocation city names
  SELECT DISTINCT geolocation_city AS unique_geo, geolocation_state
FROM olist_geolocation_dataset
GROUP BY geolocation_state, geolocation_city


-- noticed the accented letters were numerous and i will be replacing them all at once
SELECT TRANSLATE(geolocation_city, 'áãçéíóúôâêõ', 'aaceiouoaeo') AS geolocation_city_replaced
FROM olist_geolocation_dataset


-- updating it into its original table
UPDATE olist_geolocation_dataset
SET geolocation_city = TRANSLATE(geolocation_city, 'áãçéíóúôâêõ', 'aaceiouoaeo')


-- noticed some numerical letters in between the character strings and removed them
select TRANSLATE(geolocation_city, '0123456789', REPLICATE(' ', 10)) as geo_translated
from olist_geolocation_dataset
WHERE geolocation_city LIKE '%[0-9]%';


--removing symbols and extra spaces in them
UPDATE olist_geolocation_dataset
SET geolocation_city = REPLACE(geolocation_city, '''', '')
WHERE geolocation_city LIKE '%''%';


-- Removing the leading ...
UPDATE olist_geolocation_dataset
SET geolocation_city = SUBSTRING(geolocation_city, 4, LEN(geolocation_city))
WHERE LEFT(geolocation_city, 3) = '...';


--Removing the leading *
UPDATE olist_geolocation_dataset
SET geolocation_city = SUBSTRING(geolocation_city, 2, LEN(geolocation_city))
WHERE LEFT(geolocation_city, 1) = '*';


--Removing the leading 4o
UPDATE olist_geolocation_dataset
SET geolocation_city = STUFF(geolocation_city, 1, 4, '')
WHERE LEFT(geolocation_city, 4) = '4o. ';


--Extracting only one occurrence of rio de janeiro 
UPDATE olist_geolocation_dataset
SET geolocation_city = SUBSTRING(geolocation_city, 1, CHARINDEX('rio de janeiro', geolocation_city) + LEN('rio de janeiro') - 1)
WHERE CHARINDEX('rio de janeiro', geolocation_city) > 0;


--Removing the trailing z-
UPDATE olist_geolocation_dataset
SET geolocation_city = LEFT(geolocation_city, LEN(geolocation_city) - 3)
WHERE geolocation_city LIKE '%z-3';


--Removing encoding symbols %26apos%3B and %26 in the geolocation_city column
UPDATE olist_geolocation_dataset
SET geolocation_city = REPLACE(REPLACE(geolocation_city, '%26apos%3B', ''''), '%26', '&')
WHERE geolocation_city LIKE '%sao joao do pau d%';


--Removing spaces in the geolocation_city column using the REPLACE function
UPDATE olist_geolocation_dataset
SET geolocation_city = REPLACE(geolocation_city, ' ', '')
WHERE geolocation_city LIKE '%d alho%';


--Capitalizing the first letter of each word in the geolocation_city column
UPDATE olist_geolocation_dataset
SET geolocation_city = UPPER(SUBSTRING(geolocation_city, 1, 1)) + LOWER(SUBSTRING(geolocation_city, 2, LEN(geolocation_city)))


-- renaming geolocation_state to its unabbreviated name
 UPDATE olist_geolocation_dataset
SET geolocation_state = 
CASE geolocation_state
    WHEN 'AC' THEN 'Acre'
    WHEN 'AL' THEN 'Alagoas'
    WHEN 'AP' THEN 'Amapa'
    WHEN 'AM' THEN 'Amazonas'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'CE' THEN 'Ceara'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'ES' THEN 'Espirito Santo'
    WHEN 'GO' THEN 'Goias'
    WHEN 'MA' THEN 'Maranhao'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'PA' THEN 'Para'
    WHEN 'PB' THEN 'Paraiba'
    WHEN 'PR' THEN 'Parana'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'PI' THEN 'Piaui'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'RN' THEN 'Rio Grande do Norte'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'RO' THEN 'Rondonia'
    WHEN 'RR' THEN 'Roraima'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'SP' THEN 'Sao Paulo'
    WHEN 'SE' THEN 'Sergipe'
    WHEN 'TO' THEN 'Tocantins'
END;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- CUSTOMER TABLE CLEANING
SELECT *
FROM olist_customers_dataset


-- checking to see if there are inconsistency in customer_city
SELECT DISTINCT customer_city, customer_state
FROM olist_customers_dataset


-- Replacing the abbreviated customer_state to its full name
UPDATE olist_customers_dataset
SET customer_state = 
CASE customer_state
    WHEN 'AC' THEN 'Acre'
    WHEN 'AL' THEN 'Alagoas'
    WHEN 'AP' THEN 'Amapa'
    WHEN 'AM' THEN 'Amazonas'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'CE' THEN 'Ceara'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'ES' THEN 'Espirito Santo'
    WHEN 'GO' THEN 'Goias'
    WHEN 'MA' THEN 'Maranhao'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'PA' THEN 'Para'
    WHEN 'PB' THEN 'Paraiba'
    WHEN 'PR' THEN 'Parana'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'PI' THEN 'Piaui'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'RN' THEN 'Rio Grande do Norte'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'RO' THEN 'Rondonia'
    WHEN 'RR' THEN 'Roraima'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'SP' THEN 'Sao Paulo'
    WHEN 'SE' THEN 'Sergipe'
    WHEN 'TO' THEN 'Tocantins'
END;


-- changing the customer_city to a proper case
UPDATE olist_customers_dataset
SET customer_city = UPPER(LEFT(customer_city, 1)) + LOWER(SUBSTRING(customer_city, 2, LEN(customer_city)))


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ORDER ITEMS TABLE
SELECT *
FROM olist_order_items_dataset


 --TO ROUND PRICE AND FREIGHT VALUE COLUMN UP TO 2 DECIMAL PLACES
--FOR PRICE
UPDATE olist_order_items_dataset
SET price = ROUND(price, 2)


--FOR FREIGHT VALUE
UPDATE olist_order_items_dataset
SET freight_value = ROUND(freight_value, 2)


-- Add new columns
ALTER TABLE olist_order_items_dataset
ADD shipping_limit_dateee DATE,
    shipping_limit_time TIME


-- Populate new columns
UPDATE olist_order_items_dataset
SET shipping_limit_dateee = CAST(shipping_limit_date AS DATE),
    shipping_limit_time = CAST(shipping_limit_date AS TIME)


-- Remove original column
ALTER TABLE olist_order_items_dataset
DROP COLUMN shipping_limit_date


-- view the table
select*
from olist_order_items_dataset


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  ORDER PAYMENT TABLE
select *
from olist_order_payments_dataset


-- convert payment_value to 2 decimal places
UPDATE olist_order_payments_dataset
SET payment_value = ROUND(payment_value, 2)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ORDER REVIEWS TABLE
select*
from olist_order_reviews_dataset

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PRODUCT TABLE
select *
from olist_products_dataset

-- product category name is in spanish to make it more understandable we have to be able to translate it to english, which will only be possible by joining the product category name translation table with the product category table
-- let's quickly clean the product_category_name_translation table
-- by renaming the column 
EXEC sp_rename 'product_ctegory_name_translation.column1', 'product_category_name', 'COLUMN';
EXEC sp_rename 'product_category_name_translation.column2', 'product_category_name_english', 'COLUMN';


-- delete the column title from the first row
DELETE FROM product_category_name_translation
WHERE product_category_name = 'product_category_name';

DELETE FROM product_category_name_translation
WHERE product_category_name_english = 'product_category_name_english';


-- replacing the underscores with spaces
update product_category_name_translation
set product_category_name_english = REPLACE(product_category_name_english, '_', ' ')


-- check to see if the changes reflected
 SELECT *
FROM product_category_name_translation


--time to join our tables
-- add the new column name
ALTER TABLE olist_products_dataset
ADD product_category_eng_name nvarchar(50)

UPDATE olist_products_dataset
SET product_category_eng_name = p2.product_category_name_english
FROM olist_products_dataset p1
JOIN product_category_name_translation p2 ON p1.product_category_name = p2.product_category_name


-- to capitalize the english product category
UPDATE olist_products_dataset
SET product_category_eng_name = UPPER(SUBSTRING(product_category_eng_name, 1, 1)) + LOWER(SUBSTRING(product_category_eng_name, 2, LEN(product_category_eng_name)))


-- viewing our table 
SELECT *
FROM olist_products_dataset


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SELLERS TABLE
select *
FROM olist_sellers_dataset


--let's capitalize the seller city and rename it to its full form
UPDATE olist_sellers_dataset
SET seller_city= UPPER(SUBSTRING(seller_city, 1, 1)) + LOWER(SUBSTRING(seller_city, 2, LEN(seller_city))) 


-- renaming it
UPDATE olist_sellers_dataset
SET seller_state = 
CASE seller_state
    WHEN 'AC' THEN 'Acre'
    WHEN 'AL' THEN 'Alagoas'
    WHEN 'AP' THEN 'Amapa'
    WHEN 'AM' THEN 'Amazonas'
    WHEN 'BA' THEN 'Bahia'
    WHEN 'CE' THEN 'Ceara'
    WHEN 'DF' THEN 'Distrito Federal'
    WHEN 'ES' THEN 'Espirito Santo'
    WHEN 'GO' THEN 'Goias'
    WHEN 'MA' THEN 'Maranhao'
    WHEN 'MT' THEN 'Mato Grosso'
    WHEN 'MS' THEN 'Mato Grosso do Sul'
    WHEN 'MG' THEN 'Minas Gerais'
    WHEN 'PA' THEN 'Para'
    WHEN 'PB' THEN 'Paraiba'
    WHEN 'PR' THEN 'Parana'
    WHEN 'PE' THEN 'Pernambuco'
    WHEN 'PI' THEN 'Piaui'
    WHEN 'RJ' THEN 'Rio de Janeiro'
    WHEN 'RN' THEN 'Rio Grande do Norte'
    WHEN 'RS' THEN 'Rio Grande do Sul'
    WHEN 'RO' THEN 'Rondonia'
    WHEN 'RR' THEN 'Roraima'
    WHEN 'SC' THEN 'Santa Catarina'
    WHEN 'SP' THEN 'Sao Paulo'
    WHEN 'SE' THEN 'Sergipe'
    WHEN 'TO' THEN 'Tocantins'
END;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SOLVING THE BUSINESS QUESTIONS


--1)  What is the total revenue generated by Olist, and how has it changed over time?
-- to calculate the total revenue made by olist we have to add up total number of sales geenrated on the e-commerce olist data
-- Total revenue generated by Olist
SELECT ROUND(SUM(payment_value), 2) as "Total Revenue"  -- rounding the value to 2 decimal places
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id --joining the orders and order_payments table
WHERE o.order_status != 'canceled' and o.order_status != 'unavailiable'  -- excluding the canceled and unavailiable status because the order did not geenrate any revenue to the company


-- revenue by quarter
SELECT DATEPART(YEAR, order_purchase_date) AS Year,
       DATEPART(QUARTER, order_purchase_date) AS Quarter,
       ROUND(SUM(payment_value), 2) AS "Total Revenue"
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.order_status != 'canceled' AND o.order_status != 'unavailable'
GROUP BY DATEPART(YEAR, order_purchase_date), DATEPART(QUARTER, order_purchase_date)
ORDER BY Year, Quarter;


-- revenue by month
SELECT DATEPART(YEAR, order_purchase_date) AS Year,
       DATEPART(MONTH, order_purchase_date) AS Month,
       ROUND(SUM(payment_value), 2) AS "monthly_Revenue"
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.order_status != 'canceled' AND o.order_status != 'unavailable'
GROUP BY DATEPART(YEAR, order_purchase_date), DATEPART(MONTH, order_purchase_date)
ORDER BY Year, Month;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2) How many orders were placed on Olist, and how does this vary by month or season?
--How many orders were placed on Olist
SELECT COUNT(order_id) as orders_number
FROM olist_orders_dataset
WHERE order_status != 'canceled' AND order_status != 'unavailable'


-- how does this vary by month or season
-- by month 
SELECT DATEPART(YEAR, order_purchase_date) AS Year, DATEPART(Month, order_purchase_date) AS monthly_order, COUNT(*) as orders_number
FROM olist_orders_dataset
WHERE order_status != 'canceled' AND order_status != 'unavailable'
GROUP BY YEAR(order_purchase_date), DATEPART(Month, order_purchase_date)
ORDER BY Year, Monthly_order


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3)  What are the most popular product categories on Olist, and how do their sales volumes compare to each other?
--- we would be joining the payment, order items and product tables
SELECT p.product_category_eng_name AS product_category_eng_name, ROUND(SUM(op.payment_value),2) AS total_sales_volume
FROM olist_orders_dataset ord
	 JOIN olist_order_payments_dataset op ON ord.order_id = op.order_id
	JOIN olist_order_items_dataset i ON ord.order_id = i.order_id
	JOIN olist_products_dataset p ON i.product_id = p.product_id 
WHERE order_status != 'canceled' AND order_status != 'unavailable'
GROUP BY p.product_category_eng_name
ORDER BY total_sales_volume DESC;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4) What is the average order value (AOV) on Olist, and how does this vary by product category or payment method?
-- AOV on olist
SELECT  ROUND(AVG(payment_value),2) AS Average_order_value
FROM olist_order_payments_dataset op
JOIN olist_orders_dataset od on op.order_id = od.order_id
WHERE order_status != 'canceled' AND order_status != 'unavailable'


-- how AOV varies by payment type
SELECT payment_type, ROUND(AVG(payment_value), 2) AS Average_order_value
FROM olist_order_payments_dataset op
JOIN olist_orders_dataset od on op.order_id = od.order_id
WHERE  order_status != 'canceled' AND order_status != 'unavailable'
GROUP BY payment_type
ORDER BY Average_order_value;


-- how AOV varies by product category
SELECT product_category_eng_name, ROUND(AVG(op.payment_value),2) AS Average_order_value
FROM olist_orders_dataset ord 
JOIN olist_order_payments_dataset op ON ord.order_id = op.order_id
JOIN olist_order_items_dataset i ON ord.order_id = i.order_id
JOIN olist_products_dataset p ON i.product_id = p.product_id
WHERE order_status != 'canceled' AND order_status != 'unavailable'
GROUP BY product_category_eng_name
ORDER BY Average_order_value DESC;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5) How many sellers are active on Olist, and how does this number change over time?
-- Number of active sellers by year
-- Overall count of seller additions or drops
SELECT
  YEAR(order_purchase_date) AS active_year,
  COUNT(DISTINCT seller_id) AS active_sellers,
  ISNULL(COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (ORDER BY YEAR(order_purchase_date)), 0) AS num_of_seller_added_or_dropped,
  CASE
    WHEN COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (ORDER BY YEAR(order_purchase_date)) > 0 THEN 'Addition'
    WHEN COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (ORDER BY YEAR(order_purchase_date)) < 0 THEN 'Dropped'
    ELSE 'No Change'
  END AS change_indication
FROM olist_orders_dataset ood
JOIN olist_order_items_dataset ooid ON ood.order_id = ooid.order_id
GROUP BY YEAR(order_purchase_date)
ORDER BY YEAR(order_purchase_date);


-- Count of seller additions or drops by quarter
SELECT
  YEAR(order_purchase_date) AS active_year,
  DATEPART(QUARTER, order_purchase_date) AS active_quarter,
  COUNT(DISTINCT seller_id) AS active_sellers,
  ISNULL(COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (PARTITION BY YEAR(order_purchase_date) ORDER BY DATEPART(QUARTER, order_purchase_date)), 0) AS num_of_seller_added_or_dropped,
  CASE
    WHEN COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (PARTITION BY YEAR(order_purchase_date) ORDER BY DATEPART(QUARTER, order_purchase_date)) > 0 THEN 'Addition'
    WHEN COUNT(DISTINCT seller_id) - LAG(COUNT(DISTINCT seller_id)) OVER (PARTITION BY YEAR(order_purchase_date) ORDER BY DATEPART(QUARTER, order_purchase_date)) < 0 THEN 'Dropped'
    ELSE 'No Change'
  END AS change_indication
FROM olist_orders_dataset ood
JOIN olist_order_items_dataset ooid ON ood.order_id = ooid.order_id
GROUP BY YEAR(order_purchase_date), DATEPART(QUARTER, order_purchase_date)
ORDER BY YEAR(order_purchase_date), DATEPART(QUARTER, order_purchase_date);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6) What is the distribution of seller ratings on Olist, and how does this impact sales performance? 
-- Joining the order review dataset with the order payment dataset
SELECT
  oor.review_score,
  COUNT(DISTINCT oor.order_id) AS num_orders,
 ROUND(SUM(op.payment_value), 2) AS total_revenue,
  ROUND(AVG(op.payment_value), 2) AS avg_revenue
FROM olist_order_reviews_dataset oor
JOIN olist_order_payments_dataset op ON oor.order_id = op.order_id
GROUP BY oor.review_score
ORDER BY oor.review_score DESC;


-- finding the relationship between review score and total revenue
-- we want to know find the correlation coefficient of review score and total revenue
SELECT ROUND(
  (SUM(review_score * total_revenue) - (SUM(review_score) * SUM(total_revenue) / COUNT(*)))
  / (SQRT((SUM(review_score * review_score) - (SUM(review_score) * SUM(review_score) / COUNT(*))))
    * SQRT((SUM(total_revenue * total_revenue) - (SUM(total_revenue) * SUM(total_revenue) / COUNT(*))))), 2) AS correlation_coefficient
FROM (
  SELECT
    oor.review_score,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
  FROM olist_order_reviews_dataset oor
  JOIN olist_order_payments_dataset op ON oor.order_id = op.order_id
  GROUP BY oor.review_score
) AS data;


-- it has a correlation coefficient of 0.74
-- A correlation coefficient of 0.74 suggests a positive impact on revenue: as review scores increase, there is a tendency for higher total revenue. This finding indicates that seller's rating, as measured by review scores, likely has a positive influence on sales performance.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7) How many customers have made repeated purchases on Olist, and what percentage of total sales do they account for?
WITH repeated_customers AS (
    SELECT c.customer_unique_id, 
        COUNT(DISTINCT o.order_id) AS OrderCount, 
        ROUND(SUM(payment_value), 2) AS total_spent
    FROM olist_orders_dataset o
        INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
        INNER JOIN olist_order_payments_dataset oop ON o.order_id = oop.order_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(DISTINCT o.order_id) > 1
)
SELECT COUNT(DISTINCT rc.customer_unique_id) AS num_repeated_customers,
    ROUND(SUM(rc.total_spent) / (SELECT SUM(payment_value) FROM olist_order_payments_dataset), 2) * 100 AS repeated_customer_sales_percentage,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    COUNT(DISTINCT c.customer_unique_id) - COUNT(DISTINCT rc.customer_unique_id) AS num_non_repeated_customers
FROM olist_customers_dataset c
LEFT JOIN repeated_customers rc ON c.customer_unique_id = rc.customer_unique_id;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--8)  What is the average customer rating for products sold on Olist, and how does this impact sales performance?
-- Calculate average customer rating
SELECT AVG(review_score) AS average_rating
FROM olist_order_reviews_dataset;

SELECT
    op. product_category_eng_name,
    review_score,
    AVG(review_score) AS average_rating,
    COUNT(DISTINCT o.order_id) AS num_orders,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(SUM(payment_value) / COUNT(DISTINCT o.order_id), 2) AS average_revenue
FROM olist_order_reviews_dataset oor
INNER JOIN olist_orders_dataset o ON oor.order_id = o.order_id
INNER JOIN olist_order_payments_dataset oop ON oor.order_id = oop.order_id
INNER JOIN olist_order_items_dataset oi ON oor.order_id = oi.order_id
INNER JOIN olist_products_dataset op ON oi.product_id = op.product_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY op. product_category_eng_name, review_score
ORDER BY total_revenue DESC;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--9) What is the average order cancellation rate on Olist, and how does this impact seller performance?
-- Calculate overall cancellation rate and total canceled orders
SELECT
    ROUND(CAST(SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS cancellation_rate,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    ROUND(SUM(oop.payment_value), 2) AS "Amount lost",
    COUNT(DISTINCT oi.seller_id) AS num_sellers
FROM
    olist_order_items_dataset oi
    INNER JOIN olist_orders_dataset o ON oi.order_id = o.order_id
    INNER JOIN olist_order_payments_dataset oop ON oi.order_id = oop.order_id;

--This shows the sellers with canceled orders, the rate, and the number of orders that they have had to cancel, showing their performance
SELECT TOP 20
    oi.seller_id,
    COUNT(CASE WHEN o.order_status = 'canceled' THEN oi.order_id END) AS num_cancelled_orders,
    ROUND(SUM(op.payment_value), 2) AS total_sales_volume,
    AVG(r.review_score) AS customer_satisfaction,
    ROUND(CAST(COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) AS FLOAT) / COUNT(DISTINCT oi.order_id) * 100, 2) AS cancellation_rate
FROM
    olist_order_items_dataset oi
    INNER JOIN olist_orders_dataset o ON oi.order_id = o.order_id
    INNER JOIN olist_order_payments_dataset op ON oi.order_id = op.order_id
    INNER JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
GROUP BY
    oi.seller_id
ORDER BY
    cancellation_rate DESC;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10) What are the top-selling products on Olist, and how have their sales trends changed over time?
WITH ranked_products AS (
    SELECT
        p.product_category_eng_name,
        DATEPART(QUARTER, ord.order_purchase_date) AS order_quarter,
        DATEPART(YEAR, ord.order_purchase_date) AS order_year,
        SUM(op.payment_value) AS total_sales,
        RANK() OVER (PARTITION BY p.product_category_eng_name ORDER BY SUM(op.payment_value) DESC) AS product_rank
    FROM
        olist_order_items_dataset oi
        INNER JOIN olist_order_payments_dataset op ON oi.order_id = op.order_id
        INNER JOIN olist_products_dataset p ON oi.product_id = p.product_id
        INNER JOIN olist_orders_dataset ord ON ord.order_id = oi.order_id
    GROUP BY
        p.product_category_eng_name,
        DATEPART(QUARTER, ord.order_purchase_date),
        DATEPART(YEAR, ord.order_purchase_date)
)
SELECT
    product_category_eng_name,
    order_quarter,
    order_year,
    total_sales
FROM
    ranked_products
WHERE
    product_rank = 1
ORDER BY total_sales DESC;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 11) Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?
--To determine the most commonly used payment methods by Olist customers and how they vary by product category or geographic region, you can use the following SQL query:
-- total number of orders placed with each payment type

SELECT payment_type, COUNT(DISTINCT order_id) AS num_orders
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY num_orders DESC;

-- by product type
SELECT
    op.payment_type,
    COUNT(DISTINCT o.customer_id) AS num_customers,
    p.product_category_eng_name,
    c.customer_state
FROM
    olist_orders_dataset o
    INNER JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
    INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    INNER JOIN olist_products_dataset p ON oi.product_id = p.product_id
    INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY
    op.payment_type,
    p.product_category_eng_name,
    c.customer_state
ORDER BY num_customers DESC

-- by geographical region
SELECT 
    op.payment_type,
    COUNT(*) AS num_orders,
    c.customer_state
FROM
    olist_orders_dataset o
    INNER JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
    INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY
    op.payment_type,
    c.customer_state
ORDER BY
    num_orders DESC;-- 11) Which payment methods are most commonly used by Olist customers, and how does this vary by product category or geographic region?
--To determine the most commonly used payment methods by Olist customers and how they vary by product category or geographic region, you can use the following SQL query:
-- total number of orders placed with each payment type

SELECT payment_type, COUNT(DISTINCT order_id) AS num_orders
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY num_orders DESC;

-- by product type
SELECT
    op.payment_type,
    COUNT(DISTINCT o.customer_id) AS num_customers,
    p.product_category_eng_name,
    c.customer_state
FROM
    olist_orders_dataset o
    INNER JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
    INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    INNER JOIN olist_products_dataset p ON oi.product_id = p.product_id
    INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY
    op.payment_type,
    p.product_category_eng_name,
    c.customer_state
ORDER BY num_customers DESC

-- by geographical region
SELECT 
    op.payment_type,
    COUNT(*) AS num_orders,
    c.customer_state
FROM
    olist_orders_dataset o
    INNER JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
    INNER JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY
    op.payment_type,
    c.customer_state
ORDER BY
    num_orders DESC;
    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--12) How do customer reviews and ratings affect sales and product performance on Olist?
-- How do customer reviews and ratings affect sales and product performance on Olist?
SELECT
    CASE
        WHEN r.review_score = 5 THEN 'Excellent'
        WHEN r.review_score = 4 THEN 'Very Good'
        WHEN r.review_score = 3 THEN 'Good'
        WHEN r.review_score = 2 THEN 'Bad'
        WHEN r.review_score = 1 THEN 'Very Bad'
    END AS rating,
    COUNT(DISTINCT r.review_id) AS no_reviews,
    COUNT(DISTINCT p.product_id) AS no_products,
    ROUND(SUM(op.payment_value), 2) AS total_revenue,
    ROUND(AVG(op.payment_value), 2) AS avg_revenue
FROM
    olist_order_reviews_dataset r
    INNER JOIN olist_orders_dataset o ON o.order_id = r.order_id
    INNER JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
    INNER JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
    INNER JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE
    o.order_status != 'canceled' AND o.order_status != 'unavailable' AND o.order_approved_date IS NOT NULL
GROUP BY
    r.review_score
ORDER BY
    total_revenue DESC;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 13) Which product categories have the highest profit margins on Olist, and how can the
--company increase profitability across different categories?  
 WITH profit_margin AS (
    SELECT
        p.product_category_eng_name AS category_name,
        ROUND(SUM(oi.price), 2) AS total_revenue,
        ROUND(SUM(oi.freight_value), 2) AS total_shipping_costs,
        ROUND(SUM(payment_value), 2) AS total_payments_received,
        ROUND(SUM(payment_value - oi.freight_value), 2) AS total_profit,
        ROUND(((SUM(payment_value - oi.freight_value)) / SUM(oi.price)) * 100, 2) AS percentage_profit_margin
    FROM
        olist_orders_dataset o
        JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
        JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
        JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
        JOIN olist_products_dataset p ON oi.product_id = p.product_id
    GROUP BY
        p.product_category_eng_name
)
SELECT
    category_name,
    total_revenue,
    total_shipping_costs,
    total_payments_received,
    total_profit,
    percentage_profit_margin
FROM
    profit_margin
ORDER BY
    percentage_profit_margin DESC;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 14) Geolocation having high customer density. Calculate customer retention rate according to geolocations
