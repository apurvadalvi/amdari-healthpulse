create or replace stage bronze_s3_stage
url = '<your_bucket_path>'
storage_integration = s3_healthpulse_integration
file_format = parquet_format;

-- Note: Replace <your_bucket_path> with the actual path to your S3 bucket. Also, use the same integration name and file format name that you defined in the previous steps. 
-- This stage will allow you to access data stored in the specified S3 bucket using the defined storage integration and file format.