
    
    

select
    patient_id as unique_field,
    count(*) as n_records

from HEALTHPULSE_S3_DB.gold_schema.dim_patients
where patient_id is not null
group by patient_id
having count(*) > 1


