
-- Show the sales in the database completed at an active store.
SELECT 
  sl.store, 
  st.store_status, 
  Coalesce(SUM(sl.total),0)
FROM 
  sales sl
  LEFT join stores st
  on sl.store = st.store
WHERE 
  st.store_status = 'A'
Group By 
  sl.store, 
  st.store_status
LIMIT 
  1000
;

--Which sales included tequila products?
SELECT 
  sl.store, 
  t.store_status, 
  sl.category_name, 
  Coalesce(SUM(sl.total),0)
FROM 
  sales sl
  LEFT join stores st
  on sl.store = st.store
WHERE 
  st.store_status = 'A'
  and sl.category_name ILIKE '%tequila%'
Group By 
  sl.store, 
  sl.category_name, 
  st.store_status
LIMIT 
  1000
;

--Which tequila products were not sold?
SELECT 
  sl.item, 
  st.store_status, 
  sl.category_name, 
  Coalesce(SUM(sl.total),0)
FROM 
  sales sl
  LEFT JOIN stores st
  ON sl.store = st.store
WHERE 
  st.store_status = 'A'
  and sl.category_name ILIKE '%tequila%'
Group By 
  sl.item, 
  sl.category_name, 
  st.store_status
HAVING 
  Coalesce(SUM(sl.total),0) = 0
LIMIT 
  1000
;

--Which distinct products were sold in Mason City, IA?
SELECT 
  DISTINCT sl.category_name, 
  st.store_address
FROM 
  sales sl
  LEFT join stores st
  on sl.store = st.store
WHERE 
  st.store_status = 'A'
  AND st.store_address ILIKE '%mason city%'
Group By 
  sl.store, 
  sl.category_name, 
  st.store_status, 
  st.store_address
LIMIT 
  1000
;

--Which Scotch whiskies were sold in Mason City, IA?
SELECT 
  DISTINCT sl.category_name, 
  st.store_address
FROM 
  sales sl
  LEFT join stores st
  on sl.store = st.store
WHERE 
  st.store_status = 'A'
  AND st.store_address ILIKE '%mason city%'
  AND sl.category_name ILIKE '%Scotch Whisk%'
Group By 
  sl.store, 
  sl.category_name, 
  st.store_status, 
  st.store_address
LIMIT 
  1000
;

--Which unique products, other than whiskies, were sold in Mason City, IA?
SELECT 
  DISTINCT sl.category_name, 
  st.store_address
FROM 
  sales sl
  LEFT join stores st
  on sl.store = st.store
WHERE 
  st.store_status = 'A'
  AND st.store_address ILIKE '%mason city%'
  AND sl.category_name NOT LIKE '%Scotch Whisk%'
Group By 
  sl.store, 
  sl.category_name, 
  st.store_status, 
  st.store_address
LIMIT 
  1000
;

--As a check for data consistency, were there any sales of products that are not listed in the Products table?
SELECT 
  sl.description
FROM 
  sales sl
EXCEPT
SELECT
  p.products
FROM
  products p
 ;

--As another check for data consistency, were there any sales at a store that doesn’t exist?
SELECT 
  store 
FROM 
  sales 
EXCEPT 
SELECT 
  store 
FROM 
  stores
;
