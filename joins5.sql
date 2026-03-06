-- 1. Create CUSTOMERS Table
CREATE TABLE CUSTOMERSSSSS(
    CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    CITY VARCHAR(50),
    PHONE_NUMBER VARCHAR(20),
    LOYALTY_POINTS INT
);

-- 2. Create ORDERS Table
CREATE TABLE ORDERSSSSS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    TOTAL_AMOUNT DECIMAL(10,2),
    DISCOUNT_AMT DECIMAL(10,2),
    SHIPPING_DATE DATE
);

-- 3. Insert Data into CUSTOMERS
INSERT INTO CUSTOMERSSSSS VALUES
(101,'John','Doe','New York','555-0100',500),
(102,'Jane','Smith',NULL,'555-0101',120),
(103,'Robert','Brown','Chicago',NULL,0),
(104,'Emily','Davis',NULL,NULL,NULL),
(105,'Michael','Wilson','Miami','555-0105',NULL);

-- 4. Insert Data into ORDERS
INSERT INTO ORDERSSSSS VALUES
(5001,101,'2023-10-01',150.00,10.00,'2023-10-03'),
(5002,102,'2023-10-02',200.50,NULL,'2023-10-05'),
(5003,101,'2023-10-05',75.00,5.00,NULL),
(5004,104,'2023-10-06',300.00,NULL,NULL),
(5005,105,'2023-10-07',50.00,0.00,'2023-10-08'),
(5006,NULL,'2023-10-08',20.00,NULL,'2023-10-09');
SELECT * FROM CUSTOMERSSSSS
SELECT * FROM ORDERSSSSS;
--(Inner Join) List the FIRST_NAME of the customer and the TOTAL_AMOUNT for all orders that have a Discount (DISCOUNT_AMT is not null)
SELECT FIRST_NAME,TOTAL_AMOUNT FROM CUSTOMERSSSSS C INNER JOIN ORDERSSSSS O ON O.CUSTOMER_ID = O.CUSTOMER_ID WHERE DISCOUNT_AMT IS NOT NULL;
--(Left Join) List all Customers. If they have an order, display the ORDER_DATE. If not, ensure the row still appears with a NULL date
SELECT FIRST_NAME,O.ORDER_DATE FROM CUSTOMERSSSSS C LEFT JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;
--(Right Join) Display ORDER_ID and FIRST_NAME. We want to see all orders, including the one with CUSTOMER_ID NULL (Order 5006).
SELECT FIRST_NAME,O.ORDER_ID FROM CUSTOMERSSSSS C RIGHT JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;
--(Full Outer Join) Find the count of rows returned when you Full Outer Join Customers and Orders. (Try to predict the number before running it).
SELECT COUNT(*) FROM CUSTOMERSSSSS C FULL OUTER JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;
--(Left Join - Anti Join) Find the CUSTOMER_IDs that exist in the CUSTOMERS table but do NOT exist in the ORDERS table.\
SELECT C.CUSTOMER_ID FROM CUSTOMERSSSSS C left OUTER JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID where  o.customer_id is null;
--(Self Join) Find pairs of Orders (O1, O2) that were placed on the exact same ORDER_DATE.
--(skip)
--(Cross Join) Create a list showing every Customer paired with every unique CITY found in the Customer table.
(--skip)
--(Inner Join + Aggregates) Calculate the total DISCOUNT_AMT given to customers living in 'New York'.
SELECT SUM(O.DISCOUNT_AMT) AS TOTAL_DISCOUNT FROM CUSTOMERSSSSS C INNER JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID WHERE C.CITY = 'New York';
--(Left Join + NVL) Select FIRST_NAME and the SHIPPING_DATE. If the shipping date is NULL (either because the order isn't shipped OR the customer has no order), display 'Not Shipped'.
(--skip)
--(Right Join) Find the sum of TOTAL_AMOUNT for orders that do not have a linked Customer (Orphan orders).
select first_name,o.order_id,o.total_amount from CUSTOMERSSSSS c right join orders o on c.customer_id = o.customer_id;
--(Natural Join) Use a Natural Join to display LAST_NAME and TOTAL_AMOUNT. (Be careful: does LOYALTY_POINTS exist in both tables? No? Then it uses CUSTOMER_ID).
SELECT C.LAST_NAME, O.ORDER_ID FROM CUSTOMERSSSSS C inner JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;
--Left Join with Multiple Conditions) Join Customers to Orders, but ONLY link orders where the TOTAL_AMOUNT is greater than 100. Customers with small orders should look like they have NULL orders.
SELECT C.LAST_NAME,C.CUSTOMER_ID,O.ORDER_ID,O.TOTAL_AMOUNT FROM CUSTOMERSSSSS C LEFT JOIN ORDERSSSSS O ON C.CUSTOMER_ID= O.CUSTOMER_ID AND O.TOTAL_AMOUNT>100
--(Inner Join) List FIRST_NAME and ORDER_ID for customers who have a Phone Number (IS NOT NULL).
SELECT C.FIRST_NAME,ORDER_ID FROM CUSTOMERSSSSS C INNER JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID WHERE C.PHONE_NUMBER IS NOT NULL;
--(Full Join + Coalesce) Display a list of IDs. If it's a Customer without an order, show Customer ID. If it's an Order without a Customer, show Order ID. Use COALESCE.
SELECT COALESCE(C.CUSTOMER_ID,O.ORDER_ID) AS ID FROM CUSTOMERSSSSS C FULL JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
--(Self Join) Find customers who have the same LOYALTY_POINTS value as another customer.
SELECT A.FIRST_NAME AS CUST_1,B.FIRST_NAME AS CUST_2,A.LOYALTY_POINTS FROM CUSTOMERSSSSS A JOIN CUSTOMERSSSSS B ON A.LOYALTY_POINTS = B.LOYALTY_POINTS WHERE A.CUSTOMER_ID < B.CUSTOMER_ID
--(Inner Join) Display FIRST_NAME, CITY, and ORDER_DATE for orders that have actually been shipped (SHIPPING_DATE is not null).
SELECT FIRST_NAME,CITY,ORDER_DATE FROM CUSTOMERSSSSS INNER JOIN ORDERSSSSS O ON O.CUSTOMER_ID = O.CUSTOMER_ID WHERE SHIPPING_DATE IS NOT NULL
--(Left Join) Calculate the Average TOTAL_AMOUNT per Customer. Ensure customers with no orders show up (likely as NULL or 0 depending on how you write the Average).
SELECT FIRST_NAME,AVG(O.TOTAL_AMOUNT) AS AVG_TOTAL_AMOUNT FROM CUSTOMERSSSSS C LEFT JOIN ORDERSSSSS O ON C.CUSTOMER_ID = O.CUSTOMER_ID GROUP BY C.FIRST_NAME
--(Cartesian/Cross) Count how many rows are generated if you Cross Join CUSTOMERS (5 rows) and ORDERS (6 rows).
(--SKIP)
--(Join with Date Comparison) Find Customers who placed an order on the same day their account was created? (Wait, we don't have account creation date. Instead: Find Orders placed after the shipping date? This checks for data errors).
(--SKIP)
--(Three-way Simulation) Advanced Challenge: Perform a Left Join from Customers to Orders, and then Self Join that result to find Customers who have placed more than one order.
(--SKIP)