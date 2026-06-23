with source as (

    select * from {{ ref('model_six') }}

)

select
    sample_id,
    model_name,
    created_at,
    current_model,
    next_model,
    stage_four_model,
    stage_five_model,
    stage_six_model,
    'model_seven' as stage_seven_model
from source
