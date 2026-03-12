{{config(
    materialized='incremental',
    unique_key='appointment_id'
)}}

select
appointment_id :: varchar(20) as appointment_id,
patient_id :: varchar(20) as patient_id,
provider_id :: varchar(20) as provider_id,
try_to_date(appointment_date) as appointment_date,
try_to_time(appointment_time) as appointment_time,
lead_time_days :: number(4,0) as lead_time_days,
wait_time_minutes :: number(4,2) as wait_time_minutes,
is_no_show_0_1 :: boolean as is_no_show,
iff(is_no_show_0_1 in ('1', 'True'), 'No show', 'Completed') as status,
age :: number(3,0) as age,
insurance_type :: varchar(20) as insurance_type,
specialty :: varchar(50) as specialty,
provider_clinic_id :: varchar(20) as provider_clinic_id,
clinic_assignment :: varchar(20) as clinic_assignment,
clinic_name :: varchar(50) as clinic_name,
city :: varchar(30) as city,
to_time(split_part(hours, '-', 1), 'HH24:MI') as opening_time,
to_time(split_part(hours, '-', 2), 'HH24:MI') as closing_time,
current_timestamp() AS last_updated_at

from {{source('bronze', 'raw_appointments')}}


{% if is_incremental() %}
    where appointment_id not in (select appointment_id from {{ this }})
{% endif %}