USE lt03k17;

/* 
	Tự tăng: AUTO_INCREMENT
		- Làm giá trị trong cột tự động tăng (đi kèm với các cột có kiểu dữ liệu số nguyên)
        - Cột có ràng buộc AUTO_INCREMENT phải là cột PK
	Duy nhất: UNIQUE
		- Các giá trị trên cột có ràng buộc này không được trùng nhau
	NOT NULL
		- Giá trị trên cột này không được phép NULL
	CHECK
		- Giá trị trên cột phải thỏa mãn điều kiện được đưa ra trong check
	Khóa chính: PRIMARY KEY:
		- Được dùng để phân biệt các bản ghi với nhau
        - PK có thể là 1 trường hoặc nhiều trường kết hợp lại
        - PK không được phép NULL
        - PK chứa giá trị duy nhất
        - Mỗi bảng chỉ có 1 PK
	Khóa ngoại: FOREIGN KEY
		- Được dùng để liên kết với PK => Muốn có FK thì phải có PK
        - Giá trị trong cột FK phải là các giá trị đã có trong PK
        - FK có thể chứa giá trị NULL
        - FK phải có kiểu dữ liệu và ràng buộc giống PK
        - Khi tạo bảng: tạo bảng có PK trước rồi mới tạo bảng có FK
        - Khin INSERT dữ liệu: INSERT bảng có PK trước, bảng có FK sau
        - Khi DROP bảng: DROP bảng có FK trước, bảng có PK sau
        => 1 PK có thể có nhiều FK, 1 FK chỉ liên kết đến 1 PK
Sau khi tạo bảng mà quên không tạo PK, FK thì có thể tạo PK, FK bằng câu lệnh sau:
PK: ALTER TABLE table_name ADD PRIMARY KEY (field_names);
FK: ALTER TABLE table_name ADD FOREIGN KEY (field_name) REFERENCES table_name_PK(field_name);
*/

CREATE TABLE brands(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE
);

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(8, 2) CHECK (price > 0),
    quantity INT CHECK (quantity > 0)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    order_status INT,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(10) NOT NULL,
    customer_address TEXT NOT NULL
);

CREATE TABLE order_details(
	order_id INT,
    product_id INT,
    price DECIMAL(8, 2),
    quantity INT,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO brands(name) VALUES ('brand 1');
INSERT INTO brands(name) VALUES ('brand 2');
SELECT * FROM brands;

INSERT INTO products(name, price, quantity) VALUES ('product 1', 0.5, 1);
INSERT INTO products(name, price, quantity) VALUES ('product 2', 2, 1);
SELECT * FROM products;
DELETE FROM products WHERE id = 6;