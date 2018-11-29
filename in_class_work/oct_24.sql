
/*dates*/

SELECT
date,
current_date,
age(current_date,date),
case when age(current_date,date) > '3 years' then true else false end,
date_trunc('month',date),
to_char(date, 'yyyy-mm'),
extract('quarter' from date)
FROM sales
WHERE
date > '2015-01-01'
Limit 100

SALES BY MONTH

SELECT
to_char(date, 'yyyy-mm'),
sum(total)
FROM sales
WHERE
date > '2014-01-01'
group by to_char(date, 'yyyy-mm')
order by to_char(date, 'yyyy-mm') desc
Limit 100


Case statements

SELECT
 
CASE
    WHEN population < 100000
    THEN 'low'
    WHEN population BETWEEN 100000 AND 400000
    THEN 'medium'
    ELSE 'high'
End AS county_population_group,

COUNT(county)

FROM counties
GROUP BY county_population_group
LIMIT 100;

SELECT DISTINCT
p.item_no, sl.item, COUNT(DISTINCT sl.store)
FROM sales sl
LEFT join products p
on p.item_no = sl.item
WHERE p.item_no IS NULL
GROUP BY p.item_no, sl.item
ORDER BY Count(DISTINCT sl.store) DESC
LIMIT 1000;

SELECT DISTINCT
sl.store AS sales_store, st.store AS store_store, sl.convenience_store,
CASE
    WHEN sl.convenience_store = 'Y'
    THEN 'Convenience Store'
    ELSE 'Liquor Store'
END
FROM sales sl
LEFT join stores st 
on sl.store = st.store
WHERE st.store IS NULL
LIMIT 100;



PART OF A COMPLEXT SQL

WITH sales_buckets as (Select 
CASE WHEN AGE(current_date, list_date) > '40 years' THEN 'Over 40 Years'
    WHEN AGE(current_date, list_date) > '30 years' THEN '30-40 Years'
    WHEN AGE(current_date, list_date) > '20 years' THEN '20-30 Years'
    WHEN AGE(current_date, list_date) > '10 years' THEN '10-20 Years'
    WHEN AGE(current_date, list_date) > '0 days' THEN 'New Product'
    else 'No Data' end as product_age,
COUNT(item) as total_items,
SUM(total) as total_sales
From sales s
INNER JOIN products p
ON s.item = p.item_no
Where county IN (SELECT county From counties where population > 400000)
AND date > '2015-01-01'
GROUP BY 1)

Select 
product_age, 
ROUND(total_items / (SELECT SUM(total_items) FROM sales_buckets),2) AS perc_total,
ROUND(total_sales / (SELECT SUM(total_sales) FROM sales_buckets),2) AS perc_sales
From sales_buckets
GROUP BY product_age, total_items, total_sales


SELECT
CASE WHEN AGE(current_date, list_date) > '40 years' THEN 'Over 40 Years'
    WHEN AGE(current_date, list_date) > '30 years' THEN '30-40 Years'
    WHEN AGE(current_date, list_date) > '20 years' THEN '20-30 Years'
    WHEN AGE(current_date, list_date) > '10 years' THEN '10-20 Years'
    WHEN AGE(current_date, list_date) > '0 days' THEN 'New Product'
    else 'No Data' end as product_age,
ROUND(COUNT(*) *1.0/(SELECT COUNT(*) FROM products),2)*100 as percent_on_shelf
FROM products p
GROUP BY 1
