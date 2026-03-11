# Snowflake Pipeline - Amdari-HealthPulse

This folder contains the Snowflake setup pipeline for Amdari-HealthPulse.

## Pipeline Overview
The pipeline consists of SQL scripts executed in order:

1. **01_create_db_schema.sql**
   - Creates the database if not exists.
   - Creates necessary schemas (Bronze, Silver, Gold).

2. **02_file_format.sql**
   - Creates file formats for parquet files to be ingested.

3. **03_storage_integration.sql**
   - Step-by-step setup for connecting an AWS S3 bucket to Snowflake using a storage integration.
   - Includes instructions for required parameters.

4. **04_external_stage.sql**
   - Creates external stage pointing to S3 bucket.

5. **05_create_bronze_table.sql**
   - Creates raw appointments table in Bronze schema.
   - All columns stored as STRING to allow type validation in Silver layer.

6. **06_snowpipe.sql**
   - Creates a Snowpipe for automated ingestion.
   - Includes two example queries with explanations.

## Notes
- Execute scripts in order.
- This pipeline sets up the foundation for dbt transformations (models in `models/` folder).
- Only setup scripts are included here, transformations are handled by dbt.