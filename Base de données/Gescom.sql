DROP DATABASE GESCOM;

CREATE DATABASE GESCOM;

USE GESCOM;

CREATE TABLE Suppliers(
	sup_id INT NOT NULL PRIMARY KEY,
	sup_name VARCHAR(50) NOT NULL,
	sup_city VARCHAR(50) NOT NULL,
	sup_address VARCHAR(150) NOT NULL,
	sup_mail VARCHAR(75),
	sup_phone CHAR(10) 
);

CREATE TABLE Customers(
	cus_id INT NOT NULL PRIMARY KEY,
	cus_lastname VARCHAR(50) NOT NULL,
	cus_firstname VARCHAR(50) NOT NULL,
	cus_adress VARCHAR(150) NOT NULL,
	cus_zipcode CHAR(5) NOT NULL CHECK (cus_zipcode BETWEEN '01000' AND '99999'),
	cus_city VARCHAR(50) NOT NULL,
	cus_mail VARCHAR(50),
	cus_phone CHAR(10)
);

CREATE TABLE Categories(
	cat_id INT NOT NULL PRIMARY KEY,
	cat_name VARCHAR(200) NOT NULL,
	cat_parent_id INT,
	FOREIGN KEY(cat_parent_id) REFERENCES Categories(cat_id)
);

CREATE TABLE Orders(
	ord_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ord_order_date DATE NOT NULL DEFAULT current_date,
	ord_ship_date DATE,
	ord_bill_date DATE,
	ord_reception_date DATE,
	ord_status VARCHAR(25) NOT NULL,
	cus_id INT,
	FOREIGN KEY(cus_id) REFERENCES Customers(cus_id)
);

CREATE TABLE Products(
	pro_id INT auto_increment NOT NULL PRIMARY KEY,
	pro_ref VARCHAR(10) NOT NULL,
	pro_name VARCHAR(200) NOT NULL,
	pro_desc TEXT(1000) NOT NULL,
	pro_price DECIMAL(6,2) NOT NULL,
	pro_stock SMALLINT(4),
	pro_color VARCHAR(30),
	pro_picture VARCHAR(40),
	pro_add_date DATE NOT NULL DEFAULT current_date,
	pro_update_date DATETIME NOT NULL DEFAULT current_date,
	pro_publish TINYINT(1) NOT NULL,
	sup_id INT NOT NULL,
	cat_id INT NOT NULL,
	FOREIGN KEY(sup_id) REFERENCES Suppliers(sup_id),
	FOREIGN KEY(cat_id) REFERENCES Categories(cat_id)
);
	
CREATE TABLE Details(
	det_id INT NOT NULL PRIMARY KEY,
	det_price DECIMAL(6,2) NOT NULL,
	det_quantity TINYINT NOT NULL CHECK(det_quantity BETWEEN 1 AND 100),
	pro_id INT NOT NULL,
	ord_id INT NOT NULL,
	FOREIGN KEY(pro_id) REFERENCES Products(pro_id),
	FOREIGN KEY(ord_id) REFERENCES Orders(ord_id)
);

CREATE INDEX pro_ref_index ON Products(pro_ref);