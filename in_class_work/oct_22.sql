SELECT 
category_name,  COUNT(*)
FROM
    (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%whisk%') w
group by category_name
having count(*) > 100
Order By COUNT(*) desc


OR you can use a common table expression using WITH below

WITH w AS (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%whisk%')

SELECT 
category_name,  COUNT(*)
FROM w
group by category_name
having count(*) > 100
Order By COUNT(*) desc

Two CTE together

WITH w AS (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%whisk%'),
    
v AS (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%vodka%')

SELECT 
category_name,
COUNT(*)
FROM w
group by category_name

Union

SELECT 
category_name,
COUNT(*)
FROM v
group by category_name

OR as a subquery

SELECT 
category_name,
COUNT(*)
FROM (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%whisk%') w
group by category_name

Union

SELECT 
category_name,
COUNT(*)
FROM (SELECT item_no, category_name 
    FROM products
    WHERE category_name ILIKE '%vodka%') v
group by category_name

If you want to order your results!

SELECT
*
FROM
    (SELECT 
    category_name,
    COUNT(*) AS total_products
    FROM (SELECT item_no, category_name 
        FROM products
        WHERE category_name ILIKE '%whisk%') w
    group by category_name

    Union

    SELECT 
    category_name,
    COUNT(*)
    FROM (SELECT item_no, category_name 
        FROM products
        WHERE category_name ILIKE '%vodka%') v
    group by category_name) AP
Order by total_products desc
