-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into HEALTHPULSE_S3_DB.gold_schema.dim_patients as DBT_INTERNAL_DEST
        using HEALTHPULSE_S3_DB.gold_schema.dim_patients__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.patient_id = DBT_INTERNAL_DEST.patient_id))

    
    when matched then update set
        "PATIENT_ID" = DBT_INTERNAL_SOURCE."PATIENT_ID","AGE" = DBT_INTERNAL_SOURCE."AGE","INSURANCE_TYPE" = DBT_INTERNAL_SOURCE."INSURANCE_TYPE"
    

    when not matched then insert
        ("PATIENT_ID", "AGE", "INSURANCE_TYPE")
    values
        ("PATIENT_ID", "AGE", "INSURANCE_TYPE")

;
    commit;