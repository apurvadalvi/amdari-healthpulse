

with sourcedates as (
    select distinct appointment_date from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
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


    where appointment_date not in (select appointment_date from HEALTHPULSE_S3_DB.gold_schema.dim_dates)
