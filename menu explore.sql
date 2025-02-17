--- number of items 

SELECT COUNT(*) AS nmb_items
FROM menu_items;

--- the least and more expensive items 
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM menu_items;

--- number of Italian dishes, the least and most expensive Italian dishes
SELECT COUNT(category) AS nmb_it,  MIN(price) AS min_it_price, MAX(price) AS max_it_price
FROM menu_items
WHERE category = 'Italian';

--- number of dishes in each category, average dish price within each category
SELECT category, COUNT(*) AS category_count, ROUND(AVG(price), 2) AS avg_price_category
FROM menu_items
GROUP BY category;
