-- ==========================================================================
-- Snowflake SQL Scripts with AWS S3 Integration for HealthPulse Project
-- ========================================================================== 
-- This integration allows Snowflake to access data stored in AWS S3 using a defined storage integration.
-- Make sure to replace <your_account_id>, <your_role_name>, and <your_bucket_path> with your actual AWS account details and S3 bucket information.

-- Steps to set up the storage integration:
-- 1. Create a S3 bucket on AWS and note down the bucket path.

-- 2. Create an IAM role in AWS with the necessary permissions to access the S3 bucket.
--    Use AWS account as trusted entity type, use your current account ID.
--    Select "Require external ID" and fill a random number value for time being.
--    Add permissions to allow the role to read from the S3 bucket (e.g., AmazonS3ReadOnlyAccess or a custom policy with specific permissions for the bucket).
--    Give a string value for the role name (e.g., "healthpulse_s3_role") and create the role.

-- 3. Open the role, to check the arn value and copy it for later use in Snowflake.

-- 4. Execute the following SQL command to create the storage integration in Snowflake.
--    Replace <arn_value_of_your_iam_role> with the ARN of the IAM role you copied from AWS in Step 3.
--    Replace <your_bucket_path> with the path to your S3 bucket you copied from AWS in Step 1.

create or replace storage integration s3_healthpulse_integration
type = external_stage
storage_provider = S3
enabled = TRUE
storage_aws_role_arn = '<arn_value_of_your_iam_role>'
storage_allowed_locations = ('s3://<your_bucket_path>/');

-- 5. Run the following command to verify the integration details.
--    Note the storage_aws_external_id and storage_aws_iam_user_arn values from the output.

DESC integration s3_healthpulse_integration;

-- 6. On AWS, For the IAM role you created, go to the trust relationship and edit the policy(JSON structure).
--    Replace the "AWS" value with the storage_aws_iam_user_arn value from Snowflake.
--    Replace "sts:ExternalId" value with storage_aws_external_id for Snowflake to assume the role.
--    Save the changes.

-- 7. Now you can use the storage integration to access data in your S3 bucket from Snowflake.

-- NOTE: If you are using AWS free account, you would have access to S3 only for 1 hour after integration creation. 
-- After that, you would need to delete the integration and create it again to get access to S3 for another hour. 
-- This is a limitation of AWS free account for testing purposes. 
-- For production use, you would need to have a paid AWS account with proper permissions and access to S3.