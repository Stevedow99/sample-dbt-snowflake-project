{{
    config(
        materialized = 'table',
        schema = 'testing',
        tags = ['finance']
    )
}}

Select 
    *
from {{ ref('my_first_model') }}