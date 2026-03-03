

with silver as (
    select * from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
)

select distinct
 patient_id, 
 age,
 insurance_type
from silver f


    where patient_id not in (select patient_id from HEALTHPULSE_S3_DB.gold_schema.dim_patients)
