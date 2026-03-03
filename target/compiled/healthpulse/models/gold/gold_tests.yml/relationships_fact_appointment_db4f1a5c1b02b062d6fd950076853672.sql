
    
    

with child as (
    select provider_id as from_field
    from HEALTHPULSE_S3_DB.gold_schema.fact_appointments
    where provider_id is not null
),

parent as (
    select provider_id as to_field
    from HEALTHPULSE_S3_DB.gold_schema.dim_providers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


