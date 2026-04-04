CREATE DATABASE OnTapSQL2;
USE OnTapSQL2;

CREATE TABLE Khoa (
    ma_khoa VARCHAR(10) PRIMARY KEY,
    ten_khoa VARCHAR(100)
);

CREATE TABLE SinhVien (
    ma_sv VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100),
    ngay_sinh DATE,
    ma_khoa VARCHAR(10),
    FOREIGN KEY (ma_khoa) REFERENCES Khoa(ma_khoa)
);

CREATE TABLE KetQua (
    ma_sv VARCHAR(10),
    ten_mon_hoc VARCHAR(100),
    diem_thi FLOAT,
    PRIMARY KEY (ma_sv, ten_mon_hoc),
    FOREIGN KEY (ma_sv) REFERENCES SinhVien(ma_sv)
);

INSERT INTO Khoa (ma_khoa, ten_khoa) VALUES
('CNTT', 'Công nghệ thông tin'), 
('KT', 'Kinh tế');

INSERT INTO SinhVien (ma_sv, ho_ten, ngay_sinh, ma_khoa) VALUES
('SV01', 'Nguyễn Văn A', '2003-05-15', 'CNTT'),
('SV02', 'Trần Thị B', '2004-02-20', 'KT'),
('SV03', 'Lê Văn C', '2003-11-08', 'CNTT');

INSERT INTO KetQua (ma_sv, ten_mon_hoc, diem_thi) VALUES
('SV01', 'Cơ sở dữ liệu', 8.5),
('SV01', 'Lập trình Web', 7.0),
('SV02', 'Kinh tế vi mô', 9.0),
('SV03', 'Cơ sở dữ liệu', 6.5);
/* 3. */
UPDATE KetQua 
SET diem_thi = 9.5 
WHERE ma_sv = 'SV02' AND ten_mon_hoc = 'Kinh tế vi mô';
/* 4. */
DELETE FROM KetQua 
WHERE ma_sv = 'SV01' AND ten_mon_hoc = 'Lập trình Web';
/* 5. */
SELECT COUNT(*) AS tong_so_sinh_vien 
FROM SinhVien;
/* 6. */
SELECT SinhVien.ma_sv, SinhVien.ho_ten, Khoa.ten_khoa
FROM SinhVien INNER JOIN Khoa
ON SinhVien.ma_khoa = Khoa.ma_khoa;
/* 7. */
SELECT SinhVien.ma_sv, SinhVien.ho_ten, ROUND(AVG(KetQua.diem_thi), 2) AS diem_trung_binh
FROM SinhVien LEFT JOIN KetQua
ON SinhVien.ma_sv = KetQua.ma_sv
GROUP BY SinhVien.ma_sv, SinhVien.ho_ten;
/* 8. */
SELECT SinhVien.ho_ten
FROM SinhVien INNER JOIN KetQua
ON SinhVien.ma_sv = KetQua.ma_sv
WHERE KetQua.ten_mon_hoc = 'Cơ sở dữ liệu'
AND KetQua.diem_thi > (
	SELECT AVG(diem_thi)
	FROM KetQua
	WHERE ten_mon_hoc = 'Cơ sở dữ liệu'
);