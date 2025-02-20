{{
    config(
        materialized='table'
    )
}}

Select
    *,
    CASE WHEN {{var('force_error')}} = 'true'
        THEN 1 / 0
    ELSE 
        1 / 1
    END AS testing_column

from {{ ref('my_first_model') }}
