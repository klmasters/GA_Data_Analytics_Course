-- Join practice: join all tables in the database together

SELECT 
  c.county, 
  st.store, 
  p.item_description, 
  p.case_cost, 
  sl.total
FROM
  products p
  inner join sales sl 
  on p.item_no = sl.item
  inner join stores st 
  on sl.store = st.store
  inner join counties c 
  on sl.county = c.county
LIMIT 
  1000
;

/* List the store number (from Sales), category_name (from Sales), 
and two aggregated columns: average bottle_price (from Products) and average total price (from Sales).

Use a compounded WHERE clause to limit the calculations to the sales of
tequila (category_name from Sales) from active stores in Mason City, Iowa.

Group and sort the data by the store number. */

SELECT 
  sl.store, 
  sl.category_name, 
  AVG(CAST(p.bottle_price AS DECIMAL)) AS avg_btl_price, 
  AVG(sl.total) AS avg_total
FROM 
  products p
  inner join sales sl 
  on p.item_no = sl.item
  inner join stores st 
  on sl.store = st.store
WHERE 
  sl.category_name ILIKE '%tequila%'
  AND st.store_address ILIKE '%Mason%'
  AND st.store_status = 'A'                                                                                                                        
GROUP BY
  sl.store, 
  sl.category_name
ORDER BY
  sl.store                                                                             
LIMIT 1000;
