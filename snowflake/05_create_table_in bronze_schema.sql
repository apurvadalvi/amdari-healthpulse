-- This SQL script creates a table named raw_appointments in the bronze_schema schema in Snowflake. 
-- The table is designed to store raw appointment data with various attributes. 
-- Each column is defined with a string data type to accommodate the raw data format.

create or replace table bronze_schema.raw_appointments (
appointment_id string,
patient_id string,
provider_id string,
appointment_date string,
appointment_time string,
lead_time_days string,
wait_time_minutes string,
is_no_show_0_1 string,
age string,
insurance_type string,
specialty string,
provider_clinic_id string,
clinic_assignment string,
clinic_name string,
city string,
hours string
);