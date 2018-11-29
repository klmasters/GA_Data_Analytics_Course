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
