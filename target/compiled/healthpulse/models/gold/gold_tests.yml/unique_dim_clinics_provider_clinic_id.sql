
    
    

select
    provider_clinic_id as unique_field,
    count(*) as n_records

from HEALTHPULSE_S3_DB.gold_schema.dim_clinics
where provider_clinic_id is not null
group by provider_clinic_id
having count(*) > 1


