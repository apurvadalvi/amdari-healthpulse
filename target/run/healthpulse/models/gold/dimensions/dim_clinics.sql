-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into HEALTHPULSE_S3_DB.gold_schema.dim_clinics as DBT_INTERNAL_DEST
        using HEALTHPULSE_S3_DB.gold_schema.dim_clinics__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.provider_clinic_id = DBT_INTERNAL_DEST.provider_clinic_id))

    
    when matched then update set
        "PROVIDER_CLINIC_ID" = DBT_INTERNAL_SOURCE."PROVIDER_CLINIC_ID","CLINIC_NAME" = DBT_INTERNAL_SOURCE."CLINIC_NAME","CITY" = DBT_INTERNAL_SOURCE."CITY","OPENING_TIME" = DBT_INTERNAL_SOURCE."OPENING_TIME","CLOSING_TIME" = DBT_INTERNAL_SOURCE."CLOSING_TIME"
    

    when not matched then insert
        ("PROVIDER_CLINIC_ID", "CLINIC_NAME", "CITY", "OPENING_TIME", "CLOSING_TIME")
    values
        ("PROVIDER_CLINIC_ID", "CLINIC_NAME", "CITY", "OPENING_TIME", "CLOSING_TIME")

;
    commit;