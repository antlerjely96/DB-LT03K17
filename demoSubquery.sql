USE lt03k17;

SELECT * FROM students;

CREATE TABLE subjects(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

INSERT INTO subjects(name) VALUES ('subject 1'), ('subject 2'); 

CREATE TABLE marks(
	student_id INT,
    subject_id INT,
    mark DECIMAL(4, 2),
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

INSERT INTO marks VALUES (1, 1, 5.5), (2, 2, 3.6);
INSERT INTO marks VALUES (3, 2, 5.5), (3, 1, 3.6);

SELECT * FROM marks;
/* Lấy điểm lớn nhất trong bảng marks */
SELECT MAX(mark) AS max_mark FROM marks;
/* Lấy id của các student có mark = điểm lớn nhất trong bảng marks */
SELECT student_id FROM marks WHERE mark = (SELECT MAX(mark) AS max_mark FROM marks);
/* Lấy thông tin của các student trong bảng students mà các student đó có id nằm trong id của các student có mark = điểm lớn nhất */
SELECT * FROM students WHERE id IN (SELECT student_id FROM marks WHERE mark = (SELECT MAX(mark) AS max_mark FROM marks));