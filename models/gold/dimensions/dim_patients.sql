{{ config(
    materialized='incremental',
    unique_key='patient_id'
)}}

with silver as (
    select * from {{ ref('silver_appointments') }}
)

select distinct
 patient_id, 
 age,
 insurance_type
from silver f

{% if is_incremental() %}
    where patient_id not in (select patient_id from {{ this }})
{% endif %}