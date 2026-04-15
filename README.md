# Amdari HealthPulse – Healthcare Appointments Data Warehouse

A modern data warehouse project demonstrating end-to-end data ingestion, transformation, and modeling using Snowflake, dbt, and AWS. The solution follows a structured Medallion architecture.

## Overview

Amdari HealthPulse is a data engineering project that builds a healthcare appointments data warehouse using Snowflake and dbt. The project demonstrates how raw healthcare appointment data can be ingested, transformed, and modeled into an analytical data warehouse following a layered architecture.

The project includes two ingestion approaches:

- Manual pipeline implemented with Python and SQL notebooks
- Automated Snowflake pipeline using AWS S3 and Snowpipe

Both pipelines ultimately transform data through Bronze → Silver → Gold layers to produce analytics-ready tables.

---

## Tech Stack

- Snowflake – Cloud data warehouse
- dbt (Data Build Tool) – Data transformation and testing
- AWS S3 – Cloud storage for raw data ingestion
- Python – Data ingestion and preprocessing
- SQL – Data transformations and modeling

---

## Architecture Overview

The project follows a modern data warehouse architecture.

Raw data is ingested either through a manual ingestion pipeline or an automated Snowpipe pipeline, then transformed using dbt into structured analytical models.

![Architecture Diagram](docs/Architecture_diagram.png)

---

## Data Warehouse Layers

### 🥉 Bronze Layer – Raw Data Ingestion

The Bronze layer stores raw ingested data with minimal transformation. Data types are initially stored as strings to preserve source data and allow validation in later stages.

### 🥈 Silver Layer – Data Cleaning & Standardization

The Silver layer performs data cleaning and standardization, including:

- Data type validation
- Null handling
- Basic data quality checks

### 🥇 Gold Layer – Star Schema Modeling

The Gold layer contains analytics-ready models structured as a star schema, including fact and dimension tables used for reporting and analysis.

The fact table contains foreign keys referencing the dimension tables and stores business-relevant appointment metrics.

Both Silver and Gold models are configured using dbt’s incremental materialization to prevent full table replacement and ensure scalability.

![Star Schema](docs/Star_schema.png)

---

## Data Quality and Testing

Data quality checks are implemented using dbt tests defined in `silver_test.yml` and `gold_test.yml` files.

Tests include Schema validation, uniqueness, referential integrity, and domain checks

These tests ensure:

- Primary keys are unique
- Foreign keys reference valid dimension records

---

## Project Structure

Key components of the repository include:

- pipelines/manual_pipeline/ – Notebook-based manual ingestion pipeline
- pipelines/snowpipe_pipeline/ – Snowflake Snowpipe ingestion setup
- models/ – dbt transformations for Silver and Gold layers
- docs/ – Architecture diagrams and data dictionary
- macros/ – dbt macros used across models

Each folder contains its own README with detailed execution steps.

---

## Data Analytics & Dashboard

The data architecture was designed to support scalable and efficient reporting. Raw datasets were
transformed into a structured analytical model using a star schema, consisting of a centralized
fact table connected to multiple dimension tables. This approach improves query performance and enables
flexible, insight-driven analysis.

---

Overview

The system captures operational data across multiple clinics, providing a comprehensive view of service delivery,
patient behavior, and performance trends.

- 220 providers operating across 15 clinics
- 120,000+ appointments recorded
- 5,000 total patients within the system

---

Operational Performance

The analysis highlights both efficiency gains and areas requiring improvement.

- The average patient wait time is 21.28 minutes.
- In 2024, the system handled the highest volume of appointments (40,152 appointments) while maintaining the lowest
  average wait time (21.24 minutes) across the three-year period
- 57.33% of appointments exceeded the recommended 15-minute wait time threshold

---

Attendance Patterns

Patient attendance remains a key operational challenge.

- The overall no-show rate is 17.79%.
- The Dental Clinic recorded the highest number of missed appointments
- Patients aged 18–29 were the most likely to miss scheduled appointments

---

Behavioral Insights

The data reveals clear patterns influencing attendance and wait times.

- A strong positive relationship exists between lead time and no-show rates, indicating that longer booking gaps increase the
  likelihood of missed appointments
- Appointment timing significantly affects wait times, with evening slots performing the worst
- Appointments scheduled between 18:00 and 19:00 consistently recorded the highest wait times (29.62 mins and 29.49 mins respectively)

---

Summary

The dashboard provides actionable insights into both operational efficiency and patient behavior. While the system
demonstrates strong capacity handling and improved wait time performance during peak periods, challenges remain in
reducing no-shows and managing high-demand time slots.

### Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Learn more about Snowflake [in the docs](https://docs.snowflake.com/en/)
- Learn more about AWS S3 [in the docs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
