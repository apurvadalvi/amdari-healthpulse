
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    appointment_date as unique_field,
    count(*) as n_records

from HEALTHPULSE_S3_DB.gold_schema.dim_dates
where appointment_date is not null
group by appointment_date
having count(*) > 1



  
  
      
    ) dbt_internal_test