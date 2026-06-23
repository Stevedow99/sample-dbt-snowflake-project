{{
    config(
        materialized='table'
    )
}}

with source as (

    select * from {{ ref('model_two') }}

)

select
    sample_id,
    model_name,
    created_at,
    current_model,
    'model_three' as next_model
from source
