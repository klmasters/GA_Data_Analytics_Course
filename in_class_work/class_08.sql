--Which products come in packs larger than 12? 

SELECT 
  DISTINCT category_name, 
  item_no, 
  pack
FROM 
  products
WHERE 
  pack > 12
;

--How many unique products have less than 12 packs? 9 products

SELECT 
  COUNT(DISTINCT pack)
FROM 
  products
Where 
  pack < 12
;

--Which which products have a case price less than $70? 3938

SELECT 
  item_no,
  case_cost
FROM 
  products
WHERE 
  case_cost < 70
;

--Which products come in packs larger than 12 and have a case cost of less than $70? 632

SELECT 
  item_no,
  case_cost,
  pack
FROM 
  products
WHERE 
  case_cost < 70
  and pack > 12
;


--Which types of products have a proof of 85 or higher?
SELECT 
  item_no,
  category_name,
  CAST(proof AS integer)
FROM 
  products
WHERE 
  cast(proof as integer) >= 85
;

--Which products are scotch whiskies or a higher than 85 proof? 1739

SELECT 
  item_no,
  category_name,
  CAST(proof AS integer)
FROM 
  products
WHERE
  (cast(proof as integer) >= 85 
  or category_name = 'SCOTCH WHISKIES')
;

--How many stores are active (use store_status)? 1425 Inactive? 548

SELECT 
  store, 
  store_status
FROM 
  stores
WHERE 
  store_status = 'A'

;

SELECT 
  store, 
  store_status
FROM 
  stores
WHERE 
  store_status = 'I'

;
