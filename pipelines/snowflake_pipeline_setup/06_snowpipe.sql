-- This SQL script sets up a Snowpipe to automate the loading of data from an S3 bucket into a Snowflake table.
-- It creates a pipe named s3_pipe in the bronze_schema schema that listens for new files in the specified stage (bronze_schema.s3_stage)
-- and loads them into the raw_appointments table.
-- The pipe is configured to auto-ingest new files as they arrive in the stage, and it uses the parquet file format for the data.

create or replace pipe bronze_schema.s3_pipe
AUTO_INGEST = TRUE
as
copy into bronze_schema.raw_appointments
from @bronze_schema.s3_stage
file_format = parquet_format
match_by_column_name = case_insensitive;

show pipes in schema bronze_schema;

desc pipe bronze_schema.s3_pipe;