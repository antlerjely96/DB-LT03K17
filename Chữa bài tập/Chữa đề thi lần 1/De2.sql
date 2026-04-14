/* Tạo DB */
CREATE DATABASE QuanLyDiem;
/* Sử dụng DB */
USE QuanLyDiem;

/* 1. */
/* subjects > students > marks
	=> Thứ tự tạo bảng: subjects, students, marks
*/

/* Tạo bảng subjects */
CREATE TABLE subjects(
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    duration INT(11) NOT NULL
);

/* Tạo bảng students */
CREATE TABLE students(
	id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address TEXT,
    class_name VARCHAR(100)
);
/* Tạo bảng marks */
CREATE TABLE marks(
	student_id BIGINT(20),
    subject_id BIGINT(20),
    mark DECIMAL(4, 2) NOT NULL,
    exam_type VARCHAR(100),
	/* Tạo khóa chính gồm nhiều trường
		PRIMARY KEY (tên_cột_1, tên_cột_2, ...)
    */
    PRIMARY KEY (student_id, subject_id, exam_type),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
/* 2. INSERT */
/* INSERT vào bảng students */
INSERT INTO students VALUES (1, 'Hạ Thiều Trinh', '2003-07-16', '0176248958', 'trinh1607@hotmail.com', '328, Thôn Trưng Đình Phong, Ấp Hoán Ly, Quận An Hiệp An Giang', 'IT1');
INSERT INTO students VALUES (2, 'Trịnh Thanh', '2003-09-22', '0230618191', 'thanh38@yahoo.com', '8124 Phố Chiến, Xã Loan Chiêu, Huyện Thông Uyên Kiên Giang', 'IT3');
INSERT INTO students VALUES (3, 'Tạ Phương', '2002-01-07', '0841484825', 'ta.phuong@yahoo.com', '495, Ấp Danh Quyên, Phường Thu Thông, Huyện 6 Đồng Nai', 'IT2');
INSERT INTO students VALUES (4, 'Lại Tiên', '2002-07-22', '0466645802', 'tien88@gmail.com', '8 Phố Đại, Xã Trung Trưởng, Huyện Lợi Cao Bằng', 'IT3');
INSERT INTO students VALUES (5, 'Hà Chiêu Khương', '2002-06-16', '0564522091', 'khuong.ha@gmail.com', '2, Ấp 26, Phường Nhung, Quận 5 Lào Cai', 'IT3');
INSERT INTO students VALUES (6, 'Cung Tiểu Nữ', '2003-08-03', '0117958688', 'cungtieunu@hotmail.com', '3751 Phố Chiêm Lộc Kha, Phường 64, Quận Khuyên Tuyến Hải Phòng', 'IT2');
INSERT INTO students VALUES (7, 'Hỏa Long', '2001-09-29', '0675270773', 'flame.dragon@yahoo.com', '68 Phố Nhâm Nhân Dương, Phường Tống Lộ Linh, Quận Kiên Bửu Nam Định', 'IT1');
INSERT INTO students VALUES (8, 'Mạc Kỷ', '2001-11-09', '0527888916', 'ky.mac@hotmail.com', '38 Phố Tống, Xã Quân, Huyện 4 Đà Nẵng', 'IT3');
INSERT INTO students VALUES (9, 'Bùi Thùy Chi', '2001-08-08', '0531905068', 'chi0808@gmail.com', '5 Phố Thân Trang Bảo, Thôn Diêm An, Huyện Linh Vỹ Hà Tĩnh', 'IT2');
INSERT INTO students VALUES (10, 'Mộc Khuyến Sỹ', '2002-07-26', '0919694681', 'sy.khuyen@hotmail.com', '933 Phố Lương Trúc Vượng, Thôn Đỗ Hưng, Huyện 1 Sơn La', 'IT2');
/* INSERT vào bảng subjects */
INSERT INTO subjects VALUES (1, 'Lập trình căn bản', 60);
INSERT INTO subjects VALUES (2, 'Thiết kế và phát triển cơ sở dữ liệu', 60);
INSERT INTO subjects VALUES (3, 'Nguyên lý lập trình', 60);
INSERT INTO subjects VALUES (4, 'Tiếng Anh 2', 120);
INSERT INTO subjects VALUES (5, 'Hệ quản trị nội dung', 40);
INSERT INTO subjects VALUES (6, 'Đồ án 1', 120);
INSERT INTO subjects VALUES (7, 'Đồ án 2', 60);
INSERT INTO subjects VALUES (8, 'Vòng đời phát triển phần mềm', 60);
INSERT INTO subjects VALUES (9, 'Thiết kế và phát triển Website', 60);
INSERT INTO subjects VALUES (10, 'Tiếng Anh 1', 120);
/* INSERT vào bảng marks */
INSERT INTO marks VALUES (1, 10, 7.00, 'Lý thuyết');
INSERT INTO marks VALUES (2, 1, 5.70, 'Thực hành');
INSERT INTO marks VALUES (3, 9, 5.70, 'Lý thuyết');
INSERT INTO marks VALUES (4, 5, 3.90, 'Thực hành');
INSERT INTO marks VALUES (5, 9, 2.00, 'Thực hành');
INSERT INTO marks VALUES (7, 6, 7.00, 'Lý thuyết');
INSERT INTO marks VALUES (8, 7, 5.60, 'Thực hành');
INSERT INTO marks VALUES (9, 2, 8.50, 'Lý thuyết');
INSERT INTO marks VALUES (9, 10, 4.40,' Lý thuyết');
INSERT INTO marks VALUES (10, 5, 7.38, 'Thực hành');
/* 3. Sử dụng SELECT */
/* a. Hiển thị thông tin tất cả các sinh viên
	SELECT * FROM tên_bảng; 
*/
SELECT * FROM students;
/* b. Hiển thị điểm thi thực hành môn ‘Thiết kế và phát triển Website’ của các sinh viên. Thông tin hiển thị bao gồm: Mã sinh viên, điểm 
	SELECT tên_bảng.tên_cột, ... FROM tên_bảng_1 INNER JOIN tên_bảng_2 ON tên_bảng_1.tên_cột = tên_bảng_2.tên_cột WHERE tên_bảng.tên_cột = giá_trị AND tên_bảng.tên_cột = giá_trị;
*/
SELECT marks.student_id, marks.mark FROM marks INNER JOIN subjects 
ON marks.subject_id = subjects.id
WHERE marks.exam_type = 'Thực hành' AND subjects.name = 'Thiết kế và phát triển Website';
/* c. Hiển thị điểm lý thuyết trung bình của từng sinh viên bao gồm: mã sinh viên, tên sinh viên, điểm lý thuyết trung bình. Chỉ hiển thị những sinh viên có điểm lý thuyết trung bình.
	SELECT tên_bảng.tên_cột, tên_bảng.tên_cột, built-in_function(tên_bảng.tên_cột) FROM tên_bảng_1 INNER JOIN tên_bảng_2 ON tên_bảng_1.tên_cột = tên_bảng_2.tên_cột WHERE tên_bảng.tên_cột = giá_trị GROUP BY tên_bảng.tên_cột, tên_bảng.tên_cột;
*/
SELECT students.id, students.name, AVG(marks.mark) AS average_mark
FROM students INNER JOIN marks ON students.id = marks.student_id
WHERE marks.exam_type = 'Lý thuyết'
GROUP BY students.id, students.name;
