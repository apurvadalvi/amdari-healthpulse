
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select date_id
from HEALTHPULSE_S3_DB.gold_schema.fact_appointments
where date_id is null



  
  
      
    ) dbt_internal_test