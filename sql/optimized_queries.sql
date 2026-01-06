-- Indexes
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

CREATE INDEX idx_orders_customer_amount
ON orders(customer_id, total_amount);

-- Latest order per customer (optimized)
SELECT *
FROM (
    SELECT o.*,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS rn
    FROM orders o
) t
WHERE rn = 1;

-- Top 3 orders per customer (optimized)
SELECT *
FROM (
    SELECT o.*,
           RANK() OVER (
               PARTITION BY customer_id
               ORDER BY total_amount DESC
           ) AS rnk
    FROM orders o
) t
WHERE rnk <= 3;

-- EXPLAIN
EXPLAIN
SELECT *
FROM (
    SELECT o.*,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC
           ) AS rn
    FROM orders o
) t
WHERE rn = 1;
