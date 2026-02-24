DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Store_Location VARCHAR(100),
    email_id varchar(100)
);
INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location, email_id)
VALUES
(1001, '2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore','ravikumar@gmail.com'),

(1002, '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad','snehareddy@gmail.com'),

(1003, '2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai','arjunmehta@gmail.com'),

(1004, '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai','priyasharma@gmail.com'),

(1005, '2026-02-05', 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore','kiranrao@gmail.com'),

(1006, '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi','nehaverma@gmail.com'),

(1007, '2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata','rahuldas@gmail.com'),

(1008, '2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi','anjalinair@gmail.com'),

(1009, '2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad','sureshpatel@gmail.com'),

(1010, '2026-02-10', 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune','meenaiyer@gmail.com');
SELECT Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location,email_id
FROM orders
--a query to convert all customer names to uppercase.
SELECT CUSTOMER_NAME AS UPPER_CASE FROM ORDERS;
SELECT UPPER(customer_name) from orders
--a query to convert all customer names to LOWERCASE
SELECT CUSTOMER_NAME AS LOWER_CASE FROM ORDERS;
SELECT UPPER(customer_name) from orders
--the first 5 characters from Product_Name
SELECT substring(Product_Name, 1, 5) AS First_5_Characters
FROM orders
--the last 6 characters from Product_Name
select substring(product_name,1,6)as last_5_characters
from orders
--the length of each Customer_Name
select LEN ('customer_name') from orders
--the length of product_name 
select len(product_name) from orders
-- the word "Rice" with "Premium Rice" in Product_Name.
SELECT REPLACE(PRODUCT_NAME,'RICE','PREMIUM RICE')AS UPDATED_NAME FROM ORDERS
--SELECT REPLACE(ORIGINAL STR,OLD VALUES,NEW VALUES)
--Remove leading and trailing spaces from Customer_Name.
SELECT TRIM(CUSTOMER_NAME) AS SPACES FROM ORDERS
--Concatenate First_Name and Last_Name as Full_Name.
SELECT CONCAT(LEFT(Customer_Name,3), '***') AS masked_name
FROM Orders
select concat(right(customer_name,3), '***') as masked_name from Orders
--customers whose names start with 'A'.
SELECT *
FROM Orders
WHERE UPPER(customer_name) LIKE 'A%'
--Extract the domain name from Email_ID.
SELECT SUBSTRING(customer_id,CHARINDEX('@', customer_id) + 1,LEN(customer_id)) AS domain_name
FROM Orders --(SKIP)

--Reverse the Product_Name
select * from orders 
ORDER BY product_name DESC
select * from orders
order by product_name ASC
--Convert the first letter of each word in Product_Name to uppercase
select concat ( UPPER(LEFT(PRODUCT_NAME,1)),LOWER(SUBSTRING(PRODUCT_NAME,2,35))) AS letters from Orders
--Extract the last 3 characters from Order_ID.
select right (order_id,3) as masked_id from Orders
select left (order_id,3)as masked_id from orders
--Count how many times letter 'a' appears in Customer_Name.
select len(customer_name) - len(replace(customer_name,'a','')) as count_a from Orders
--Mask the last 4 digits of a phone number.
--select substring(phone_number,1,len(phone_number) - 4)  + '****' as mask_num from Orders(skip)
--Split Full_Name into First_Name and Last_Name
SELECT LEFT(customer_Name, CHARINDEX(' ', customer_Name) - 1) AS First_Name,RIGHT(customer_Name, LEN(customer_Name) - CHARINDEX(' ', customer_Name)) AS Last_Name
FROM orders
--Remove all special characters from Product_Code(skip)
--Compare two columns ignoring case sensitivity.
select * from orders where upper(customer_name) = upper(product_name) --(case insentive comparison ryt)
select * from orders where upper(customer_name) = upper(customer_name) --(comparing the same column wrong)
select * from orders where lower (customer_name) = lower(product_name) --correct
select * from orders where lower(customer_name) = lower(product_name)
select * from orders where upper(customer_name) = lower(product_name)
select * from orders where lower(customer_name) = upper(product_name)
--Find customers whose name contains 'kumar'
select * from orders where customer_name like '%kumar%'
select * from orders where LOWER(customer_name) like '%kumar%'
select * from orders where UPPER (customer_name) like '%KUMAR%'
--Pad Order_ID with leading zeros to make it 6 digits.
SELECT right ('000000' + cast(order_id as varchar),6) Pad_order_id from Orders
SELECT left ('000000' + cast(order_id as varchar),6) Pad_order_id from Orders
--Extract substring between two characters.
SELECT 
SUBSTRING(customer_name, 1, CHARINDEX('(', customer_name) - 1) 
AS extract_value
FROM Orders;
(--showinginvalid should fix it --skip)