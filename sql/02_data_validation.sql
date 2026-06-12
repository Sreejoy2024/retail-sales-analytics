-- ================================================
-- FILE: 02_data_validation.sql
-- PURPOSE: Verify data imported correctly & explore
-- ================================================

USE superstore_db;

-- Check total row count (should be 9994)
SELECT COUNT(*) AS Total_Rows FROM orders;

-- Preview first 5 rows
SELECT * FROM orders LIMIT 5;

-- Check for NULL values in key columns
SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Null_Region,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Null_Category
FROM orders;

-- Check distinct values in categorical columns
SELECT DISTINCT Region FROM orders;
SELECT DISTINCT Category FROM orders;
SELECT DISTINCT Sub_Category FROM orders;
SELECT DISTINCT Segment FROM orders;
SELECT DISTINCT Ship_Mode FROM orders;

-- Basic statistics on numeric columns
SELECT
    ROUND(MIN(Sales), 2) AS Min_Sales,
    ROUND(MAX(Sales), 2) AS Max_Sales,
    ROUND(AVG(Sales), 2) AS Avg_Sales,
    ROUND(MIN(Profit), 2) AS Min_Profit,
    ROUND(MAX(Profit), 2) AS Max_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(MIN(Discount), 2) AS Min_Discount,
    ROUND(MAX(Discount), 2) AS Max_Discount
FROM orders;