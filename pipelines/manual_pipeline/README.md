# Manual Pipeline - Amdari-HealthPulse

This folder contains the manual ETL pipeline for the Amdari-HealthPulse project, implemented using Jupyter notebooks with Python and SQL.

## Pipeline Overview
The pipeline follows a staged approach:

1. **01_ingestion.ipynb**
   - Ingests raw data from local files into the **Bronze** stage in Snowflake.
   - Focuses on basic data loading.

2. **02_bronze_to_silver.ipynb**
   - Transforms data from **Bronze** to **Silver** stage.
   - Includes a combination of Python (for data processing) and SQL (executed on Snowflake) for cleaning and structuring data.

3. **03_silver_to_gold.ipynb**
   - Converts **Silver** tables into **Gold** tables.
   - Implements star schema modeling using SQL in Snowflake.
   - Gold tables are analytical-ready with dimensions and facts.

## Notes
- Each notebook is designed to be run in order (`01 → 02 → 03`).
- Python code is used where Snowflake allows integration; otherwise SQL is preferred.
- Only sample data is included in the repo. Large datasets are not committed.
- This manual pipeline uses a separate Snowflake database (`amdari_manual_db`) to avoid overwriting production data.
- It follows the same Bronze → Silver → Gold layers as the production pipeline.
- To run against the production database, update the database and schema variables at the top of each notebook.