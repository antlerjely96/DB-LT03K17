/* tạo db */
CREATE DATABASE lt03k17;
/* Su dung db */
USE lt03k17;
/* Tao bang */
CREATE TABLE students(
	id VARCHAR(8),
    full_name VARCHAR(100),
    address TEXT,
    phone_number VARCHAR(10),
    birthday DATE,
    gender VARCHAR(20)
);

/* Thêm 1 bản ghi có đầy đủ dữ liệu của tất cả các trường */
INSERT INTO students VALUES ('std1', 'student A', 'HN', '0123456789', '2000-02-03', 'Male');
/* Thêm nhiều bản ghi, các bản ghi có đầy đủ dữ liệu của tất cả các trường */
INSERT INTO students VALUES
('std2', 'student B', 'HN', '0147852369', '2007-03-05', 'Female'),
('std3', 'student C', 'HP', '0369852147', '2007-03-06', 'Male');
/* Thêm 1 bản ghi không đầy đủ dữ liệu trên các trường */
INSERT INTO students(id, full_name, address, phone_number, gender)
VALUES ('std4', 'student D', 'HP', '0987654321', 'Male');
/* Thêm nhiều bản ghi không đầy đủ dữ liệu trên các trường */
INSERT INTO students(id, full_name, address, gender)
VALUES ('std5', 'student E', 'HN', 'Male'),
('std6', 'student F', 'HN', 'Female');

/* Cập nhật dữ liệu: UPDATE*/
UPDATE students SET gender = 'Female' WHERE id = 'std1';

/* Xóa dữ liệu: DELETE */
DELETE FROM students WHERE id = 'std3';