SELECT 
  DISTINCT vendor, 
  SUM(total)
FROM 
  sales
WHERE 
  date >= '2014-01-01'
  AND date <='2014-03-31'
GROUP BY 
  vendor
HAVING 
  SUM(total) >100000
ORDER BY 
  SUM(total) DESC
;
