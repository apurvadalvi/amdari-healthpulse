{{ config(
    materialized='incremental',
    unique_key='provider_clinic_id'
)}}

with silver as (
    select * from {{ ref('silver_appointments') }}
)

select distinct
    provider_clinic_id,
    clinic_name,
    city,
    opening_time,
    closing_time
from silver f

{% if is_incremental() %}
    where provider_clinic_id not in (select provider_clinic_id from {{ this }})
{% endif %}