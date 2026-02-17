# 🏨 Hospitality Revenue and Booking Analysis

## 📌 Project Overview

This project analyzes large-scale hospitality booking data to uncover revenue trends, platform performance, and customer behavior. The objective is to convert raw booking records into actionable business insights using structured analysis and interactive dashboards.

This project mirrors real-world consulting and business intelligence workflows — from raw data ingestion and SQL-based warehousing, through Python-driven cleaning and EDA, to executive-ready Power BI reporting.

---

## 🎯 Business Problem

Hospitality businesses face challenges such as:
- Identifying which booking platforms drive the most revenue
- Tracking realized vs expected revenue
- Understanding high-value customer segments
- Turning large datasets into decision-ready insights

This analysis addresses these challenges using a full-stack analytics approach across SQL, Python, and Power BI.

---

## 📊 Dataset Summary

- **Records analyzed:** 132,000+ bookings
- **Revenue represented:** $1.69 billion
- **Data type:** Structured transactional data
- **Key fields:** Booking date, Platform, Customer type, Revenue, Realization status

---

## 🛠️ Analysis Workflow

### 1. 🗄️ Database Setup — `load.sql`
Designed and deployed a MySQL data warehouse (`hospitality_dw`) with a star schema architecture:
- **Dimension tables:** `dim_hotels`, `dim_rooms`, `dim_date`
- **Fact tables:** `fact_bookings`, `fact_aggregated_bookings`
- Bulk-loaded 132,000+ records from CSV files using `LOAD DATA LOCAL INFILE`
- Applied performance indexes on high-query columns (platform, property, status, revenue)

### 2. 📊 SQL Analysis — `sql_analysis.sql`
Wrote 9 structured analytical queries covering:
- Total revenue generated vs realized
- Revenue realization percentage
- Revenue breakdown by booking platform and hotel
- Monthly revenue trends
- Occupancy rate calculation
- Average customer ratings by platform
- Cancelled booking revenue loss
- Top-performing cities by revenue

### 3. 🐍 Data Cleaning & EDA — `EDA_cleaning.ipynb`
Performed end-to-end data preparation and exploratory analysis in Python:
- Validated data types, handled missing values, and removed duplicates
- Engineered features and standardized key fields
- Conducted exploratory analysis to surface patterns in revenue, platform usage, and booking behavior
- Generated visualizations to support dashboard design

### 4. 📈 Dashboard Development — Power BI
Built KPI-driven interactive dashboards including:
- Revenue KPIs (generated vs realized)
- Platform-wise performance analysis
- Customer segment breakdown (business vs individual)
- Realized vs unrealized revenue views

Dashboards are designed for executive-level decision support.

---

## 💡 Key Insights

- Analyzed **132,000+ bookings** representing **$1.69B** in revenue
- Identified **70.1% revenue realization rate**, highlighting significant revenue leakage
- Found that **business bookings generated over $500M** in realized revenue
- Highlighted **top-performing platforms** driving the majority of revenue
- Quantified **revenue loss from cancellations** to support refund policy decisions

---

## 🧰 Tools and Technologies

| Layer | Tools |
|---|---|
| Data Warehouse | MySQL, SQL |
| Data Cleaning & EDA | Python, Pandas, Jupyter Notebook |
| Visualization | Power BI, DAX |
| Data Source | CSV files (structured transactional data) |

---

## 📁 Project Files

| File | Description |
|---|---|
| `load.sql` | MySQL warehouse setup — schema creation, CSV loading, and indexing |
| `sql_analysis.sql` | 9 analytical SQL queries covering revenue, occupancy, ratings, and platform performance |
| `EDA_cleaning.ipynb` | Python notebook for data cleaning, validation, and exploratory analysis |

---

## 📌 Business Impact

- Converted raw booking data into business-ready insights
- Enabled data-driven pricing and platform partnership decisions
- Quantified revenue leakage and cancellation impact for operational action
- Demonstrated an end-to-end analytics lifecycle from raw ingestion to executive dashboards

---

## 🧠 Skills Demonstrated

- End-to-end data pipeline design (SQL → Python → BI)
- Relational database modeling (star schema)
- Business-focused KPI development
- Large dataset analysis (132K+ records)
- Executive dashboard design and insight-driven storytelling

---

## 🔮 Future Enhancements

- Revenue forecasting using time-series models
- Automated SQL pipeline with scheduled refresh
- Advanced customer segmentation using clustering
- Automated dashboard data refresh

---

#ConsultingAnalytics #DataAnalytics #SQL #Python #PowerBI
