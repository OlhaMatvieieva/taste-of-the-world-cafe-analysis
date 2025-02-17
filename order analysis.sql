--- merge menu_items and item_id

SELECT *
FROM order_details o
LEFT JOIN menu_items m ON o.item_id = m.menu_item_id;

--- the least and most ordered items and their categories
SELECT m.item_name, COUNT(m.item_name) AS order_count, m.category
FROM order_details o
INNER JOIN menu_items m ON o.item_id = m.menu_item_id
GROUP BY m.menu_item_id, m.item_name, m.category
ORDER BY order_count ASC
LIMIT 5;

SELECT m.item_name, COUNT(m.item_name) AS order_count, m.category
FROM order_details o
INNER JOIN menu_items m ON o.item_id = m.menu_item_id
GROUP BY m.menu_item_id, m.item_name, m.category
ORDER BY order_count DESC
LIMIT 5;

---  the top 5 orders that spent the most money

SELECT o.order_id, SUM(m.price) AS total
FROM order_details o
INNER JOIN menu_items m ON o.item_id = m.menu_item_id
GROUP BY o.order_id
ORDER BY total DESC
LIMIT 5;

--- the details of the top 5 spend orders
SELECT order_id, category, COUNT(item_id) AS nmb_items
FROM order_details o
INNER JOIN menu_items m ON o.item_id = m.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category


