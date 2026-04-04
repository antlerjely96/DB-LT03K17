/* 2. */
SELECT employees.FIRST_NAME, employees.LAST_NAME, departments.DEPARTMENT_NAME, locations.CITY, locations.STATE_PROVINCE
FROM employees
INNER JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
INNER JOIN locations ON departments.LOCATION_ID = locations.LOCATION_ID;
/* 5. */
SELECT employees.FIRST_NAME, employees.LAST_NAME, departments.DEPARTMENT_NAME, locations.CITY, locations.STATE_PROVINCE
FROM employees
INNER JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
INNER JOIN locations ON departments.LOCATION_ID = locations.LOCATION_ID
WHERE employees.FIRST_NAME LIKE '%z%';
/* 13. */
SELECT jobs.JOB_TITLE, departments.DEPARTMENT_NAME, employees.FIRST_NAME, employees.LAST_NAME, employees.HIRE_DATE
FROM employees
INNER JOIN jobs ON employees.JOB_ID = jobs.JOB_ID
INNER JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
WHERE employees.HIRE_DATE BETWEEN '1993-01-01' AND '1997-08-31';
/* 17. */
SELECT countries.COUNTRY_NAME, locations.CITY, departments.DEPARTMENT_NAME
FROM countries
INNER JOIN locations ON countries.COUNTRY_ID = locations.COUNTRY_ID
INNER JOIN departments ON locations.LOCATION_ID = departments.LOCATION_ID;
/* 21. */
SELECT countries.COUNTRY_NAME, locations.CITY, COUNT(departments.DEPARTMENT_ID) AS "number"
FROM countries
INNER JOIN locations ON countries.COUNTRY_ID = locations.COUNTRY_ID
INNER JOIN departments ON locations.LOCATION_ID = departments.LOCATION_ID
WHERE departments.DEPARTMENT_ID IN (
	SELECT DEPARTMENT_ID FROM employees 
	GROUP BY DEPARTMENT_ID 
	HAVING COUNT(EMPLOYEE_ID) >= 2
)
GROUP BY countries.COUNTRY_NAME, locations.CITY;
/* 22. */
SELECT departments.DEPARTMENT_NAME, employees.FIRST_NAME, employees.LAST_NAME, locations.CITY
FROM departments
INNER JOIN employees ON departments.MANAGER_ID = employees.EMPLOYEE_ID
INNER JOIN locations ON departments.LOCATION_ID = locations.LOCATION_ID;