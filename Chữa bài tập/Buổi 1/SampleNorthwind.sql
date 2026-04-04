CREATE DATABASE lt03k17;
USE lt03k17;

CREATE TABLE region(
	RegionID TINYINT(3),
    RegionDescription VARCHAR(50)
);

CREATE TABLE territories(
	TerritoryID VARCHAR(20),
    TerritoryDescription VARCHAR(50),
    RegionID TINYINT(3)
);

CREATE TABLE employeeterritories(
	EmployeeID MEDIUMINT(8),
    TerritoryID VARCHAR(20)
);

CREATE TABLE employees(
	EmployeeID MEDIUMINT(8),
    LastName VARCHAR(20),
    FirstName VARCHAR(10),
    Title VARCHAR(30),
    TitleOfCourtesy VARCHAR(25),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    HomePhone VARCHAR(24),
    Extension VARCHAR(4),
    Photo BLOB,
    Notes TEXT,
    ReportsTo MEDIUMINT(8),
    PhotoPath VARCHAR(255),
    Salary INT(11)
);

CREATE TABLE shippers(
	ShipperID TINYINT(3),
    CompanyName VARCHAR(40),
    Phone VARCHAR(24)
);

CREATE TABLE orders(
	OrderID INT(10),
    CustomerID VARCHAR(5),
    EmployeeID MEDIUMINT(8),
    OrderDate DATE,
    RequireDate DATE,
    ShippedDate DATE,
    ShipVia TINYINT(3),
    Freght DECIMAL(8, 2),
    ShipName VARCHAR(40),
    ShipAddress VARCHAR(60),
    ShipCity VARCHAR(15),
    ShipRegion VARCHAR(15),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(15)
);

CREATE TABLE customers(
	CustomerID VARCHAR(5),
    CompanyName VARCHAR(40),
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24)
);

CREATE TABLE orderdetails(
	OrderID INT(10),
    ProductID SMALLINT(5),
    UnitPrice DECIMAL(8, 2),
    Quantity SMALLINT(2),
    Discount DOUBLE(8, 0)
);

CREATE TABLE products(
	ProductID SMALLINT(5),
    ProductName VARCHAR(40),
    SupplierID SMALLINT(5),
    CategoryID TINYINT(3),
    QuantityPerUnit VARCHAR(20),
    UnitPrice DECIMAL(8, 2),
    UnitsInStock SMALLINT(6),
    UnitsOnOrder SMALLINT(5),
    ReorderLevel SMALLINT(5),
    Discontinued TINYINT(1)
);

CREATE TABLE customerdemographics(
	CustomerTypeID VARCHAR(10),
    CustomerDesc TEXT
);

CREATE TABLE customercustomerdemo(
	CustomerID VARCHAR(5),
    CustomerTypeID VARCHAR(10)
);

CREATE TABLE suppliers(
	SupplierID SMALLINT(5),
    CompanyName VARCHAR(40),
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    HomePage TEXT
);

CREATE TABLE categories(
	CategoryID TINYINT(3),
    CategoryName VARCHAR(30),
    Description TEXT,
    Picture BLOB
);