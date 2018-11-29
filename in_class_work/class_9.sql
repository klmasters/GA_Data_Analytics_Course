/** number 1 which products have a case cost of more than 100 **/ 

SELECT
    *
FROM products
WHERE
    case_cost > 100
;

/** number 2 which tequilas have a case cost of more than 100 **/
SELECT
    *
FROM products
WHERE
    category_name ilike '%tequila%'
    AND case_cost > 100
;
/** number 3 which tequilas or scotch whiskies have a case cost of more than 100**/
SELECT
    *
FROM products
WHERE
    (category_name ILIKE '%tequila%' 
    or
    category_name ILIKE '%SCOTCH WHISKIES%')
    AND case_cost > 100
;

/** number 4 which tequilas or scotch whiskies have a case cost between 100 and 120**/
SELECT
    *
FROM products
WHERE
    (category_name ILIKE '%tequila%' 
    or
    category_name ILIKE '%SCOTCH WHISKIES%')
    AND case_cost BETWEEN 100 AND 120
;

/** number 5 which whiskies of any kind cost more than 100**/
SELECT
    *
FROM products
WHERE
    category_name ilike '%whisk%'
    AND case_cost > 100
;

/** number 6 **/
SELECT
    *
FROM products
WHERE
    category_name ilike '%whisk%'
    AND case_cost BETWEEN 100 AND 150
;

/** number 7 **/
SELECT
    *
FROM products
WHERE
    category_name NOT LIKE '%tequila%' 
    AND case_cost BETWEEN 100 AND 120
;
