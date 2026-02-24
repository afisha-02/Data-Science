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
    Store_Location VARCHAR(100)
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
--NUMERICAL FUNCTIONS
--Round Unit_Price to 2 decimal places.
SELECT ROUND (UNIT_PRICE, 2) FROM ORDERS
--Find total sales per order sum(expression*expression)
SELECT order_id,sum(quantity * Unit_Price) as total_sales from orders group by Order_ID
--Calculate average order value.
select AVG(UNIT_PRICE)  FROM ORDERS
--Find highest product price.
SELECT MAX(UNIT_PRICE) FROM ORDERS
--Find lowest product price.
SELECT MIN(UNIT_PRICE) FROM ORDERS
--Calculate percentage discount applied.
SELECT UNIT_PRICE,UNIT_PRICE,SELLING_PRICE((UNIT_PRICE - SELLING_PRICE)/UNIT_PRICE)*100 AS DISCOUNT_PERCENTAGE FROM ORDERS --NOT UNDERSTOOD..(SKIP)
--Find modulus of Quantity divided by 2.
SELECT QUANTITY,  QUANTITY % 2 AS REMAINDER FROM ORDERS  
--Convert negative values to positive.
SELECT ABS(UNIT_PRICE) FROM ORDERS
--Truncate price without rounding
SELECT UNIT_PRICE, FLOOR(UNIT_PRICE) AS TRUNCATED_PRICE FROM ORDERS
--Find square root of total sales.
SELECT UNIT_PRICE,SQRT(UNIT_PRICE) AS TOTAL_SALES FROM ORDERS
--Calculate exponential value of a number.
SELECT QUANTITY,EXP(QUANTITY) FROM ORDERS
--Calculate power of 2^5.
SELECT LOG (2,5) FROM ORDERS
--Find absolute difference between two price
SELECT PRODUCT_NAME,ABS(CURRENT_PRICE - OLD_PRICE) AS PRICE_DIFFERENCE FROM ORDERS --(NO COLUMN NAME SO SKIP)
--Calculate sales growth percentage.(HOW)--SKIP 
--Find random number between 1 and 100
SELECT FLOOR(RAND()*100)+1 AS RANDOM_NUMBER FROM ORDERS
--Divide total sales by number of orders.
SELECT SUM(TOTAL_SALES) / SUM(NUM_OF_ORDERS) AS SALES_NUMBER FROM ORDERS --NO COLUMN FOUND
--Find ceiling value of price.
SELECT CEILING(UNIT_PRICE) AS VALUE_OF_PRICE FROM ORDERS --(DOUBT >> NOT UNDERSTOOD)
--Find floor value of price.
SELECT FLOOR(UNIT_PRICE) FROM ORDERS  --(DOUBT >> NOT UNDERSTOOD)
--Convert decimal to integer.
SELECT CAST(UNIT_PRICE AS INT) AS integer_price FROM ORDERS;
--Calculate compound interest(SKIP)


