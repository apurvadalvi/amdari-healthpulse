
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select appointment_date
from HEALTHPULSE_S3_DB.gold_schema.dim_dates
where appointment_date is null



  
  
      
    ) dbt_internal_test