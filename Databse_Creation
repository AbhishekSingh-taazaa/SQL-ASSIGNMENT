-- Database: departmental_store

-- DROP DATABASE departmental_store;

CREATE DATABASE departmental_store
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
--Creating staff table	
	CREATE TABLE staffs(
		staff_id SERIAL PRIMARY KEY,
		staff_name VARCHAR(50),
		staff_role VARCHAR(40),
		gender CHAR(1),
		phone_number INT
		
	);
	
	DROP TABLE staffs;
	DROP TABLE product_categories;
	ALTER TABLE staffs
	ALTER COLUMN phone_number TYPE CHAR(10);
--Creating product_categories table	
	
	CREATE TABLE product_categories(
	
		category_id SERIAL PRIMARY KEY,
		category_name VARCHAR(40)
	);
--Creating products table with refference of categories_id	
	
	CREATE TABLE products(
	
		product_id SERIAL PRIMARY KEY,
		product_name VARCHAR(50),
		category_id INT REFERENCES product_categories (category_id),
		product_code VARCHAR(50) UNIQUE,
		manufactror_name VARCHAR(40),
		manufacturing_date DATE,
		expiry_date DATE

	);
	
	DROP TABLE products;
	
	ALTER TABLE products
	ALTER COLUMN 
	
--creating product_revenue table with product references
	
	CREATE TABLE product_revenues(
		product_revenueid SERIAL PRIMARY KEY,
	product_id INT  REFERENCES products (product_id),
		costprice NUMERIC(6,2),
		sellingprice NUMERIC(8,2)

	);
	
	DROP TABLE product_revenues;
	
--creating inventory table references products

CREATE TABLE inventory(
	inventory_productid SERIAL PRIMARY KEY,
	product_id INT references products (product_id),
	product_quantity INT,
	instock BOOLEAN
	
);

DROP TABLE inventory;

--creating supplier table

CREATE TABLE suppliers (

	supplier_id SERIAL PRIMARY KEY,
	suppiler_name VARCHAR(50),
	supplier_number INT,
	supplier_email VARCHAR(80),
	supplier_city VARCHAR(50)

);

ALTER TABLE suppliers
ALTER COLUMN supplier_number TYPE CHAR(10);

--Creating order_detail table with suppilers and products references


CREATE TABLE order_details(
	order_id SERIAL PRIMARY KEY,
	suppiler_id INT REFERENCES suppliers (supplier_id),
	product_id INT REFERENCES products (product_id),
	customer_id INT REFERENCES customer (customer_id),
	date_of_order DATE ,
	date_of_delivered DATE,
	order_city VARCHAR(40)
);

DROP Table order_details;

--Creating costumer table

CREATE TABLE customer(

	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(50),
	customer_email VARCHAR(80) UNIQUE,
	customer_number CHAR(10) 
);

DROP Table customer;
