
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select provider_clinic_id
from HEALTHPULSE_S3_DB.gold_schema.dim_clinics
where provider_clinic_id is null



  
  
      
    ) dbt_internal_test