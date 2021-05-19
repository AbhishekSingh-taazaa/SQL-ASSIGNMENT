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

--Inserting Data Into Address

SELECT * FROM Address;

INSERT INTO Address(Address_Line1,Address_Line2,Pin_Code,City,State) VALUES 
('2/610 Street No-55','Nodia Electronic City','201309','Gautam Buddah Nagar','Uttar Pradesh'),
('5/330 Street No-66','Botanical Garden','209666','Delhi','Uttar Pradesh'),
('100/800 Street No-22','Hazrat Ganj','209606','Lucknow','Uttar Pradesh'),
('23/44 Street No-52','Sector 62','209306','Noida','Uttar Pradesh'),
('1/30 Street No-22','Nodia Electronic City','209606','Fatehgarh','Uttar Pradesh');

--Inserting Into Role

SELECT * FROM ROLE;

INSERT INTO Role(Role_name,Description) Values
('Inventory Manager','Care About Inventory Stock'),
('Front-Desk Manager','Intract with Costumer'),
('Cleaner','Clean out the Store'),
('Accountant', 'Manage Bills');

--Inserting data into staffs	

SELECT * from Staff;

	INSERT INTO Staff(First_Name,Last_Name,Role_Id,Address_Id,Gender,Phone_Number,Salary)
	VALUES('Vikas', 'Dubey', 3, 1, 'M', '8886765551',9000),
	('Devendra', 'Sharma',4,3,'M','9876543211',15000),
	('Siden', 'Jickey',1, 2, 'F','5554443331', 15000),
	('Jimmy', 'Mistle', 2, 4,'M','1231233456', 10000);
	
--Inserting data into product_categories	
	
	INSERT INTO Product_Category(Category_Name)
	Values ('Groceries'),
	('Computer & Accessories'),
	('Mobile & Accessories'),
	('Appliances'),
	('Womens Fashion'),
	('Mens Fashion'),
	('Books');	
	

--Inserting data into products	
	SELECT * FROM Product;

INSERT INTO Product(Product_Code, Product_Name, Category_Id, Manufacturing_Date, Expiry_Date)
	VALUES ('LAYSPOTATO', 'Potato Chips', 1, '2020-11-05', '2021-12-12'),
	( 'ACERNITRO5', 'Laptop', 2,'2018-10-21', null),
	('POLOTSHIRT', 'T-Shirt', 6, '2015-07-05', null),
	('CHOCODAIRY', 'Chocolate', 1,'2020-11-05', '2022-01-01'),
	('HPCHAMBER', 'Harry Potter', 7, '2020-11-05', null);
	
	
--Inserting data into inventory

	INSERT INTO Inventory(Product_Code, Brand_Name, Product_Quantity, InStock)
	Values ('LAYSPOTATO', 'LAYS',50,true),
	('ACERNITRO5', 'ACER',20,true),
	('CHOCODAIRY', 'DAIRY MILK',200,false),
	('HPCHAMBER', 'Scholastic Press', 400, true),
	('POLOTSHIRT', 'DMX', 100, false);
	
	TRUNCATE TABLE Inventory;
	
	SELECT * from Inventory;
	
--Inserting data into product_revenues
SELECT * from Product_Price;

INSERT INTO Product_Price(Product_Code,Cost_Price,Selling_Price,Date_Of_Register)
VALUES ('LAYSPOTATO', 15, 25, '2021-02-12'),
('CHOCODAIRY', 150.50, 350, '2021-04-20'),
('ACERNITRO5', 30999.99, 55000, '2020-08-01'),
('HPCHAMBER', 200.00, 300.00, '2019-10-12'),
('POLOTSHIRT', 100.11, 200.00, '2021-01-06');

--Inserting into supppilers

INSERT INTO Supplier(First_Name, Last_Name, Supplier_Number, Supplier_Email, Address_Id)
VALUES ('Duke', 'Jamson', '3405009990', 'duke12@gmail.com', 1),
('Jordy', 'Lanister', '5566776690', 'jordyl@gmail.com', 2),
('Nerd', 'Stark', '9879879876', 'nerdst@gmail.com', 3),
('John', 'Snow', '4354356709', 'johnsnow@gmail.com', 4);

SELECT * FROM Supplier;
		
--Inserting into customer

INSERT INTO Customer(First_Name, Last_Name, Customer_Email, Customer_Number, Address_Id)
VALUES ('Sachin', 'Sharma', 'sachin@gmail.com', '9089867561', 4),
('Arpit', 'Kumawat', 'arpit@gmail.com', '8989114567', 3),
('Ritik', 'Pandey', 'rick@gmail.com', '9089864545', 2),
('Sandeep', 'Sharma', 'sandeep@gmail.com', '9089867561', 1),
('Riya', 'Singh', 'riya@gmail.com', '9120413430', 1);

SELECT * FROM Customer;	


--Inserting into order_details

INSERT INTO Order_Detail(Supplier_Id, Product_Code , Customer_Id, Ordered_Quantity, Date_Of_order, date_of_delivery, Address_Id)
VALUES(1, 'LAYSPOTATO', 4, 20, '2021-04-09', '2021-04-23', 4),
(2, 'CHOCODAIRY', 3, 10, '2021-05-03', '2021-05-10', 3),
(4, 'ACERNITRO5', 1, 2, '2021-03-13', '2021-03-21', 1);
	
	SELECT * FROM Order_Detail;