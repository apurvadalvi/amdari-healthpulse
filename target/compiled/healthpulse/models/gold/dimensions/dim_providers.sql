

with silver as (
    select * from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
)

select distinct
 provider_id,
 specialty,
 clinic_assignment
from silver f


    where provider_id not in (select provider_id from HEALTHPULSE_S3_DB.gold_schema.dim_providers)
