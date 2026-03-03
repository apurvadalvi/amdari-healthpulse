{{ config(
    materialized='incremental',
    unique_key='appointment_id'
)}}

with silver as (
    select * from {{ ref('silver_appointments') }}
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
join {{ ref('dim_dates') }} d on f.appointment_date = d.appointment_date

{% if is_incremental() %}
    where f.appointment_id not in (select appointment_id from {{ this }})
{% endif %}