

with silver as (
    select * from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
)

select
 f.appointment_id, 
 f.patient_id,
 f.provider_id,
 f.provider_clinic_id,
 d.date_id,
 f.appointment_time,
 f.lead_time_days,
 f.wait_time_minutes,
 f.is_no_show,
 f.status,
current_timestamp() as last_updated_at
from silver f
join HEALTHPULSE_S3_DB.gold_schema.dim_dates d on f.appointment_date = d.appointment_date


    where f.appointment_id not in (select appointment_id from HEALTHPULSE_S3_DB.gold_schema.fact_appointments)
