{{
    config(
        materialized='insert_into'
    )
}}

Select

*

from {{ ref('sample_varible_model') }}