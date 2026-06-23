with source as (

    select * from {{ ref('model_five') }}

)

select
    sample_id,
    model_name,
    created_at,
    current_model,
    next_model,
    stage_four_model,
    stage_five_model,
    'model_six' as stage_six_model
from source
