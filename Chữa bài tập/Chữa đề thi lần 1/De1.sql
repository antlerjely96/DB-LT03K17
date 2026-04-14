/* Tạo DB */
CREATE DATABASE QuanLyNhanVien;
/* Sử dụng DB */
USE QuanLyNhanVien;

/* 1. */
/* Departments > employees > Salaries 
	=> Thứ tự tạo bảng: Departments, Employees, Salaries
*/

/* Cấu trúc câu lệnh tạo bảng:
	Note: Ở bảng A thì cột A1 là Primary key. Ở bảng B thì cột B1 là Primary key, B2 là Foreign key của A1
	CREATE TABLE tên_bảng_A(
		tên_cột_A1 Kiểu_dữ_liệu(kích_thước) Ràng_buộc_1 Ràng_buộc_2,
        tên_cột_A2 kiểu_dữ_liệu
    );
    
    CREATE TABLE tên_bảng_B(
		tên_cột_B1 Kiểu_dữ_liệu(kích_thước) Ràng_buộc_1 Ràng_buộc_2,
        tên_cột_B2 kiểu_dữ_liệu,
        FOREIGN KEY (tên_cột_B2) REFERENCES tên_bảng_A(tên_cột_A1)
    );
*/

/* Tạo bảng departments */
CREATE TABLE departments(
	id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
/* Tạo bảng employees */
CREATE TABLE employees(
	id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(12) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address TEXT,
    department_id BIGINT(20),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
/* Tạo bảng salaries */
CREATE TABLE salaries(
	id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id BIGINT(20),
    salary DECIMAL(8, 0) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

/* 2. */
/* Cấu trúc câu lệnh INSERT
		INSERT 1 bản ghi đầy đủ tất cả các trường
			INSERT INTO tên_bảng VALUES ('giá_trị_1', 'giá_trị_2', ...);
        INSERT 1 bản ghi không đầy đủ tất cả các trường
			INSERT INTO tên_bảng(tên_cột_1, tên_cột_2, ...) VALUES ('giá_trị_1', 'giá_trị_2', ...);
*/
/* INSERT vào bảng departments */
INSERT INTO departments VALUES (1, 'Truyền thông');
INSERT INTO departments VALUES (2, 'Tư vấn');
INSERT INTO departments VALUES (3, 'Kế toán');
INSERT INTO departments VALUES (4, 'Nhân sự');
INSERT INTO departments VALUES (5, 'Kỹ thuật');
INSERT INTO departments VALUES (6, 'Hoạt động khách hàng');
INSERT INTO departments VALUES (7, 'Tìm kiếm thông tin');
INSERT INTO departments VALUES (8, 'Sản phẩm');
INSERT INTO departments VALUES (9, 'Nội vụ');
INSERT INTO departments VALUES (10, 'Kiểm thử');
/* INSERT vào bảng employees */
INSERT INTO employees VALUES (1, 'Nguyễn Hà Trung', '1993-01-15', '0368597426', 'trungnh@abc.com', 'Hai Bà Trưng, Hà Nội', 1);
INSERT INTO employees VALUES (2, 'Đào Minh Khôi', '1976-05-15', '0982563145', 'khoidm@abc.com', 'Bình Lục, Hà Nam', 2);
INSERT INTO employees VALUES (3, 'Đặng Nhật Minh' , '1984-03-20', '0867462598', 'minhdn@abc.com', 'Hoàn Kiếm, Hà Nội', 1);
INSERT INTO employees VALUES (4, 'Phạm Quang Bảo', '1967-10-11', '0562145276', 'baopq@abc.com', 'Long Biên, Hà Nội', 3);
INSERT INTO employees VALUES (5, 'Đặng Khánh Ngân', '1994-07-07', '0354698826', 'ngandk@abc.com', 'Long Biên, Hà Nội', 5);
INSERT INTO employees VALUES (6, 'Chu Mi Na', '1990-02-28', '0568796353', 'nacm@abc.com', 'Đài Bắc, Trung Quốc', 9);
INSERT INTO employees VALUES (7, 'Hoàng Bảo Ngọc', '1986-08-28', '0372593687', 'ngochb@abc.com', 'Việt Trì, Phú Thọ', 2);
INSERT INTO employees VALUES (8, 'Bùi Ngọc Sơn', '1995-01-30', '09863546789', 'sonbn@abc.com', 'Từ Sơn, Bắc Ninh', 1);
INSERT INTO employees VALUES (9, 'Hà Văn Thái', '1993-06-27', '0365781234', 'thaihv@abc.com', 'Thanh Xuân, Hà Nội', 4);
INSERT INTO employees VALUES (10, 'Đỗ Đình Văn', '1991-04-19', '0375262345', 'vandd@abc.com', 'Vạn Phúc, Hà Đông', 1);
/* INSERT vào bảng salaries */
INSERT INTO salaries VALUES (1, 3, 5000000);
INSERT INTO salaries VALUES (2, 1, 6000000);
INSERT INTO salaries VALUES (3, 9, 5500000);
INSERT INTO salaries VALUES (4, 5, 4900000);
INSERT INTO salaries VALUES (5, 8, 5200000);
INSERT INTO salaries VALUES (6, 6, 3600000);
INSERT INTO salaries VALUES (7, 7, 4999000);
INSERT INTO salaries VALUES (8, 2, 6123000);
INSERT INTO salaries VALUES (9, 10, 9999000);
INSERT INTO salaries VALUES (10, 4, 6621000);
/* 3. Dùng câu lệnh SELECT */
/* a. Hiển thị thông tin tất cả các nhân viên: SELECT * FROM tên_bảng; */
SELECT * FROM employees;
/* b. Hiển thị thông tin nhân viên có mức lương lớn hơn 5 triệu:
SELECT tên_bảng.tên_cột, ... FROM tên_bảng_1 INNER JOIN tên_bảng_2 ON tên_bảng_1.tên_cột = tên_bảng_2.tên_cột WHERE tên_bảng.tên_cột > giá_trị; */
SELECT employees.*, salaries.salary FROM employees INNER JOIN salaries
ON employees.id = salaries.employee_id
WHERE salaries.salary > 5000000;
/* c. Hiển thị thông tin nhân viên bao gồm: tên nhân viên, mức lương (nhân viên không có
lương sẽ hiển thị là NULL): SELECT tên_bảng.tên_cột, ... FROM tên_bảng_1 LEFT JOIN tên_bảng_2 ON tên_bảng_1.tên_cột = tên_bảng_2.tên_cột */
SELECT employees.name, salaries.salary FROM employees LEFT JOIN salaries
ON employees.id = salaries.employee_id;
/* d. Hiển thị thông tin phòng ban và số lượng nhân viên trong từng phòng:
	SELECT tên_bảng.tên_cột, built-in_function(tên_bảng.tên_cột) FROM tên_bảng_1 LEFT JOIN tên_bảng_2 ON tên_bảng_1.tên_cột = tên_bảng_2.tên_cột GROUP BY tên_bảng.tên_cột;
*/
SELECT departments.name, COUNT(employee_id) AS number_employee
FROM departments LEFT JOIN employees
ON departments.id = employees.department_id
GROUP BY departments.name;
/* e. Hiển thị thông tin nhân viên có lương cao nhất theo từng phòng ban (phòng ban nào
không có nhân viên thì thông tin mức lương cao nhất sẽ là NULL). */
