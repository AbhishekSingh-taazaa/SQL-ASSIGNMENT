-- Database: Departmental_Store_Updated

-- DROP DATABASE "Departmental_Store_Updated";

CREATE DATABASE "Departmental_Store_Updated"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	--Creating staff table	
	CREATE TABLE Staff(
		Staff_Id SERIAL PRIMARY KEY,
		First_Name VARCHAR(50),
		Lirst_Name VARCHAR(50),
		Role_Id INT REFERENCES Role (Role_Id),
		Address_Id INT REFERENCES Address (Address_Id),
		Gender CHAR(1),
		Phone_Number CHAR(10) NOT NULL,
		Salary BIGINT 
	);
	
	DROP TABLE Staff;
	
	--Creating Address Table 
	
	CREATE TABLE Address(
	
		Address_Id SERIAL PRIMARY KEY,
	Address_Line1 VARCHAR(80) NOT NULL ,
	Address_Line2 VARCHAR(80),
	Pin_Code CHAR(6) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(50) NOT NULL
	);
	
	--Creating Role Table
	
	CREATE TABLE Role(
	
		Role_Id SERIAL PRIMARY KEY,
		Role_Name VARCHAR(80) UNIQUE NOT NULL,
		Description VARCHAR(128) NOT NULL
	
	);
	
	--Creating Product_Categories Table
	
	CREATE TABLE Product_Category(
	
		Category_Id SERIAL PRIMARY KEY,
		Category_Name VARCHAR(40)
	);
	
	CREATE TABLE Product(
	
		Product_Code VARCHAR(100) PRIMARY KEY,
		Product_Name VARCHAR(50),
		Category_Id INT REFERENCES Product_Category (Category_Id),
		Manufacturing_Date DATE  NOT NULL,
		Expiry_Date DATE

	);
	
	DROP TABLE Product;
	
	CREATE TABLE Inventory(
	Product_Code VARCHAR(100) references Product (Product_Code) PRIMARY KEY,
	Brand_Name VARCHAR(100) NOT NULL UNIQUE,
	Product_Quantity BIGINT NOT NULL,
	InStock BOOLEAN NOT NULL
	
	);
	
	DROP TABLE Inventory;
	--creating product_revenue table with product references
	
	CREATE TABLE Product_Price(
		Product_Code VARCHAR(100) references Product (Product_Code),
		Cost_Price NUMERIC(10,2),
		Selling_Price NUMERIC(10,2),
		Date_of_Register DATE NOT NULL

	);
	
	DROP TABLE Product_Price;
	
	
	--creating supplier table

CREATE TABLE Supplier (

	Supplier_id SERIAL PRIMARY KEY,
	First_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50) NOT NULL,
	Supplier_Number CHAR(10) UNIQUE NOT NULL,
	Supplier_Email VARCHAR(80) UNIQUE NOT NULL,
	Address_Id INT REFERENCES Address (Address_Id)
 );

	--Creating costumer table

CREATE TABLE Customer(

	Customer_Id SERIAL PRIMARY KEY,
	Customer_Name VARCHAR(50) NOT NULL,
	Customer_Email VARCHAR(80) UNIQUE NOT NULL,
	Customer_Number CHAR(10),
	Address_Id INT REFERENCES Address (Address_Id)
 
);

	--Creating order_detail table with suppilers and products references


CREATE TABLE Order_Details(
	Order_Id SERIAL PRIMARY KEY,
	Supplier_Id INT REFERENCES Supplier (Supplier_Id),
	Product_Code VARCHAR(100) REFERENCES Product (Product_Code),
	Customer_Id INT REFERENCES Customer (Customer_Id),
	Date_Of_Order DATE NOT NULL,
	Date_Of_Deliverey DATE NOT NULL,
	Address_Id INT REFERENCES Address (Address_Id)
);
	
	
	
	
	
	