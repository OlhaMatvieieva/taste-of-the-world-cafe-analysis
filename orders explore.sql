--- min and max date of orders, 3 months

SELECT MIN(order_date) AS min_date, MAX(order_date) AS max_date
FROM order_details;

--- number of orders were made within this date range, number of items were ordered within this date range
SELECT COUNT(DISTINCT order_id) AS orders_count, COUNT(order_details_id) AS items_count
FROM order_details;

--- orders with the most number of items
SELECT order_id, COUNT(item_id) AS count_items
FROM order_details
GROUP BY order_id
ORDER BY count_items DESC;

--- orders had more than 12 items
SELECT count_items, COUNT(count_items)
FROM (SELECT order_id, COUNT(item_id) AS count_items
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12) AS num_orders
GROUP BY count_items;