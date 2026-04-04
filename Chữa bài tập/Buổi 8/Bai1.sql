/* 6. */
SELECT orders.ord_no, orders.ord_date, customer.cust_name, customer.grade, salesman.name, salesman.commission
FROM orders
INNER JOIN customer ON orders.customer_id = customer.customer_id
JOIN salesman ON orders.salesman_id = salesman.salesman_id;
/* 11. */
SELECT customer.cust_name, orders.ord_no, orders.ord_date, orders.purch_amt, salesman.name, salesman.commission
FROM customer
LEFT JOIN orders ON customer.customer_id = orders.customer_id
LEFT JOIN salesman ON customer.salesman_id = salesman.salesman_id;
/* 13. */
SELECT salesman.name, customer.cust_name, customer.city, customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt
FROM salesman
LEFT JOIN customer ON salesman.salesman_id = customer.salesman_id
LEFT JOIN orders ON customer.customer_id = orders.customer_id;
/* 14. */
SELECT salesman.name, customer.cust_name, customer.city, customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt
FROM salesman
LEFT JOIN customer ON salesman.salesman_id = customer.salesman_id
LEFT JOIN orders ON customer.customer_id = orders.customer_id
WHERE (orders.purch_amt >= 2000 AND customer.grade IS NOT NULL) OR orders.ord_no IS NULL;