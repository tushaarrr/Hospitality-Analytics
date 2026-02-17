/* =====================================================
   Hospitality Revenue Warehouse Setup
   Using Provided CSV Files
   ===================================================== */

DROP DATABASE IF EXISTS hospitality_dw;
CREATE DATABASE hospitality_dw;
USE hospitality_dw;

SET GLOBAL local_infile = 1;

-- =====================================================
-- 1️⃣ DIMENSION TABLES
-- =====================================================

CREATE TABLE dim_hotels (
    hotel_id VARCHAR(20) PRIMARY KEY,
    hotel_name VARCHAR(255),
    city VARCHAR(100)
);

CREATE TABLE dim_rooms (
    room_id VARCHAR(20) PRIMARY KEY,
    room_class VARCHAR(100)
);

CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

-- =====================================================
-- 2️⃣ FACT TABLES
-- =====================================================

CREATE TABLE fact_bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    property_id VARCHAR(20),
    booking_date DATE,
    check_in_date DATE,
    check_out_date DATE,
    no_guests INT,
    room_category VARCHAR(50),
    booking_platform VARCHAR(100),
    ratings_given DECIMAL(3,2),
    booking_status VARCHAR(50),
    revenue_generated DECIMAL(18,2),
    revenue_realized DECIMAL(18,2)
);

CREATE TABLE fact_aggregated_bookings (
    property_id VARCHAR(20),
    check_in_date DATE,
    room_category VARCHAR(50),
    successful_bookings INT,
    capacity INT
);

-- =====================================================
-- 3️⃣ LOAD CSV FILES
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/path/dim_hotels.csv'
INTO TABLE dim_hotels
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/path/dim_rooms.csv'
INTO TABLE dim_rooms
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/path/dim_date.csv'
INTO TABLE dim_date
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/path/fact_bookings.csv'
INTO TABLE fact_bookings
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/path/fact_aggregated_bookings.csv'
INTO TABLE fact_aggregated_bookings
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Optional performance indexes
CREATE INDEX idx_platform ON fact_bookings(booking_platform);
CREATE INDEX idx_property ON fact_bookings(property_id);
CREATE INDEX idx_status ON fact_bookings(booking_status);
CREATE INDEX idx_revenue ON fact_bookings(revenue_realized);
