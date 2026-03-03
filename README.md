# Amdari Project – Healthcare Appointments Data Warehouse  
**Snowflake + AWS S3 + dbt**

---

## 📌 Project Summary

This project was developed as part of the **Amdari Data Engineering Project** to demonstrate an end-to-end modern data pipeline using Snowflake and dbt.

The objective of this project was to:

- Ingest raw appointment data from AWS S3 into Snowflake
- Transform and standardize data using dbt
- Build an analytics-ready Gold layer using a star schema
- Implement incremental processing
- Enforce data quality with dbt tests

The solution follows a structured **Bronze → Silver → Gold** architecture.

---

## 🏗 Architecture Overview

< img src = "docs/Architecture_diagram.png" width = 700>

---

## 🥉 Bronze Layer – Raw Data Ingestion

- Raw Parquet files are stored in AWS S3.
- A Snowflake external stage is configured to connect to S3.
- Data is loaded into a Bronze table using:
  - Snowpipe (auto-ingest).
- No transformations are applied at this stage.
- An ingestion timestamp column is maintained to track loads.

The Bronze layer preserves the raw structure of the data.

---

## 🥈 Silver Layer – Data Cleaning & Standardization

The Silver layer is built using dbt models.

Key transformations include:

- Enforcing correct data types
- Converting ID columns to `VARCHAR`
- Standardising date formats
- Converting numeric flags (0/1) to Boolean
- Mapping no-show indicators to meaningful status values
- Applying incremental logic to process only newly ingested records

Silver models ensure consistency, integrity, and usability of the data.

---

## 🥇 Gold Layer – Star Schema Modeling

The Gold layer is designed for analytics and reporting.

### Dimension Tables

- `dim_patients`
- `dim_clinics`
- `dim_providers`
- `dim_dates`

### Fact Table

- `fact_appointments`

The fact table contains foreign keys referencing the dimension tables and stores business-relevant appointment metrics.

Both Silver and Gold models are configured using dbt’s incremental materialization to prevent full table replacement and ensure scalability.

---

## 🧪 Data Quality & Testing

Data quality checks are implemented using dbt tests defined in `silver_test.yml` and `gold_test.yml` files.

Tests include:

- `not_null`
- `unique`
- `relationships`


These tests ensure:
- Primary keys are unique
- Foreign keys reference valid dimension records



Run process using:
- dbt run
- dbt test


### 
Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices