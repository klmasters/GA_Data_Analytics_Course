SELECT sl.store, st.store_status, Coalesce(SUM(sl.total),0)
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
Group By sl.store, st.store_status
LIMIT 1000;

SELECT sl.store, st.store_status, sl.category_name, Coalesce(SUM(sl.total),0)
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
and sl.category_name ILIKE '%tequila%'
Group By sl.store, sl.category_name, st.store_status
LIMIT 1000;

SELECT sl.item, st.store_status, sl.category_name, Coalesce(SUM(sl.total),0)
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
and sl.category_name ILIKE '%tequila%'
Group By sl.item, sl.category_name, st.store_status
HAVING Coalesce(SUM(sl.total),0) = 0
LIMIT 1000;

SELECT DISTINCT sl.category_name, st.store_address
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
AND st.store_address ILIKE '%mason city%'
Group By sl.store, sl.category_name, st.store_status, st.store_address
LIMIT 1000;

SELECT DISTINCT sl.category_name, st.store_address
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
AND st.store_address ILIKE '%mason city%'
AND sl.category_name ILIKE '%Scotch Whisk%'
Group By sl.store, sl.category_name, st.store_status, st.store_address
LIMIT 1000;

SELECT DISTINCT sl.category_name, st.store_address
FROM sales sl
LEFT join stores st
on sl.store = st.store
WHERE st.store_status = 'A'
AND st.store_address ILIKE '%mason city%'
AND sl.category_name NOT LIKE '%Scotch Whisk%'
Group By sl.store, sl.category_name, st.store_status, st.store_address
LIMIT 1000;

SELECT p.category_name, sl.category_name
From sales sl
Left join products p
on p.item_no = sl.item
WHERE
