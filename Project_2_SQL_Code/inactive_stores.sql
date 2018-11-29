-- Looked for stores with sales in the 1st quarter that are inactive
SELECT 
  sl.store, 
  st.store_status 
FROM 
  sales sl 
  RIGHT JOIN stores st ON sl.store = st.store 
WHERE 
  date >= '2014-01-01' 
  AND date <= '2014-03-31' 
  AND st.store_status = 'I'
