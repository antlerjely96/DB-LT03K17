CREATE DATABASE OnTapSQL;
USE OnTapSQL;

CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE levels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    level INT,
    salary_one_hour FLOAT
);

CREATE TABLE staffs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(13),
    address TEXT,
    date_of_birth DATE,
    department_id INT,
    level_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL,
    FOREIGN KEY (level_id) REFERENCES levels(id) ON DELETE SET NULL
);

CREATE TABLE workdays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT,
    workday_number FLOAT,
    month INT,
    year INT,
    FOREIGN KEY (staff_id) REFERENCES staffs(id) ON DELETE CASCADE
);

INSERT INTO departments (name) VALUES
('IT'), ('Nhân sự'), ('Kế toán'), ('Marketing'), ('Kinh doanh'),
('Chăm sóc khách hàng'), ('Sản xuất'), ('Kho vận'), ('Hành chính'), ('R&D');

INSERT INTO levels (level, salary_one_hour) VALUES
(1, 20000), (2, 25000), (3, 30000), (4, 40000), (5, 55000),
(6, 70000), (7, 90000), (8, 120000), (9, 150000), (10, 200000);

INSERT INTO staffs (name, email, phone, address, date_of_birth, department_id, level_id) VALUES
('Nguyen Van A', 'a@gmail.com', '0901111111', 'Hanoi', '1990-01-01', 1, 5),
('Tran Thi B', 'b@gmail.com', '0902222222', 'HCMC', '1992-02-02', 1, 8),
('Le Van C', 'c@gmail.com', '0903333333', 'Da Nang', '1995-03-03', 2, 3),
('Pham Thi D', 'd@gmail.com', '0904444444', 'Hai Phong', '1988-04-04', 3, 6),
('Hoang Van E', 'e@gmail.com', '0905555555', 'Can Tho', '1991-05-05', 4, 4),
('Vu Thi F', 'f@gmail.com', '0906666666', 'Hue', '1996-06-06', 5, 2),
('Vo Van G', 'g@gmail.com', '0907777777', 'Nha Trang', '1993-07-07', 5, 7),
('Ngo Thi H', 'h@gmail.com', '0908888888', 'Vinh', '1997-08-08', 3, 2),
('Bui Van I', 'i@gmail.com', '0909999999', 'Ha Long', '1989-09-09', 1, 4),
('Dang Thi K', 'k@gmail.com', '0910000000', 'Quy Nhon', '1994-10-10', 2, 5);

INSERT INTO workdays (staff_id, workday_number, month, year) VALUES
(1, 22, 4, 2024),
(2, 20.5, 4, 2024),
(3, 21, 4, 2024),
(4, 23, 4, 2024),
(5, 19, 4, 2024),
(6, 22.5, 4, 2024),
(7, 20, 4, 2024),
(8, 21.5, 4, 2024),
(9, 24, 4, 2024),
(10, 22, 4, 2024);

/* b. */
SELECT * FROM departments;
/* c. */
SELECT departments.name, staffs.*
FROM departments LEFT JOIN staffs
ON departments.id = staffs.department_id
ORDER BY departments.name ASC;
/* d. */
SELECT departments.id, departments.name, COUNT(staffs.id) AS number_staff
FROM departments LEFT JOIN staffs
ON departments.id = staffs.department_id
GROUP BY departments.id, departments.name;
/* e. */
SELECT staffs.name, workdays.month, (workdays.workday_number * 8 * levels.salary_one_hour) AS salary
FROM staffs
INNER JOIN workdays ON staffs.id = workdays.staff_id
INNER JOIN levels ON staffs.level_id = levels.id
WHERE workdays.month = 4;
/* f. */
SELECT departments.id, departments.name, AVG(workdays.workday_number * 8 * levels.salary_one_hour) AS average_salary
FROM departments
INNER JOIN staffs ON departments.id = staffs.department_id
INNER JOIN workdays ON staffs.id = workdays.staff_id
INNER JOIN levels ON staffs.level_id = levels.id
WHERE workdays.month = 4
GROUP BY departments.id, departments.name;
/* g. */
SELECT departments.name AS department_name, staffs.name AS staff_name, levels.level AS highest_level
FROM staffs
INNER JOIN departments ON staffs.department_id = departments.id
INNER JOIN levels ON staffs.level_id = levels.id
WHERE (staffs.department_id, levels.level) IN (
    SELECT staffs.department_id, MAX(levels.level)
    FROM staffs INNER JOIN levels
    ON staffs.level_id = levels.id
    GROUP BY staffs.department_id
);