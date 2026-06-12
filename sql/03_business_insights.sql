create database superstore_db;
use superstore_db;
CREATE TABLE orders (
    Row_ID        INT,
    Order_ID      VARCHAR(25),
    Order_Date    DATE,
    Ship_Date     DATE,
    Ship_Mode     VARCHAR(50),
    Customer_ID   VARCHAR(25),
    Customer_Name VARCHAR(100),
    Segment       VARCHAR(50),
    Country       VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Postal_Code   VARCHAR(15),
    Region        VARCHAR(20),
    Product_ID    VARCHAR(25),
    Category      VARCHAR(50),
    Sub_Category  VARCHAR(50),
    Product_Name  VARCHAR(300),
    Sales         DECIMAL(10,4),
    Quantity      INT,
    Discount      DECIMAL(5,4),
    Profit        DECIMAL(10,4)
);
drop table orders;
CREATE TABLE orders_staging (
    Row_ID        VARCHAR(10),
    Order_ID      VARCHAR(25),
    Order_Date    VARCHAR(20),
    Ship_Date     VARCHAR(20),
    Ship_Mode     VARCHAR(50),
    Customer_ID   VARCHAR(25),
    Customer_Name VARCHAR(100),
    Segment       VARCHAR(50),
    Country       VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Postal_Code   VARCHAR(15),
    Region        VARCHAR(20),
    Product_ID    VARCHAR(25),
    Category      VARCHAR(50),
    Sub_Category  VARCHAR(50),
    Product_Name  VARCHAR(300),
    Sales         VARCHAR(20),
    Quantity      VARCHAR(10),
    Discount      VARCHAR(10),
    Profit        VARCHAR(20)
);
drop table orders_staging;
CREATE TABLE orders (
    Ship_Mode    VARCHAR(50),
    Segment      VARCHAR(50),
    Country      VARCHAR(50),
    City         VARCHAR(50),
    State        VARCHAR(50),
    Postal_Code  VARCHAR(15),
    Region       VARCHAR(20),
    Category     VARCHAR(50),
    Sub_Category VARCHAR(50),
    Sales        DECIMAL(10,4),
    Quantity     INT,
    Discount     DECIMAL(5,4),
    Profit       DECIMAL(10,4)
);
select count(*) from orders;
select * from orders LIMIT 5;
SELECT
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Overall_Profit_Margin_Pct
FROM orders;
SELECT
    Region,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM orders
GROUP BY Category, Sub_Category
ORDER BY Category, Total_Profit DESC;
SELECT
    CASE
        WHEN Discount = 0 THEN '1. No Discount'
        WHEN Discount <= 0.20 THEN '2. Low (1-20%)'
        WHEN Discount <= 0.40 THEN '3. Medium (21-40%)'
        ELSE '4. High (41%+)'
    END AS Discount_Band,
    COUNT(*) AS Num_Orders,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Discount_Band
ORDER BY Discount_Band;
SELECT
    Segment,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM orders
GROUP BY Segment
ORDER BY Total_Profit DESC;
SELECT
    Ship_Mode,
    COUNT(*) AS Num_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Ship_Mode
ORDER BY Total_Profit DESC;
SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Category, Sub_Category
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;