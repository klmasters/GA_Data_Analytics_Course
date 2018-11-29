--Which products have a case cost of more than $100?

SELECT
    *
FROM 
   products
WHERE
    case_cost > 100
;

-- Which tequilas have a case cost of more than $100?

SELECT
    *
FROM 
   products
WHERE
    category_name ilike '%tequila%'
    AND case_cost > 100
;

-- Which tequilas or scotch whiskies have a case cost of more than $100?

SELECT
    *
FROM 
   products
WHERE
    (category_name ILIKE '%tequila%' 
    OR
    category_name ILIKE '%SCOTCH WHISKIES%')
    AND case_cost > 100
;

-- Which tequilas or scotch whiskies have a case cost between $100 and $120?

SELECT
    *
FROM 
   products
WHERE
    (category_name ILIKE '%tequila%' 
    OR
    category_name ILIKE '%SCOTCH WHISKIES%')
    AND case_cost BETWEEN 100 AND 120
;

-- Which whiskies of any kind cost more than $100?

SELECT
    *
FROM 
   products
WHERE
    category_name ILIKE '%whisk%'
    AND case_cost > 100
;

-- Which whiskies of any kind cost between $100 and $150?

SELECT
    *
FROM 
   products
WHERE
    category_name ILIKE '%whisk%'
    AND case_cost BETWEEN 100 AND 150
;

-- Which products, excluding tequilas, cost between $100 and $120?

SELECT
    *
FROM 
   products
WHERE
    category_name NOT LIKE '%tequila%' 
    AND case_cost BETWEEN 100 AND 120
;
