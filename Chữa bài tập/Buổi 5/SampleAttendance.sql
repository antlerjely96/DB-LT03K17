CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE accounts (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password TEXT NOT NULL,
    role INT(11) NOT NULL,
    locked TINYINT(4) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE majors (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE school_years (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_year INT(11) NOT NULL,
    end_year INT(11) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE subjects (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    duration INT(11) NOT NULL,
    major_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (major_id) REFERENCES majors(id)
);

CREATE TABLE instructors (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    account_id BIGINT(20) NOT NULL,
    major_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (major_id) REFERENCES majors(id)
);

CREATE TABLE admins (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    gender VARCHAR(10),
    account_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE class_students (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    major_id BIGINT(20) NOT NULL,
    school_year_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (major_id) REFERENCES majors(id),
    FOREIGN KEY (school_year_id) REFERENCES school_years(id)
);

CREATE TABLE students (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address TEXT,
    gender VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    class_student_id BIGINT(20) NOT NULL,
    account_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (class_student_id) REFERENCES class_students(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE divisions (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    class_student_id BIGINT(20) NOT NULL,
    admin_id BIGINT(20) NOT NULL,
    subject_id BIGINT(20) NOT NULL,
    instructor_id BIGINT(20) NOT NULL,
    start_date DATE,
    status VARCHAR(255) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (class_student_id) REFERENCES class_students(id),
    FOREIGN KEY (admin_id) REFERENCES admins(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(id)
);

CREATE TABLE division_details (
    division_id BIGINT(20),
    day_of_week VARCHAR(255)NOT NULL,
    division_date DATE,
    division_start_time TIME NOT NULL,
    division_end_time TIME NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (division_id, division_date),
    FOREIGN KEY (division_id) REFERENCES divisions(id)
);

CREATE TABLE attendances (
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    attendance_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    class_student_id BIGINT(20) NOT NULL,
    subject_id BIGINT(20) NOT NULL,
    account_id BIGINT(20) NOT NULL,
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (class_student_id) REFERENCES class_students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE attendance_details (
    attendance_id BIGINT(20),
    student_id BIGINT(20),
    attendance_status VARCHAR(100) NOT NULL,
    note VARCHAR(255),
    deleted_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (attendance_id, student_id),
    FOREIGN KEY (attendance_id) REFERENCES attendances(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);