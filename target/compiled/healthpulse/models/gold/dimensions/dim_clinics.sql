

with silver as (
    select * from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
)

select distinct
    provider_clinic_id,
    clinic_name,
    city,
    opening_time,
    closing_time
from silver f


    where provider_clinic_id not in (select provider_clinic_id from HEALTHPULSE_S3_DB.gold_schema.dim_clinics)
