{{
    config(
        materialized='table'
    )
}}


select 
    *,
    1/0 as error_column,
    1/1 as control_column
from {{ ref('my_second_model') }}