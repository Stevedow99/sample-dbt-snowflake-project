{{
    config(
        materialized='table',
        on_error=var('on_error_setting')
    )
}}

with source as (


    select * from {{ ref('model_three') }}

)

select
    sample_id,
    model_name,
    created_at,
    current_model,
    next_model,
    100.0 / {{ var('denominator') }} as fail_feild,
    'model_four' as stage_four_model
from source
