{{
    config(
        materialized='table'
    )
}}


Select
    *
from {{ ref('middle_model') }}