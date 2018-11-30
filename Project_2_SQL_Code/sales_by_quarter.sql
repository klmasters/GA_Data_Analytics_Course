SELECT 
  EXTRACT('quarter' FROM date), 
  TO_CHAR(date, 'yyyy'), 
  SUM(total)
FROM 
  sales
GROUP BY 
  EXTRACT('quarter' FROM date), 
  TO_CHAR(date, 'yyyy')
;
