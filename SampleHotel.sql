CREATE DATABASE SampleHotel;
USE SampleHotel;

CREATE TABLE admins(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL
);

CREATE TABLE payments(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE services(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE customers(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    CCCD VARCHAR(20) NOT NULL,
    Gender VARCHAR(6),
    Address VARCHAR(255),
    DateOfBirth DATE,
    CreateAt DATE,
    Password VARCHAR(100) NOT NULL
);

CREATE TABLE roomtypes(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Beds VARCHAR(50) NOT NULL,
    Capacity VARCHAR(100) NOT NULL,
    Image VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    BasePrice INT(10) NOT NULL
);

CREATE TABLE bookings(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT(20) NOT NULL,
    AdminId INT(20) NOT NULL,
    CheckInDay DATE NOT NULL,
    CheckOutDay DATE NOT NULL,
    CheckInRealDay DATE NOT NULL,
    CheckOutRealDay DATE NOT NULL,
    Status VARCHAR(255) NOT NULL,
    CheckName VARCHAR(100) NOT NULL,
    CheckPhone VARCHAR(15) NOT NULL,
    CheckEmail VARCHAR(100) NOT NULL,
    TotalPrice INT(10) NOT NULL,
    DepositAmount INT(10) NOT NULL,
    Notes TEXT,
    FOREIGN KEY (CustomerId) REFERENCES customers(id),
    FOREIGN KEY (AdminId) REFERENCES admins(id)
);

CREATE TABLE servicedetails(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    roomtypeid INT(20),
    serviceid INT(20)
);

CREATE TABLE rooms(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    number INT(10),
    description TEXT,
    roomtypeid INT(20),
    status VARCHAR(255)
);

CREATE TABLE bills(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    createdday DATE,
    totalprice INT(10),
    payername VARCHAR(100),
    payerphone VARCHAR(15),
    payeremail VARCHAR(100),
    bookingid INT(20),
    paymentid INT(20),
    adminid INT(20)
);

CREATE TABLE bookingdetails(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    bookingid INT(20),
    roomid INT(20)
);

CREATE TABLE serviceusages(
	id INT(20) PRIMARY KEY AUTO_INCREMENT,
    serviceid INT(20),
    billid INT(20)
);