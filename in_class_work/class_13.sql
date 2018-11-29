1 which counties have the highest sales of whiskey and vodka:

SELECT county, SUM(total)
FROM (SELECT county, total, category_name FROM sales WHERE category_name ILIKE '%whisk%'
OR category_name ILIKE '%vodka%') as wv
group by county
order by SUM(total) desc
LIMIT 100;

1.5 playing with columns and numbers etc.
SELECT county, 
SUM(CASE WHEN category_name ILIKE '%whisk%' THEN total ELSE 0 END) AS whisk_total,
SUM(CASE WHEN category_name ILIKE '%vodka%' THEN total ELSE 0 END) AS vodka_total,
SUM(CASE WHEN category_name ILIKE '%vodka%' OR category_name ILIKE '%whisk%' THEN total ELSE 0 END) AS total_both
FROM sales
group by county

LIMIT 100;

2 beginnings...
SELECT category_name, CAST(proof AS decimal)
FROM products
WHERE CAST(proof AS decimal) > 80


Select county, category_name


4 what are the top five countries in terms of ml per capita
---------

ELECT 
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
