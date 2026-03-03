{{ config(
    materialized='incremental',
    unique_key='provider_id'
)}}

with silver as (
    select * from {{ ref('silver_appointments') }}
)

select distinct
 provider_id,
 specialty,
 clinic_assignment
from silver f

{% if is_incremental() %}
    where provider_id not in (select provider_id from {{ this }})
{% endif %}