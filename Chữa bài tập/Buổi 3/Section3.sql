/* 1. */
SELECT * FROM employees;
/* 2. */
SELECT * FROM employees WHERE birth_date < '2005-01-01';
/* 3. */
SELECT * FROM dept_manager WHERE from_date > '2019-12-31' AND from_date < '2024-01-01';
/* 4. */
SELECT * FROM salaries WHERE salary > 100000000;
/* 5. */
SELECT * FROM employees WHERE gender = 'M';
/* 6. */
SELECT * FROM employees WHERE first_name LIKE '%Jack%';
/* 7. */
SELECT * FROM employees WHERE first_name = 'Timothy' OR last_name = 'Timothy';