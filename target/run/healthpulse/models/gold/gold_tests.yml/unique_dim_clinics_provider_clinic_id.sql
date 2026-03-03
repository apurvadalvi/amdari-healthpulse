
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    provider_clinic_id as unique_field,
    count(*) as n_records

from HEALTHPULSE_S3_DB.gold_schema.dim_clinics
where provider_clinic_id is not null
group by provider_clinic_id
having count(*) > 1



  
  
      
    ) dbt_internal_test