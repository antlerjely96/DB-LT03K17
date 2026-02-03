/* Lấy toàn bộ các bản ghi của bảng students*/
SELECT * FROM students;
/* Lấy 1 số trường của các bản ghi */
SELECT id, full_name, phone_number FROM students;
/* Lấy các bản ghi có giới tính là nam trong bảng students */
SELECT * FROM students WHERE gender = 'Male';
/* Lấy thông tin địa chỉ của các sinh viên, loại bỏ trùng nhau */
SELECT DISTINCT(address) FROM students;
SELECT DISTINCT(address), id FROM students;
/* Lấy thông tin các sinh viên nam, có địa chỉ là HN */
SELECT * FROM students WHERE gender = 'Male' AND address = 'HN';
/* Lấy thông tin các sinh viên nam hoặc các sinh viên có địa chỉ là HN */
SELECT * FROM students WHERE gender = 'Male' OR address = 'HN';
/* Lấy thông tin các sinh viên có địa chỉ nằm trong (HN, HP) */
SELECT * FROM students WHERE address IN ('HN', 'HP', 'TPHCM');
/* */
SELECT * FROM students WHERE address = 'HN' OR address = 'HP' OR address = 'TPHCM';
/* Lấy thông tin các sinh viên có địa chỉ không nằm trong (HN, HP) */
SELECT * FROM students WHERE address NOT IN ('HN', 'HP', 'TPHCM');
/* Tìm kiếm, lấy các bản ghi có full_name bắt đầu là std */
SELECT * FROM students WHERE full_name LIKE 'std%';
/* Tìm kiếm, lấy các bản ghi có full_name kết thúc là 1 */
SELECT * FROM students WHERE full_name LIKE '%1';
/* Tìm kiếm, lấy các bản ghi có full_name chứa de */
SELECT * FROM students WHERE full_name LIKE '%de%';
/* Lấy các bản ghi trong bảng, sắp xếp theo thứ tự tên giảm dần */
SELECT * FROM students ORDER BY full_name DESC;
/* Lấy 3 bản ghi, bắt đầu từ vị trí 1 */
SELECT * FROM students LIMIT 3 OFFSET 1;
SELECT * FROM students LIMIT 1, 3;
/* Lấy các bản ghi có phone_number không bị null */
SELECT * FROM students WHERE phone_number IS NOT NULL;
/* Lấy các bản ghi có phone_number bị null */
SELECT * FROM students WHERE phone_number IS NULL;