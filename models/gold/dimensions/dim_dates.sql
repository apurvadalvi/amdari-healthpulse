{{ config(
    materialized='incremental',
    unique_key='appointment_date'
)}}

with sourcedates as (
    select distinct appointment_date from {{ ref('silver_appointments') }}
)

select distinct
 row_number() over (order by appointment_date) as date_id,
 appointment_date,
 extract(year from appointment_date) as year,
 extract(month from appointment_date) as month,
 extract(day from appointment_date) as day,
 extract(week from appointment_date) as week,
 extract(dayofweek from appointment_date) as day_of_week,

from sourcedates

{% if is_incremental() %}
    where appointment_date not in (select appointment_date from {{ this }})
{% endif %}