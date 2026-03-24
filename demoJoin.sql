USE lt03k17;

CREATE TABLE `types`(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

INSERT INTO types(name) VALUES ('Type 1'), ('Type 2'), ('Type 3');

SELECT * FROM brands;
SELECT * FROM products;
ALTER TABLE products ADD COLUMN brand_id INT;
ALTER TABLE products ADD FOREIGN KEY (brand_id) REFERENCES brands(id);
ALTER TABLE products ADD column type_id INT;
ALTER TABLE products ADD FOREIGN KEY (type_id) REFERENCES types(id);
UPDATE products SET name = 'product 2', price = 3.5, quantity = 200, brand_id = 2 WHERE id = 5;
UPDATE products SET type_id = 1 WHERE id = 7;
INSERT INTO brands(name) VALUES ('brand 3');
INSERT INTO products(name, price, quantity) VALUES ('product 10', 50, 50);
SELECT * FROM orders;

/* INNER JOIN: Bảng A chứa PK, bảng B chứa FK
	SELECT table_name.field_names FROM table_A INNER JOIN table_B ON table_A.field_PK = table_B.field_FK;
*/
/* INNER JOIN bảng brands và products */
SELECT products.*, brands.name AS brand_name
FROM brands INNER JOIN products ON brands.id = products.brand_id;

/* LEFT JOIN: Bảng A chứa PK, bảng B chứa FK
	SELECT table_name.field_names FROM table_A LEFT JOIN table_B ON table_A.field_PK = table_B.field_FK;
*/
/* LEFT JOIN brands vaf products */
SELECT products.*, brands.name AS brand_name
FROM brands LEFT JOIN products ON brands.id = products.brand_id;

/* RIGHT JOIN: Bảng A chứa PK, bảng B chứa FK
	SELECT table_name.field_names FROM table_A RIGHT JOIN table_B ON table_A.field_PK = table_B.field_FK;
*/
/* RIGHT JOIN brands vaf products */
SELECT products.*, brands.name AS brand_name
FROM brands RIGHT JOIN products ON brands.id = products.brand_id;

/* Join 3 bảng A, B, C: lấy A join B, sau đó lấy kết quả nhận được Join với C */
/* Join 3 bảng types, brands, products: Join types với products, sau đó lấy kết quả nhận được Join với brands */
SELECT products.*, types.name AS type_name, brands.name AS brand_name FROM products LEFT JOIN types
ON products.type_id = types.id
LEFT JOIN brands ON brands.id = products.brand_id;
/*
	Join 3 bảng: join 2 bảng, rồi join với bảng thứ 3
	Join 4 bảng: (join 2 bảng, rồi join với bảng thứ 3), rồi join với bảng thứ 4
    join 5 bảng: ((join 2 bảng, rồi join với bảng thứ 3), rồi join với bảng thứ 4), rồi join với bảng thứ 5
*/