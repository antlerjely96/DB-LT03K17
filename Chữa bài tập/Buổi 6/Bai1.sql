/* 1. */
SELECT salesman.name, customer.cust_name, customer.city
FROM salesman INNER JOIN customer
ON salesman.city = customer.city;
/* 2. */
SELECT orders.ord_no, orders.purch_amt, customer.cust_name, customer.city
FROM orders INNER JOIN customer
ON orders.customer_id = customer.customer_id
WHERE orders.purch_amt BETWEEN 500 AND 2000;
/* 3. */
SELECT customer.cust_name, customer.city, salesman.name, salesman.commission
FROM customer INNER JOIN salesman
ON customer.salesman_id = salesman.salesman_id;
/* 4. */
SELECT customer.cust_name, customer.city, salesman.name, salesman.commission
FROM customer INNER JOIN salesman
ON customer.salesman_id = salesman.salesman_id
WHERE salesman.commission > 0.12;
/* 8. */
SELECT customer.cust_name, customer.city AS customer_city, customer.grade, salesman.name, salesman.city AS salesman_city
FROM customer INNER JOIN salesman
ON customer.salesman_id = salesman.salesman_id
ORDER BY customer.customer_id ASC;
/* 9. */
SELECT customer.cust_name, customer.city AS customer_city, customer.grade, salesman.name, salesman.city AS salesman_cit
FROM customer INNER JOIN salesman
ON customer.salesman_id = salesman.salesman_id
WHERE customer.grade < 300
ORDER BY customer.customer_id ASC;
/* 10. */
SELECT customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt
FROM customer LEFT JOIN orders
ON customer.customer_id = orders.customer_id
ORDER BY orders.ord_date ASC;
/* 12. */
SELECT customer.cust_name, customer.city AS customer_city, customer.grade, salesman.name, salesman.city AS salesman_city
FROM salesman LEFT JOIN customer
ON salesman.salesman_id = customer.salesman_id
ORDER BY salesman.salesman_id ASC;
/* 15. */
SELECT customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt
FROM customer RIGHT JOIN orders
ON customer.customer_id = orders.customer_id;
/* 21. */
SELECT * FROM item_mast INNER JOIN company_mast
ON item_mast.PRO_COM = company_mast.COM_ID;
/* 22. */
SELECT item_mast.PRO_NAME, item_mast.PRO_PRICE, company_mast.COM_NAME
FROM item_mast INNER JOIN company_mast
ON item_mast.PRO_COM = company_mast.COM_ID;
/* 23. */
SELECT AVG(item_mast.PRO_PRICE) AS average_price, company_mast.COM_NAME
FROM item_mast INNER JOIN company_mast
ON item_mast.PRO_COM = company_mast.COM_ID
GROUP BY company_mast.COM_NAME;
/* 24. */
SELECT AVG(item_mast.PRO_PRICE) AS average_price, company_mast.COM_NAME
FROM item_mast INNER JOIN company_mast
ON item_mast.PRO_COM = company_mast.COM_ID
GROUP BY company_mast.COM_NAME
HAVING AVG(item_mast.PRO_PRICE) > 350;
/* 26. */
SELECT * FROM emp_details
INNER JOIN emp_department ON emp_details.EMP_DEPT = emp_department.DPT_CODE;