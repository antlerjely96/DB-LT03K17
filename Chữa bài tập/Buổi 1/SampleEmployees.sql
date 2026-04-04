CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE salaries(
	emp_no INT(10),
    salary INT(11),
    from_date DATE,
    to_date DATE
);

CREATE TABLE titles(
	emp_no INT(10),
    title VARCHAR(50),
    from_date DATE,
    to_date DATE
);

CREATE TABLE employees(
	emp_no INT(10),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

CREATE TABLE dept_manager(
	dept_no CHAR(4),
    emp_no INT(10),
    from_date DATE,
    to_date DATE
);

CREATE TABLE dept_emp(
	emp_no INT(10),
    dept_no CHAR(4),
    from_date DATE,
    to_date DATE
);

CREATE TABLE departments(
	dept_no CHAR(4),
    dept_name VARCHAR(40)
);