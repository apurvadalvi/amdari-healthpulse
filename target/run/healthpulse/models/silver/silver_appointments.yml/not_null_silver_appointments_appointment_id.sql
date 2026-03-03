
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select appointment_id
from HEALTHPULSE_S3_DB.silver_schema.silver_appointments
where appointment_id is null



  
  
      
    ) dbt_internal_test