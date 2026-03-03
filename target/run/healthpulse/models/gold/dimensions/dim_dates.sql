-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into HEALTHPULSE_S3_DB.gold_schema.dim_dates as DBT_INTERNAL_DEST
        using HEALTHPULSE_S3_DB.gold_schema.dim_dates__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.appointment_date = DBT_INTERNAL_DEST.appointment_date))

    
    when matched then update set
        "DATE_ID" = DBT_INTERNAL_SOURCE."DATE_ID","APPOINTMENT_DATE" = DBT_INTERNAL_SOURCE."APPOINTMENT_DATE","YEAR" = DBT_INTERNAL_SOURCE."YEAR","MONTH" = DBT_INTERNAL_SOURCE."MONTH","DAY" = DBT_INTERNAL_SOURCE."DAY","WEEK" = DBT_INTERNAL_SOURCE."WEEK","DAY_OF_WEEK" = DBT_INTERNAL_SOURCE."DAY_OF_WEEK"
    

    when not matched then insert
        ("DATE_ID", "APPOINTMENT_DATE", "YEAR", "MONTH", "DAY", "WEEK", "DAY_OF_WEEK")
    values
        ("DATE_ID", "APPOINTMENT_DATE", "YEAR", "MONTH", "DAY", "WEEK", "DAY_OF_WEEK")

;
    commit;