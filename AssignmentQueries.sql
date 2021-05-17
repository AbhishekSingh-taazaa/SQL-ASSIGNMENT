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
	
--Data of products	
	SELECT * FROM products;
	
--Data of staffs
  SELECT * FROM staffs;
  
--Data of suppliers
	SELECT * FROM suppliers;
	
--Data of product_categories
	SELECT * FROM product_categories;
	
--Data of product_revenues
   SELECT * FROM product_revenues;
   
--Data of order_details
	SELECT * FROM order_details;
	
	
	
--ASSIGNMENT 2--

--1 Query staff using name or phone number or both

SELECT * FROM staffs
WHERE staff_name = 'Shivam Tripathi'
OR phone_number='5554443331';
	
	
SELECT * FROM staffs
WHERE staff_name = 'Shivam Tripathi';

SELECT * FROM staffs
WHERE  phone_number='5554443331';
			
--2 Query staff using their Roles

SELECT * FROM staffs
WHERE staff_role = 'Cleaner';

--3 Query Product based on 

--a On name basis

	SELECT * FROM products 
	WHERE product_name='Realme 5 pro';
	
--b On the basis of Category

--All product with categories--

	SELECT p.product_name, pc.category_name FROM products p
	INNER JOIN product_categories pc ON pc.category_id= p.category_id; 
	
--Selected category--	

	SELECT p.product_name, pc.category_name FROM products p
	INNER JOIN product_categories pc ON pc.category_id= p.category_id
	WHERE pc.category_name='Books';
	
--c On the basis of stock

SELECT p.product_name, i.instock FROM products p
INNER JOIN inventory i USING(product_id);

SELECT p.product_name, i.instock FROM products p
INNER JOIN inventory i USING(product_id)
WHERE i.instock = true;

--D On the Basis of Selling Price--

SELECT p.product_name, pr.costprice, pr.sellingprice FROM products p
JOIN product_revenues pr USING(product_id);

--selling Price equals(=)

SELECT p.product_name, pr.costprice, pr.sellingprice FROM products p
JOIN product_revenues pr USING(product_id)
WHERE pr.sellingprice = 6000;

--selling price greater than(>)

SELECT p.product_name, pr.costprice, pr.sellingprice FROM products p
JOIN product_revenues pr USING(product_id)
WHERE pr.sellingprice > 500;

--selling price less than(<)


SELECT p.product_name, pr.costprice, pr.sellingprice FROM products p
JOIN product_revenues pr USING(product_id)
WHERE pr.sellingprice < 500;


--4 number of product outofstock

SELECT COUNT(p.product_id) As outofstock FROM products p
JOIN inventory i USING(product_id)
WHERE i.instock = false;

--5 number of products within a category

SELECT COUNT(p.product_name) AS total_product, pc.category_name
FROM products p
JOIN product_categories pc
USING (category_id)
group by pc.category_name;


--6 Product-Categories listed in descending with highest number of products to the lowest number of products

SELECT pc.category_name, COUNT(p.product_name) AS total_product
FROM products p
JOIN product_categories pc
USING (category_id)
GROUP BY pc.category_name
ORDER BY total_product ASC;

--7 List of Suppliers -

-- a. Name

	SELECT * FROM suppliers
	WHERE suppiler_name = 'Nerd Stark';


-- b. Phone
	
	
	SELECT * FROM suppliers
	WHERE supplier_number = '3405009990';

-- c. Email


	SELECT * FROM suppliers
	WHERE supplier_email = 'jordyl@gmail.com';

-- d. City or State
	
	
	SELECT * FROM suppliers
	WHERE supplier_city = 'Noida';
	
--8	List of Product with different suppliers, with the recent date of supply and the amount supplied on the most recent occasion

SELECT * FROM order_details;
	
 SELECT ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 ORDER BY ordt.date_of_delivered DESC;
 	
--FILTERING DATA	
	
--a on the basis of product name	
 SELECT ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE pro.product_name ='T-Shirt'
 ORDER BY ordt.date_of_delivered DESC;	
 
--b on the basis of suppiler name 

 SELECT ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE  s.suppiler_name ='John Snow'
 ORDER BY ordt.date_of_delivered DESC;	
 
--c on the basis of product code

 SELECT ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE pro.product_code ='HPCHAMBER'
 ORDER BY ordt.date_of_delivered DESC;	
 
 --d supplied after a particular date
 
  SELECT ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE ordt.date_of_delivered >'2021-05-09'
 ORDER BY ordt.date_of_delivered DESC;	
 
 --e supplied before a particular date
 
  SELECT  ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE ordt.date_of_delivered < '2021-05-09'
 ORDER BY ordt.date_of_delivered DESC;	
 
 --Product has inventory more than or less than a given qty
 SELECT  ordt.order_id, pro.product_name, s.suppiler_name, cus.customer_name, ordt.date_of_delivered FROM order_details ordt
 JOIN products pro USING(product_id)
 JOIN customer cus USING(customer_id)
 JOIN inventory inv ON inv.product_id = pro.product_id
 JOIN suppliers s ON s.supplier_id=ordt.suppiler_id
 WHERE inv.product_quantity = 100
 ORDER BY ordt.date_of_delivered DESC;	