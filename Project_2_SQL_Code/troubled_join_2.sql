--Tried to run this to get product sales by quarter but it didn’t work (because I was joining on item which I figured out later)
WITH q1_data AS (
  SELECT 
    item, 
    category_name, 
    total 
  FROM 
    sales 
  WHERE 
    date >= '2014-01-01' 
    AND date <= '2014-03-31'
), 
q2_data AS (
  SELECT 
    item, 
    category_name, 
    total 
  FROM 
    sales 
  WHERE 
    date >= '2014-04-01' 
    AND date <= '2014-06-30'
), 
q3_data AS (
  SELECT 
    item, 
    category_name, 
    total 
  FROM 
    sales 
  WHERE 
    date >= '2014-07-01' 
    AND date <= '2014-09-30'
), 
q4_data AS (
  SELECT 
    item, 
    category_name, 
    total 
  FROM 
    sales 
  WHERE 
    date >= '2014-10-01' 
    AND date <= '2014-12-31'
) 
SELECT 
  q1.category_name, 
  SUM(q1.total) AS q1_sales, 
  SUM(q2.total) AS q2_sales --SUM(q3.total) AS q3_sales, SUM(q4.total) AS q4_sales
FROM 
  q1_data q1 
  FULL OUTER JOIN q2_data q2 on q1.item = q2.item 
GROUP BY 
  q1.category_name 
LIMIT 
  10

