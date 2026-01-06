-- Latest order per customer (slow)
SELECT o.*
FROM orders o
WHERE o.order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- Top 3 orders per customer (slow)
SELECT *
FROM orders o1
WHERE (
    SELECT COUNT(*)
    FROM orders o2
    WHERE o2.customer_id = o1.customer_id
      AND o2.total_amount >= o1.total_amount
) <= 3;

-- EXPLAIN
EXPLAIN SELECT o.*
FROM orders o
WHERE o.order_date = (
    SELECT MAX(order_date)
    FROM orders
    WHERE customer_id = o.customer_id
);
