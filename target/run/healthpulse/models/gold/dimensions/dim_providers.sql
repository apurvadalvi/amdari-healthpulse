-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into HEALTHPULSE_S3_DB.gold_schema.dim_providers as DBT_INTERNAL_DEST
        using HEALTHPULSE_S3_DB.gold_schema.dim_providers__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.provider_id = DBT_INTERNAL_DEST.provider_id))

    
    when matched then update set
        "PROVIDER_ID" = DBT_INTERNAL_SOURCE."PROVIDER_ID","SPECIALTY" = DBT_INTERNAL_SOURCE."SPECIALTY","CLINIC_ASSIGNMENT" = DBT_INTERNAL_SOURCE."CLINIC_ASSIGNMENT"
    

    when not matched then insert
        ("PROVIDER_ID", "SPECIALTY", "CLINIC_ASSIGNMENT")
    values
        ("PROVIDER_ID", "SPECIALTY", "CLINIC_ASSIGNMENT")

;
    commit;