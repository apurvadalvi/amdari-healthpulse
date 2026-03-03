
    
    

select
    appointment_id as unique_field,
    count(*) as n_records

from HEALTHPULSE_S3_DB.gold_schema.fact_appointments
where appointment_id is not null
group by appointment_id
having count(*) > 1


