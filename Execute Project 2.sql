-- 1. top 3 customer based on order
SELECT c.first_name, c.last_name,
sum(o.total_amount) total_order_amount
FROM customer as c
JOIN orders AS o ON o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_order_amount DESC
LIMIT 3;

-- 2. average order value for each customer
SELECT c.first_name, c.last_name, avg(o.total_amount) average_order
FROM customer c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 3. employee with >4 resolved ticket support
SELECT e.first_name, e.last_name,  count(s.ticket_id)
FROM employee e
JOIN support_ticket s ON e.employee_id = s.employee_id
WHERE s.status = 'resolved'
GROUP BY e.employee_id
HAVING count(s.ticket_id)>4;

-- 4. produk yang belum pernah dipesan
SELECT product.product_name FROM product 
LEFT JOIN orderdetail od on od.product_id = product.product_id
WHERE od.order_id IS NULL;

-- 5. total revenue
SELECT sum(quantity*unit_price) FROM orderdetail;

-- 6. harga rata rata tiap kategori produk
WITH cte_avg_price AS (
SELECT category, avg(price) rerata FROM product
GROUP BY category
)
SELECT * FROM cte_avg_price WHERE rerata> 500;

-- 7. pelanggan yg pernah order melebihi 1000
SELECT customer_id, total_amount FROM orders
WHERE total_amount>1000;