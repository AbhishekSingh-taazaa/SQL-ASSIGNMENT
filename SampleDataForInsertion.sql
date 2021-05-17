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
	
--Inserting data into staffs	
	INSERT INTO staffs(staff_name,staff_role,gender,phone_number)
	VALUES('Vikas Dubey','Cleaner','M','8886765551'),
	('Devendra Sharma','Billing','M','9876543211'),
	('Siden','Inventory Manager','F','5554443331'),
	('Jimmy','guard','M','1231233456');
	
	SELECT * from staffs;
	
--Inserting data into product_categories	
	
	INSERT INTO product_categories(category_name)
	Values ('Groceries'),
	('Computer & Accessories'),
	('Mobile & Accessories'),
	('Appliances'),
	('Womens Fashion'),
	('Mens Fashion'),
	('Books');
	
	select * from product_categories;
	
	
	
--Inserting data into products	
	INSERT INTO products(product_name,category_id,product_code,manufactror_name,manufacturing_date,expiry_date)
	VALUES ('Potato Chips', 1, 'LAYSPOTATO', 'LAYS', '2020-11-05', '2021-12-12'),
	('Acer Nitro 5', 2, 'ACERNITRO5', 'ACER', '2018-10-21', null),
	('T-Shirt', 6, 'TSHIRT', 'Polo', '2015-07-05', null),
	('Dairy Milk', 1, 'CHOCODAIRY', 'Cadboury', '2020-11-05', '2022-01-01'),
	('Harry Potter', 7, 'HPCHAMBER', 'J.K. Rowling', '2020-11-05', null);
	
	select * from products;
	
--Inserting data into inventory

	INSERT INTO inventory(product_id, product_quantity, instock)
	Values (4,50,true),
	(5,100,true),
	(6,10,false);
	
	SELECT * from inventory;
	
	
--Inserting data into product_revenues

INSERT INTO product_revenues(product_id,costprice,sellingprice)
VALUES (5,70.23,150.55);

INSERT INTO product_revenues(product_id,costprice,sellingprice)
VALUES (2,15,25),
(4,150.50,350),
(1,7999.99,15000),
(3,3000.00,6000.00),
(6,100.11,200.00);

SELECT * FROM product_revenues;

--Inserting into supppilers

INSERT INTO suppliers(suppiler_name, supplier_number, supplier_email, supplier_city)
VALUES ('Duke Jamson', '3405009990', 'duke12@gmail.com', 'Noida'),
('Jordy Lanister', '5566776690', 'jordyl@gmail.com', 'Lucknow'),
('Nerd Stark', '9879879876', 'nerdst@gmail.com', 'Gaziabad'),
('John Snow', '4354356709', 'johnsnow@gmail.com', 'Delhi');

SELECT * FROM suppliers;
	
--Inserting into customer

INSERT INTO customer(customer_name, customer_email, customer_number)
VALUES ('Sachin Sharma', 'sachin@gmail.com', '9089867561'),
('Arpit Kumawat', 'arpit@gmail.com', '8989114567'),
('Ritik Pandey', 'rick@gmail.com', '9089864545'),
('Sandeep Sharma', 'sandeep@gmail.com', '9089867561'),
('Riya Singh', 'riya@gmail.com', '9120413430');

SELECT * FROM customer;
--Inserting into order_details

INSERT INTO order_details(suppiler_id, product_id, customer_id, date_of_order, date_of_delivered, order_city)
VALUES(3, 6, 8, '2021-04-09', '2021-04-23', 'Gaziabad'),
(2, 4, 5, '2021-05-03', '2021-05-10', 'Lucknow'),
(1, 3, 7, '2021-03-13', '2021-03-21', 'Noida');
	
	SELECT * FROM order_details;
	
	
	
	
	