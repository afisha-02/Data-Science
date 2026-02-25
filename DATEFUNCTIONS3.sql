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
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location)
VALUES
(1001, '2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore'),

(1002, '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad'),

(1003, '2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai'),

(1004, '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai'),

(1005, '2026-02-05', 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore'),

(1006, '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi'),

(1007, '2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata'),

(1008, '2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi'),

(1009, '2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad'),

(1010, '2026-02-10', 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');
--date funstions
--Extract year from Order_Date.
SELECT YEAR(CAST(order_date AS DATE)) AS extract_year FROM Orders
--Extract month from Order_Date.
select month(cast(order_date as date)) as extract_month from orders
--Extract day from Order_Date.
select day(cast(order_date as date)) as extract_date from orders
--Find current date.
select getdate() from Orders
--Find current timestamp.
select getdate() as currentdatetime
--Add 7 days to Order_Date.
select dateadd(day,7,order_date) as new_order_date from Orders
--Subtract 30 days from Order_Date.
select datediff(day,30,29) as new_order_date from orders
select getdate() - 30 as new_order_datye from orders
select dateadd(day,-30,order_date) from orders
--Find difference between two dates
select datediff(day,order_date,getdate()) from orders
--Find number of months between two dates.
select datediff(month,order_date,getdate()) from Orders
--Find last day of the month.
SELECT EOMONTH(GETDATE()) AS Last_Day_Of_Month
--Get first day of the year.
select eomonth(getdate()) as first_day_of_year
--Format date as 'DD-MM-YYYY'
SELECT FORMAT(order_date, 'dd-MM-yyyy') AS Formatted_Date
FROM Orders
--Convert string to date
SELECT CAST(order_date AS DATE) AS Converted_Date
FROM Orders
--Convert date to string.
select cast(getdate() as varchar(20)) as date_to_string
--Find week number of the year.
select datepart(week,getdate()) as week_number from Orders
--Find day name from date.
select datepart(day,getdate()) as day_number from orders
--Find quarter of the year.
select datepart(year,getdate()) as quarter_year from Orders
--Calculate age from DOB.
select datediff(year,age,getdate()) as date_of_birth from Orders--skip()
--Check if date is weekend.(skip)
--Find next Monday after a given date(skip)
