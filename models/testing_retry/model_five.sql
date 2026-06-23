{{
    config(
        materialized='table'
    )
}}



with source as (

    select * from {{ ref('model_four') }}

)

select
    sample_id,
    model_name,
    created_at,
    current_model,
    next_model,
    stage_four_model,
    'model_five' as stage_five_model
from source
