with source as (

    select * from {{ ref('model_one') }}

)

select
    sample_id,
    model_name,
    created_at,
    'model_two' as current_model
from source
