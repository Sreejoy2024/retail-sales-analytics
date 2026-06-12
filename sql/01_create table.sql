-- ================================================
-- FILE: 01_create_table.sql
-- PURPOSE: Create the superstore database & table
-- ================================================

CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

CREATE TABLE IF NOT EXISTS orders (
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