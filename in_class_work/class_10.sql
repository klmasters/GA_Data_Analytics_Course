SELECT c.county, st.store, p.item_description, p.case_cost, sl.total

FROM
products p
inner join sales sl on p.item_no = sl.item
inner join stores st on sl.store = st.store
inner join counties c on sl.county = c.county

LIMIT 1000;

SELECT sl.store, sl.category_name, AVG(CAST(p.bottle_price AS DECIMAL)) AS avg_btl_price, AVG(sl.total) AS avg_total

FROM products p
inner join sales sl on p.item_no = sl.item
inner join stores st on sl.store = st.store

WHERE sl.category_name ILIKE '%tequila%'
AND st.store_address ILIKE '%Mason%'
AND st.store_status = 'A'                                            
                                                                             
GROUP BY sl.store, sl.category_name
Order by sl.store                                                                             
LIMIT 1000;
