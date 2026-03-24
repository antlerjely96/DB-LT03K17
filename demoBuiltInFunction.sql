USE lt03k17;

/* Built-in function: Là những hàm được xây dựng sẵn, mỗi hàm có 1 chức năng nhất định
	Built-in function áp dụng trên 1 cột
	Cú pháp:
		SELECT Built-in_function(field_name) FROM table_name;
*/

SELECT NOW() AS now;
SELECT MAX(id) AS max_id FROM products;
SELECT id, COUNT(id) AS number_orders FROM orders GROUP BY customer_id;

/* 
	1 số built-in function
    AVG(field_name): tính trung bình
    MAX(field_name): Lấy max
    MIN(field_name): Lấy min
    COUNT(field_name): đếm
    SUM(field_name): Tính tổng
    YEAR(): Lấy năm hiện tại
    MONTH(): Tháng hiện tại
    DAY(): Ngày hiện tại
    CURDATE(): Ngày tháng năm hiện tại
    CURTIME(): Giờ hiện tại
    
*/